import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'asi_map_state.dart';

class AsiMapCubit extends Cubit<AsiMapState> {
  AsiMapCubit({
    required Asi asi,
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

    emit(
      state.copyWith(
        compartments: compartments,
      ),
    );

    Compartment? initCompartment;

    if (state.asi.latitude != null &&
        state.asi.longitude != null &&
        compartments.isNotBlank) {
      initCompartment = checkOutlineCompartment(
        LatLng(
          state.asi.latitude!,
          state.asi.longitude!,
        ),
      );

      final marker = await MapUtils.generateMarkerFromLatLng(
        LatLng(
          state.asi.latitude!,
          state.asi.longitude!,
        ),
        shouldShowCustomIconMarker: false,
      );
      emit(state.copyWith(marker: marker));
    } else if (state.asi.localCompartmentId != null) {
      initCompartment = state.compartments.firstWhereOrNull((element) => element.localCompartmentId == state.asi.localCompartmentId);
    }

    if (initCompartment != null) {
      await updateOutlineCompartment(initCompartment);
    }
  }

  Future<void> updateOutlineCompartment(Compartment? compartment) async {
    if (compartment == null) return;
    final markers = <Marker>[];
    for (final item in compartment.getPolygonLatLng()) {
      final marker = await MapUtils.generateMarkerFromLatLng(
        item,
      );

      markers.add(marker);
    }

    emit(
      state.copyWith(
        asi: state.asi.copyWith(
          managementUnitId: compartment.managementUnitId,
          compartmentName: compartment.unitNumber,
          localCompartmentId: compartment.localCompartmentId,
        ),
        outlineMarker: markers,
        outlinedCompartment: compartment,
      ),
    );
  }

  void removeMarker() {
    emit(
      state.copyWith(
        isClearMarker: true,
        isClearOutlineCompartment: true,
      ),
    );
  }

  Future<void> createNewMarker() async {
    if (state.currentCameraPosition == null) return;
    final marker = await MapUtils.generateMarkerFromLatLng(
      state.currentCameraPosition!.target,
      shouldShowCustomIconMarker: false,
    );

    emit(
      state.copyWith(
        marker: marker,
        asi: state.asi.copyWith(
          latitude: marker.position.latitude,
          longitude: marker.position.longitude,
        ),
      ),
    );

    final outlineCompartment = checkOutlineCompartment(state.currentCameraPosition!.target);
    if (outlineCompartment != null) {
      await updateOutlineCompartment(outlineCompartment);
    }
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
  }
}
