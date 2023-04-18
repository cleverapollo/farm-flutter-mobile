import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:maps_toolkit/src/latlng.dart' as mapToolkitLatlong;
import 'package:polymaker/core/models/trackingmode.dart';
import 'package:polymaker/polymaker.dart' as polymaker;
import 'dart:math';
import 'package:flutter_svg/svg.dart' hide svg;

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
  GoogleMapController? _controller;
  List<Marker> _markers = [];
  bool _isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.siteLocation.tr(),
        showLeading: true,
        subtitle: "Site Name",
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
                  onMapCreated: (GoogleMapController controller) =>
                      _controller = controller,
                  markers: _markers.toSet(),
                  onTap: (latLong) {
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
                          onPressed: () {
                            if (_markers.isEmpty) return;
                            _markers.removeLast();
                            _isFinished = false;
                            setState(() {});
                          },
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

  void _finishDrawing() {
    _isFinished = true;
    _polylines();
    var areaInSquareMeters = SphericalUtil.computeArea(_markers
        .map((e) =>
            mapToolkitLatlong.LatLng(e.position.latitude, e.position.longitude))
        .toList());
    print('areaInSquareMeters: $areaInSquareMeters');
    setState(() {});
  }
}
