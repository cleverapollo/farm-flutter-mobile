import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'group_scheme_master_species.freezed.dart';

part 'group_scheme_master_species.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GroupSchemeMasterSpecies with _$GroupSchemeMasterSpecies {
  const factory GroupSchemeMasterSpecies({
    @JsonKey(name: 'GroupSchemeMasterSpeciesId') int? groupSchemeMasterSpeciesId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'MasterSpeciesId') int? masterSpeciesId,
    @JsonKey(name: 'Region') String? region,
    @JsonKey(name: 'AnimalTypeId') int? animalTypeId,
    @JsonKey(name: 'AnimalTypeName') String? animalTypeName,
    @JsonKey(name: 'CommonName') String? commonName,
    @JsonKey(name: 'CommonName2') String? commonName2,
    @JsonKey(name: 'ScientificName') String? scientificName,
    @JsonKey(name: 'SpeciesRangeId') int? speciesRangeId,
    @JsonKey(name: 'SpeciesRangeName') String? speciesRangeName,
    @JsonKey(name: 'EndangeredStatusId') int? endangeredStatusId,
    @JsonKey(name: 'EndangeredStatusName') String? endangeredStatusName,
    @JsonKey(name: 'BufferZoneDistance') String? bufferZoneDistance,
    @Default(false)
    @JsonKey(name: 'RemoveBufferZone') bool removeBufferZone,
    @JsonKey(name: 'WebLink') String? webLink,
    @JsonKey(name: 'ControlMeasures') String? controlMeasures,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
  }) = _GroupSchemeMasterSpecies;

  const GroupSchemeMasterSpecies._();

  factory GroupSchemeMasterSpecies.fromJson(Map<String, dynamic> json) => _$GroupSchemeMasterSpeciesFromJson(json);

  Id get id => groupSchemeMasterSpeciesId ?? Isar.autoIncrement;
}
