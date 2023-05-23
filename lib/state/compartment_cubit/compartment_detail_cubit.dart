import 'package:cmo/di.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/state/compartment_cubit/compartment_detail_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CompartmentDetailCubit extends Cubit<CompartmentDetailState> {
  CompartmentDetailCubit() : super(const CompartmentDetailState());
  Compartment _compartment = Compartment();

  Future saveCompartment() {
    _compartment.compartmentId = DateTime.now().millisecondsSinceEpoch;
    return cmoDatabaseMasterService.cacheCompartment(_compartment);
  }

  void onCompartmentNameChanged(String value) {
    _compartment.compartmentName = value;
  }

  void onPolygonAreaChanged(double? value) {
    _compartment.polygonArea = value;
  }

  void onLocationsChanged(List<GeoLocation>? locations) {
    _compartment.locations = locations;
  }

  void onCompartmentUnitChanged(String value) {
    _compartment.unit = value;
  }

  void onEffectiveAreaChanged(double? value) {
    _compartment.effectiveArea = value;
  }

  void onEspacementChanged(String? value) {
    _compartment.espacement = value;
  }

  void onPlannedPlantDateChanged(DateTime? value) {
    _compartment.plannedPlantDate = value?.toIso8601String();
  }

  void onSurvivalPercentageDateChanged(double? value) {
    _compartment.survivalPercentage = value;
  }

  void onStockingPercentageDateChanged(double? value) {
    _compartment.stockingPercentage = value;
  }

  void onRotationChanged(String value) {
    _compartment.rotation = value;
  }

  void onMAIChanged(String value) {
    _compartment.mai = value;
  }
}
