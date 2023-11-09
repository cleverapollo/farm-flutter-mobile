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
    final selectedCompartmentMapDetail = await generateCompartmentMapDetailFromCompartment(state.selectedCompartment);
    if (state.listCompartments.isNotBlank) {
      for (final compartment in state.listCompartments) {
        final compartmentMapDetail = await generateCompartmentMapDetailFromCompartment(compartment);
        if (compartmentMapDetail != null) {
          listCompartmentMapDetails.add(compartmentMapDetail);
        }
      }
    }

    emit(
      state.copyWith(
        loading: false,
        selectedCompartmentMapDetails: selectedCompartmentMapDetail,
        compartmentMapDetailByCameraPosition: selectedCompartmentMapDetail,
        listCompartmentMapDetails: listCompartmentMapDetails,
      ),
    );
  }

  Future<CompartmentMapDetail?> generateCompartmentMapDetailFromCompartment(
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
    }

    return null;
  }

  void onTapMarker(MarkerId markerId) {
    if (state.isEditing) {
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

  void onCameraMove(CameraPosition cameraPosition) {
    if (state.isEditing && state.selectedEditedMarker != null) {
      final editingMarkers = List<Marker>.from(state.editingMarkers);
      if (editingMarkers.length == 1) {
        editingMarkers.add(editingMarkers.last);
      }

      editingMarkers[editingMarkers.length - 1] = editingMarkers[editingMarkers.length - 1].copyWith(
        positionParam: LatLng(
          cameraPosition.target.latitude,
          cameraPosition.target.longitude,
        ),
      );

      emit(
        state.copyWith(
          editingMarkers: editingMarkers,
        ),
      );
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

  void editingPolygon() {
    emit(
      state.copyWith(
        isEditing: true,
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
