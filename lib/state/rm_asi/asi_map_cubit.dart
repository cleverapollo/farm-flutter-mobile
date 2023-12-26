import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'asi_map_state.dart';

class AsiMapCubit extends Cubit<AsiMapState> {
  AsiMapCubit({
    required Asi asi,
    String? farmId,
  }) : super(
    AsiMapState(
      asi: asi,
    ),
  ) {
    fetchData();
  }

  Future<void> fetchData() async {
    final compartments = await cmoDatabaseMasterService.getCompartmentByFarmId(
      state.asi.farmId,
    );

    if (state.asi.latitude != null &&
        state.asi.longitude != null &&
        compartments.isNotBlank) {
      final initCompartment = compartments.firstWhereOrNull((compartment) {
        final latLng = LatLng(
          state.asi.latitude!,
          state.asi.longitude!,
        );

        final polygons = compartment.getPolygonLatLng();
        return MapUtils.checkPositionInsidePolygon(latLng: latLng, polygon: polygons);
      });

      if (initCompartment != null) {
        onCompartmentChanged(initCompartment);
      }
    }

    emit(
      state.copyWith(
        compartments: compartments,
      ),
    );
  }

  Future<void> saveAsi() async {
    try {
      emit(state.copyWith(isLoading: true));
      await cmoDatabaseMasterService.cacheAsi(
        state.asi.copyWith(
          isMasterdataSynced: false,
          createDT: state.asi.createDT ?? DateTime.now(),
          updateDT: DateTime.now(),
        ),
      );

    } catch (e) {
      logger.e('Cannot saveASI $e');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onCompartmentChanged(Compartment? compartment) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(
          managementUnitId: compartment?.managementUnitId,
          compartmentName: compartment?.unitNumber,
          localCompartmentId: compartment?.localCompartmentId,
        ),

        outlinedCompartment: compartment,
      ),
    );
  }

  void onSelectLocation(LocationModel locationModel) {
    emit(
      state.copyWith(
        asi: state.asi.copyWith(
          latitude: locationModel.latitude,
          longitude: locationModel.longitude,
        ),
      ),
    );

    final selectedCompartment = state.compartments.firstWhereOrNull((compartment) {
      final latLng = LatLng(
        locationModel.latitude!,
        locationModel.longitude!,
      );

      final polygons = compartment.getPolygonLatLng();
      return MapUtils.checkPositionInsidePolygon(latLng: latLng, polygon: polygons);
    });

    if (selectedCompartment != null) {
      onCompartmentChanged(selectedCompartment);
    }
  }

  Future<void> initMapData() async {
    emit(state.copyWith(isLoading: true));
    // final listCompartments = await cmoDatabaseMasterService.getCompartmentsByGroupSchemeId(groupSchemeId: activeGroupScheme?.groupSchemeId);
    // if (listCompartments.isNotBlank) {
    //   for (final compartment in listCompartments) {
    //     final compartmentMapDetail = await generateCompartmentMapDetailFromCompartment(compartment);
    //     listCompartmentMapDetails.add(compartmentMapDetail);
    //   }
    // }
    //
    // final selectedCompartmentMapDetail = await generateCompartmentMapDetailFromCompartment(state.selectedCompartment);
    //
    // emit(
    //   state.copyWith(
    //     loading: false,
    //     listCompartments: listCompartments,
    //     listCompartmentMapDetails: listCompartmentMapDetails,
    //     selectedCompartmentMapDetails: selectedCompartmentMapDetail,
    //     compartmentMapDetailByCameraPosition: selectedCompartmentMapDetail,
    //   ),
    // );
  }

  void removeMarker() {
    emit(state.copyWith(isClearMarker: true));
  }

  Future<void> createNewMarker() async {
    if (state.currentCameraPosition == null) return;
    final marker = await MapUtils.generateMarkerFromLatLng(state.currentCameraPosition!.target);
    emit(
      state.copyWith(
        marker: marker,
      ),
    );
  }

  Compartment? checkOutlineCompartment(LatLng latLng) {
    final selectedCompartment = state.compartments.firstWhereOrNull((compartment) {
      final polygons = compartment.getPolygonLatLng();
      return MapUtils.checkPositionInsidePolygon(latLng: latLng, polygon: polygons);
    });

    return selectedCompartment;
  }

  void onCameraMove(CameraPosition cameraPosition) {
    emit(state.copyWith(currentCameraPosition: cameraPosition));
    // if (state.isAddingNew && !state.isCompletePolygon) {
    //   final temporaryMarkers = List<Marker>.from(state.temporaryMarkers);
    //   if (temporaryMarkers.isNotBlank) {
    //     if (temporaryMarkers.length == 1) {
    //       temporaryMarkers.add(MapUtils.copyMarkerValue(temporaryMarkers.last));
    //     }
    //
    //     temporaryMarkers[temporaryMarkers.length - 1] = temporaryMarkers[temporaryMarkers.length - 1].copyWith(
    //       positionParam: LatLng(
    //         cameraPosition.target.latitude,
    //         cameraPosition.target.longitude,
    //       ),
    //     );
    //
    //     emit(
    //       state.copyWith(
    //         temporaryMarkers: temporaryMarkers,
    //       ),
    //     );
    //   }
    // } else if (state.isUpdating) {
    //   final temporaryMarkers = List<Marker>.from(state.temporaryMarkers);
    //   var selectedMarker = temporaryMarkers.firstWhereOrNull((element) => element.markerId == state.selectedEditedMarker?.markerId);
    //   if (selectedMarker != null) {
    //     final selectedMarkerIndex = temporaryMarkers.indexOf(selectedMarker);
    //     temporaryMarkers[selectedMarkerIndex] = temporaryMarkers[selectedMarkerIndex].copyWith(
    //       positionParam: LatLng(
    //         cameraPosition.target.latitude,
    //         cameraPosition.target.longitude,
    //       ),
    //     );
    //     selectedMarker = selectedMarker.copyWith(
    //       positionParam: LatLng(
    //         cameraPosition.target.latitude,
    //         cameraPosition.target.longitude,
    //       ),
    //     );
    //   }
    //
    //
    //   emit(
    //     state.copyWith(
    //       selectedEditedMarker: selectedMarker,
    //       temporaryMarkers: temporaryMarkers,
    //     ),
    //   );
    // }

    // final latLng = LatLng(
    //   cameraPosition.target.latitude,
    //   cameraPosition.target.longitude,
    // );
    //
    // final compartmentMapDetail =
    // state.listCompartmentMapDetails.firstWhereOrNull(
    //       (element) => MapUtils.checkPositionInsidePolygon(
    //     latLng: latLng,
    //     polygon: element.polygons,
    //   ),
    // );
    //
    // final selectedCompartmentMapDetail = MapUtils.checkPositionInsidePolygon(
    //   latLng: latLng,
    //   polygon: state.selectedCompartmentMapDetails?.polygons ?? <LatLng>[],
    // );
    //
    // emit(
    //   state.copyWith(
    //     compartmentMapDetailByCameraPosition: (selectedCompartmentMapDetail
    //         ? state.selectedCompartmentMapDetails
    //         : null) ??
    //         compartmentMapDetail,
    //   ),
    // );
  }
}
