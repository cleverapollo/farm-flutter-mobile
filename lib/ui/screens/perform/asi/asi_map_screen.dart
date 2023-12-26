import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/rm_asi/asi_map_cubit.dart';
import 'package:cmo/state/rm_asi/asi_map_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/cmo_map.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AsiMapScreen extends BaseStatefulWidget {
  AsiMapScreen({
    super.key,
    this.farmName,
    required this.onSave,
  }) : super(screenName: 'ASI Map Screen');

  final String? farmName;
  final void Function(double?, List<PolygonItem>?) onSave;

  @override
  State<StatefulWidget> createState() => AsiMapScreenState();

  static dynamic push(
      BuildContext context, {
        required Asi asi,
        required void Function(double?, List<PolygonItem>?) onSave,
        String? farmName,
      }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => AsiMapCubit(
              asi: asi,
            ),
            child: AsiMapScreen(
              farmName: farmName,
              onSave: onSave,
            ),
          );
        },
      ),
    );
  }
}

class AsiMapScreenState extends BaseStatefulWidgetState<AsiMapScreen> {

  @override
  void initState() {
    super.initState();
  }

  GoogleMapController? mapController;

  Set<Polyline> generatePolyline() {
    // final state = context.read<CompartmentMapsSummariesCubit>().state;
    // if (state.isCompletePolygon) {
    //   return <Polyline>{};
    // }
    //
    // if (state.isAddingNew) {
    //   final markers = state.temporaryMarkers;
    //   var polylines = <Polyline>{};
    //   if (markers.length < 2) {
    //     return polylines;
    //   }
    //
    //   for (var i = 1; i < markers.length; i++) {
    //     polylines.add(
    //       Polyline(
    //         polylineId: PolylineId('${markers[i].markerId.value} ${i - 1}_$i'),
    //         points: [
    //           markers[i - 1].position,
    //           markers[i].position,
    //         ],
    //         color: context.colors.yellow,
    //         width: 2,
    //         onTap: () {
    //           print('onTap polyline');
    //         },
    //         startCap: Cap.roundCap,
    //         endCap: Cap.roundCap,
    //       ),
    //     );
    //   }
    //
    //   if (state.isCompletePolygon) {
    //     polylines.add(
    //       Polyline(
    //         polylineId: PolylineId('${markers[markers.length - 1].markerId.value} ${markers.length - 1}_0'),
    //         points: [
    //           markers[markers.length - 1].position,
    //           markers[0].position,
    //         ],
    //         color: context.colors.yellow,
    //         width: 2,
    //       ),
    //     );
    //   }
    //
    //   return polylines;
    // } else if (state.isUpdating) {
    //   final selectedPolyline = state.selectedEditedPolyline;
    //
    //   final markers = state.temporaryMarkers;
    //   var now = DateTime.now().microsecondsSinceEpoch;
    //   var polylines = <Polyline>{};
    //   if (markers.length < 2) {
    //     return polylines;
    //   }
    //
    //   Color getPolylineColor(Polyline polyline) {
    //     if (selectedPolyline == null) {
    //       return context.colors.yellow;
    //     }
    //
    //     final centerLatLng = MapUtils.getCenterPositionFromPolyline(selectedPolyline);
    //     if (polyline.points.first == centerLatLng || polyline.points.last == centerLatLng ) {
    //       return context.colors.greenFF47;
    //     }
    //
    //     return context.colors.yellow;
    //   }
    //
    //   for (var i = 1; i < markers.length; i++) {
    //     var polyline = Polyline(
    //       consumeTapEvents: true,
    //       width: 2,
    //       startCap: Cap.roundCap,
    //       endCap: Cap.roundCap,
    //       polylineId: PolylineId('${markers[i].markerId.value} ${i - 1}_$i $now'),
    //       points: [
    //         markers[i - 1].position,
    //         markers[i].position,
    //       ],
    //
    //     );
    //
    //     polyline = polyline.copyWith(
    //       colorParam: getPolylineColor(polyline),
    //       onTapParam: () {
    //         context.read<CompartmentMapsSummariesCubit>().onTapPolyline(
    //           polyline,
    //           onMoveCameraToCenterPoint: moveMapCameraToLocation,
    //         );
    //       },
    //     );
    //
    //     polylines.add(polyline);
    //     now++;
    //   }
    //
    //   var lastPolyline = Polyline(
    //     consumeTapEvents: true,
    //     width: 2,
    //     polylineId: PolylineId(
    //         '${markers[markers.length - 1].markerId.value} ${markers.length - 1}_0 $now}'),
    //     points: [
    //       markers[markers.length - 1].position,
    //       markers[0].position,
    //     ],
    //   );
    //
    //   lastPolyline = lastPolyline.copyWith(
    //     colorParam: getPolylineColor(lastPolyline),
    //     onTapParam: () {
    //       context.read<CompartmentMapsSummariesCubit>().onTapPolyline(
    //         lastPolyline,
    //         onMoveCameraToCenterPoint: moveMapCameraToLocation,
    //       );
    //     },
    //   );
    //
    //   polylines.add(lastPolyline);
    //   return polylines;
    // }

    return <Polyline>{};
  }

  Set<Polygon> generatePolygon() {
    // final state = context.read<CompartmentMapsSummariesCubit>().state;
    final polygon = <Polygon>{};

    // for (final compartmentMapDetail in state.listCompartmentMapDetails) {
    //   if (compartmentMapDetail.compartment.localCompartmentId == state.selectedCompartment.localCompartmentId) {
    //     continue;
    //   } else {
    //     final generatePolygon = generateSetPolygonFromCompartmentMapDetail(compartmentMapDetail);
    //     if (generatePolygon != null) {
    //       polygon.add(generatePolygon);
    //     }
    //   }
    // }
    //
    // final selectedPolygon = generatePolygonFromListMarker();
    // if (selectedPolygon != null && !state.isUpdating) {
    //   polygon.add(selectedPolygon);
    // }

    return polygon;
  }

  Polygon? generateSetPolygonFromCompartmentMapDetail(
      CompartmentMapDetail compartmentMapDetail, {
        bool isSelected = false,
      }) {
    final fillColor = isSelected ? context.colors.yellow.withOpacity(0.3) : context.colors.white.withOpacity(0.5);
    final strokeColor = isSelected ? context.colors.yellow : context.colors.white;

    if (compartmentMapDetail.markers.isBlank) return null;

    return Polygon(
      polygonId: PolygonId('${compartmentMapDetail.compartment.localCompartmentId}'),
      points: compartmentMapDetail.markers.map((e) => e.position).toList(),
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: 2,
    );
  }

  Polygon? generatePolygonFromListMarker() {
    // final state = context.read<AsiMapCubit>().state;
    // if ((state.isAddingNew && !state.isCompletePolygon) || (state.selectedCompartmentMapDetails?.markers == null || state.selectedCompartmentMapDetails!.markers.isBlank)) {
    //   return null;
    // }
    //
    // final listMarkers = state.selectedCompartmentMapDetails?.markers ?? [];
    // final strokeColor = context.colors.yellow;
    //
    // return Polygon(
    //   polygonId: PolygonId('${state.selectedCompartmentMapDetails?.compartment.localCompartmentId}'),
    //   points: listMarkers.map((e) => e.position).toList(),
    //   fillColor: context.colors.yellow.withOpacity(0.3),
    //   strokeColor: strokeColor,
    //   strokeWidth: 2,
    // );
  }

  Future<void> moveMapCameraToLocation(LatLng position) async {
    await mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> moveMapCameraToInitLocation() async {
    final state = context.read<AsiMapCubit>().state;
    // if (state.isAddingNew) {
    //   final position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high,
    //   );
    //
    //   await mapController?.animateCamera(
    //     CameraUpdate.newLatLng(
    //       LatLng(
    //         position.latitude,
    //         position.longitude,
    //       ),
    //     ),
    //   );
    // } else {
    //   await mapController?.animateCamera(
    //     CameraUpdate.newLatLng(
    //       state.selectedCompartmentMapDetails!.centerPoint(),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.asi.tr(),
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<AsiMapCubit, AsiMapState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: const CameraPosition(target: Constants.mapCenter, zoom: 14),
                      polylines: generatePolyline(),
                      polygons: generatePolygon(),
                      mapType: MapType.satellite,
                      myLocationEnabled: true,
                      markers: state.marker == null ? {} : {state.marker!},
                      onCameraMove: (position) => context
                          .read<AsiMapCubit>()
                          .onCameraMove(position),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        MapUtils.checkLocationPermission(
                          onAllowed: () async {
                            await Future.delayed(Duration(seconds: 1)).then((_) async {
                              await context.read<AsiMapCubit>().initMapData();
                              await moveMapCameraToInitLocation();
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                const MapCenterIcon(),
              ],
            ),
          ),
          BlocSelector<AsiMapCubit, AsiMapState, Marker?>(
            selector: (state) => state.marker,
            builder: (context, marker) {
              return MapLatLongFooter(
                marker?.position,
              );
            },
          ),
          const SizedBox(height: 32),
          functionButtons(),
          const SizedBox(height: 24),
          BlocSelector<AsiMapCubit, AsiMapState, Marker?>(
            selector: (state) => state.marker,
            builder: (context, marker) {
              return Align(
                child: CmoFilledButton(
                  title: LocaleKeys.save.tr(),
                  disable: marker == null,
                  onTap: () {
                    // if (isEnableNextButton) {
                    //   if (widget.onSave == null) {
                    //     Navigator.of(context).pop(locationModel);
                    //   } else {
                    //     widget.onSave!(locationModel);
                    //   }
                    // }
                  },
                ),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget functionButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: context.read<AsiMapCubit>().removeMarker,
              child: Container(
                alignment: Alignment.center,
                child: SvgGenImage(Assets.icons.icRefreshMap.path).svg(
                  height: 68,
                  width: 68,
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: context.read<AsiMapCubit>().createNewMarker,
              child: Container(
                alignment: Alignment.center,
                child: SvgGenImage(Assets.icons.icAcceptMap.path).svg(
                  height: 68,
                  width: 68,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
