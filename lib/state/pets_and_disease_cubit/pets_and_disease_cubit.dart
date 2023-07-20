import 'package:cmo/di.dart';
import 'package:cmo/model/config/config.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetsAndDiseasesCubit extends Cubit<PetsAndDiseasesState> {
  PetsAndDiseasesCubit() : super(PetsAndDiseasesState()) {
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
      data: state.data.copyWith(
        comment: comment ?? state.data.comment,
        numberOfOutbreaks: numberOfOutbreaks ?? state.data.numberOfOutbreaks,
        areaLost: areaLost ?? state.data.areaLost,
        underControl: underControl ?? state.data.underControl,
        pestsAndDiseaseTypeName:
            selectPetsAndDiseaseType?.pestsAndDiseaseTypeName ??
                state.selectPetsAndDiseaseType?.pestsAndDiseaseTypeName,
        pestsAndDiseaseTreatmentMethods:
            selectPestsAndDiseasesRegisterTreatmentMethods
                    ?.pestsAndDiseasesRegisterTreatmentMethodNo ??
                state.data.pestsAndDiseaseTreatmentMethods,
      ),
      carClosed: carClosed ?? state.carClosed,
      carRaised: carRaised ?? state.carRaised,
      selectPetsAndDiseaseType:
          selectPetsAndDiseaseType ?? state.selectPetsAndDiseaseType,
      selectPestsAndDiseasesRegisterTreatmentMethods: selectMethods,
    ));
  }

  Future<void> onSave(BuildContext context) async {
    await cmoDatabaseMasterService
        .cachePetsAndDiseaseFromFarm(state.data.copyWith(
      isActive: true,
      isMasterdataSynced: false,
      pestsAndDiseasesRegisterNo:
          DateTime.now().millisecondsSinceEpoch.toString(),
      pestsAndDiseasesRegisterId: null,
    ))
        .then((value) {
      if (value != null) {
        showSnackSuccess(msg: 'Save Pests And Disease $value Successfully}');
        Navigator.pop(context);
      } else {
        showSnackError(msg: 'Something was wrong, please try again.');
      }
    });
  }
}
