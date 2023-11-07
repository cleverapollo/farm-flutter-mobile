import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart';

class CompartmentMapsSummariesScreen extends BaseStatefulWidget {
  CompartmentMapsSummariesScreen({super.key}) : super(screenName: 'Compartment Maps Summaries');

  @override
  State<StatefulWidget> createState() => CompartmentMapsSummariesScreenState();

  static dynamic push(
      BuildContext context, {
        required String farmId,
        String? farmName,
        String? campId,
        required List<Compartment> listCompartments,
        required Compartment selectedCompartment,
      }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentMapsSummariesCubit(
              listCompartments: listCompartments,
              selectedCompartment: selectedCompartment,
              // farmId,
              // compartment: compartment ?? const Compartment(
              //   isActive: true,
              // ),
            ),
            child: CompartmentMapsSummariesScreen(
            ),
          );
        },
      ),
    );
  }
}

class CompartmentMapsSummariesScreenState extends State<CompartmentMapsSummariesScreen> {

  // Future<void> generatePolygon() {
  //   // if (!_isFinished) return Set();
  //   final polygon = Polygon(
  //     polygonId: PolygonId('Polygon'),
  //     points: state.markers.map((e) => e.position).toList(),
  //     fillColor: context.colors.blueDark1.withOpacity(0.4),
  //     strokeColor: Colors.transparent,
  //   );
  //   return Set.of([polygon]);
  // }

  Set<Polyline> _polylines(List<Marker> markers) {

    var polylines = <Polyline>{};
    if (markers.length < 2) {
      return polylines;
    }

    for (var i = 1; i < markers.length; i++) {
      polylines.add(
        Polyline(
          polylineId: PolylineId("${i - 1}_$i"),
          points: [markers[i - 1].position, markers[i].position],
          color: context.colors.grey,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
        ),
      );
    }

    polylines.add(
      Polyline(
        polylineId: PolylineId('${markers.length - 1}_0'),
        points: [
          markers[markers.length - 1].position,
          markers[0].position,
        ],
        color: context.colors.grey,
        width: 5,
      ),
    );

    return polylines;
  }

  Set<Polygon> generatePolygon(List<Marker> markers) {
    // if (!_isFinished) return Set();
    final polygon = Polygon(
      polygonId: PolygonId('Polygon'),
      points: markers.map((e) => e.position).toList(),
      fillColor: context.colors.blueDark1.withOpacity(0.4),
      strokeColor: Colors.transparent,
    );
    return Set.of([polygon]);
  }

  void _drawInitialPolygon() {
    Future.delayed(const Duration(seconds: 1), () async {
      setState(() {
        // _isFinished = true;
      });

      await context.read<CompartmentMapsSummariesCubit>().initMapData();
      _finishDrawing();
    });
  }

  void _finishDrawing() {
    final markers = context.read<CompartmentMapCubit>().state.markers;
    if (markers.isEmpty) return;
    // _isFinished = true;
    // areaSquareMeters = SphericalUtil.computeArea(markers
    //     .map((e) => mapToolkitLatlong.LatLng(
    //     e.position.latitude, e.position.longitude))
    //     .toList())
    //     .toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.compartments.tr(),
        // subtitle: widget.farmName ?? '',
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(target: Constants.mapCenter, zoom: 14),
                      polylines: _polylines(state.markers),
                      polygons: generatePolygon(state.markers),
                      mapType: MapType.satellite,
                      myLocationEnabled: true,
                      // onCameraMove: (position) => context.read<CompartmentMapCubit>().onCameraMove(position, _isFinished),
                      markers: state.markers.toSet(),
                      onMapCreated: (GoogleMapController controller) {
                        if (state.markers.isNotBlank) {
                          _drawInitialPolygon();
                        }
                        //
                        // _controller = controller;
                        // Geolocator.checkPermission().then((permission) async {
                        //   if (permission == LocationPermission.whileInUse ||
                        //       permission == LocationPermission.always) {
                        //     if (widget.points.isBlank) {
                        //       await _moveMapCameraCurrentLocation();
                        //     }
                        //   } else if (permission == LocationPermission.denied) {
                        //     permission = await Geolocator.requestPermission();
                        //     if (permission == LocationPermission.whileInUse ||
                        //         permission == LocationPermission.always) {
                        //       if (widget.points.isBlank) {
                        //         await _moveMapCameraCurrentLocation();
                        //       }
                        //     }
                        //   }
                        // });
                      },
                    );
                  },
                ),
                const MapCenterIcon(),
              ],
            ),
          ),
          const SizedBox(height: 36),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(color: context.colors.grey),
          //   ),
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   alignment: Alignment.center,
          //   child: Text(
          //     _presentAreaSquare(),
          //     style: context.textStyles.bodyBold,
          //   ),
          // ),
          const SizedBox(height: 8),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       onPressed: _removePreviousPoint,
            //       padding: EdgeInsets.zero,
            //       iconSize: 36,
            //       icon: Container(
            //         alignment: Alignment.center,
            //         color: Colors.white,
            //         child: SvgGenImage(Assets.icons.icRefresh.path).svg(
            //           width: 36,
            //           height: 36,
            //           colorFilter: const ColorFilter.mode(
            //             Colors.blue,
            //             BlendMode.srcIn,
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 16),
            //     IconButton(
            //       onPressed: () async {
            //         var center = await getCenter();
            //         if (center != null) {
            //           if (_isCompletedPoint(center)) {
            //             _finishDrawing();
            //           } else {
            //             await context.read<CompartmentMapCubit>().creatNewMarker(center);
            //             if (_isFinished) {
            //               _finishDrawing();
            //             } else {
            //               setState(() {});
            //             }
            //           }
            //         }
            //       },
            //       padding: EdgeInsets.zero,
            //       iconSize: 36,
            //       icon: Container(
            //         alignment: Alignment.center,
            //         color: Colors.white,
            //         child: SvgGenImage(Assets.icons.icAccept.path).svg(
            //           width: 36,
            //           height: 36,
            //           colorFilter: const ColorFilter.mode(
            //             Colors.blue,
            //             BlendMode.srcIn,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 8),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: CmoFilledButton(
            //           title: LocaleKeys.complete_polygon.tr(),
            //           onTap: _finishDrawing,
            //         ),
            //       ),
            //       const SizedBox(width: 24),
            //       Expanded(
            //         child: CmoFilledButton(
            //           title: LocaleKeys.next.tr(),
            //           onTap: _isFinished
            //               ? () {
            //             widget.onSave(
            //               (areaSquareMeters ?? 0) / 10000,
            //               context
            //                   .read<CompartmentMapCubit>()
            //                   .state
            //                   .markers
            //                   .map(
            //                     (e) => PolygonItem(
            //                   latitude: e.position.latitude,
            //                   longitude: e.position.longitude,
            //                 ),
            //               )
            //                   .toList(),
            //             );
            //
            //             Navigator.of(context).pop();
            //           }
            //               : null,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}