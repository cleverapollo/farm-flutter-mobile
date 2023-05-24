import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CompartmentDetailCubit extends Cubit<CompartmentDetailState> {
  CompartmentDetailCubit() : super(const CompartmentDetailState());
  Compartment _compartment = Compartment();

  Future saveCompartment() {
    return cmoDatabaseMasterService.cacheCompartment(_compartment.copyWith(compartmentId: DateTime.now().millisecondsSinceEpoch));
  }

  void onCompartmentNameChanged(String value) {
    _compartment = _compartment.copyWith(compartmentName: value);
  }

  void onPolygonAreaChanged(double? value) {
    _compartment = _compartment.copyWith(polygonArea: value);
  }

  void onLocationsChanged(List<GeoLocation>? locations) {
    _compartment = _compartment.copyWith(jsonLocations: json.encode(locations));
  }

  void onCompartmentUnitChanged(String value) {
    _compartment = _compartment.copyWith(unit: value);
  }

  void onEffectiveAreaChanged(double? value) {
    _compartment = _compartment.copyWith(effectiveArea: value);
  }

  void onEspacementChanged(String? value) {
    _compartment = _compartment.copyWith(espacement: value);
  }

  void onPlannedPlantDateChanged(DateTime? value) {
    _compartment =
        _compartment.copyWith(plannedPlantDate: value?.toIso8601String());
  }

  void onSurvivalPercentageDateChanged(double? value) {
    _compartment = _compartment.copyWith(survivalPercentage: value);
  }

  void onStockingPercentageDateChanged(double? value) {
    _compartment = _compartment.copyWith(stockingPercentage: value);
  }

  void onRotationChanged(String value) {
    _compartment = _compartment.copyWith(rotation: value);
  }

  void onMAIChanged(String value) {
    _compartment = _compartment.copyWith(mai: value);
  }
}
