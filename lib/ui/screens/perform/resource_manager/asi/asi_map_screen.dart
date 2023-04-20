import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart'
    as map;

class ASIMapScreen extends StatefulWidget {
  const ASIMapScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ASIMapScreen()));
  }

  @override
  State<ASIMapScreen> createState() => _ASIMapScreenState();
}

class _ASIMapScreenState extends State<ASIMapScreen> {
  late GoogleMapController _controller;

  final List<map.LatLng> points = [
    const LatLng(-26.015368927981065, 28.042593151330948)
  ];

  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers = points.map((e) => _markerFrom(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CmoAppBarV2(
        title: 'Add ASI',
        subtitle: 'Site Name',
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: context.colors.white,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: const CameraPosition(
                          target: Constants.mapCenter, zoom: 14),
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
                                child: SvgGenImage(Assets.icons.icRefresh.path)
                                    .svg(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
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
              Row(
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
              const SizedBox(height: 40),
              Align(
                child: CmoFilledButton(
                    title: 'Next',
                    onTap: () {
                      ASIDetailScreen.push(context,
                          lat: _markers.first.position.latitude,
                          lng: _markers.first.position.longitude);
                    }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
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
