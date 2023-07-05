import 'package:cmo/di.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCampCubit extends Cubit<AddCampState> {
  AddCampCubit({Camp? camp})
      : super(
          AddCampState(
            camp: camp ??
                Camp(campId: DateTime.now().millisecondsSinceEpoch.toString()),
          ),
        );

  void onCampNameChanged(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(campName : value)));
  }

  void onProtectedAreaChanged(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(protectedArea : double.tryParse(value))));
  }

  void onCattlePostHousingChanged(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(cattlePostHousing : double.tryParse(value))));
  }

  void onCorridorsChanged(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(corridors : double.tryParse(value))));
  }

  void onRoadAndFireBreaksChanged(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(roadAndFireBreaks : double.tryParse(value))));
  }

  void onPoachingAlleviationZoneChanged(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(poachingAlleviationZone : double.tryParse(value))));
  }
  void onLocationChanged({double? latitude, double? longitude}) {
    emit(state.copyWith(
      camp: state.camp?.copyWith(latitude: latitude, longitude: longitude),),);
  }

  void onInfestationCategory1Changed(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(infestationCategory1 : double.tryParse(value))));
  }

  void onInfestationCategory2Changed(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(infestationCategory2 : double.tryParse(value))));
  }

  void onInfestationCategory3Changed(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(infestationCategory3 : double.tryParse(value))));
  }

  void onInfestationCategory4Changed(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(infestationCategory4 : double.tryParse(value))));
  }

  void onInfestationCategory5Changed(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(infestationCategory5 : double.tryParse(value))));
  }

  void onPlannedYearOfHarvestChanged(int? value) {
    emit(state.copyWith(camp: state.camp?.copyWith(plannedYearOfHarvest : value)));
  }

  void onActualYearOfHarvestChanged(int? value) {
    emit(state.copyWith(camp: state.camp?.copyWith(actualYearOfHarvest : value)));
  }

  Future saveCamp() async {
    if (state.camp == null) {
      return;
    }
    final activeFarm = await configService.getActiveFarm();
    emit(state.copyWith(
      camp: state.camp?.copyWith(farmId: activeFarm?.farmId,
          isActive: true
      ),));
    return cmoDatabaseMasterService.cacheCamp(state.camp!);
  }
}
