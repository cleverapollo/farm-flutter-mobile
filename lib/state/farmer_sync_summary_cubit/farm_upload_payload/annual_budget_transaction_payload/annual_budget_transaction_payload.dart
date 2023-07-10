import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_budget_transaction_payload.freezed.dart';
part 'annual_budget_transaction_payload.g.dart';

@freezed
class AnnualBudgetTransactionPayLoad with _$AnnualBudgetTransactionPayLoad {
  const factory AnnualBudgetTransactionPayLoad({
    int? AnnualBudgetTransactionId,
    String? AnnualBudgetId,
    String? TransactionDescripion,
    int? TransactionCategoryId,
    String? TransactionCategoryName,
    int? TransactionAmount,
    int? TransactionAttribute1,
    int? IsLocal,
    bool? IsActive,
    bool? IsIncome,
    int? CanDelete,
  }) = _AnnualBudgetTransactionPayLoad;
  factory AnnualBudgetTransactionPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetTransactionPayLoadFromJson(json);
}
