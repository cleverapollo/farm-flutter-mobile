import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/model/pets_and_diseases/pets_and_diseases.dart';
import 'package:cmo/model/treament_method/treament_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pets_and_disease_state.freezed.dart';

@freezed
class PetsAndDiseasesState with _$PetsAndDiseasesState {
  const factory PetsAndDiseasesState({
    @Default([]) List<PestsAndDiseaseType> petsAndDiseaseTypes,
    @Default([])
        List<PestsAndDiseasesRegisterTreatmentMethod>
            pestsAndDiseasesRegisterTreatmentMethods,
    @Default([]) List<PetsAndDiseaseRegister> petsAndDiseaseRegisters,
    @Default([]) List<PetsAndDiseaseRegister> filterPetsAndDiseaseRegisters,
    @Default(StatusFilterEnum.open) StatusFilterEnum statusFilter,
    int? groupSchemeId,
    String? farmId,
    @Default(false) bool isLoading,
  }) = _PetsAndDiseasesState;
}
