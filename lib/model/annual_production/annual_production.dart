import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_production.freezed.dart';

part 'annual_production.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualProduction with _$AnnualProduction {
  const factory AnnualProduction({
    @JsonKey(name: 'AnnualProductionId') int? annualProductionId,
    @JsonKey(name: 'FarmId') int? farmId,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'Workers') int? workers,
    @JsonKey(name: 'WorkPeriodMonths') double? workPeriodMonths,
    @JsonKey(name: 'WorkPeriodWeeks') int? workPeriodWeeks,
    @JsonKey(name: 'ProductionPerWorker') int? productionPerWorker,
    @JsonKey(name: 'ProductionPerTeam') int? productionPerTeam,
    @JsonKey(name: 'BiomassRemoved') int? biomassRemoved,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @JsonKey(name: 'WorkCycles') double? workCycles,
    @JsonKey(name: 'AnnualCharcoalProductionPerPerson') double? annualCharcoalProductionPerPerson,
    @JsonKey(name: 'AnnualCharcoalProductionPerTeam') double? annualCharcoalProductionPerTeam,
    @JsonKey(name: 'ConversionWoodToCharcoal') double? conversionWoodToCharcoal,
    @JsonKey(name: 'AnnualWoodBiomassRemoved') double? annualWoodBiomassRemoved,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _AnnualProduction;

  const AnnualProduction._();

  factory AnnualProduction.fromJson(Map<String, dynamic> json) => _$AnnualProductionFromJson(json);

  @override
  Id get id => annualProductionId ?? Isar.autoIncrement;
}