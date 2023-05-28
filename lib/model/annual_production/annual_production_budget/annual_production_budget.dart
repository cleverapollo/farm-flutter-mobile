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
    @JsonKey(name: 'AnnualProductionId') int? annualProductionId,
    @JsonKey(name: 'Year') int? year,
    @JsonKey(name: 'IncomeAmount') double? incomeAmount,
    @JsonKey(name: 'ExpenseAmount') double? expenseAmount,
    @JsonKey(name: 'BalanceAmount') double? balanceAmount,
    @JsonKey(name: 'TransactionBudgetName') String? transactionBudgetName,
    @JsonKey(name: 'TransactionBudgetYear') int? transactionBudgetYear,
    @JsonKey(name: 'CreateDT') String? createDT,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _AnnualProductionBudget;

  const AnnualProductionBudget._();

  factory AnnualProductionBudget.fromJson(Map<String, dynamic> json) =>
      _$AnnualProductionBudgetFromJson(json);

  @override
  Id get id => annualBudgetId ?? Isar.autoIncrement;
}
