import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart'
    as map;

enum MapType {
  markerSingle,
  markerSingleWithPhotos;

  bool get isMarkerSingleWithPhotos {
    return this == MapType.markerSingleWithPhotos;
  }

  bool get isMarkerSingle {
    return this == MapType.markerSingle;
  }
}

class CmoMapWidget extends StatefulWidget {
  const CmoMapWidget._(
      {required this.mapType,
      required this.points,
      required this.marker,
      required this.height,
      required this.width});

  factory CmoMapWidget.marker({
    required LatLng initialPoint,
    void Function(LatLng marker)? marker,
    double? height,
    double? width,
  }) {
    return CmoMapWidget._(
      mapType: MapType.markerSingle,
      points: [initialPoint],
      marker: marker,
      height: height,
      width: width,
    );
  }

  factory CmoMapWidget.markerWithPhotos({
    required LatLng initialPoint,
    void Function(LatLng marker)? marker,
    double? height,
    double? width,
  }) {
    return CmoMapWidget._(
      mapType: MapType.markerSingleWithPhotos,
      points: [initialPoint],
      marker: marker,
      height: height,
      width: width,
    );
  }

  final double? height;
  final double? width;
  final MapType mapType;
  final List<LatLng> points;
  final void Function(LatLng point)? marker;

  @override
  State<CmoMapWidget> createState() => _CmoMapWidgetState();
}

class _CmoMapWidgetState extends State<CmoMapWidget> {
  late final GoogleMapController _controller;

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
                onMapCreated: (GoogleMapController controller) =>
                    _controller = controller,
                markers: _markers.isEmpty ? <Marker>{} : _markers.toSet(),
                onTap: (latLong) {
                  debugPrint(latLong.toString());
                  setState(() {
                    _removePreviousPoint();
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
            title: 'Lat | Long',
            subTitle:
                '${_markers.first.position.latitude.toStringAsFixed(5)} | ${_markers.first.position.longitude.toStringAsFixed(5)}',
            trailingWidget: const Icon(
              Icons.location_on,
              color: Colors.green,
            ),
          ),
        ),
        Visibility(
          visible: widget.mapType.isMarkerSingleWithPhotos,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                child: CmoFilledButton(title: 'Select Photo', onTap: () {}),
              ),
              Align(
                child: CmoFilledButton(title: 'Take Photo', onTap: () {}),
              ),
            ],
          ),
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
}
