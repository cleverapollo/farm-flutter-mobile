import 'dart:collection';
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
    required Compartment selectedCompartment,
    required String farmId,
  }) : super(
          CompartmentMapsSummariesState(
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
        final compartmentMapDetail =
            await generateCompartmentMapDetailFromCompartment(
          compartment,
        );
        listCompartmentMapDetails.add(compartmentMapDetail);
      }
    }

    final selectedCompartmentMapDetail =
        await generateCompartmentMapDetailFromCompartment(
      state.selectedCompartment,
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

  void onCameraMove(CameraPosition cameraPosition, LatLngBounds? visibleRegion) {
    emit(state.copyWith(currentCameraPosition: cameraPosition));
    if (state.isAddingNew && !state.isCompletePolygon) {
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
    } else if (state.isUpdating) {
      final temporaryMarkers = List<Marker>.from(state.temporaryMarkers);
      var selectedMarker = temporaryMarkers.firstWhereOrNull((element) => element.markerId == state.selectedEditedMarker?.markerId);
      if (selectedMarker != null) {
        final selectedMarkerIndex = temporaryMarkers.indexOf(selectedMarker);
        temporaryMarkers[selectedMarkerIndex] = temporaryMarkers[selectedMarkerIndex].copyWith(
          positionParam: LatLng(
            cameraPosition.target.latitude,
            cameraPosition.target.longitude,
          ),
        );
        selectedMarker = selectedMarker.copyWith(
          positionParam: LatLng(
            cameraPosition.target.latitude,
            cameraPosition.target.longitude,
          ),
        );
      }


      emit(
        state.copyWith(
          selectedEditedMarker: selectedMarker,
          temporaryMarkers: temporaryMarkers,
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

  void onTapMarker(MarkerId markerId) {
    if (state.isUpdating) {
      final marker = state.temporaryMarkers.firstWhereOrNull((element) => element.markerId == markerId);
      if (marker != null) {
        emit(
          state.copyWith(
            selectedEditedMarker: marker,
          ),
        );
      }
    }
  }

  Future<void> onTapPolyline(
    Polyline polyline, {
    required void Function(LatLng centerLatLng) onMoveCameraToCenterPoint,
  }) async {
    if (state.isUpdating) {
      final centerLatLng = MapUtils.getCenterPositionFromPolyline(polyline);
      final centerMaker = await MapUtils.generateMarkerFromLatLng(
        centerLatLng,
        onTap: onTapMarker,
      );

      final listMarker = List<Marker>.from(state.temporaryMarkers);
      final firstMarker = listMarker.firstWhereOrNull(
        (marker) =>
            marker.position.latitude == polyline.points.first.latitude &&
            marker.position.longitude == polyline.points.first.longitude,
      );

      if (firstMarker != null) {
        final firstMarkerIndex = listMarker.indexOf(firstMarker);
        listMarker.insert(firstMarkerIndex + 1, centerMaker);
      }

      emit(
          state.copyWith(
            selectedEditedPolyline: polyline,
            editingMarkers: listMarker,
            temporaryMarkers: listMarker,
          ),
        );

      onMoveCameraToCenterPoint(centerLatLng);
      onTapMarker(centerMaker.markerId);
    }
  }

  Future<void> createNewMarker() async {
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
        temporaryMarkers: List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? []),
        listMarkersHistory: [List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? [])],
      ),
    );
  }

  void onUpdateNewPositionMarker() {
    emit(
      state
          .resetEditingMarkers(
            isCleanEditingMarkers: false,
            isCleanTemporaryMarkers: false,
          )
          .copyWith(
            editingMarkers: List<Marker>.from(state.temporaryMarkers),
            listMarkersHistory: List<List<Marker>>.from(state.listMarkersHistory + [state.editingMarkers]),
            isChanged: true,
          ),
    );
  }

  void onResetPolygon() {
    if (state.listMarkersHistory.length <= 1) {
      emit(
        state.resetEditingMarkers().copyWith(
          isChanged: false,
          editingMarkers: List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? []),
          temporaryMarkers: List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? []),
          listMarkersHistory: [List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? [])],
        ),
      );

      return;
    }

    final newListMarkersHistory = List<List<Marker>>.from(state.listMarkersHistory);
    final lastListMarkersSnapshot = newListMarkersHistory.last;
    newListMarkersHistory.removeLast();

    emit(
      state.resetEditingMarkers().copyWith(
            isChanged: false,
            listMarkersHistory: newListMarkersHistory,
            temporaryMarkers: List<Marker>.from(lastListMarkersSnapshot),
            editingMarkers: List<Marker>.from(lastListMarkersSnapshot),
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
