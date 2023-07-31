import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_farm_production_payload.freezed.dart';
part 'annual_farm_production_payload.g.dart';

@freezed
class AnnualFarmProductionPayload with _$AnnualFarmProductionPayload {
  const factory AnnualFarmProductionPayload({
    String? AnnualFarmProductionId,
    num? Year,
    String? FarmId,
    int? NoOfWorkers,
    num? WorkPeriodMonths,
    num? WorkPeriodWeeks,
    num? CycleLength,
    num? NoOfCycles,
    num? ProductionPerCycle,
    num? AnnualCharcoalProductionPerPerson,
    num? AnnualCharcoalProductionPerTeam,
    num? ConversionWoodToCharcoal,
    num? AnnualWoodBiomassRemoved,
    num? IsLocal,
    num? IsActive,
    num? CanDelete,
  }) = _AnnualFarmProductionPayload;
  factory AnnualFarmProductionPayload.fromJson(Map<String, dynamic> json) =>
      _$AnnualFarmProductionPayloadFromJson(json);
}
