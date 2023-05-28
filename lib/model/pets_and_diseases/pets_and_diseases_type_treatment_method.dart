import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'pets_and_diseases_type_treatment_method.freezed.dart';
part 'pets_and_diseases_type_treatment_method.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class PestsAndDiseaseTypeTreatmentMethod
    with _$PestsAndDiseaseTypeTreatmentMethod {
  const factory PestsAndDiseaseTypeTreatmentMethod({
    @JsonKey(name: 'PestsAndDiseaseTypeTreatmentMethodId')
        int? pestsAndDiseaseTypeTreatmentMethodId,
    @JsonKey(name: 'PestsAndDiseaseTypeTreatmentMethodNo')
        String? pestsAndDiseaseTypeTreatmentMethodNo,
    @JsonKey(name: 'PestsAndDiseaseTypeId') String? pestsAndDiseaseTypeId,
    @JsonKey(name: 'PestsAndDiseaseTypeNo') String? pestsAndDiseaseTypeNo,
    @JsonKey(name: 'TreatmentMethodId') int? treatmentMethodId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
  }) = _PestsAndDiseaseTypeTreatmentMethod;

  const PestsAndDiseaseTypeTreatmentMethod._();

  factory PestsAndDiseaseTypeTreatmentMethod.fromJson(
          Map<String, dynamic> json) =>
      _$PestsAndDiseaseTypeTreatmentMethodFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
