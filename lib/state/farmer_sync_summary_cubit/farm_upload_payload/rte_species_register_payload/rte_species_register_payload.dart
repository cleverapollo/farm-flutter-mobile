import 'package:freezed_annotation/freezed_annotation.dart';
part 'rte_species_register_payload.freezed.dart';
part 'rte_species_register_payload.g.dart';

@freezed
class RteSpeciesRegisterPayLoad with _$RteSpeciesRegisterPayLoad {
  const factory RteSpeciesRegisterPayLoad({
    String? RteSpeciesRegisterNo,
    String? FarmId,
    String? CommonName,
    String? RteSpeciesRegisterId,
    String? ScientificName,
    num? AnimalTypeId,
    num? SpeciesRangeId,
    DateTime? DateSpotted,
    String? CampId,
    String? Location,
    num? Latitude,
    num? Longitude,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? CampName,
    String? AnimalTypeName,
    String? SpeciesRangeName,
    DateTime? CreateDT,
    DateTime? UpdateDT,
  }) = _RteSpeciesRegisterPayLoad;
  factory RteSpeciesRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesRegisterPayLoadFromJson(json);
}
