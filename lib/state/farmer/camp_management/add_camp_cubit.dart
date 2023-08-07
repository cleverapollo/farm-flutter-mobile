import 'package:cmo/di.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/state/farmer/camp_management/add_camp_state.dart';
import 'package:cmo/state/farmer/site_management_plan/site_management_plan_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCampCubit extends Cubit<AddCampState> {
  AddCampCubit({Camp? camp})
      : super(
          AddCampState(
            camp: camp ??
                Camp(
                  campId: DateTime.now().millisecondsSinceEpoch.toString(),
                  plannedYearOfHarvest: DateTime.now().year,
                ),
          ),
        );

  Future init() async {
    final activeFarm = await configService.getActiveFarm();
    var compartments = await cmoDatabaseMasterService
        .getCompartmentByFarmId(activeFarm?.farmId ?? '');
    if (compartments != null) {
      compartments = compartments
          .where((element) => element.campId == state.camp?.campId)
          .toList();
    }
    var asis = await cmoDatabaseMasterService
        .getAsiRegisterByFarmId(activeFarm?.farmId ?? '');
    asis =
        asis.where((element) => element.campId == state.camp?.campId).toList();
    emit(state.copyWith(
      farm: activeFarm,
      compartments: compartments,
      asis: asis,
    ));
  }

  void onCampNameChanged(String value) {
    emit(state.copyWith(camp: state.camp?.copyWith(campName: value)));
  }

  void onProtectedAreaChanged(String value) {
    emit(state.copyWith(
        camp: state.camp?.copyWith(protectedArea: double.tryParse(value))));
  }

  void onCattlePostHousingChanged(String value) {
    emit(state.copyWith(
        camp: state.camp?.copyWith(cattlePostHousing: double.tryParse(value))));
  }

  void onCorridorsChanged(String value) {
    emit(state.copyWith(
        camp: state.camp?.copyWith(corridors: double.tryParse(value))));
  }

  void onRoadAndFireBreaksChanged(String value) {
    emit(state.copyWith(
        camp: state.camp?.copyWith(roadAndFireBreaks: double.tryParse(value))));
  }

  void onPoachingAlleviationZoneChanged(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(poachingAlleviationZone: double.tryParse(value))));
  }

  void onLocationChanged({double? latitude, double? longitude}) {
    emit(
      state.copyWith(
        camp: state.camp?.copyWith(latitude: latitude, longitude: longitude),
      ),
    );
  }

  void onInfestationCategory1Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory1: double.tryParse(value))));
  }

  void onInfestationCategory2Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory2: double.tryParse(value))));
  }

  void onInfestationCategory3Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory3: double.tryParse(value))));
  }

  void onInfestationCategory4Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory4: double.tryParse(value))));
  }

  void onInfestationCategory5Changed(String value) {
    emit(state.copyWith(
        camp: state.camp
            ?.copyWith(infestationCategory5: double.tryParse(value))));
  }

  void onPlannedYearOfHarvestChanged(int? value) {
    emit(state.copyWith(
        camp: state.camp?.copyWith(plannedYearOfHarvest: value)));
  }

  void onActualYearOfHarvestChanged(int? value) {
    emit(
        state.copyWith(camp: state.camp?.copyWith(actualYearOfHarvest: value)));
  }

  void onCompartmentChanged(
      {required AddingCompartmentResult addingCompartmentResult}) {
    emit(state.copyWith(
        compartments: addingCompartmentResult.compartments ?? []));
  }

  void onAsisChanged({List<Asi>? asis}) {
    emit(state.copyWith(asis: asis ?? []));
  }

  void onTonsOfProductChanged(String? value) {
    emit(
        state.copyWith(
            camp: state.camp?.copyWith(tonsOfCharcoalProduced: double.tryParse(value ?? '')),
        ),
    );
  }
  
  Future<void> saveCamp(BuildContext context) async {
    emit(state.copyWith(
      camp: state.camp
          ?.copyWith(farmId: state.farm?.farmId, isActive: true, isLocal: true),
    ));

    await cmoDatabaseMasterService.cacheCamp(state.camp!);
    await context.read<SiteManagementPlanCubit>().refresh();
  }
}
