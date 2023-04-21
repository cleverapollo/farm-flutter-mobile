import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_production.freezed.dart';

part 'annual_production.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualProduction with _$AnnualProduction {
  const factory AnnualProduction({
    @JsonKey(name: 'AnnualProductionId') int? annualProductionId,
    @JsonKey(name: 'AnnualProductionName') String? annualProductionName,
    @JsonKey(name: 'Workers') int? workers,
    @JsonKey(name: 'ProductionPerWorker') int? productionPerWorker,
    @JsonKey(name: 'ProductionPerTeam') int? productionPerTeam,
    @JsonKey(name: 'BiomassRemoved') int? biomassRemoved,
    @JsonKey(name: 'WorkCycles') double? workCycles,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,

  }) = _AnnualProduction;

  const AnnualProduction._();

  factory AnnualProduction.fromJson(Map<String, dynamic> json) => _$AnnualProductionFromJson(json);

  @override
  Id get id => annualProductionId ?? Isar.autoIncrement;
}
