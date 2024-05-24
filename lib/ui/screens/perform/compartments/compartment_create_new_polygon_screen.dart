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
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompartmentCreateNewPolygonScreen extends BaseStatefulWidget {
  CompartmentCreateNewPolygonScreen({
    super.key,
    this.farmName,
    required this.farmId,
    required this.onSave,
  }) : super();

  final String? farmName;
  final String farmId;
  final void Function(double?, List<PolygonItem>?) onSave;

  @override
  State<StatefulWidget> createState() => CompartmentCreateNewPolygonScreenState();

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
            create: (_) => CompartmentCreateNewPolygonCubit(
              selectedCompartment: selectedCompartment,
              farmId: farmId,
            ),
            child: CompartmentCreateNewPolygonScreen(
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

class CompartmentCreateNewPolygonScreenState extends BaseStatefulWidgetState<CompartmentCreateNewPolygonScreen> {

  GoogleMapController? mapController;
  late CompartmentCreateNewPolygonCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<CompartmentCreateNewPolygonCubit>();
  }

  @override
  bool get shouldCheckConnectionSpeed => true;

  @override
  bool get canPopWithoutWarningDialog => !cubit.state.isEditing;

  Set<Polyline> generatePolyline() {
    final state = cubit.state;
    final markers = state.isCompletePolygon ? state.displayMarkers : state.temporaryMarkers;
    final polylines = <Polyline>{};

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
          width: 2,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
        ),
      );
    }

    return polylines;
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
    if (!state.isCompletePolygon ||
        state.selectedCompartmentMapDetails?.markers == null ||
        state.selectedCompartmentMapDetails!.markers.isBlank ||
        state.selectedCompartmentMapDetails!.markers.length <= 2) {
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

  Future<void> moveMapCameraToInitLocation() async {
    final state = cubit.state;
    if (state.selectedCompartment.polygon.isBlank) {
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

  void onTemporarySavedListMarkersOnCompartmentModel({
    bool shouldClearLastItem = true,
  }) {
    final listMarkers = cubit.getTemporarySavedMarkers(shouldClearLastItem);
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
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<CompartmentCreateNewPolygonCubit, CompartmentCreateNewPolygonState>(
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
                        await cubit.onCameraMove(
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
                  child: BlocSelector<CompartmentCreateNewPolygonCubit, CompartmentCreateNewPolygonState, bool>(
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

  Widget compartmentDetailData() {
    return BlocSelector<CompartmentCreateNewPolygonCubit, CompartmentCreateNewPolygonState, CompartmentMapDetail?>(
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
    return BlocBuilder<CompartmentCreateNewPolygonCubit, CompartmentCreateNewPolygonState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    cubit.removePreviousMarker();
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
                  onTap: () async {
                    await cubit.createNewMarker();
                    onTemporarySavedListMarkersOnCompartmentModel();
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
                    child: CmoFilledButton(
                      title: LocaleKeys.complete_polygon.tr(),
                      onTap: cubit.onCompletePolygon,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: BlocSelector<CompartmentCreateNewPolygonCubit, CompartmentCreateNewPolygonState, bool>(
                      selector: (state) => state.isCompletePolygon,
                      builder: (context, isCompletePolygon) {
                        return CmoFilledButton(
                          title: LocaleKeys.next.tr(),
                          disable: !isCompletePolygon,
                          onTap: () {
                            final selectedCompartmentMapDetails = cubit.state.selectedCompartmentMapDetails;
                            if (selectedCompartmentMapDetails != null) {
                              widget.onSave(
                                selectedCompartmentMapDetails.getAreaInHa(),
                                selectedCompartmentMapDetails.markers
                                    .map(
                                      (e) => PolygonItem(
                                        latitude: e.position.latitude,
                                        longitude: e.position.longitude,
                                      ),
                                    )
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
      },
    );
  }
}
