import 'package:freezed_annotation/freezed_annotation.dart';

part 'camp_payload.freezed.dart';
part 'camp_payload.g.dart';

@freezed
class CampPayLoad with _$CampPayLoad {
  const factory CampPayLoad({
    String? CampId,
    String? CampName,
    String? FarmId,
    bool? IsActive,
    int? IsLocal,
    int? CampOrder,
    int? ProtectedArea,
    int? CattlePostHousing,
    int? Corridors,
    int? RoadAndFireBreaks,
    int? PoachingAlleviationZone,
    int? ConvertedToGrassland,
    int? RangeLand,
    int? InfestationCategory1,
    int? InfestationCategory2,
    int? InfestationCategory3,
    int? InfestationCategory4,
    int? InfestationCategory5,
    int? CumulativeBiomass,
    int? PlannedYearOfHarvest,
    int? ActualYearOfHarvest,
    int? TonsOfCharcoalProduced,
    int? TotalArea,
    int? CanDelete,
  }) = _CampPayLoad;
  factory CampPayLoad.fromJson(Map<String, dynamic> json) =>
      _$CampPayLoadFromJson(json);
}
