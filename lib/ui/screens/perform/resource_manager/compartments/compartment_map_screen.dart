import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_detail_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_map;
import 'package:google_maps_flutter_platform_interface/src/types/location.dart'
    as map;
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:maps_toolkit/src/latlng.dart' as mapToolkitLatlong;

class CompartmentMapScreen extends StatefulWidget {
  static Future<T?> push<T>(
    BuildContext context, {
    List<map.LatLng>? points,
    required String farmId,
    String? farmName,
  }) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (_) => CompartmentMapScreen(
          points: points,
          farmId: farmId,
          farmName: farmName,
        ),
      ),
    );
  }

  CompartmentMapScreen({this.points, required this.farmId, this.farmName, Key? key}) : super(key: key);

  final List<map.LatLng>? points;
  final String farmId;
  final String? farmName;

  @override
  _CompartmentMapScreenState createState() => _CompartmentMapScreenState();
}

class _CompartmentMapScreenState extends State<CompartmentMapScreen> {
  static const haSquareMeters = 10000;
  GoogleMapController? _controller;
  List<Marker> _markers = [];
  bool _isFinished = false;
  double? areaSquareMeters;

  @override
  void initState() {
    super.initState();
    if (widget.points != null) {
      _markers = widget.points!.map((e) => _markerFrom(e)).toList();
      _isFinished = true;
      _finishDrawing();
    }
  }

  Marker _markerFrom(map.LatLng position) {
    return Marker(
      markerId: MarkerId(
          'place_name_${position.latitude}_${position.longitude}'),
      position: position,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartments.tr(),
        showLeading: true,
        subtitle: widget.farmName ?? LocaleKeys.siteName.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
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
                  onMapCreated: (GoogleMapController controller) {
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
                  onTap: (latLong) {
                    if (_isFinished) return;
                    setState(() {
                      _markers.add(_markerFrom(latLong));
                    });
                  },
                ),
                Positioned(
                  right: 5,
                  top: 24,
                  child: _markers.isEmpty
                      ? Container()
                      : IconButton(
                          onPressed: _removePreviousPoint,
                          iconSize: 38,
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: SvgGenImage(Assets.icons.icRefresh.path).svg(
                              colorFilter: const ColorFilter.mode(
                                  Colors.grey, BlendMode.srcIn),
                            ),
                          ),
                        ),
                ),
                Positioned(
                  right: 5,
                  top: 74,
                  child: _markers.length < 3
                      ? Container()
                      : IconButton(
                          onPressed: () {
                            _finishDrawing();
                          },
                          iconSize: 38,
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: SvgGenImage(Assets.icons.icAccept.path).svg(
                              colorFilter: const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                ),
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
          const SizedBox(height: 64),
          CmoFilledButton(
            title: LocaleKeys.next.tr(),
            onTap: _isFinished
                ? () {
                    CompartmentDetailScreen.push(context,
                        farmId: widget.farmId,
                        farmName: widget.farmName,
                        measuredArea: (areaSquareMeters ?? 0) / 10000,
                        locations: _markers
                            .map((e) => GeoLocation(
                                latitude: e.position.latitude,
                                longitude: e.position.longitude))
                            .toList());
                  }
                : null,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
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
            .map((e) => mapToolkitLatlong.LatLng(
                e.position.latitude, e.position.longitude))
            .toList())
        .toDouble();
    setState(() {});
  }

  String _presentAreaSquare() {
    if (areaSquareMeters == null) return '0 ${LocaleKeys.measured.tr()}';
    if (areaSquareMeters! > haSquareMeters) {
      return '${(areaSquareMeters! / haSquareMeters).toStringAsFixed(2)} ha ${LocaleKeys.measured.tr()}';
    }
    return '$areaSquareMeters m2 ${LocaleKeys.measured.tr()}';
  }
}
