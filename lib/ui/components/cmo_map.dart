import 'dart:async';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:cmo/ui/widget/cmo_lat_lng_input.dart';
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
  final bool showButtonList;
  final VoidCallback? takePhotoFromCamera;
  final VoidCallback? onSelectPhotos;
  final VoidCallback? onRemoveMarker;
  final LatLng? selectedPoint;
  final bool isAllowManualLatLng;
  final bool shouldShowPhotoButton;
  final void Function()? onMapCreated;

  const CmoMap({
    Key? key,
    this.initialMapCenter,
    this.showLatLongFooter = true,
    required this.onMapMoved,
    this.onPinned,
    this.showMarker = false,
    this.showResetAcceptIcons = false,
    this.showButtonList = false,
    this.isAllowManualLatLng = false,
    this.takePhotoFromCamera,
    this.onSelectPhotos,
    this.onRemoveMarker,
    this.selectedPoint,
    this.shouldShowPhotoButton = true,
    this.onMapCreated,
  }) : super(key: key);

  @override
  State<CmoMap> createState() => CmoMapState();
}

class CmoMapState extends State<CmoMap> {
  GoogleMapController? mapController;
  LatLng? _latLong;
  Timer? _debounceOnCameraMove;

  Marker? marker;
  MapType mapType = MapType.satellite;

  @override
  void initState() {
    super.initState();
    if (widget.selectedPoint != null) {
      marker = _markerFrom(widget.selectedPoint);
    }
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
    if (widget.selectedPoint != null) {
      return;
    }
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(
          position.latitude,
          position.longitude,
        ),
      ),
    );
  }

  Future<void> _moveMapCameraToDefaultLocation() async {
    if (widget.selectedPoint != null) {
      return;
    }
    return mapController?.animateCamera(
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

  void onLatLngChanged(String latlng) {
    final split = latlng.split(',');
    if (split.length == 2) {
      final lat = double.tryParse(split[0].trim());
      final lng = double.tryParse(split[1].trim());
      if (lat != null && lng != null) {
        widget.onPinned?.call(
          lat,
          lng,
        );
      }
    }
  }

  void onChangeMapType() {
    if (mapType == MapType.satellite) {
      mapType = MapType.normal;
    } else {
      mapType = MapType.satellite;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  mapType: mapType,
                  onMapCreated: (controller) {
                    mapController = controller;
                    checkPermission();
                    widget.onMapCreated?.call();
                  },
                  onCameraMove: _onCameraMove,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: widget.initialMapCenter ?? Constants.mapCenter,
                    zoom: Constants.mapZoom,
                  ),
                  markers: shouldShowMarker(),
                  onTap: (latLong) {
                    setState(() {
                      marker = _markerFrom(latLong);
                    });
                  },
                ),
              ),
              Positioned(
                left: 15,
                bottom: 15,
                child: MapTypeSwitchButton(
                  onTap: onChangeMapType,
                ),
              ),
              const MapCenterIcon(),
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
        mapLatLongFooterWidget(),
        buttonsListWidget(),
        resetAcceptButton(),
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
        return MapLatLongFooter(
          marker?.position,
          onLatLngChanged: widget.isAllowManualLatLng ? onLatLngChanged : null,
        );
      } else {
        return MapLatLongFooter(
          _latLong,
          onLatLngChanged: widget.isAllowManualLatLng ? onLatLngChanged : null,
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buttonsListWidget() {
    if (!widget.showButtonList) return const SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        resetOutsideIcon(),
        const SizedBox(
          width: 15,
        ),
        acceptOutsideIcon(),
        Visibility(
          visible: widget.shouldShowPhotoButton,
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              selectPhotoIcon(),
              const SizedBox(
                width: 15,
              ),
              takePhotoIcon(),
            ],
          ),
        )
      ],
    );
  }

  Widget resetAcceptButton() {
    if (!widget.showResetAcceptIcons) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          resetOutsideIcon(),
          const SizedBox(
            width: 15,
          ),
          acceptOutsideIcon(),
        ],
      ),
    );
  }

  Widget resetOutsideIcon() {
    return InkWell(
      onTap: () {
        setState(() {
          marker = null;
        });

        widget.onRemoveMarker?.call();
      },
      child: Container(
        alignment: Alignment.center,
        child: SvgGenImage(Assets.icons.icRefreshMap.path).svg(
          height: 68,
          width: 68,
        ),
      ),
    );
  }

  Widget acceptOutsideIcon() {
    return InkWell(
      onTap: () {
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
      child: Container(
        alignment: Alignment.center,
        child: SvgGenImage(Assets.icons.icAcceptMap.path).svg(
          height: 68,
          width: 68,
        ),
      ),
    );
  }

  Widget selectPhotoIcon() {
    return InkWell(
      onTap: () => widget.onSelectPhotos?.call(),
      child: Container(
        alignment: Alignment.center,
        child: SvgGenImage(Assets.icons.icSelectPhotoMap.path).svg(
          height: 60,
          width: 60,
        ),
      ),
    );
  }

  Widget takePhotoIcon() {
    return InkWell(
      onTap: () async {
        widget.takePhotoFromCamera?.call();
      },
      child: Container(
        alignment: Alignment.center,
        child: SvgGenImage(Assets.icons.icTakePhotoMap.path).svg(
          height: 60,
          width: 60,
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}

class MapLatLongFooter extends StatelessWidget {
  final LatLng? latLong;
  final ValueChanged<String>? onLatLngChanged;

  const MapLatLongFooter(this.latLong, {this.onLatLngChanged, Key? key})
      : super(key: key);

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
                  child: onLatLngChanged != null
                      ? CmoLatLngInput(
                          latLong: latLong,
                          onLatLngChanged: onLatLngChanged,
                        )
                      : FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: GeoLocationText(
                            latLong: latLong,
                          ),
                        ),
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

