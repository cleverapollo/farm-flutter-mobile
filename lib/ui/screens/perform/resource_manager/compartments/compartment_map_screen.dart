import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_detail_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_map;
import 'package:google_maps_flutter_platform_interface/src/types/location.dart'
    as map;
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:maps_toolkit/src/latlng.dart' as mapToolkitLatlong;
import 'package:cmo/utils/network_utils.dart';

class CompartmentMapScreen extends StatefulWidget {
  static Future<T?> push<T>(
    BuildContext context, {
    List<map.LatLng>? points,
    required String farmId,
    String? campId,
    String? farmName,
    Compartment? compartment,
  }) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => CompartmentMapCubit(points: points),
          child: CompartmentMapScreen(
            points: points,
            farmId: farmId,
            farmName: farmName,
            campId: campId,
            compartment: compartment,
          ),
        ),
      ),
    );
  }

  CompartmentMapScreen(
      {this.points,
      required this.farmId,
      this.farmName,
      this.campId,
      this.compartment,
      Key? key})
      : super(key: key);

  final List<map.LatLng>? points;
  final String farmId;
  final String? farmName;
  final String? campId;
  final Compartment? compartment;

  @override
  _CompartmentMapScreenState createState() => _CompartmentMapScreenState();
}

class _CompartmentMapScreenState extends State<CompartmentMapScreen> {
  static const haSquareMeters = 10000;
  GoogleMapController? _controller;
  bool _isFinished = false;
  double? areaSquareMeters;
  final _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _hasInternet = true;
  bool _shouldShowNoInternetWidget = false;

  late map.LatLng centerMapPoint;

  @override
  void initState() {
    super.initState();
    onInternetStateChangeListener();
    _calculateCenterPoint();
  }

  Future<void> onInternetStateChangeListener() async {
    final hasInternet = await NetworkUtils.hasInternet();
    if (!hasInternet) {
      setState(() {
        _hasInternet = hasInternet;
        _shouldShowNoInternetWidget = !hasInternet;
      });
    }
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      final hasInternet = result != ConnectivityResult.none;
      if (hasInternet != _hasInternet) {
        setState(() {
          _hasInternet = hasInternet;
          _shouldShowNoInternetWidget = !hasInternet;
        });
      }

      if (_shouldShowNoInternetWidget) {
        Future.microtask(() async {
          await Future.delayed(const Duration(seconds: 5));
          setState(() {
            _shouldShowNoInternetWidget = false;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _drawInitialPolygon() {
    Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
      _isFinished = true;
      });

      await context.read<CompartmentMapCubit>().initMapData();
      _finishDrawing();
    });
  }

  void _calculateCenterPoint() {
    if (widget.points.isBlank) {
      centerMapPoint = Constants.mapCenter;
      return;
    }

    double centerLat = 0;
    double centerLng = 0;

    for (final item in widget.points!) {
      centerLat += item.latitude;
      centerLng += item.longitude;
    }

    centerMapPoint = map.LatLng(
        centerLat / widget.points!.length, centerLng / widget.points!.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartments.tr(),
        showLeading: true,
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<CompartmentMapCubit, CompartmentMapState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition:
                      CameraPosition(target: centerMapPoint, zoom: 14),
                      polylines: _polylines(state.tempMarkers),
                      polygons: _polygon(state.markers),
                      mapType: MapType.satellite,
                      myLocationEnabled: true,
                      onCameraMove: (position) => context.read<CompartmentMapCubit>().onCameraMove(position, _isFinished),
                      onMapCreated: (GoogleMapController controller) {
                        if (widget.points.isNotBlank) {
                          _drawInitialPolygon();
                        }

                        _controller = controller;
                        Geolocator.checkPermission().then((permission) async {
                          if (permission == LocationPermission.whileInUse ||
                              permission == LocationPermission.always) {
                            if (widget.points.isBlank) {
                              await _moveMapCameraCurrentLocation();
                            }
                          } else if (permission == LocationPermission.denied) {
                            permission = await Geolocator.requestPermission();
                            if (permission == LocationPermission.whileInUse ||
                                permission == LocationPermission.always) {
                              if (widget.points.isBlank) {
                                await _moveMapCameraCurrentLocation();
                              }
                            }
                          }
                        });
                      },
                      markers: state.markers.toSet(),
                    );
                  },
                ),
                MapCenterIcon(),
                Center(
                  child: _buildNoInternet(),
                )
              ],
            ),
          ),
          const SizedBox(height: 36),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: context.colors.grey),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            child: Text(
              _presentAreaSquare(),
              style: context.textStyles.bodyBold,
            ),
          ),
          const SizedBox(height: 8),
          if (_hasInternet) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _removePreviousPoint,
                  padding: EdgeInsets.zero,
                  iconSize: 36,
                  icon: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: SvgGenImage(Assets.icons.icRefresh.path).svg(
                      width: 36,
                      height: 36,
                      colorFilter: const ColorFilter.mode(
                        Colors.blue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () async {
                    var center = await getCenter();
                    if (center != null) {
                      if (_isCompletedPoint(center)) {
                        _finishDrawing();
                      } else {
                        await context.read<CompartmentMapCubit>().creatNewMarker(center);
                        if (_isFinished) {
                          _finishDrawing();
                        } else {
                          setState(() {});
                        }
                      }
                    }
                  },
                  padding: EdgeInsets.zero,
                  iconSize: 36,
                  icon: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: SvgGenImage(Assets.icons.icAccept.path).svg(
                      width: 36,
                      height: 36,
                      colorFilter: const ColorFilter.mode(
                        Colors.blue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CmoFilledButton(
                      title: LocaleKeys.complete_polygon.tr(),
                      onTap: _finishDrawing,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: CmoFilledButton(
                      title: LocaleKeys.next.tr(),
                      onTap: _isFinished
                          ? () {
                              CompartmentDetailScreen.push(
                                context,
                                farmId: widget.farmId,
                                farmName: widget.farmName,
                                campId: widget.campId,
                                measuredArea: (areaSquareMeters ?? 0) / 10000,
                                compartment: widget.compartment,
                                locations: context
                                    .read<CompartmentMapCubit>()
                                    .state
                                    .markers
                                    .map(
                                      (e) => PolygonItem(
                                        latitude: e.position.latitude,
                                        longitude: e.position.longitude,
                                      ),
                                    )
                                    .toList(),
                              );
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            const SizedBox(
              height: 40,
            ),
            CmoFilledButton(
              title: LocaleKeys.connect_to_internet.tr(),
              onTap: () {
                AppSettings.openAppSettings(type: AppSettingsType.wifi);
              },
            )
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<map.LatLng?> getCenter() async {
    if (_controller == null) {
      return null;
    }
    LatLngBounds visibleRegion = await _controller!.getVisibleRegion();
    map.LatLng centerLatLng = map.LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );
    return centerLatLng;
  }

  Future _moveMapCameraCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await _controller?.animateCamera(CameraUpdate.newLatLng(
        google_map.LatLng(position.latitude, position.longitude)));
  }

  Set<Polyline> _polylines(List<Marker> markers) {
    var polylines = <Polyline>{};
    if (markers.length < 2) {
      return polylines;
    }
    final color = widget.points.isBlank ? context.colors.yellow : context.colors.red;
    for (var i = 1; i < markers.length; i++) {
      polylines.add(
        Polyline(
          polylineId: PolylineId("${i - 1}_$i"),
          points: [markers[i - 1].position, markers[i].position],
          color: color,
          width: 5,
          patterns: (i != markers.length - 1 || widget.points?.length == markers.length) ? [] : [PatternItem.dash(60), PatternItem.gap(20)],
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
        ),
      );
    }

    if (_isFinished) {
      polylines.last.copyWith(patternsParam: []);
      polylines.add(
        Polyline(
          polylineId: PolylineId('${markers.length - 1}_0'),
          points: [
            markers[markers.length - 1].position,
            markers[0].position,
          ],
          color: color,
          width: 5,
        ),
      );
    }

    return polylines;
  }

  Set<Polygon> _polygon(List<Marker> markers) {
    if (!_isFinished) return Set();
    final polygon = Polygon(
      polygonId: PolygonId('Polygon'),
      points: markers.map((e) => e.position).toList(),
      fillColor: context.colors.blueDark1.withOpacity(0.4),
      strokeColor: Colors.transparent,
    );
    return Set.of([polygon]);
  }

  void _removePreviousPoint() {
    areaSquareMeters = null;
    context.read<CompartmentMapCubit>().removePreviousMarker();
    _isFinished = false;
    setState(() {});
  }

  void _finishDrawing() {
    final markers = context.read<CompartmentMapCubit>().state.markers;
    if (markers.isEmpty) return;
    _isFinished = true;
    areaSquareMeters = SphericalUtil.computeArea(markers
            .map((e) => mapToolkitLatlong.LatLng(
                e.position.latitude, e.position.longitude))
            .toList())
        .toDouble();
    setState(() {});
  }

  String _presentAreaSquare() {
    if (areaSquareMeters == null) return '0 ${LocaleKeys.measured.tr()}';
    return '${(areaSquareMeters! / haSquareMeters).toStringAsFixed(2)} ha ${LocaleKeys.measured.tr()}';
  }

  bool _isCompletedPoint(map.LatLng lastPoint) {
    final markers = context.read<CompartmentMapCubit>().state.markers;
    if (markers.length < 3) {
      return false;
    }

    var distance = SphericalUtil.computeDistanceBetween(
      mapToolkitLatlong.LatLng(markers.first.position.latitude, markers.first.position.longitude),
      mapToolkitLatlong.LatLng(lastPoint.latitude, lastPoint.longitude),
    );

    return distance < 3;
  }

  Widget _buildNoInternet() {
    if (_hasInternet || !_shouldShowNoInternetWidget) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 174,
      width: double.infinity,
      color: context.colors.greyD9D9,
      alignment: AlignmentDirectional.center,
      child: Text(
        LocaleKeys.no_internet_to_create_boundary.tr(),
        textAlign: TextAlign.center,
        style: context.textStyles.bodyNormal.copyWith(
          color: context.colors.blue,
        ),
      ),
    );
  }
}
