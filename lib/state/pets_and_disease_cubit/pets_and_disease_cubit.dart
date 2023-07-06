import 'package:cmo/di.dart';
import 'package:cmo/model/config/config.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsAndDiseasesCubit extends Cubit<PetsAndDiseasesState> {
  PetsAndDiseasesCubit() : super(const PetsAndDiseasesState()) {
    initConfigData();
  }

  Future<void> onChangeStatus(bool isUnderControl) async {
    final result = await cmoDatabaseMasterService
        .getPetsAndDiseaseRegisterByFarmId(state.farmId!,
            isUnderControl: isUnderControl);

    emit(state.copyWith(
        petsAndDiseaseRegisters: result, isOpen: isUnderControl));
  }

  Future<void> initData() async {
    final result = await cmoDatabaseMasterService
        .getPetsAndDiseaseRegisterByFarmId(state.farmId!);

    if (result.isNotEmpty) {
      emit(state.copyWith(petsAndDiseaseRegisters: result));
    }
  }

  Future<void> initConfigData() async {
    final farm = await configService.getActiveFarm();

    emit(state.copyWith(
        farmId: farm?.farmId, groupSchemeId: farm?.groupSchemeId));
  }

  Future<void> initAddData() async {
    final petsAndDiseasesTypes = await cmoDatabaseMasterService
        .getAllPetsAndDiseaseTypeByGroupSchemeId(state.groupSchemeId!);
    final treatmentMethods = await cmoDatabaseMasterService
        .getTreatmentMethodByGroupSchemeId(state.groupSchemeId!);
    final petsAndDiseaseTreatmentMethod = await cmoDatabaseMasterService
        .getAllPestsAndDiseasesRegisterTreatmentMethod();

    emit(state.copyWith(
      petsAndDiseaseTypes: petsAndDiseasesTypes,
      pestsAndDiseasesRegisterTreatmentMethods: petsAndDiseaseTreatmentMethod,
    ));
  }

  void onChangeData({
    String? comment,
    int? numberOfOutbreaks,
    int? areaLost,
    bool? underControl,
    bool? carRaised,
    bool? carClosed,
    PestsAndDiseaseType? selectPetsAndDiseaseType,
    PestsAndDiseasesRegisterTreatmentMethod?
        selectPestsAndDiseasesRegisterTreatmentMethods,
  }) {
    final selectMethods = state.selectPestsAndDiseasesRegisterTreatmentMethods;

    if (selectPestsAndDiseasesRegisterTreatmentMethods != null) {
      selectMethods.add(selectPestsAndDiseasesRegisterTreatmentMethods);
    }

    emit(state.copyWith(
      comment: comment ?? state.comment,
      numberOfOutbreaks: numberOfOutbreaks ?? state.numberOfOutbreaks,
      areaLost: areaLost ?? state.areaLost,
      underControl: underControl ?? state.underControl,
      carClosed: carClosed ?? state.carClosed,
      carRaised: carRaised ?? state.carRaised,
      selectPetsAndDiseaseType:
          selectPetsAndDiseaseType ?? state.selectPetsAndDiseaseType,
      selectPestsAndDiseasesRegisterTreatmentMethods: selectMethods,
    ));
  }
}
