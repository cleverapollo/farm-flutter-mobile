import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_production_budget.freezed.dart';

part 'annual_production_budget.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualProductionBudget with _$AnnualProductionBudget {
  const factory AnnualProductionBudget({
    @JsonKey(name: 'FarmId') int? farmId,
    @JsonKey(name: 'AnnualBudgetId') int? annualBudgetId,
    @JsonKey(name: 'AnnualBudgetName') String? annualBudgetName,
    @JsonKey(name: 'AnnualFarmProductionId') int? annualFarmProductionId,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'IncomeAmount') double? incomeAmount,
    @JsonKey(name: 'ExpenseAmount') double? expenseAmount,
    @JsonKey(name: 'BalanceAmount') double? balanceAmount,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _AnnualProductionBudget;

  const AnnualProductionBudget._();

  factory AnnualProductionBudget.fromJson(Map<String, dynamic> json) => _$AnnualProductionBudgetFromJson(json);

  @override
  Id get id => annualBudgetId ?? Isar.autoIncrement;
}
