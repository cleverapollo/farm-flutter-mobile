import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pets_and_disease_detail_state.dart';

class PetsAndDiseasesDetailCubit extends Cubit<PetsAndDiseasesDetailState> {
  PetsAndDiseasesDetailCubit(PetsAndDiseaseRegister? petsAndDiseaseRegister)
      : super(
          PetsAndDiseasesDetailState(
            petsAndDiseaseRegister: petsAndDiseaseRegister,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));

    final farm = await configService.getActiveFarm();

    emit(state.copyWith(activeFarm: farm));

    final petsAndDiseasesTypes = await cmoDatabaseMasterService.getPestsAndDiseaseTypeByGroupSchemeId(state.activeFarm?.groupSchemeId);
    final treatmentMethods = await cmoDatabaseMasterService.getTreatmentMethodByGroupSchemeId(state.activeFarm?.groupSchemeId);

    emit(
      state.copyWith(
        petsAndDiseaseTypes: petsAndDiseasesTypes,
        treatmentMethods: treatmentMethods,
      ),
    );

    if (state.petsAndDiseaseRegister != null) {
      final pestsAndDiseasesTreatmentMethod = await cmoDatabaseMasterService
          .getPestsAndDiseasesRegisterTreatmentMethodByPestsAndDiseasesRegisterNo(
        state.petsAndDiseaseRegister?.pestsAndDiseasesRegisterNo,
      );

      final selectedPestsAndDiseasesType =
          state.petsAndDiseaseTypes.firstWhereOrNull(
        (e) =>
            e.pestsAndDiseaseTypeId ==
            state.petsAndDiseaseRegister?.pestsAndDiseaseTypeId,
      );

      emit(
        state.copyWith(
          selectedPetsAndDiseaseType: selectedPestsAndDiseasesType,
          selectedTreatmentMethods: state.treatmentMethods
              .where((element) =>
                  pestsAndDiseasesTreatmentMethod.firstWhereOrNull((e) =>
                      e.treatmentMethodId == element.treatmentMethodId) !=
                  null)
              .toList(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          petsAndDiseaseRegister: PetsAndDiseaseRegister(
            pestsAndDiseasesRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
            isActive: true,
            farmId: state.activeFarm?.farmId,
            isMasterdataSynced: false,
            updateDT: DateTime.now(),
            createDT: DateTime.now(),
          ),
        ),
      );
    }

    emit(state.copyWith(loading: false));
  }

  void onSelectPetsAndDiseaseType(PestsAndDiseaseType selectPetsAndDiseaseType) {
    emit(
      state.copyWith(
        selectedPetsAndDiseaseType: selectPetsAndDiseaseType,
        isEditing: true,
        isSelectPetTypeError: false,
        petsAndDiseaseRegister: state.petsAndDiseaseRegister?.copyWith(
          pestsAndDiseaseTypeId: selectPetsAndDiseaseType.pestsAndDiseaseTypeId,
          pestsAndDiseaseTypeName: selectPetsAndDiseaseType.pestsAndDiseaseTypeName,
        ),
      ),
    );
  }

  void onSelectTreatmentMethod(List<TreatmentMethod> selectedTreatmentMethods) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedTreatmentMethods: selectedTreatmentMethods,
      ),
    );
  }

  void onChangeData({
    String? comment,
    int? numberOfOutbreaks,
    double? areaLost,
    bool? underControl,
    DateTime? discoveredDate,
  }) {
    emit(
      state.copyWith(
        isEditing: true,
        petsAndDiseaseRegister: state.petsAndDiseaseRegister?.copyWith(
          comment: comment ?? state.petsAndDiseaseRegister?.comment,
          numberOfOutbreaks: numberOfOutbreaks ?? state.petsAndDiseaseRegister?.numberOfOutbreaks,
          areaLost: areaLost ?? state.petsAndDiseaseRegister?.areaLost,
          underControl: underControl ?? state.petsAndDiseaseRegister?.underControl,
          discoveredDate: discoveredDate ?? state.petsAndDiseaseRegister?.discoveredDate,
        ),
      ),
    );
  }

  bool onValidateRequiredField() {
    if (state.petsAndDiseaseRegister?.pestsAndDiseaseTypeId == null) {
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

    futures.add(
      cmoDatabaseMasterService.deletedPestsAndDiseaseTreatmentMethodByPestsAndDiseasesRegisterNo(
        state.petsAndDiseaseRegister?.pestsAndDiseasesRegisterNo,
      ),
    );

    var now = DateTime.now().microsecondsSinceEpoch;
    for (final item in state.selectedTreatmentMethods) {
      now++;
      futures.add(
        cmoDatabaseMasterService.cachePestsAndDiseasesRegisterTreatmentMethod(
          PestsAndDiseasesRegisterTreatmentMethod(
            isActive: true,
            isMasterdataSynced: false,
            treatmentMethodId: item.treatmentMethodId,
            pestsAndDiseasesRegisterId: state.petsAndDiseaseRegister?.pestsAndDiseasesRegisterId,
            pestsAndDiseasesRegisterNo: state.petsAndDiseaseRegister?.pestsAndDiseasesRegisterNo,
            pestsAndDiseasesRegisterTreatmentMethodNo: now.toString(),
          ),
          isDirect: false,
        ),
      );
    }

    await Future.wait(futures);

    final value = await cmoDatabaseMasterService.cachePetsAndDisease(
      state.petsAndDiseaseRegister!.copyWith(
        isActive: true,
        isMasterdataSynced: false,
        pestsAndDiseasesRegisterId: null,
        updateDT: DateTime.now(),
      ),
    );

    if (value != null) {
      showSnackSuccess(msg: 'Save Pests And Disease $value Successfully');
      return true;
    } else {
      showSnackError(msg: 'Something was wrong, please try again.');
      return false;
    }
  }
}
