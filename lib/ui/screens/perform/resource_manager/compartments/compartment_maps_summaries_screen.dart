import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_detail_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompartmentMapsSummariesScreen extends BaseStatefulWidget {
  CompartmentMapsSummariesScreen({
    super.key,
    this.farmName,
    required this.farmId,
    required this.onSave,
  }) : super(screenName: 'Compartment Maps Summaries');

  final String? farmName;
  final String farmId;
  final void Function(double?, List<PolygonItem>?) onSave;

  @override
  State<StatefulWidget> createState() => CompartmentMapsSummariesScreenState();

  static dynamic push(
      BuildContext context, {
        required String farmId,
        required Compartment selectedCompartment,
        required void Function(double?, List<PolygonItem>?) onSave,
        String? farmName,
        String? campId,
      }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => CompartmentMapsSummariesCubit(
              selectedCompartment: selectedCompartment,
            ),
            child: CompartmentMapsSummariesScreen(
              farmName: farmName,
              farmId: farmId,
              onSave: onSave,
            ),
          );
        },
      ),
    );
  }
}

class CompartmentMapsSummariesScreenState extends BaseStatefulWidgetState<CompartmentMapsSummariesScreen> {

  @override
  void initState() {
    super.initState();
  }

  GoogleMapController? mapController;

  Set<Polyline> generatePolyline() {
    final state = context.read<CompartmentMapsSummariesCubit>().state;
    if (state.isCompletePolygon) {
      return <Polyline>{};
    }

    if (state.isAddingNew) {
      final markers = state.temporaryMarkers;
      var polylines = <Polyline>{};
      if (markers.length < 2) {
        return polylines;
      }

      for (var i = 1; i < markers.length; i++) {
        polylines.add(
          Polyline(
            polylineId: PolylineId('${markers[i].markerId.value} ${i - 1}_$i'),
            points: [
              markers[i - 1].position,
              markers[i].position,
            ],
            color: context.colors.yellow,
            width: 5,
            onTap: () {
              print('onTap polyline');
            },
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
          ),
        );
      }

      if (state.isCompletePolygon) {
        polylines.add(
          Polyline(
            polylineId: PolylineId('${markers[markers.length - 1].markerId.value} ${markers.length - 1}_0'),
            points: [
              markers[markers.length - 1].position,
              markers[0].position,
            ],
            color: context.colors.yellow,
            width: 5,
          ),
        );
      }

      return polylines;
    } else if (state.isUpdating) {
      final selectedPolyline = state.selectedEditedPolyline;

      final markers = state.temporaryMarkers;
      var now = DateTime.now().microsecondsSinceEpoch;
      var polylines = <Polyline>{};
      if (markers.length < 2) {
        return polylines;
      }

      Color getPolylineColor(Polyline polyline) {
        if (selectedPolyline == null) {
          return context.colors.yellow;
        }

        final centerLatLng = MapUtils.getCenterPositionFromPolyline(selectedPolyline);
        if (polyline.points.first == centerLatLng || polyline.points.last == centerLatLng ) {
          return context.colors.greenFF47;
        }

        return context.colors.yellow;
      }

      for (var i = 1; i < markers.length; i++) {
        var polyline = Polyline(
          consumeTapEvents: true,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          polylineId: PolylineId('${markers[i].markerId.value} ${i - 1}_$i $now'),
          points: [
            markers[i - 1].position,
            markers[i].position,
          ],

        );

        polyline = polyline.copyWith(
          colorParam: getPolylineColor(polyline),
          onTapParam: () {
            context
                .read<CompartmentMapsSummariesCubit>()
                .onTapPolyline(polyline);
          },
        );

        polylines.add(polyline);
        now++;
      }

      var lastPolyline = Polyline(
        consumeTapEvents: true,
        width: 5,
        polylineId: PolylineId(
            '${markers[markers.length - 1].markerId.value} ${markers.length - 1}_0 $now}'),
        points: [
          markers[markers.length - 1].position,
          markers[0].position,
        ],
      );

      lastPolyline = lastPolyline.copyWith(
        colorParam: getPolylineColor(lastPolyline),
        onTapParam: () {
          context
              .read<CompartmentMapsSummariesCubit>()
              .onTapPolyline(lastPolyline);
        },
      );

      polylines.add(lastPolyline);
      return polylines;
    }

    return <Polyline>{};
  }

  Set<Polygon> generatePolygon() {
    final state = context.read<CompartmentMapsSummariesCubit>().state;
    final polygon = <Polygon>{};

    for (final compartmentMapDetail in state.listCompartmentMapDetails) {
      if (compartmentMapDetail.compartment.localCompartmentId == state.selectedCompartment.localCompartmentId) {
        continue;
      } else {
        final generatePolygon = generateSetPolygonFromCompartmentMapDetail(compartmentMapDetail);
        if (generatePolygon != null) {
          polygon.add(generatePolygon);
        }
      }
    }

    final selectedPolygon = generatePolygonFromListMarker();
    if (selectedPolygon != null && !state.isUpdating) {
      polygon.add(selectedPolygon);
    }

    return polygon;
  }

  Polygon? generateSetPolygonFromCompartmentMapDetail(
      CompartmentMapDetail compartmentMapDetail, {
        bool isSelected = false,
      }) {
    final fillColor = isSelected ? context.colors.yellow.withOpacity(0.3) : context.colors.grey.withOpacity(0.5);
    final strokeColor = isSelected ? context.colors.yellow : context.colors.grey;

    if (compartmentMapDetail.markers.isBlank) return null;

    return Polygon(
      polygonId: PolygonId('${compartmentMapDetail.compartment.localCompartmentId}'),
      points: compartmentMapDetail.markers.map((e) => e.position).toList(),
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: 5,
    );
  }

  Polygon? generatePolygonFromListMarker() {
    final state = context.read<CompartmentMapsSummariesCubit>().state;
    if ((state.isAddingNew && !state.isCompletePolygon) || (state.selectedCompartmentMapDetails?.markers == null || state.selectedCompartmentMapDetails!.markers.isBlank)) {
      return null;
    }

    final listMarkers = state.selectedCompartmentMapDetails?.markers ?? [];
    final strokeColor = context.colors.yellow;

    return Polygon(
      polygonId: PolygonId('${state.selectedCompartmentMapDetails?.compartment.localCompartmentId}'),
      points: listMarkers.map((e) => e.position).toList(),
      fillColor: context.colors.yellow.withOpacity(0.3),
      strokeColor: strokeColor,
      strokeWidth: 5,
    );
  }

  Future<void> moveMapCameraToInitLocation() async {
    final state = context.read<CompartmentMapsSummariesCubit>().state;
    if (state.isAddingNew) {
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
    } else {
      await mapController?.animateCamera(
        CameraUpdate.newLatLng(
          state.selectedCompartmentMapDetails!.centerPoint(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.compartments.tr(),
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          instructionMessages(),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: const CameraPosition(target: Constants.mapCenter, zoom: 14),
                      polylines: generatePolyline(),
                      polygons: generatePolygon(),
                      mapType: MapType.satellite,
                      myLocationEnabled: true,
                      markers: Set.of(state.temporaryMarkers),
                      onCameraMove: (position) => context
                          .read<CompartmentMapsSummariesCubit>()
                          .onCameraMove(position),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        MapUtils.checkLocationPermission(
                          onAllowed: () async {
                            await Future.delayed(Duration(seconds: 1)).then((_) async {
                              await context.read<CompartmentMapsSummariesCubit>().initMapData();
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
          const SizedBox(height: 8,),
          compartmentDetailData(),
          const SizedBox(height: 32),
          functionButtons(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget instructionMessages() {
    return BlocBuilder<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState>(
      builder: (context, state) {
        var instructionMessage = '';

        if (state.isUpdating) {
          instructionMessage = LocaleKeys.select_a_point_or_line_to_edit.tr();
          if (state.selectedEditedMarker != null || state.selectedEditedPolyline != null) {
            instructionMessage = LocaleKeys.pan_map_to_move_point.tr();
          }

          return CmoHeaderTile(
            title: instructionMessage,
            backgroundColor: context.colors.black,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget compartmentDetailData() {
    return BlocSelector<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState, CompartmentMapDetail?>(
      selector: (state) => state.compartmentMapDetailByCameraPosition,
      builder: (context, compartmentMapDetailByCameraPosition) {
        final compartmentName = compartmentMapDetailByCameraPosition?.compartment.unitNumber ?? '';
        final perimeter = (compartmentMapDetailByCameraPosition?.getPerimeter() ?? 0).toStringAsFixed(2);
        final area = (compartmentMapDetailByCameraPosition?.getAreaInHa() ?? 0).toStringAsFixed(2);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              compartmentName,
              style: context.textStyles.bodyBold.blueDark2,
            ),
            Text(
              '${LocaleKeys.perimeter.tr()} ${perimeter}km',
              style: context.textStyles.bodyNormal.blueDark2,

            ),
            Text(
              '${LocaleKeys.area.tr()} $area ha ${LocaleKeys.measured.tr()}',
              style: context.textStyles.bodyNormal.blueDark2,
            ),
          ],
        );
      },
    );
  }

  Widget functionButtons() {
    return BlocBuilder<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState>(
      builder: (context, state) {
        Widget? child;
        if (state.isAddingNew) {
          child = addingFunctionButton();
        } else if (state.isSelectedCompartmentMapDetails && !state.isUpdating) {
          child = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: context.read<CompartmentMapsSummariesCubit>().editingPolygon,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: SvgGenImage(Assets.icons.icEditBlueCircle.path).svg(
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ],
          );
        } else if (state.isUpdating) {
          child = editingFunctionButton();
        } else {
          child = const SizedBox(
            width: 60,
            height: 60,
          );
        }

        return child;

      },
    );
  }

  Widget addingFunctionButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: context.read<CompartmentMapsSummariesCubit>().removePreviousMarker,
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
              onTap: context.read<CompartmentMapsSummariesCubit>().createNewMarker,
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
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: CmoFilledButton(
                  title: LocaleKeys.complete_polygon.tr(),
                  onTap: context.read<CompartmentMapsSummariesCubit>().onCompletePolygon,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: BlocSelector<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState, bool>(
                  selector: (state) => state.isCompletePolygon,
                  builder: (context, isCompletePolygon) {
                    return CmoFilledButton(
                      title: LocaleKeys.next.tr(),
                      disable: !isCompletePolygon,
                      onTap: () {
                        final selectedCompartmentMapDetails = context.read<CompartmentMapsSummariesCubit>().state.selectedCompartmentMapDetails;
                        if (selectedCompartmentMapDetails != null) {
                          widget.onSave(
                            selectedCompartmentMapDetails.getAreaInHa(),
                            selectedCompartmentMapDetails.markers
                                .map((e) => PolygonItem(
                                      latitude: e.position.latitude,
                                      longitude: e.position.longitude,
                                    ))
                                .toList(),
                          );
                        }

                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget editingFunctionButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: context.read<CompartmentMapsSummariesCubit>().onResetPolygon,
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
              onTap: context.read<CompartmentMapsSummariesCubit>().onUpdateNewPositionMarker,
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
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: BlocSelector<CompartmentMapsSummariesCubit, CompartmentMapsSummariesState, bool>(
                  selector: (state) => state.isChanged,
                  builder: (context, isChanged) => CmoFilledButton(
                    title: LocaleKeys.accept_changes.tr(),
                    disable: !isChanged,
                    onTap: () {
                      context
                          .read<CompartmentMapsSummariesCubit>()
                          .onAcceptChanges(onSave: widget.onSave);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: CmoFilledButton(
                  title: LocaleKeys.exit.tr(),
                  onTap: Navigator.of(context).pop,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
