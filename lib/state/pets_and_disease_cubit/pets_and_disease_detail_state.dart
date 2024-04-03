part of 'pets_and_disease_detail_cubit.dart';

class PetsAndDiseasesDetailState extends BaseState {
  PetsAndDiseasesDetailState({
    this.petsAndDiseaseTypes = const <PestsAndDiseaseType>[],
    this.pestsAndDiseasesRegisterTreatmentMethods = const <PestsAndDiseasesRegisterTreatmentMethod>[],
    this.selectedTreatmentMethods = const <TreatmentMethod>[],
    this.treatmentMethods = const <TreatmentMethod>[],
    this.petsAndDiseaseRegister,
    this.activeFarm,
    this.isSelectPetTypeError = false,
    super.loading,
    super.isEditing,
  });

  final PetsAndDiseaseRegister? petsAndDiseaseRegister;
  final List<PestsAndDiseaseType> petsAndDiseaseTypes;
  final List<PestsAndDiseasesRegisterTreatmentMethod> pestsAndDiseasesRegisterTreatmentMethods;
  final List<TreatmentMethod> selectedTreatmentMethods;
  final List<TreatmentMethod> treatmentMethods;
  final bool isSelectPetTypeError;
  final Farm? activeFarm;

  PetsAndDiseasesDetailState copyWith({
    bool? loading,
    bool? isEditing,
    PetsAndDiseaseRegister? petsAndDiseaseRegister,
    List<PestsAndDiseaseType>? petsAndDiseaseTypes,
    List<PestsAndDiseasesRegisterTreatmentMethod>? pestsAndDiseasesRegisterTreatmentMethods,
    List<TreatmentMethod>? selectedTreatmentMethods,
    PestsAndDiseaseType? selectedPetsAndDiseaseType,
    List<TreatmentMethod>? treatmentMethods,
    bool? isSelectPetTypeError,
    Farm? activeFarm,
  }) {
    return PetsAndDiseasesDetailState(
      petsAndDiseaseRegister: petsAndDiseaseRegister ?? this.petsAndDiseaseRegister,
      petsAndDiseaseTypes: petsAndDiseaseTypes ?? this.petsAndDiseaseTypes,
      pestsAndDiseasesRegisterTreatmentMethods: pestsAndDiseasesRegisterTreatmentMethods ?? this.pestsAndDiseasesRegisterTreatmentMethods,
      selectedTreatmentMethods: selectedTreatmentMethods ?? this.selectedTreatmentMethods,
      treatmentMethods: treatmentMethods ?? this.treatmentMethods,
      isSelectPetTypeError: isSelectPetTypeError ?? this.isSelectPetTypeError,
      activeFarm: activeFarm ?? this.activeFarm,
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
    );
  }
}
