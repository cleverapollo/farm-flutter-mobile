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
    num? IsLocal,
    num? CampOrder,
    num? ProtectedArea,
    num? CattlePostHousing,
    num? Corridors,
    num? RoadAndFireBreaks,
    num? PoachingAlleviationZone,
    num? ConvertedToGrassland,
    num? RangeLand,
    num? InfestationCategory1,
    num? InfestationCategory2,
    num? InfestationCategory3,
    num? InfestationCategory4,
    num? InfestationCategory5,
    num? CumulativeBiomass,
    num? PlannedYearOfHarvest,
    num? ActualYearOfHarvest,
    num? TonsOfCharcoalProduced,
    num? TotalArea,
    num? CanDelete,
  }) = _CampPayLoad;
  factory CampPayLoad.fromJson(Map<String, dynamic> json) =>
      _$CampPayLoadFromJson(json);
}
