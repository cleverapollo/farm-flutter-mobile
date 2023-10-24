import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/model/pets_and_diseases/pets_and_diseases.dart';
import 'package:cmo/state/pets_and_disease_cubit/pets_and_disease_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
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
    emit(state.copyWith(isLoading: true));
    final inited = await initConfigData();

    if (!inited) return;

    final result = await cmoDatabaseMasterService
        .getPetsAndDiseaseRegisterByFarmId(state.farmId!);

    emit(state.copyWith(petsAndDiseaseRegisters: result, isLoading: false));
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

  Future<void> initAddData({PetsAndDiseaseRegister? data}) async {
    emit(state.copyWith(isLoading: true));

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
    ));

    if (data != null) {
      final pestsAndDiseasesTreatmentMethod = await cmoDatabaseMasterService
          .getPestsAndDiseasesRegisterTreatmentMethodByPestsAndDiseasesRegisterNo(
              data.pestsAndDiseasesRegisterNo);

      final selectPestsAndDiseasesType = state.petsAndDiseaseTypes
          .firstWhereOrNull(
              (e) => e.pestsAndDiseaseTypeId == data.pestsAndDiseaseTypeId);

      emit(state.copyWith(
        data: data.copyWith(
          createDT: data.createDT ?? DateTime.now(),
          updateDT: DateTime.now(),
        ),
        carClosed: data.carClosedDate != null,
        carRaised: data.carRaisedDate != null,
        selectPetsAndDiseaseType: selectPestsAndDiseasesType,
        selectPestsAndDiseasesRegisterTreatmentMethods:
            pestsAndDiseasesTreatmentMethod,
      ));
    }

    emit(state.copyWith(
        data: state.data.copyWith(
          pestsAndDiseasesRegisterNo: state.data.pestsAndDiseasesRegisterNo ??
              DateTime.now().millisecondsSinceEpoch.toString(),
        ),
        isLoading: false));
  }

  void onSelectPetsAndDiseaseType(PestsAndDiseaseType selectPetsAndDiseaseType) {
    emit(
      state.copyWith(
        selectPetsAndDiseaseType: selectPetsAndDiseaseType,
        isSelectPetTypeError: false,
        data: state.data.copyWith(
          pestsAndDiseaseTypeId:
              selectPetsAndDiseaseType.pestsAndDiseaseTypeId ??
                  state.selectPetsAndDiseaseType?.pestsAndDiseaseTypeId,
          pestsAndDiseaseTypeName:
              selectPetsAndDiseaseType.pestsAndDiseaseTypeName ??
                  state.selectPetsAndDiseaseType?.pestsAndDiseaseTypeName,
        ),
      ),
    );
  }

  void onChangeData({
    String? comment,
    int? numberOfOutbreaks,
    double? areaLost,
    bool? underControl,
    PestsAndDiseaseType? selectPetsAndDiseaseType,
    List<PestsAndDiseasesRegisterTreatmentMethod>?
        selectPestsAndDiseasesRegisterTreatmentMethods,
  }) {

    emit(state.copyWith(
      data: state.data.copyWith(
        comment: comment ?? state.data.comment,
        numberOfOutbreaks: numberOfOutbreaks ?? state.data.numberOfOutbreaks,
        areaLost: areaLost ?? state.data.areaLost,
        underControl: underControl ?? state.data.underControl,
      ),
      selectPestsAndDiseasesRegisterTreatmentMethods:
          selectPestsAndDiseasesRegisterTreatmentMethods != null
              ? selectPestsAndDiseasesRegisterTreatmentMethods
                  .map((e) => e.copyWith(
                        pestsAndDiseasesRegisterNo:
                            state.data.pestsAndDiseasesRegisterNo,
                      ))
                  .toList()
              : state.selectPestsAndDiseasesRegisterTreatmentMethods,
    ));
  }

  bool onValidateRequiredField() {
    if (state.selectPetsAndDiseaseType == null) {
      emit(
        state.copyWith(
          isSelectPetTypeError: true,
        ),
      );

      return false;
    }

    return true;
  }

  Future<bool> onSave() async {
    if (!onValidateRequiredField()) {
      return false;
    }

    final futures = <Future<void>>[];

    final needDeleted = await cmoDatabaseMasterService
        .deletedPestsAndDiseaseTreatmentMethodByPestsAndDiseasesRegisterNo(
            state.data.pestsAndDiseasesRegisterNo);

    for (final item in state.selectPestsAndDiseasesRegisterTreatmentMethods) {
      futures.add(
          cmoDatabaseMasterService.cachePestsAndDiseaseTreatmentMethod(item));
    }

    await Future.wait(futures);

    final value = await cmoDatabaseMasterService
        .cachePetsAndDiseaseFromFarm(state.data.copyWith(
      isActive: true,
      isMasterdataSynced: false,
      pestsAndDiseasesRegisterId: null,
      farmId: state.farmId,
      updateDT: DateTime.now(),
      createDT: state.data.createDT ?? DateTime.now(),
    ));

    if (value != null) {
      showSnackSuccess(msg: 'Save Pests And Disease $value Successfully');
      return true;
    } else {
      showSnackError(msg: 'Something was wrong, please try again.');
      return false;
    }
  }
}
