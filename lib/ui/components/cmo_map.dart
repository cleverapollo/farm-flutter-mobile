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
  final void Function(double, double)? onPinned;
  final bool showLatLongFooter;
  final bool showMarker;
  final bool showResetAcceptIcons;

  const CmoMap({
    Key? key,
    this.initialMapCenter,
    this.showLatLongFooter = true,
    required this.onMapMoved,
    this.onPinned,
    this.showMarker = false,
    this.showResetAcceptIcons = false,
  }) : super(key: key);

  @override
  State<CmoMap> createState() => CmoMapState();
}

class CmoMapState extends State<CmoMap> {
  late GoogleMapController mapController;
  LatLng? _latLong;
  Timer? _debounceOnCameraMove;

  Marker? marker;

  @override
  void initState() {
    super.initState();
  }

  void _onCameraMove(CameraPosition position) {
    _debounceOnCameraMove?.cancel();
    _debounceOnCameraMove = Timer(const Duration(milliseconds: 300), () {
      widget.onMapMoved(position.target.latitude, position.target.longitude);
      setState(() {
        _latLong = position.target;
      });
    });
  }

  Future<void> _moveMapCameraCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await mapController.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          position.latitude,
          position.longitude,
        ),
      ),
    );
  }

  Future<void> _moveMapCameraToDefaultLocation() async {
    return mapController.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          Constants.mapCenter.latitude,
          Constants.mapCenter.longitude,
        ),
      ),
    );
  }

  Set<Marker> shouldShowMarker() {
    if (!widget.showMarker || marker == null) return <Marker>{};
    return {marker!};
  }

  Marker? _markerFrom(LatLng? latLng) {
    if (latLng == null) return null;
    return Marker(
      markerId: MarkerId(
        'place_name_${latLng.latitude}_${latLng.longitude}',
      ),
      position: latLng,
    );
  }

  void checkPermission() {
    GeolocatorPlatform.instance.checkPermission().then((permission) async {
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        await _moveMapCameraCurrentLocation();
      } else if (permission == LocationPermission.denied) {
        permission = await GeolocatorPlatform.instance.requestPermission();
        if (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) {
          await _moveMapCameraCurrentLocation();
        } else {
          await _moveMapCameraToDefaultLocation();
        }
      } else {
        await _moveMapCameraToDefaultLocation();
      }
    });
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
                    checkPermission();
                  },
                  onCameraMove: _onCameraMove,
                  initialCameraPosition: const CameraPosition(
                    target: Constants.mapCenter,
                    zoom: 16.0,
                  ),
                  markers: shouldShowMarker(),
                  onTap: (latLong) {
                    setState(() {
                      marker = _markerFrom(latLong);
                    });
                  },
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
              if(widget.showResetAcceptIcons) ...[
                resetIcon(),
                acceptIcon(),
              ]
            ],
          ),
        ),

        mapLatLongFooterWidget(),
      ],
    );
  }

  Widget resetIcon() {
    return Positioned(
      right: 5,
      top: 24,
      child: IconButton(
        onPressed: () {
          setState(() {
            marker = null;
          });
        },
        iconSize: 38,
        icon: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.white,
          child: SvgGenImage(Assets.icons.icRefresh.path).svg(
            colorFilter: const ColorFilter.mode(
              Colors.grey,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  Widget acceptIcon() {
    return Positioned(
      right: 5,
      top: 74,
      child: IconButton(
        onPressed: () {
          setState(() {
            marker ??= _markerFrom(_latLong);
            if (_latLong != null) {
              widget.onPinned?.call(
                _latLong!.latitude,
                _latLong!.longitude,
              );
            }
          });
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
    );
  }

  Widget mapLatLongFooterWidget() {
    if (widget.showLatLongFooter) {
      if (widget.showMarker) {
        return MapLatLongFooter(marker?.position);
      } else {
        return MapLatLongFooter(_latLong);
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
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
