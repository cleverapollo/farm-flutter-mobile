import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rte_species.freezed.dart';

part 'rte_species.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RteSpecies with _$RteSpecies {
  const factory RteSpecies({
    @JsonKey(name: 'RteSpeciesId') int? rteSpeciesId,
    @JsonKey(name: 'SpeciesType') String? speciesType,
    @JsonKey(name: 'SpeciesTypeId') int? speciesTypeId,
    @JsonKey(name: 'CommonName') String? commonName,
    @JsonKey(name: 'ScientificName') String? scientificName,
    @JsonKey(name: 'SpeciesRange') String? speciesRange,
    @JsonKey(name: 'SpeciesRangeId') int? speciesRangeId,
    @JsonKey(name: 'CampName') String? campName,
    @JsonKey(name: 'CampId') int? campId,
    @JsonKey(name: 'DateSpotted') String? dateSpotted,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'GeneralComments') String? generalComments,
    @Default(<PhotoModel>[])
    @JsonKey(name: 'Photos') List<PhotoModel>? photos,
    @Default(false) @JsonKey(name: 'CarRaised') bool? carRaised,
    @Default(false) @JsonKey(name: 'CarClosed') bool? carClosed,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _RteSpecies;

  const RteSpecies._();

  factory RteSpecies.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesFromJson(json);

  @override
  Id get id => rteSpeciesId ?? Isar.autoIncrement;
}
