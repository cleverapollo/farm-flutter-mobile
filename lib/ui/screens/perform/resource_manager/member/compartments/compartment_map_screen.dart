import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/member/compartments/compartment_detail_screen.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:maps_toolkit/src/latlng.dart' as mapToolkitLatlong;

class CompartmentMapScreen extends StatefulWidget {
  static Future<T?> push<T>(BuildContext context) async {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(builder: (_) => CompartmentMapScreen()),
    );
  }

  CompartmentMapScreen({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.compartments.tr(),
        showLeading: true,
        subtitle: LocaleKeys.siteName.tr(),
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
                  onMapCreated: (GoogleMapController controller) =>
                      _controller = controller,
                  markers: _markers.toSet(),
                  onTap: (latLong) {
                    if (_isFinished) return;
                    final marker = Marker(
                      markerId: MarkerId('place_name_${latLong.latitude}'),
                      position: latLong,
                      draggable: true,
                    );
                    setState(() {
                      _markers.add(marker);
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
                ? () => CompartmentDetailScreen.push(context)
                : null,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Set<Polyline> _polylines() {
    var polylines = <Polyline>{};
    if (_markers.length < 2) {
      return polylines;
    }
    for (var i = 1; i < _markers.length; i++) {
      polylines.add(
        Polyline(
          polylineId: PolylineId("${i - 1}_$i"),
          points: [_markers[i - 1].position, _markers[i].position],
          color: context.colors.yellow,
          width: 5,
        ),
      );
    }
    if (_isFinished) {
      polylines.add(
        Polyline(
          polylineId: PolylineId("${_markers.length - 1}_0"),
          points: [
            _markers[_markers.length - 1].position,
            _markers[0].position,
          ],
          color: context.colors.yellow,
          width: 5,
        ),
      );
    }
    return polylines;
  }

  Set<Polygon> _polygon() {
    if (!_isFinished) return Set();
    final polygon = Polygon(
      polygonId: PolygonId("Polygon"),
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
    if (areaSquareMeters == null)
      return '0 ${LocaleKeys.measured.tr()}';
    if (areaSquareMeters! > haSquareMeters) {
      return '${(areaSquareMeters! / haSquareMeters).toStringAsFixed(2)} ha ${LocaleKeys.measured.tr()}';
    }
    return '$areaSquareMeters m2 ${LocaleKeys.measured.tr()}';
  }
}
