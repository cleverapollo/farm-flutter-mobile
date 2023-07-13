import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/annual_budget_payload/annual_budget_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_budget.freezed.dart';

part 'annual_budget.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualBudget with _$AnnualBudget {
  const factory AnnualBudget({
    @JsonKey(name: 'AnnualBudgetId') String? annualBudgetId,
    @JsonKey(name: 'AnnualBudgetName') String? annualBudgetName,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'AnnualFarmProductionId') String? annualFarmProductionId,
    @JsonKey(name: 'AnnualFarmProductionYear') int? annualFarmProductionYear,
    @JsonKey(name: 'TotalIncome') double? totalIncome,
    @JsonKey(name: 'TotalExpense') double? totalExpense,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(1) @JsonKey(name: 'CanDelete') int? canDelete,
    @Default(1) @JsonKey(name: 'IsLocal') int? isLocal,
  }) = _AnnualBudget;

  const AnnualBudget._();

  factory AnnualBudget.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetFromJson(json);

  @override
  Id get id => int.tryParse(annualBudgetId ?? '') ?? Isar.autoIncrement;
}

extension AnnualBudgetExtensions on AnnualBudget {
  AnnualBudgetPayLoad toPayLoad() {
    return AnnualBudgetPayLoad(
      AnnualBudgetId: annualBudgetId,
      AnnualBudgetName: annualBudgetName,
      GroupschemeId: groupSchemeId,
      FarmId: farmId,
      AnnualFarmProductionId: annualFarmProductionId,
      AnnualFarmProductionYear: annualFarmProductionYear,
      TotalIncome: totalIncome,
      TotalExpense: totalExpense,
      IsLocal: isLocal,
      IsActive: isActive,
      CanDelete: canDelete,
    );
  }

  double profitAndLoss() {
    if (totalIncome != null && totalExpense != null) {
      return totalIncome! - totalExpense!;
    }

    return 0;
  }
}
