import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/compartment_cubit/compartment_map_detail.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'compartment_create_new_polygon_state.dart';

class CompartmentCreateNewPolygonCubit extends Cubit<CompartmentCreateNewPolygonState> {
  CompartmentCreateNewPolygonCubit({
    required Compartment selectedCompartment,
    required String farmId,
  }) : super(
    CompartmentCreateNewPolygonState(
      selectedCompartment: selectedCompartment,
      farmId: farmId,
    ),
  );

  Future<void> initMapData() async {
    emit(state.copyWith(loading: true));
    final listCompartmentMapDetails = <CompartmentMapDetail>[];
    final activeGroupScheme = await configService.getActiveGroupScheme();
    final listCompartments = await cmoDatabaseMasterService.getCompartmentsByGroupSchemeId(
      groupSchemeId: activeGroupScheme?.groupSchemeId,
    );

    if (listCompartments.isNotBlank) {
      for (final compartment in listCompartments) {
        final compartmentMapDetail = await generateCompartmentMapDetailFromCompartment(
          compartment,
        );

        listCompartmentMapDetails.add(compartmentMapDetail);
      }
    }

    final selectedCompartmentMapDetail = await generateCompartmentMapDetailFromCompartment(
      state.selectedCompartment,
      shouldGenerateMarker: true,
    );

    emit(
      state.copyWith(
        loading: false,
        listCompartments: listCompartments,
        listCompartmentMapDetails: listCompartmentMapDetails,
        selectedCompartmentMapDetails: selectedCompartmentMapDetail,
        compartmentMapDetailByCameraPosition: selectedCompartmentMapDetail,
      ),
    );

    if (selectedCompartmentMapDetail.polygons.isNotBlank) {
      final markers = <Marker>[];
      for (final latLng in selectedCompartmentMapDetail.polygons) {
        final marker = await MapUtils.generateMarkerFromLatLng(latLng);
        markers.add(marker);

        if (selectedCompartmentMapDetail.polygons.last == latLng) {
          markers.add(await MapUtils.generateMarkerFromLatLng(latLng));
        }
      }

      emit(
        state.copyWith(
          editingMarkers: markers,
          temporaryMarkers: markers,
          displayMarkers: await generateMarkerWithDistanceValue(markers),
          isCompletePolygon: false,
        ),
      );
    }
  }

  Future<CompartmentMapDetail> generateCompartmentMapDetailFromCompartment(
      Compartment compartment, {
        bool shouldGenerateMarker = false,
      }) async {
    if (compartment.polygon.isNotBlank) {
      final compartmentMapDetail = CompartmentMapDetail(
        compartment: compartment,
        polygons: compartment.getPolygonLatLng(),
      );

      if (shouldGenerateMarker) {
        final markers = <Marker>[];
        for (final item in compartmentMapDetail.polygons) {
          final marker = await MapUtils.generateMarkerFromLatLng(item);
          markers.add(marker);
        }

        return compartmentMapDetail.copyWith(markers: markers);
      } else {
        return compartmentMapDetail;
      }
    } else {
      return CompartmentMapDetail(
        compartment: compartment,
      );
    }
  }

  Future<List<Marker>> generateMarkerWithDistanceValue(
    List<Marker> markers,
  ) async {
    final settingConfig = await configService.getSettingConfig();
    final distanceUnit = settingConfig.distanceUnitEnum;
    if (state.isCompletePolygon || state.temporaryMarkers.length < 2) {
      return markers;
    }

    final listMarkers = List<Marker>.from(markers);
    final lastCenterPolyline = markers[markers.length - 1].position;
    listMarkers.add(
      Marker(
        markerId: MarkerId(
            'place_name_${lastCenterPolyline.latitude}_${lastCenterPolyline.longitude}'),
        position: lastCenterPolyline,
        icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
          title: '${distanceUnit.convertKmToDisplayDistanceUnit(
                MapUtils.calculateDistanceBetweenTwoMarkers(
                  markers[markers.length - 1],
                  markers[markers.length - 2],
                ),
              )!.toStringAsFixed(2)}${distanceUnit.valueName}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 60,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );

    return listMarkers;
  }

  Future<void> onCameraMove(CameraPosition cameraPosition, LatLngBounds? visibleRegion) async {
    emit(state.copyWith(currentCameraPosition: cameraPosition));
    if (!state.isCompletePolygon) {
      final temporaryMarkers = List<Marker>.from(state.temporaryMarkers);
      if (temporaryMarkers.isNotBlank) {
        if (temporaryMarkers.length == 1) {
          temporaryMarkers.add(MapUtils.copyMarkerValue(temporaryMarkers.last));
        }

        temporaryMarkers[temporaryMarkers.length - 1] = temporaryMarkers[temporaryMarkers.length - 1].copyWith(
          positionParam: LatLng(
            cameraPosition.target.latitude,
            cameraPosition.target.longitude,
          ),
        );

        emit(
          state.copyWith(
            temporaryMarkers: temporaryMarkers,
            displayMarkers: await generateMarkerWithDistanceValue(temporaryMarkers),
          ),
        );
      }
    }

    final latLng = LatLng(
      cameraPosition.target.latitude,
      cameraPosition.target.longitude,
    );

    final compartmentMapDetail = state.listCompartmentMapDetails.firstWhereOrNull(
      (element) => MapUtils.checkPositionInsidePolygon(
        latLng: latLng,
        polygon: element.polygons,
      ),
    );

    final selectedCompartmentMapDetail = MapUtils.checkPositionInsidePolygon(
      latLng: latLng,
      polygon: state.selectedCompartmentMapDetails?.polygons ?? <LatLng>[],
    );

    emit(
      state.copyWith(
        visibleRegion: visibleRegion,
        compartmentMapDetailByCameraPosition: (selectedCompartmentMapDetail
            ? state.selectedCompartmentMapDetails
            : null) ??
            compartmentMapDetail,
      ),
    );
  }

  Future<void> createNewMarker() async {
    if (state.currentCameraPosition == null) return;
    final marker = await MapUtils.generateMarkerFromLatLng(state.currentCameraPosition!.target);
    emit(
      state.copyWith(
        isEditing: true,
        editingMarkers: state.editingMarkers + [marker],
        temporaryMarkers: state.temporaryMarkers + [marker],
        displayMarkers: await generateMarkerWithDistanceValue(state.temporaryMarkers + [marker]),
        isCompletePolygon: false,
      ),
    );
  }

  Future<void> removePreviousMarker() async {
    final markers = state.temporaryMarkers;
    if (markers.isEmpty) return;
    markers.removeLast();
    emit(
      state.copyWith(
        isEditing: true,
        editingMarkers: markers,
        temporaryMarkers: markers,
        displayMarkers: await generateMarkerWithDistanceValue(markers),
        isCompletePolygon: false,
      ),
    );
  }

  void onCompletePolygon() {
    final temporaryMarkers = List<Marker>.from(state.temporaryMarkers);
    temporaryMarkers.removeLast();
    final selectedCompartmentMapDetails = state.selectedCompartmentMapDetails?.copyWith(
      markers: temporaryMarkers,
      polygons: temporaryMarkers
          .map(MapUtils.generateLatLngFromMarker)
          .toList(),
    );

    emit(
      state.copyWith(
        isCompletePolygon: true,
        isEditing: true,
        compartmentMapDetailByCameraPosition: selectedCompartmentMapDetails,
        selectedCompartmentMapDetails: selectedCompartmentMapDetails,
        displayMarkers: temporaryMarkers,
      ),
    );
  }

  Future<void> onResetPolygon() async {
    if (state.listMarkersHistory.length <= 1) {
      final listMarkers = List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? []);
      emit(
        state.resetEditingMarkers().copyWith(
          isChanged: false,
          isEditing: true,
          editingMarkers: listMarkers,
          temporaryMarkers: listMarkers,
          displayMarkers: await generateMarkerWithDistanceValue(listMarkers),
          listMarkersHistory: [listMarkers],
        ),
      );

      return;
    }

    final newListMarkersHistory = List<List<Marker>>.from(state.listMarkersHistory);
    final lastListMarkersSnapshot = newListMarkersHistory.last;
    newListMarkersHistory.removeLast();
    final listMarkers = List<Marker>.from(lastListMarkersSnapshot);
    emit(
      state.resetEditingMarkers().copyWith(
        isChanged: false,
        isEditing: true,
        listMarkersHistory: newListMarkersHistory,
        temporaryMarkers: listMarkers,
        editingMarkers: listMarkers,
        displayMarkers: await generateMarkerWithDistanceValue(listMarkers),
      ),
    );
  }

  List<Marker> getTemporarySavedMarkers(bool shouldClearLastItem) {
    final temporaryMarkers = List<Marker>.from(state.temporaryMarkers);
    if (shouldClearLastItem) {
      temporaryMarkers.removeLast();
    }

    return temporaryMarkers;
  }


  void onChangeMapType() {
    final currentMapType = state.mapType;
    if (currentMapType == MapType.satellite) {
      emit(state.copyWith(mapType: MapType.normal));
    } else {
      emit(state.copyWith(mapType: MapType.satellite));
    }
  }

  void onAcceptChanges({
    required void Function(double?, List<PolygonItem>?) onSave,
  }) {
    if (state.selectedCompartmentMapDetails == null) {
      return;
    }

    final selectedCompartmentMapDetails =
    state.selectedCompartmentMapDetails!.copyWith(
      markers: state.editingMarkers,
      polygons: state.editingMarkers.map(MapUtils.generateLatLngFromMarker).toList(),
    );

    onSave(
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
}
