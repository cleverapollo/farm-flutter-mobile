import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'species_type.freezed.dart';
part 'species_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnimalType with _$AnimalType {
  const factory AnimalType({
    @JsonKey(name: 'AnimalTypeId') int? animalTypeId,
    @JsonKey(name: 'AnimalTypeName') String? animalTypeName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _AnimalType;

  const AnimalType._();

  factory AnimalType.fromJson(Map<String, dynamic> json) =>
      _$AnimalTypeFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
