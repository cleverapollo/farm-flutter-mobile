import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CmoMap extends StatefulWidget {
  final LatLng? initialMapCenter;
  final void Function(double, double) onMapMoved;
  final bool showLatLongFooter;

  const CmoMap({
    Key? key,
    this.initialMapCenter,
    this.showLatLongFooter = true,
    required this.onMapMoved,
  }) : super(key: key);

  @override
  State<CmoMap> createState() => CmoMapState();
}

class CmoMapState extends State<CmoMap> {
  late GoogleMapController mapController;
  LatLng? _latLong;
  Timer? _debouceOnCameraMove;

  void _onCameraMove(CameraPosition position) {
    _debouceOnCameraMove?.cancel();
    _debouceOnCameraMove = Timer(const Duration(milliseconds: 300), () {
      widget.onMapMoved(position.target.latitude, position.target.longitude);
      setState(() {
        _latLong = position.target;
      });
    });
  }

  Future _moveMapCameraCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await mapController.animateCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
  }

  Future _moveMapCameraToDefaultLocation() async {
    return mapController.animateCamera(CameraUpdate.newLatLng(
        LatLng(Constants.mapCenter.latitude, Constants.mapCenter.longitude)));
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 36),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  onMapCreated: (controller) {
                    mapController = controller;
                    Geolocator.checkPermission().then((permission) async {
                      if (permission == LocationPermission.whileInUse ||
                          permission == LocationPermission.always) {
                        _moveMapCameraCurrentLocation();
                      } else if (permission == LocationPermission.denied) {
                        permission = await Geolocator.requestPermission();
                        if (permission == LocationPermission.whileInUse ||
                            permission == LocationPermission.always) {
                          _moveMapCameraCurrentLocation();
                        } else {
                          _moveMapCameraToDefaultLocation();
                        }
                      } else {
                        _moveMapCameraToDefaultLocation();
                      }
                    });
                  },
                  onCameraMove: _onCameraMove,
                  initialCameraPosition: const CameraPosition(
                    target: Constants.mapCenter,
                    zoom: 16.0,
                  ),
                ),
              ),
              Center(
                child: Assets.icons.icPan.svgWhite,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 32,
                  child: ColoredBox(
                    color: Colors.black.withOpacity(0.4),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            LocaleKeys.panMap.tr(),
                            style: context.textStyles.bodyBold.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.showLatLongFooter) MapLatLongFooter(_latLong) else Container(),
      ],
    );
  }
}

class MapLatLongFooter extends StatelessWidget {
  final LatLng? latLong;

  const MapLatLongFooter(this.latLong, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: GeoLocationText(
                        latLong: latLong,
                      )),
                ),
                Assets.icons.icLocation.widget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
