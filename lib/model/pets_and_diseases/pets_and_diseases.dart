import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'pets_and_diseases.freezed.dart';
part 'pets_and_diseases.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class PetsAndDiseaseRegister with _$PetsAndDiseaseRegister {
  const factory PetsAndDiseaseRegister({
    @JsonKey(name: 'PestsAndDiseasesRegisterNo')
        String? pestsAndDiseasesRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'PestsAndDiseaseTypeId') int? pestsAndDiseaseTypeId,
    @JsonKey(name: 'PestsAndDiseasesRegisterId')
        String? pestsAndDiseasesRegisterId,
    @JsonKey(name: 'NumberOfOutbreaks') int? numberOfOutbreaks,
    @JsonKey(name: 'AreaLost') int? areaLost,
    @JsonKey(name: 'UnderControl') bool? underControl,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'PestsAndDiseaseTypeName') String? pestsAndDiseaseTypeName,
    @JsonKey(name: 'PestsAndDiseaseTreatmentMethods')
        String? pestsAndDiseaseTreatmentMethods,
  }) = _PetsAndDiseaseRegister;

  const PetsAndDiseaseRegister._();

  factory PetsAndDiseaseRegister.fromJson(Map<String, dynamic> json) =>
      _$PetsAndDiseaseRegisterFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
