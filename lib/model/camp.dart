import 'package:cmo/di.dart';
import 'package:cmo/extensions/bool_estension.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/camp_payload/camp_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'camp.freezed.dart';
part 'camp.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Camp with _$Camp {
  const factory Camp({
    @JsonKey(name: 'CampId') String? campId,
    @JsonKey(name: 'CampName') String? campName,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'ProtectedArea') double? protectedArea,
    @JsonKey(name: 'CattlePostHousing') double? cattlePostHousing,
    @JsonKey(name: 'Corridors') double? corridors,
    @JsonKey(name: 'RoadAndFireBreaks') double? roadAndFireBreaks,
    @JsonKey(name: 'PoachingAlleviationZone') double? poachingAlleviationZone,
    @JsonKey(name: 'ConvertedToGrassland') double? convertedToGrassland,
    @JsonKey(name: 'RangeLand') double? rangeLand,
    @JsonKey(name: 'TotalArea') double? totalArea,
    @JsonKey(name: 'InfestationCategory1') double? infestationCategory1,
    @JsonKey(name: 'InfestationCategory2') double? infestationCategory2,
    @JsonKey(name: 'InfestationCategory3') double? infestationCategory3,
    @JsonKey(name: 'InfestationCategory4') double? infestationCategory4,
    @JsonKey(name: 'InfestationCategory5') double? infestationCategory5,
    @JsonKey(name: 'TotalRangeInfestation') double? totalRangeInfestation,
    @JsonKey(name: 'InfestedWieghtedAverage') double? infestedWieghtedAverage,
    @JsonKey(name: 'EstimatedBiomass') double? estimatedBiomass,
    @JsonKey(name: 'TotalBiomass') double? totalBiomass,
    @JsonKey(name: 'CumulativeBiomass') double? cumulativeBiomass,
    @JsonKey(name: 'PlannedYearOfHarvest') int? plannedYearOfHarvest,
    @JsonKey(name: 'ActualYearOfHarvest') int? actualYearOfHarvest,
    @JsonKey(name: 'TonsOfCharcoalProduced') double? tonsOfCharcoalProduced,
    @JsonKey(name: 'EstimatedBiomassRemoved') double? estimatedBiomassRemoved,
    @JsonKey(name: 'Variance') double? variance,
    @JsonKey(name: 'CampOrder') int? campOrder,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
    @JsonKey(name: 'CanDelete') int? canDelete,
  }) = _Camp;

  const Camp._();

  @override
  Id get id => int.tryParse(campId ?? '') ?? Isar.autoIncrement;

  factory Camp.fromJson(Map<String, dynamic> json) => _$CampFromJson(json);
}

extension CampExtension on Camp {
  CampPayLoad toPayLoad() {
    return CampPayLoad(
      CampId: campId,
      CampName: campName,
      FarmId: farmId,
      IsActive: isActive,
      IsLocal: isLocal.toInt,
      CampOrder: campOrder,
      ProtectedArea: protectedArea?.toInt(),
      CattlePostHousing: cattlePostHousing?.toInt(),
      Corridors: corridors?.toInt(),
      RoadAndFireBreaks: roadAndFireBreaks?.toInt(),
      PoachingAlleviationZone: poachingAlleviationZone?.toInt(),
      ConvertedToGrassland: convertedToGrassland?.toInt(),
      RangeLand: rangeLand?.toInt(),
      InfestationCategory1: infestationCategory1?.toInt(),
      InfestationCategory2: infestationCategory2?.toInt(),
      InfestationCategory3: infestationCategory3?.toInt(),
      InfestationCategory4: infestationCategory4?.toInt(),
      InfestationCategory5: infestationCategory5?.toInt(),
      CumulativeBiomass: cumulativeBiomass?.toInt(),
      PlannedYearOfHarvest: plannedYearOfHarvest,
      ActualYearOfHarvest: actualYearOfHarvest,
      TonsOfCharcoalProduced: tonsOfCharcoalProduced?.toInt(),
      TotalArea: totalArea?.toInt(),
      CanDelete: canDelete,
    );
  }

  bool get isFirstStepCompleted =>
      (campName?.isNotEmpty ?? false) &&
      protectedArea != null &&
      cattlePostHousing != null &&
      corridors != null &&
      roadAndFireBreaks != null &&
      poachingAlleviationZone != null &&
      latitude != null;

  double totalInfestationRemaining() {
    double remainingInfestation = 100;
    if (this.infestationCategory1 != null) {
      remainingInfestation -= this.infestationCategory1!;
    }
    if (this.infestationCategory2 != null) {
      remainingInfestation -= this.infestationCategory2!;
    }
    if (this.infestationCategory3 != null) {
      remainingInfestation -= this.infestationCategory3!;
    }
    if (this.infestationCategory4 != null) {
      remainingInfestation -= this.infestationCategory4!;
    }
    if (this.infestationCategory5 != null) {
      remainingInfestation -= this.infestationCategory5!;
    }

    return remainingInfestation;
  }

  double calculateInfestationWeightAverage() {
    //TODO: Need to make 1, 2, 3, 4, 5 master data, hardcoded cause of time
    double average = ((this.infestationCategory1 ?? 0) * 0) +
        ((this.infestationCategory2 ?? 0) * 1) +
        ((this.infestationCategory3 ?? 0) * 2) +
        ((this.infestationCategory4 ?? 0) * 3) +
        ((this.infestationCategory5 ?? 0) * 4);
    double total = ((this.infestationCategory1 ?? 0)) +
        ((this.infestationCategory2 ?? 0)) +
        ((this.infestationCategory3 ?? 0)) +
        ((this.infestationCategory4 ?? 0)) +
        ((this.infestationCategory5 ?? 0));
    return double.parse((average / total).toStringAsFixed(2));
  }

  double calculateEstimatedBiomass() {
    //TODO: Need to make 0, 3, 8, 12, 20 master data, hardcoded cause of time
    double average = ((this.infestationCategory1 ?? 0) * 0) +
        ((this.infestationCategory2 ?? 0) * 3) +
        ((this.infestationCategory3 ?? 0) * 8) +
        ((this.infestationCategory4 ?? 0) * 12) +
        ((this.infestationCategory5 ?? 0) * 20);
    return double.parse((average / 100).toStringAsFixed(2));
  }

  double calculateTotalBiomass() {
    return double.parse((this.calculateEstimatedBiomass() *
            ((this.rangeLand ?? 0) +
                (this.convertedToGrassland ?? 0) +
                (this.poachingAlleviationZone ?? 0) +
                (this.roadAndFireBreaks ?? 0) +
                (this.cattlePostHousing ?? 0) +
                (this.corridors ?? 0)))
        .toStringAsFixed(2));
  }

  double calculateTotalArea() {
    double totalArea = (this.protectedArea ?? 0) +
        (this.cattlePostHousing ?? 0) +
        (this.corridors ?? 0) +
        (this.roadAndFireBreaks ?? 0) +
        (this.poachingAlleviationZone ?? 0) +
        (this.convertedToGrassland ?? 0) +
        (this.rangeLand ?? 0);
    return double.parse(totalArea.toStringAsFixed(2));
  }

  double calculateTotalRangeInfestation() {
    return (infestationCategory1 ?? 0) +
        (infestationCategory2 ?? 0) +
        (infestationCategory3 ?? 0) +
        (infestationCategory4 ?? 0) +
        (infestationCategory5 ?? 0);
  }

  Future<double> calculateEstimatedBiomassRemoved() async {
    var productions = await cmoDatabaseMasterService
        .getAnnualFarmProductionByFarmId(this.farmId ?? '');
    var conversionOfWoodToCharcoal =
        productions.firstOrNull?.conversionWoodToCharcoal ?? 1;
    return conversionOfWoodToCharcoal * (this.tonsOfCharcoalProduced ?? 0);
  }
}
