import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rte_species.freezed.dart';

part 'rte_species.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RteSpecies with _$RteSpecies {
  const factory RteSpecies({
    @JsonKey(name: 'RteSpeciesRegisterId') String? rteSpeciesRegisterId,
    @JsonKey(name: 'RteSpeciesRegisterNo') String? rteSpeciesRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'GroupSchemeMasterSpeciesId') int? groupSchemeMasterSpeciesId,
    @JsonKey(name: 'DateSpotted') DateTime? dateSpotted,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
  }) = _RteSpecies;

  const RteSpecies._();

  factory RteSpecies.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesFromJson(json);

  Id get id => int.tryParse(rteSpeciesRegisterNo ?? '') ?? Isar.autoIncrement;
}
