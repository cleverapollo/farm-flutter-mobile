import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'compartment_maps_summaries_state.dart';

class CompartmentMapsSummariesCubit extends Cubit<CompartmentMapsSummariesState> {
  CompartmentMapsSummariesCubit({
    required List<Compartment> listCompartments,
    required Compartment selectedCompartment,
  }) : super(
          CompartmentMapsSummariesState(
            listCompartments: listCompartments,
            selectedCompartment: selectedCompartment,
          ),
        );

  Future<void> initMapData() async {
    emit(state.copyWith(loading: true));
    final listCompartmentMapDetails = <CompartmentMapDetail>[];
    if (state.listCompartments.isNotBlank) {
      for (final compartment in state.listCompartments) {
        final compartmentMapDetail = await generateCompartmentMapDetailFromCompartment(compartment);
        listCompartmentMapDetails.add(compartmentMapDetail);
      }
    }

    final selectedCompartmentMapDetail = await generateCompartmentMapDetailFromCompartment(state.selectedCompartment);

    emit(
      state.copyWith(
        loading: false,
        selectedCompartmentMapDetails: selectedCompartmentMapDetail,
        compartmentMapDetailByCameraPosition: selectedCompartmentMapDetail,
        listCompartmentMapDetails: listCompartmentMapDetails,
      ),
    );
  }

  Future<CompartmentMapDetail> generateCompartmentMapDetailFromCompartment(
      Compartment compartment,
      ) async {
    if (compartment.polygon.isNotBlank) {
      final compartmentMapDetail = CompartmentMapDetail(
        compartment: compartment,
        polygons: compartment.getPolygonLatLng(),
      );

      final markers = <Marker>[];
      for (final item in compartmentMapDetail.polygons) {
        final marker = await MapUtils.generateMarkerFromLatLng(
          item,
          draggable: true,
          onTap: onTapMarker,
        );

        markers.add(marker);
      }

      return compartmentMapDetail.copyWith(markers: markers);
    } else {
      return CompartmentMapDetail(
        compartment: compartment,
      );
    }
  }

  void onCameraMove(CameraPosition cameraPosition) {
    emit(state.copyWith(currentCameraPosition: cameraPosition));
    if (state.isUpdating && !state.isCompletePolygon) {
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
          ),
        );
      }
    }

    final latLng = LatLng(
      cameraPosition.target.latitude,
      cameraPosition.target.longitude,
    );

    final compartmentMapDetail =
        state.listCompartmentMapDetails.firstWhereOrNull(
      (element) => MapUtils.checkPositionInsidePolygon(
        latLng: latLng,
        polygon: element.polygons,
      ),
    );

    emit(
      state.copyWith(
        compartmentMapDetailByCameraPosition: compartmentMapDetail,
      ),
    );
  }

  void onTapMarker(MarkerId markerId) {
    if (state.isUpdating) {
      final marker = state.editingMarkers.firstWhereOrNull((element) => element.markerId == markerId);
      if (marker != null) {
        final editingMarkers = List<Marker>.from(state.editingMarkers);
        editingMarkers.remove(marker);
        editingMarkers.add(marker);
        emit(
          state.copyWith(
            selectedEditedMarker: marker,
            editingMarkers: editingMarkers,
          ),
        );
      }
    }
  }

  Future<void> createNewMarker() async {
    emit(state.copyWith(isUpdating: true));
    if (state.currentCameraPosition == null) return;
    final marker = await MapUtils.generateMarkerFromLatLng(state.currentCameraPosition!.target);
    emit(
      state.copyWith(
        editingMarkers: state.editingMarkers + [marker],
        temporaryMarkers: state.temporaryMarkers + [marker],
        isCompletePolygon: false,
      ),
    );
  }

  void removePreviousMarker() {
    final markers = state.temporaryMarkers;
    if (markers.isEmpty) return;
    markers.removeLast();
    emit(
      state.copyWith(
        editingMarkers: markers,
        temporaryMarkers: markers,
        isCompletePolygon: false,
      ),
    );
  }

  void onCompletePolygon() {
    final selectedCompartmentMapDetails = state.selectedCompartmentMapDetails?.copyWith(
      markers: state.temporaryMarkers,
      polygons: state.temporaryMarkers
          .map(MapUtils.generateLatLngFromMarker)
          .toList(),
    );

    emit(
      state.copyWith(
        isCompletePolygon: true,
        compartmentMapDetailByCameraPosition: selectedCompartmentMapDetails,
        selectedCompartmentMapDetails: selectedCompartmentMapDetails,
      ),
    );
  }

  void editingPolygon() {
    emit(
      state.copyWith(
        isUpdating: true,
        editingMarkers: List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? []),
      ),
    );
  }

  void onResetPolygon() {
    emit(
      state.resetEditingMarkers().copyWith(
            editingMarkers: List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? []),
          ),
    );
  }

  void onRemoveMarker() {
    if (state.editingMarkers.length <= 3) {
      return;
    }

    final marker = state.editingMarkers.firstWhereOrNull((element) => element.markerId == state.selectedEditedMarker?.markerId);
    if (marker != null) {
      final editingMarkers = List<Marker>.from(state.editingMarkers);
      editingMarkers.remove(marker);
      emit(
        state.resetEditingMarkers().copyWith(
          editingMarkers: editingMarkers,
        ),
      );
    }
  }

  Future<void> onAcceptChanges() async {
    final listLatLng = state.editingMarkers
        .map(
          (e) => LatLng(
            e.position.latitude,
            e.position.longitude,
          ),
        )
        .toList();
    final listPolygonItem = state.editingMarkers
        .map(
          (e) => PolygonItem(
            latitude: e.position.latitude,
            longitude: e.position.longitude,
          ),
        )
        .toList();
    await cmoDatabaseMasterService.cacheCompartment(
      state.selectedCompartment.copyWith(
        updateDT: DateTime.now(),
        isActive: true,
        polygonArea: MapUtils.computeAreaInHa(listLatLng),
        polygon: json.encode(listPolygonItem),
      ),
      isDirect: true,
    );
  }
}
