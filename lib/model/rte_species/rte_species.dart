import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/rte_species_register_payload/rte_species_register_payload.dart';
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
          @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
          @Default(false) @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
          @JsonKey(name: 'CampName') String? campName,
          @JsonKey(name: 'AnimalTypeName') String? animalTypeName,
            @JsonKey(name: 'CreateDT') DateTime? createDT,
            @JsonKey(name: 'UpdateDT') DateTime? updateDT,
          @JsonKey(name: 'SpeciesRangeName') String? speciesRangeName}) =
      _RteSpecies;

  const RteSpecies._();

  factory RteSpecies.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesFromJson(json);

  @override
  Id get id => int.tryParse(rteSpeciesRegisterNo ?? '') ?? Isar.autoIncrement;
}

extension RteSpeciesX on RteSpecies {
  RteSpeciesRegisterPayLoad toPayLoad() {
    return RteSpeciesRegisterPayLoad(
      RteSpeciesRegisterNo: rteSpeciesRegisterNo,
      FarmId: farmId,
      CommonName: commonName,
      RteSpeciesRegisterId: rteSpeciesRegisterId,
      ScientificName: scientificName,
      AnimalTypeId: animalTypeId,
      SpeciesRangeId: speciesRangeId,
      DateSpotted: dateSpotted,
      CampId: campId,
      Location: location,
      Latitude: latitude,
      Longitude: longitude,
      Comment: comment,
      CarRaisedDate: carRaisedDate,
      CarClosedDate: carClosedDate,
      IsActive: isActive,
      IsMasterdataSynced: isMasterDataSynced,
      CampName: campName,
      AnimalTypeName: animalTypeName,
      SpeciesRangeName: speciesRangeName,
      CreateDT: createDT,
      UpdateDT: updateDT,
    );
  }
}
