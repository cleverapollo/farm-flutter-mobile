import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'pest_and_disease_type.freezed.dart';
part 'pest_and_disease_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class PestsAndDiseaseType with _$PestsAndDiseaseType {
  const factory PestsAndDiseaseType({
    @JsonKey(name: 'PestsAndDiseaseTypeId') int? pestsAndDiseaseTypeId,
    @JsonKey(name: 'PestsAndDiseaseTypeName') String? pestsAndDiseaseTypeName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _PestsAndDiseaseType;

  const PestsAndDiseaseType._();

  factory PestsAndDiseaseType.fromJson(Map<String, dynamic> json) =>
      _$PestsAndDiseaseTypeFromJson(json);

  @override
  Id get id => pestsAndDiseaseTypeId ?? Isar.autoIncrement;
}
