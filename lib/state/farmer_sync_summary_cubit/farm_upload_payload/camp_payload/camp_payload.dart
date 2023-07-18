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
    @Default(0) num? CampOrder,
    @Default(0) num? ProtectedArea,
    @Default(0) num? CattlePostHousing,
    @Default(0) num? Corridors,
    @Default(0) num? RoadAndFireBreaks,
    @Default(0) num? PoachingAlleviationZone,
    @Default(0) num? ConvertedToGrassland,
    @Default(0) num? RangeLand,
    @Default(0) num? InfestationCategory1,
    @Default(0) num? InfestationCategory2,
    @Default(0) num? InfestationCategory3,
    @Default(0) num? InfestationCategory4,
    @Default(0) num? InfestationCategory5,
    @Default(0) num? CumulativeBiomass,
    @Default(0) num? PlannedYearOfHarvest,
    @Default(0) num? ActualYearOfHarvest,
    @Default(0) num? TonsOfCharcoalProduced,
    @Default(0) num? TotalArea,
    @Default(0) num? CanDelete,
  }) = _CampPayLoad;
  factory CampPayLoad.fromJson(Map<String, dynamic> json) =>
      _$CampPayLoadFromJson(json);
}
