import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:app_settings/app_settings.dart';
import 'package:cmo/env/env.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_detail_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_bottom_sheet.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_map;
import 'package:google_maps_flutter_platform_interface/src/types/location.dart'
    as map;
import 'package:map_autocomplete_field/map_autocomplete_field.dart';
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
  }) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (_) => CompartmentMapScreen(
          points: points,
          farmId: farmId,
          farmName: farmName,
          campId: campId,
        ),
      ),
    );
  }

  CompartmentMapScreen({this.points, required this.farmId, this.farmName, this.campId, Key? key}) : super(key: key);

  final List<map.LatLng>? points;
  final String farmId;
  final String? farmName;
  final String? campId;

  @override
  _CompartmentMapScreenState createState() => _CompartmentMapScreenState();
}

class _CompartmentMapScreenState extends State<CompartmentMapScreen> {
  static const haSquareMeters = 10000;
  GoogleMapController? _controller;
  List<Marker> _markers = [];
  bool _isFinished = false;
  double? areaSquareMeters;
  var _mapType = MapType.normal;
  final _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _hasInternet = true;

  @override
  void initState() {
    super.initState();
    onInternetStateChangeListener();
  }

  Future<void> onInternetStateChangeListener() async {
    final hasInternet = await NetworkUtils().hasInternet();
    if (!hasInternet) {
      setState(() {
        _hasInternet = hasInternet;
      });
    }
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      final hasInternet = result != ConnectivityResult.none;
      if (hasInternet != _hasInternet) {
        setState(() {
          _hasInternet = hasInternet;
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
      for (final item in widget.points!) {
        _markers.add(await _markerFrom(item));
      }
      _isFinished = true;
      _finishDrawing();
    });
  }

  Future<Marker> _markerFrom(map.LatLng position) async {
    return Marker(
        markerId: MarkerId(
            'place_name_${position.latitude}_${position.longitude}'),
        position: position,
        icon: await BitmapDescriptorHelper.getBitmapDescriptorFromSvgAsset(
          Assets.icons.mapPolygonPoint.path,
          Size(8, 8),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartments.tr(),
        showLeading: true,
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator
            .of(context)
            .pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                      target: Constants.mapCenter, zoom: 14),
                  polylines: _polylines(),
                  polygons: _polygon(),
                  mapType: MapType.satellite,
                  onMapCreated: (GoogleMapController controller) {
                    if (widget.points != null) {
                      _drawInitialPolygon();
                    }
                    _controller = controller;
                    Geolocator.checkPermission().then((permission) async {
                      if (permission == LocationPermission.whileInUse ||
                          permission == LocationPermission.always) {
                        _moveMapCameraCurrentLocation();
                      } else if (permission == LocationPermission.denied) {
                        permission = await Geolocator.requestPermission();
                        if (permission == LocationPermission.whileInUse ||
                            permission == LocationPermission.always) {
                          _moveMapCameraCurrentLocation();
                        }
                      }
                    });
                  },
                  markers: _markers.toSet(),
                ),
                MapCenterIcon(),
                Positioned(
                  right: 6,
                  top: 6,
                  child: FloatingActionButton(
                    onPressed: () async {
                      var mapType = await showCustomModalBottomSheet(
                        context,
                        content: const _MapTypeSelector(),
                      );
                      if (mapType != null) {
                        setState(() {
                          _mapType = mapType as MapType;
                        });
                      }
                    },
                    mini: true,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.satellite_outlined, color: Colors.black54,),
                  ),
                ),
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
          if (_hasInternet)...[
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
                      width: 36, height: 36, colorFilter: const ColorFilter.mode(
                      Colors.blue,
                      BlendMode.srcIn,
                    ),),
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
                        _markers.add(await _markerFrom(center));
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
                      width: 36, height: 36, colorFilter: const ColorFilter.mode(
                      Colors.blue,
                      BlendMode.srcIn,
                    ),),
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
                      onTap: _markers.length > 2
                          ? () => _finishDrawing()
                          : null,
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
                          locations: _markers
                              .map(
                                (e) => PolygonItem(
                              latitude: e.position.latitude,
                              longitude: e.position.longitude,
                            ),
                          )
                              .toList(),
                        );
                      } : null,
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            const SizedBox(height: 40,),
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

  Set<Polyline> _polylines() {
    var polylines = <Polyline>{};
    if (_markers.length < 2) {
      return polylines;
    }
    final color =
    widget.points == null ? context.colors.yellow : context.colors.red;
    for (var i = 1; i < _markers.length; i++) {
      polylines.add(
        Polyline(
          polylineId: PolylineId("${i - 1}_$i"),
          points: [_markers[i - 1].position, _markers[i].position],
          color: color,
          width: 5,
        ),
      );
    }
    if (_isFinished) {
      polylines.add(
        Polyline(
          polylineId: PolylineId('${_markers.length - 1}_0'),
          points: [
            _markers[_markers.length - 1].position,
            _markers[0].position,
          ],
          color: color,
          width: 5,
        ),
      );
    }
    return polylines;
  }

  Set<Polygon> _polygon() {
    if (!_isFinished) return Set();
    final polygon = Polygon(
      polygonId: PolygonId('Polygon'),
      points: _markers.map((e) => e.position).toList(),
      fillColor: context.colors.blueDark1.withOpacity(0.4),
      strokeColor: Colors.transparent,
    );
    return Set.of([polygon]);
  }

  void _removePreviousPoint() {
    areaSquareMeters = null;
    if (_markers.isEmpty) return;
    _markers.removeLast();
    _isFinished = false;
    setState(() {});
  }

  void _finishDrawing() {
    _isFinished = true;
    areaSquareMeters = SphericalUtil.computeArea(_markers
        .map((e) =>
        mapToolkitLatlong.LatLng(
            e.position.latitude, e.position.longitude))
        .toList())
        .toDouble();
    setState(() {});
  }

  String _presentAreaSquare() {
    if (areaSquareMeters == null) return '0 ${LocaleKeys.measured.tr()}';
      return '${(areaSquareMeters! / haSquareMeters).toStringAsFixed(
          2)} ha ${LocaleKeys.measured.tr()}';
  }

  bool _isCompletedPoint(map.LatLng lastPoint) {
    if (_markers.length < 3) {
      return false;
    }
    var distance = SphericalUtil.computeDistanceBetween(
      mapToolkitLatlong.LatLng(
          _markers.first.position.latitude, _markers.first.position.longitude),
      mapToolkitLatlong.LatLng(
          lastPoint.latitude, lastPoint.longitude),
    );
    return distance < 3;
  }


  Widget _buildNoInternet() {
    if (_hasInternet) {
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

class _MapTypeSelector extends StatelessWidget {
  const _MapTypeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            LocaleKeys.map_type.tr(),
            style: context.textStyles.bodyNormal.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colors.blueDark2,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _item(
                  context,
                  icon: Icons.map_outlined,
                  text: LocaleKeys.default_text.tr(),
                  onTapped: () => Navigator.of(context).pop(MapType.normal),
                ),
                _item(
                  context,
                  icon: Icons.satellite_outlined,
                  text: LocaleKeys.satellite.tr(),
                  onTapped: () => Navigator.of(context).pop(MapType.satellite),
                ),
                _item(
                  context,
                  icon: Icons.terrain_outlined,
                  text: LocaleKeys.terrain.tr(),
                  onTapped: () => Navigator.of(context).pop(MapType.terrain),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String text,
    required Function() onTapped,
  }) {
    return InkWell(
      onTap: onTapped,
      child: Column(
        children: [
          Icon(
            icon,
            size: 84,
            color: context.colors.blue,
          ),
          Text(text),
        ],
      ),
    );
  }
}


class BitmapDescriptorHelper {

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
      String assetName, [
        Size size = const Size(48, 48),
      ]) async {
    final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetName), null);

    double devicePixelRatio = ui.window.devicePixelRatio;
    int width = (size.width * devicePixelRatio).toInt();
    int height = (size.height * devicePixelRatio).toInt();

    final scaleFactor = min(
      width / pictureInfo.size.width,
      height / pictureInfo.size.height,
    );

    final recorder = ui.PictureRecorder();

    ui.Canvas(recorder)
      ..scale(scaleFactor)
      ..drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();

    final image = rasterPicture.toImageSync(width, height);
    final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }
}
