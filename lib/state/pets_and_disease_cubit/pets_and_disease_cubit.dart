import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
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

  Future<void> initData() async {
    emit(state.copyWith(isLoading: true));
    final inited = await initConfigData();

    if (!inited) return;

    final result = await cmoDatabaseMasterService
        .getPetsAndDiseaseRegisterByFarmId(state.farmId!);

    final allTreatmentMethod = await cmoDatabaseMasterService.getAllPestsAndDiseasesRegisterTreatmentMethod();
    final allPestsAndDiseaseTypes = await cmoDatabaseMasterService.getAllPestsAndDiseaseTypes();
    emit(
      state.copyWith(
        petsAndDiseaseRegisters: result,
        filterPetsAndDiseaseRegisters: result,
        pestsAndDiseasesRegisterTreatmentMethods: allTreatmentMethod,
        petsAndDiseaseTypes: allPestsAndDiseaseTypes,
        isLoading: false,
      ),
    );

    applyFilter();
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

  void onFilterStatus(StatusFilterEnum statusFilter) {
    emit(
      state.copyWith(
        statusFilter: statusFilter,
      ),
    );

    applyFilter();
  }

  void applyFilter() {
    var filterItems = <PetsAndDiseaseRegister>[];
    switch (state.statusFilter) {
      case StatusFilterEnum.open:
        filterItems = state.petsAndDiseaseRegisters
            .where((element) => element.underControl != null && element.underControl!)
            .toList();
        break;
      case StatusFilterEnum.closed:
        filterItems = state.petsAndDiseaseRegisters
            .where((element) => element.underControl == null || !element.underControl!)
            .toList();
        break;
    }

    emit(
      state.copyWith(
        filterPetsAndDiseaseRegisters: filterItems,
      ),
    );
  }

  String getPestAndDiseaseTypeName(PetsAndDiseaseRegister registerItem) {
    return state.petsAndDiseaseTypes
            .firstWhereOrNull(
              (element) =>
                  element.pestsAndDiseaseTypeId ==
                  registerItem.pestsAndDiseaseTypeId,
            )
            ?.pestsAndDiseaseTypeName ??
        '';
  }

  String getTotalTreatmentMethods(PetsAndDiseaseRegister registerItem) {
    final listItems = state.pestsAndDiseasesRegisterTreatmentMethods.where(
      (element) =>
          element.pestsAndDiseasesRegisterNo ==
          registerItem.pestsAndDiseasesRegisterNo,
    );
    return listItems.isBlank ? '0' : listItems.length.toString();
  }
}
