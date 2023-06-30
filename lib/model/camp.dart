import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'camp.g.dart';

@collection
@JsonSerializable()
class Camp {

  @JsonKey(name: 'CampName')
  String? campName;
  @JsonKey(name: 'FarmId')
  String? farmId;
  @JsonKey(name: 'ProtectedArea')
  double? protectedArea;
  @JsonKey(name: 'CattlePostHousing')
  double? cattlePostHousing;
  @JsonKey(name: 'Corridors')
  double? corridors;
  @JsonKey(name: 'RoadAndFireBreaks')
  double? roadAndFireBreaks;
  @JsonKey(name: 'PoachingAlleviationZone')
  double? poachingAlleviationZone;
  @JsonKey(name: 'ConvertedToGrassland')
  double? convertedToGrassland;
  @JsonKey(name: 'RangeLand')
  double? rangeLand;
  @JsonKey(name: 'TotalArea')
  double? totalArea;
  @JsonKey(name: 'InfestationCategory1')
  double? infestationCategory1;
  @JsonKey(name: 'InfestationCategory2')
  double? infestationCategory2;
  @JsonKey(name: 'InfestationCategory3')
  double? infestationCategory3;
  @JsonKey(name: 'InfestationCategory4')
  double? infestationCategory4;
  @JsonKey(name: 'InfestationCategory5')
  double? infestationCategory5;
  @JsonKey(name: 'TotalRangeInfestation')
  double? totalRangeInfestation;
  @JsonKey(name: 'InfestedWieghtedAverage')
  double? infestedWieghtedAverage;
  @JsonKey(name: 'EstimatedBiomass')
  double? estimatedBiomass;
  @JsonKey(name: 'TotalBiomass')
  double? totalBiomass;
  @JsonKey(name: 'CumulativeBiomass')
  double? cumulativeBiomass;
  @JsonKey(name: 'PlannedYearOfHarvest')
  int? plannedYearOfHarvest;
  @JsonKey(name: 'ActualYearOfHarvest')
  int? actualYearOfHarvest;
  @JsonKey(name: 'TonsOfCharcoalProduced')
  double? tonsOfCharcoalProduced;
  @JsonKey(name: 'EstimatedBiomassRemoved')
  double? estimatedBiomassRemoved;
  @JsonKey(name: 'Variance')
  double? variance;
  @JsonKey(name: 'CampOrder')
  int? campOrder;
  @JsonKey(name: 'IsActive')
  bool? isActive;
  @JsonKey(name: 'CreateDT')
  DateTime? createDT;
  @JsonKey(name: 'UpdateDT')
  DateTime? updateDT;
  @JsonKey(name: 'latitude')
  double? latitude;
  @JsonKey(name: 'longitude')
  double? longitude;

  @override
  Id get id => Isar.autoIncrement;

  Camp();

  factory Camp.fromJson(Map<String, dynamic> json) =>
      _$CampFromJson(json);
}

extension CampExtension on Camp {
  bool get isFirstStepCompleted => (campName?.isNotEmpty ?? false)
      && protectedArea != null && cattlePostHousing != null && corridors != null &&
      roadAndFireBreaks != null && poachingAlleviationZone != null && latitude != null;
}
