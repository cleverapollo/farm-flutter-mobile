import 'package:cmo/extensions/bool_estension.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/annual_farm_production_payload/annual_farm_production_payload.dart';
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
    @JsonKey(name: 'Year') String? year,
    @JsonKey(name: 'NoOfWorkers') double? noOfWorkers,
    @JsonKey(name: 'WorkPeriodMonths') double? workPeriodMonths,
    @JsonKey(name: 'WorkPeriodWeeks') double? workPeriodWeeks,
    @JsonKey(name: 'CycleLength') double? cycleLength,
    @JsonKey(name: 'NoOfCycles') double? noOfCycles,
    @JsonKey(name: 'ProductionPerCycle') double? productionPerCycle,
    @JsonKey(name: 'AnnualCharcoalProductionPerPerson')
        double? annualCharcoalProductionPerPerson,
    @JsonKey(name: 'AnnualCharcoalProductionPerTeam')
        double? annualCharcoalProductionPerTeam,
    @JsonKey(name: 'ConversionWoodToCharcoal') double? conversionWoodToCharcoal,
    @JsonKey(name: 'AnnualWoodBiomassRemoved') double? annualWoodBiomassRemoved,
    @Default(1) @JsonKey(name: 'CanDelete') int? canDelete,
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

  double calculateNoOfCycles({bool isRound = false}) {
    if (isRound) {
      return (workPeriodWeeks! / cycleLength!).round().toDouble();
    } else {
      return workPeriodWeeks! / cycleLength!;
    }
  }

  double calculatedAnnualCharcoalProductionPerPerson({bool isRound = false}) {
    final cycles = calculateNoOfCycles();
    final productionPerPerson = cycles * productionPerCycle!;

    if (isRound) {
      return productionPerPerson.round().toDouble();
    } else {
      return productionPerPerson;
    }
  }

  double calculatedAnnualCharcoalProductionPerTeam({bool isRound = false}) {
    final cycles = calculateNoOfCycles();
    final productionPerPerson = cycles * productionPerCycle!;
    final productionPerTeam = noOfWorkers! * productionPerPerson;

    if (isRound) {
      return productionPerTeam.round().toDouble();
    } else {
      return productionPerTeam;
    }
  }

  double calculateAnnualWoodBiomassRemoved({bool isRound = false}) {
    final productionPerTeam = calculatedAnnualCharcoalProductionPerTeam();
    final annualBiomassRemoved = conversionWoodToCharcoal! * productionPerTeam;

    if (isRound) {
      return annualBiomassRemoved.round().toDouble();
    } else {
      return annualBiomassRemoved;
    }
  }
}

extension AnnualFarmProductionX on AnnualFarmProduction {
  AnnualFarmProductionPayload toPayLoad() {
    return AnnualFarmProductionPayload(
      AnnualFarmProductionId: annualFarmProductionId,
      Year: int.tryParse(year ?? ''),
      FarmId: farmId,
      NoOfWorkers: noOfWorkers?.toInt(),
      WorkPeriodMonths: workPeriodMonths?.toInt(),
      WorkPeriodWeeks: workPeriodWeeks?.toInt(),
      CycleLength: cycleLength?.toInt(),
      NoOfCycles: noOfCycles?.toInt(),
      ProductionPerCycle: productionPerCycle?.toInt(),
      AnnualCharcoalProductionPerPerson:
          annualCharcoalProductionPerPerson?.toInt(),
      AnnualCharcoalProductionPerTeam: annualCharcoalProductionPerTeam?.toInt(),
      ConversionWoodToCharcoal: conversionWoodToCharcoal?.toInt(),
      AnnualWoodBiomassRemoved: annualWoodBiomassRemoved?.toInt(),
      IsLocal: isLocal.toInt,
      IsActive: isActive.toInt,
      CanDelete: canDelete,
    );
  }
}
