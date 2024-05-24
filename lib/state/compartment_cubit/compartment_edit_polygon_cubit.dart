import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/compartment_cubit/compartment_map_detail.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'compartment_edit_polygon_state.dart';

class CompartmentEditPolygonCubit extends Cubit<CompartmentEditPolygonState> {
  CompartmentEditPolygonCubit({
    required Compartment selectedCompartment,
    required String farmId,
  }) : super(
          CompartmentEditPolygonState(
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
          final marker = await MapUtils.generateMarkerFromLatLng(
            item,
            onTap: onTapMarker,
          );

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
    if(state.isCompletePolygon || state.temporaryMarkers.length < 2) return markers;
    final listMarkers = List<Marker>.from(markers);
    if (state.isUpdating && state.selectedEditedMarker != null) {
      final selectedMarker = state.selectedEditedMarker;
      final selectedMarkerIndex = markers.indexWhere((element) => element.markerId == selectedMarker!.markerId);
      if (selectedMarkerIndex == -1) return markers;
      var previousIndex = selectedMarkerIndex - 1;
      var nextIndex = selectedMarkerIndex + 1;
      if (selectedMarkerIndex == 0) {
        previousIndex = markers.length - 1;
        nextIndex = 1;
      } else if (selectedMarkerIndex == markers.length - 1) {
        nextIndex = 0;
      }

      listMarkers.add(
        Marker(
          markerId: MarkerId('place_name_${markers[previousIndex].position.latitude}_${markers[previousIndex].position.longitude}'),
          position: markers[previousIndex].position,
          icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
            title: '${distanceUnit.convertKmToDisplayDistanceUnit(
                  MapUtils.calculateDistanceBetweenTwoMarkers(
                    markers[previousIndex],
                    markers[selectedMarkerIndex],
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

      listMarkers.add(
        Marker(
          markerId: MarkerId('place_name_${markers[nextIndex].position.latitude}_${markers[nextIndex].position.longitude}_2'),
          position: markers[nextIndex].position,
          icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
            title: '${distanceUnit.convertKmToDisplayDistanceUnit(
                  MapUtils.calculateDistanceBetweenTwoMarkers(
                    markers[selectedMarkerIndex],
                    markers[nextIndex],
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
    }


    return listMarkers;
  }

  Future<void> onCameraMove(CameraPosition cameraPosition, LatLngBounds? visibleRegion) async {
    emit(state.copyWith(currentCameraPosition: cameraPosition));
    if (state.isUpdating) {
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
          displayMarkers: await generateMarkerWithDistanceValue(temporaryMarkers),
        ),
      );
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

      emit(
        state.copyWith(
          displayMarkers: await generateMarkerWithDistanceValue(listMarker),
        ),
      );
    }
  }

  Future<void> editingPolygon() async {
    final listMarkers = List<Marker>.from(state.selectedCompartmentMapDetails?.markers ?? []);
    emit(
      state.copyWith(
        isUpdating: true,
        editingMarkers: listMarkers,
        temporaryMarkers: listMarkers,
        displayMarkers: await generateMarkerWithDistanceValue(listMarkers),
        listMarkersHistory: [listMarkers],
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
            isEditing: true,
            editingMarkers: List<Marker>.from(state.temporaryMarkers),
            listMarkersHistory: List<List<Marker>>.from(state.listMarkersHistory + [state.editingMarkers]),
            isChanged: true,
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
