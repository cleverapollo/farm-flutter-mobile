import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_budget_payload.freezed.dart';
part 'annual_budget_payload.g.dart';

@freezed
class AnnualBudgetPayLoad with _$AnnualBudgetPayLoad {
  const factory AnnualBudgetPayLoad({
    String? AnnualBudgetId,
    String? AnnualBudgetName,
    num? GroupschemeId,
    String? FarmId,
    String? AnnualFarmProductionId,
    num? AnnualFarmProductionYear,
    num? TotalIncome,
    num? TotalExpense,
    num? IsLocal,
    bool? IsActive,
    num? CanDelete,
  }) = _AnnualBudgetPayLoad;
  factory AnnualBudgetPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetPayLoadFromJson(json);
}
