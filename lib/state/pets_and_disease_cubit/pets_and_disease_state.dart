import 'package:cmo/model/pest_and_disease_type/pest_and_disease_type.dart';
import 'package:cmo/model/pests_and_diseases_register_treatment_method/pests_and_diseases_register_treatment_method.dart';
import 'package:cmo/model/pets_and_diseases/pets_and_diseases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pets_and_disease_state.freezed.dart';

@freezed
class PetsAndDiseasesState with _$PetsAndDiseasesState {
  const factory PetsAndDiseasesState({
    @Default([]) List<PestsAndDiseaseType> petsAndDiseaseTypes,
    @Default([])
        List<PestsAndDiseasesRegisterTreatmentMethod>
            pestsAndDiseasesRegisterTreatmentMethods,
    @Default([])
        List<PestsAndDiseasesRegisterTreatmentMethod>
            selectPestsAndDiseasesRegisterTreatmentMethods,
    @Default([]) List<PetsAndDiseaseRegister> petsAndDiseaseRegisters,
    PestsAndDiseaseType? selectPetsAndDiseaseType,
    PetsAndDiseaseRegister? data,
    int? groupSchemeId,
    String? farmId,
    bool? carRaised,
    bool? carClosed,
    bool? underControl,
    String? comment,
    int? areaLost,
    int? numberOfOutbreaks,
    bool? isOpen,
  }) = _PetsAndDiseasesState;
}
