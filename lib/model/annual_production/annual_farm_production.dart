import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_farm_production.freezed.dart';

part 'annual_farm_production.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualFarmProduction with _$AnnualFarmProduction {
  const factory AnnualFarmProduction({
    @JsonKey(name: 'AnnualFarmProductionId') String? annualFarmProductionId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'NoOfWorkers') int? noOfWorkers,
    @JsonKey(name: 'WorkPeriodMonths') double? workPeriodMonths,
    @JsonKey(name: 'WorkPeriodWeeks') double? workPeriodWeeks,
    @JsonKey(name: 'CycleLength') int? cycleLength,
    @JsonKey(name: 'NoOfCycles') int? noOfCycles,
    @JsonKey(name: 'ProductionPerCycle') double? workCycles,
    @JsonKey(name: 'AnnualCharcoalProductionPerPerson') double? annualCharcoalProductionPerPerson,
    @JsonKey(name: 'AnnualCharcoalProductionPerTeam') double? annualCharcoalProductionPerTeam,
    @JsonKey(name: 'ConversionWoodToCharcoal') double? conversionWoodToCharcoal,
    @JsonKey(name: 'AnnualWoodBiomassRemoved') double? annualWoodBiomassRemoved,
    @JsonKey(name: 'CanDelete') int? canDelete,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _AnnualFarmProduction;

  const AnnualFarmProduction._();

  factory AnnualFarmProduction.fromJson(Map<String, dynamic> json) =>
      _$AnnualFarmProductionFromJson(json);

  @override
  Id get id => int.tryParse(annualFarmProductionId ?? '') ?? Isar.autoIncrement;
}
