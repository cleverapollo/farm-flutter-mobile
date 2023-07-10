import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_budget_payload.freezed.dart';
part 'annual_budget_payload.g.dart';

@freezed
class AnnualBudgetPayLoad with _$AnnualBudgetPayLoad {
  const factory AnnualBudgetPayLoad({
    String? AnnualBudgetId,
    String? AnnualBudgetName,
    int? GroupschemeId,
    String? FarmId,
    String? AnnualFarmProductionId,
    int? AnnualFarmProductionYear,
    int? TotalIncome,
    int? TotalExpense,
    int? IsLocal,
    bool? IsActive,
    int? CanDelete,
  }) = _AnnualBudgetPayLoad;
  factory AnnualBudgetPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetPayLoadFromJson(json);
}
