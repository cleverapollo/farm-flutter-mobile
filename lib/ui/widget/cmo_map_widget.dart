import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/service/image_picker_service.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart'
    as map;

enum GoogleMapType {
  markerSingle,
  markerSingleWithPhotos;

  bool get isMarkerSingleWithPhotos {
    return this == GoogleMapType.markerSingleWithPhotos;
  }

  bool get isMarkerSingle {
    return this == GoogleMapType.markerSingle;
  }
}

class CmoMapWidget extends StatefulWidget {
  const CmoMapWidget._({
    required this.googleMapType,
    required this.points,
    required this.marker,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  factory CmoMapWidget.marker({
    required LatLng initialPoint,
    void Function(LatLng marker)? marker,
    double? height,
    double? width,
  }) {
    return CmoMapWidget._(
      googleMapType: GoogleMapType.markerSingle,
      points: [initialPoint],
      marker: marker,
      height: height,
      width: width,
    );
  }

  factory CmoMapWidget.markerWithPhotos({
    required LatLng? initialPoint,
    void Function(LatLng marker)? marker,
    double? height,
    double? width,
    Key? key,
  }) {
    return CmoMapWidget._(
      googleMapType: GoogleMapType.markerSingleWithPhotos,
      points: initialPoint != null ? [initialPoint] : [],
      marker: marker,
      height: height,
      width: width,
      key: key,
    );
  }

  final double? height;
  final double? width;
  final GoogleMapType googleMapType;
  final List<LatLng> points;
  final void Function(LatLng point)? marker;

  @override
  State<CmoMapWidget> createState() => CmoMapWidgetState();
}

class CmoMapWidgetState extends State<CmoMapWidget> {
  late final GoogleMapController _controller;
  final ImagePickerService _imagePickerService = ImagePickerService();
  final locationModel = LocationModel();

  List<map.LatLng> points = [];
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    points = widget.points;
    _markers = points.map((e) => _markerFrom(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height ?? MediaQuery.of(context).size.height * 0.54,
          width: widget.width ?? double.infinity,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition:
                    const CameraPosition(target: Constants.mapCenter, zoom: 14),
                mapType: MapType.satellite,
                myLocationEnabled: true,
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
                markers: _markers.isEmpty ? <Marker>{} : _markers.toSet(),
                onTap: (latLong) {
                  debugPrint(latLong.toString());
                  setState(() {
                    _removePreviousPoint();
                    locationModel.latitude = latLong.latitude;
                    locationModel.longitude = latLong.longitude;
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
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
          child: CmoDropDownLayoutWidget(
            title: LocaleKeys.lat_long.tr(),
            subTitle: _markers.isEmpty ? '' :
                '${_markers.first.position.latitude.toStringAsFixed(5)} | ${_markers.first.position.longitude.toStringAsFixed(5)}',
            trailingWidget: const Icon(
              Icons.location_on,
              color: Colors.green,
            ),
          ),
        ),
        Visibility(
          visible: widget.googleMapType.isMarkerSingleWithPhotos,
          child: buttonsListWidget(),
        ),
      ],
    );
  }

  void _removePreviousPoint() {
    if (_markers.isEmpty) return;
    _markers.removeLast();
    setState(() {});
  }

  Marker _markerFrom(map.LatLng position) {
    return Marker(
      markerId:
          MarkerId('place_name_${position.latitude}_${position.longitude}'),
      position: position,
    );
  }

  Future _moveMapCameraCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await _controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
  }


  Widget buttonsListWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        resetIcon(),
        const SizedBox(width: 15,),
        acceptIcon(),
        const SizedBox(width: 15,),
        selectPhotoIcon(),
        const SizedBox(width: 15,),
        takePhotoIcon(),
      ],
    );
  }

  Widget resetIcon() {
    return InkWell(
      onTap: _removePreviousPoint,
      child: Container(
        alignment: Alignment.center,
        child: SvgGenImage(Assets.icons.icRefreshMap.path).svg(
          height: 68,
          width: 68,
        ),
      ),
    );
  }

  Widget acceptIcon() {
    return InkWell(
      onTap: () {},
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
      onTap: () async {
        locationModel.imageUri =
            (await _imagePickerService.pickImageFromGallery())
                ?.path;
      },
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
        locationModel.imageUri =
            (await _imagePickerService.pickImageFromCamera())
                ?.path;
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
}
