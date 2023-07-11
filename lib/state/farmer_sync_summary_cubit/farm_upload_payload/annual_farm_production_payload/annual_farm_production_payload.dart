import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_farm_production_payload.freezed.dart';
part 'annual_farm_production_payload.g.dart';

@freezed
class AnnualFarmProductionPayload with _$AnnualFarmProductionPayload {
  const factory AnnualFarmProductionPayload({
    String? AnnualFarmProductionId,
    int? Year,
    String? FarmId,
    int? NoOfWorkers,
    int? WorkPeriodMonths,
    int? WorkPeriodWeeks,
    int? CycleLength,
    int? NoOfCycles,
    int? ProductionPerCycle,
    int? AnnualCharcoalProductionPerPerson,
    int? AnnualCharcoalProductionPerTeam,
    int? ConversionWoodToCharcoal,
    int? AnnualWoodBiomassRemoved,
    int? IsLocal,
    int? IsActive,
    int? CanDelete,
  }) = _AnnualFarmProductionPayload;
  factory AnnualFarmProductionPayload.fromJson(Map<String, dynamic> json) =>
      _$AnnualFarmProductionPayloadFromJson(json);
}
