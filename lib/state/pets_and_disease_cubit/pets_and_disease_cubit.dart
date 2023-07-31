import 'package:cmo/di.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter/material.dart';
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
    final inited = await initConfigData();

    if (!inited) return;

    final result = await cmoDatabaseMasterService
        .getPetsAndDiseaseRegisterByFarmId(state.farmId!);

    if (result.isNotEmpty) {
      emit(state.copyWith(petsAndDiseaseRegisters: result));
    }
  }

  Future<bool> initConfigData() async {
    try {
      final farm = await configService.getActiveFarm();

      emit(state.copyWith(
          farmId: farm?.farmId, groupSchemeId: farm?.groupSchemeId));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> initAddData() async {
    final inited = await initConfigData();

    if (!inited) return;

    final petsAndDiseasesTypes = await cmoDatabaseMasterService
        .getAllPetsAndDiseaseTypeByGroupSchemeId(state.groupSchemeId!);
    final treatmentMethods = await cmoDatabaseMasterService
        .getTreatmentMethodByGroupSchemeId(state.groupSchemeId!);
    final petsAndDiseaseTreatmentMethod = await cmoDatabaseMasterService
        .getAllPestsAndDiseasesRegisterTreatmentMethod();

    emit(state.copyWith(
        petsAndDiseaseTypes: petsAndDiseasesTypes,
        pestsAndDiseasesRegisterTreatmentMethods: petsAndDiseaseTreatmentMethod,
        treatmentMethods: treatmentMethods,
        data: state.data.copyWith(
            pestsAndDiseasesRegisterNo:
                DateTime.now().millisecondsSinceEpoch.toString())));
  }

  void onChangeData({
    String? comment,
    int? numberOfOutbreaks,
    int? areaLost,
    bool? underControl,
    bool? carRaised,
    bool? carClosed,
    PestsAndDiseaseType? selectPetsAndDiseaseType,
    List<PestsAndDiseasesRegisterTreatmentMethod>?
        selectPestsAndDiseasesRegisterTreatmentMethods,
  }) {
    final selectMethods = <PestsAndDiseasesRegisterTreatmentMethod>[];

    selectMethods.addAll(state.pestsAndDiseasesRegisterTreatmentMethods);

    if (selectPestsAndDiseasesRegisterTreatmentMethods != null) {
      selectMethods.addAll(
          selectPestsAndDiseasesRegisterTreatmentMethods.map((e) => e.copyWith(
                pestsAndDiseasesRegisterNo:
                    state.data.pestsAndDiseasesRegisterNo,
              )));
    }

    emit(state.copyWith(
      data: state.data.copyWith(
        comment: comment ?? state.data.comment,
        numberOfOutbreaks: numberOfOutbreaks ?? state.data.numberOfOutbreaks,
        areaLost: areaLost ?? state.data.areaLost,
        underControl: underControl ?? state.data.underControl,
        pestsAndDiseaseTypeId:
            selectPetsAndDiseaseType?.pestsAndDiseaseTypeId ??
                state.selectPetsAndDiseaseType?.pestsAndDiseaseTypeId,
        pestsAndDiseaseTypeName:
            selectPetsAndDiseaseType?.pestsAndDiseaseTypeName ??
                state.selectPetsAndDiseaseType?.pestsAndDiseaseTypeName,
        carClosedDate:
            carClosed == true ? DateTime.now().toIso8601String() : null,
        carRaisedDate:
            carRaised == true ? DateTime.now().toIso8601String() : null,
      ),
      carClosed: carClosed ?? state.carClosed,
      carRaised: carRaised ?? state.carRaised,
      selectPetsAndDiseaseType:
          selectPetsAndDiseaseType ?? state.selectPetsAndDiseaseType,
      pestsAndDiseasesRegisterTreatmentMethods: selectMethods,
    ));
  }

  Future<void> onSave(BuildContext context) async {
    final futures = <Future<void>>[];

    for (final item in state.pestsAndDiseasesRegisterTreatmentMethods) {
      futures.add(
          cmoDatabaseMasterService.cachePestsAndDiseaseTreatmentMethod(item));
    }

    await Future.wait(futures);

    await cmoDatabaseMasterService
        .cachePetsAndDiseaseFromFarm(state.data.copyWith(
      isActive: true,
      isMasterdataSynced: false,
      pestsAndDiseasesRegisterId: null,
      farmId: state.farmId,
    ))
        .then((value) {
      if (value != null) {
        showSnackSuccess(msg: 'Save Pests And Disease $value Successfully');
        Navigator.pop(context);
      } else {
        showSnackError(msg: 'Something was wrong, please try again.');
      }
    });
  }
}
