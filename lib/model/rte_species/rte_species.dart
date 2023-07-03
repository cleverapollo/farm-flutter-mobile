import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rte_species.freezed.dart';

part 'rte_species.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RteSpecies with _$RteSpecies {
  const factory RteSpecies(
          {@JsonKey(name: 'RteSpeciesRegisterNo') String? rteSpeciesRegisterNo,
          @JsonKey(name: 'FarmId') String? farmId,
          @JsonKey(name: 'CommonName') String? commonName,
          @JsonKey(name: 'RteSpeciesRegisterId') String? rteSpeciesRegisterId,
          @JsonKey(name: 'ScientificName') String? scientificName,
          @JsonKey(name: 'AnimalTypeId') int? animalTypeId,
          @JsonKey(name: 'SpeciesRangeId') int? speciesRangeId,
          @JsonKey(name: 'DateSpotted') DateTime? dateSpotted,
          @JsonKey(name: 'CampId') String? campId,
          @JsonKey(name: 'Location') String? location,
          @JsonKey(name: 'Latitude') double? latitude,
          @JsonKey(name: 'Longitude') double? longitude,
          @JsonKey(name: 'Comment') String? comment,
          @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
          @JsonKey(name: 'CarClosedDate') String? carClosedDate,
          @JsonKey(name: 'IsActive') bool? isActive,
          @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
          @JsonKey(name: 'CampName') String? campName,
          @JsonKey(name: 'AnimalTypeName') String? animalTypeName,
          @JsonKey(name: 'SpeciesRangeName') String? speciesRangeName}) =
      _RteSpecies;

  const RteSpecies._();

  factory RteSpecies.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesFromJson(json);

  @override
  Id get id => int.tryParse(rteSpeciesRegisterId ?? '') ?? Isar.autoIncrement;
}
