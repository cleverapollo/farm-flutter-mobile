import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/compartment_cubit/compartment_map_detail.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/components/ignore_pointer_loading.dart';
import 'package:cmo/ui/components/map_center_icon.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompartmentEditPolygonScreen extends BaseStatefulWidget {
  const CompartmentEditPolygonScreen({
    super.key,
    this.farmName,
    required this.farmId,
    required this.onSave,
  }) : super(screenName: 'Compartment Maps Summaries');

  final String? farmName;
  final String farmId;
  final void Function(double?, List<PolygonItem>?) onSave;

  @override
  State<StatefulWidget> createState() => CompartmentEditPolygonScreenState();

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
            create: (_) => CompartmentEditPolygonCubit(
              selectedCompartment: selectedCompartment,
              farmId: farmId,
            ),
            child: CompartmentEditPolygonScreen(
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

class CompartmentEditPolygonScreenState extends BaseStatefulWidgetState<CompartmentEditPolygonScreen> {

  GoogleMapController? mapController;

  late CompartmentEditPolygonCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CompartmentEditPolygonCubit>();
  }

  @override
  bool get shouldCheckConnectionSpeed => true;

  @override
  bool get canPopWithoutWarningDialog => !cubit.state.isEditing;

  Set<Polyline> generatePolyline() {
    final state = cubit.state;
    if (state.isUpdating) {
      final selectedPolyline = state.selectedEditedPolyline;

      final markers = state.temporaryMarkers;
      var now = DateTime.now().microsecondsSinceEpoch;
      final polylines = <Polyline>{};
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
          width: 2,
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
            cubit.onTapPolyline(
                  polyline,
                  onMoveCameraToCenterPoint: moveMapCameraToLocation,
                );
          },
        );

        polylines.add(polyline);
        now++;
      }

      var lastPolyline = Polyline(
        consumeTapEvents: true,
        width: 2,
        polylineId: PolylineId('${markers[markers.length - 1].markerId.value} ${markers.length - 1}_0 $now}'),
        points: [
          markers[markers.length - 1].position,
          markers[0].position,
        ],
      );

      lastPolyline = lastPolyline.copyWith(
        colorParam: getPolylineColor(lastPolyline),
        onTapParam: () {
          cubit.onTapPolyline(
                lastPolyline,
                onMoveCameraToCenterPoint: moveMapCameraToLocation,
              );
        },
      );

      polylines.add(lastPolyline);

      return polylines;
    }

    return <Polyline>{};
  }

  Set<Polygon> generatePolygon() {
    final state = cubit.state;
    final polygon = <Polygon>{};
    final visibleRegion = state.visibleRegion;

    for (final compartmentMapDetail in state.listCompartmentMapDetails) {
      final isCompartmentVisible = visibleRegion?.contains(compartmentMapDetail.compartment.centerPoint());
      if (isCompartmentVisible != null && isCompartmentVisible) {
        if (compartmentMapDetail.compartment.localCompartmentId == state.selectedCompartment.localCompartmentId) {
          continue;
        } else {
          final generatePolygon = generateSetPolygonFromCompartmentMapDetail(compartmentMapDetail);
          if (generatePolygon != null) {
            polygon.add(generatePolygon);
          }
        }
      }
    }

    final selectedPolygon = generatePolygonFromListMarker();
    if (selectedPolygon != null) {
      polygon.add(selectedPolygon);
    }

    return polygon;
  }

  Polygon? generateSetPolygonFromCompartmentMapDetail(
      CompartmentMapDetail compartmentMapDetail, {
        bool isSelected = false,
      }) {
    final strokeColor = isSelected ? context.colors.yellow : context.colors.white;
    final fillColor = strokeColor.withOpacity(isSelected ? 0.3 : 0.5);

    if (compartmentMapDetail.polygons.isBlank) return null;

    return Polygon(
      polygonId: PolygonId('${compartmentMapDetail.compartment.localCompartmentId}'),
      points: compartmentMapDetail.polygons,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: 2,
    );
  }

  Polygon? generatePolygonFromListMarker() {
    final state = cubit.state;
    if (state.isUpdating) {
      return null;
    }

    final listMarkers = state.selectedCompartmentMapDetails?.markers ?? [];
    final strokeColor = context.colors.yellow;

    return Polygon(
      polygonId: PolygonId('${state.selectedCompartmentMapDetails?.compartment.localCompartmentId}'),
      points: listMarkers.map((e) => e.position).toList(),
      fillColor: strokeColor.withOpacity(0.3),
      strokeColor: strokeColor,
      strokeWidth: 2,
    );
  }

  Future<void> moveMapCameraToLocation(LatLng position) async {
    await mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> moveMapCameraToInitLocation() async {
    final state = cubit.state;
    await mapController?.animateCamera(
      CameraUpdate.newLatLng(
        state.selectedCompartmentMapDetails!.centerPoint(),
      ),
    );
  }

  void onTemporarySavedListMarkersOnCompartmentModel({
    bool shouldClearLastItem = true,
  }) {
    final listMarkers = context
        .read<CompartmentEditPolygonCubit>()
        .getTemporarySavedMarkers(shouldClearLastItem);
    final polygons = listMarkers.map(MapUtils.generateLatLngFromMarker).toList();
    final areaInHa = MapUtils.computeAreaInHa(polygons);
    widget.onSave(
      areaInHa,
      listMarkers
          .map(
            (e) => PolygonItem(
              latitude: e.position.latitude,
              longitude: e.position.longitude,
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.compartments.tr(),
        subtitle: widget.farmName ?? '',
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: onShowWarningDispose,
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: onShowWarningDispose,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          instructionMessages(),
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<CompartmentEditPolygonCubit, CompartmentEditPolygonState>(
                  builder: (context, state) {
                    return GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target: Constants.mapCenter,
                        zoom: Constants.mapZoom,
                      ),
                      polylines: generatePolyline(),
                      polygons: generatePolygon(),
                      mapType: state.mapType,
                      myLocationEnabled: true,
                      markers: Set.of(state.displayMarkers),
                      onCameraMove: (position) async {
                        final visibleRegion = await mapController?.getVisibleRegion();
                        await context
                            .read<CompartmentEditPolygonCubit>()
                            .onCameraMove(
                              position,
                              visibleRegion,
                            );
                      },
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                        MapUtils.checkLocationPermission(
                          onAllowed: () async {
                            await Future.delayed(Duration(seconds: 1)).then((_) async {
                              await cubit.initMapData();
                              await moveMapCameraToInitLocation();
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: MapTypeSwitchButton(
                    onTap: cubit.onChangeMapType,
                  ),
                ),
                const MapCenterIcon(),
                Positioned.fill(
                  child: BlocSelector<CompartmentEditPolygonCubit, CompartmentEditPolygonState, bool>(
                    selector: (state) => state.loading,
                    builder: (context, loading) {
                      return loading
                          ? const IgnorePointerLoading()
                          : const SizedBox.shrink();
                    },
                  ),
                ),
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
    return BlocBuilder<CompartmentEditPolygonCubit, CompartmentEditPolygonState>(
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
    return BlocSelector<CompartmentEditPolygonCubit, CompartmentEditPolygonState, CompartmentMapDetail?>(
      selector: (state) => state.compartmentMapDetailByCameraPosition,
      builder: (context, compartmentMapDetailByCameraPosition) {
        final compartmentName = compartmentMapDetailByCameraPosition?.compartment.unitNumber ?? '';
        final perimeter = (convertDistanceUnit(compartmentMapDetailByCameraPosition?.getPerimeter()) ?? 0).toStringAsFixed(2);
        final area = (convertAreaUnit(compartmentMapDetailByCameraPosition?.getAreaInHa()) ?? 0).toStringAsFixed(2);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              compartmentName,
              style: context.textStyles.bodyBold.blueDark2,
            ),
            Text(
              '${LocaleKeys.perimeter.tr()} $perimeter $distanceUnit',
              style: context.textStyles.bodyNormal.blueDark2,

            ),
            Text(
              '${LocaleKeys.area.tr()} $area $areaUnit ${LocaleKeys.measured.tr()}',
              style: context.textStyles.bodyNormal.blueDark2,
            ),
          ],
        );
      },
    );
  }

  Widget functionButtons() {
    return BlocBuilder<CompartmentEditPolygonCubit, CompartmentEditPolygonState>(
      builder: (context, state) {
        Widget? child;
        if (state.isSelectedCompartmentMapDetails && !state.isUpdating) {
          child = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: cubit.editingPolygon,
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

  Widget editingFunctionButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                cubit.onResetPolygon();
                onTemporarySavedListMarkersOnCompartmentModel();
              },
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
              onTap: () {
                cubit.onUpdateNewPositionMarker();
                onTemporarySavedListMarkersOnCompartmentModel(shouldClearLastItem: false);
              },
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
                child: BlocSelector<CompartmentEditPolygonCubit, CompartmentEditPolygonState, bool>(
                  selector: (state) => state.isChanged,
                  builder: (context, isChanged) => CmoFilledButton(
                    title: LocaleKeys.accept_changes.tr(),
                    disable: !isChanged,
                    onTap: () {
                      cubit.onAcceptChanges(onSave: widget.onSave);
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
