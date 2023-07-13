import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_budget_transaction_payload.freezed.dart';
part 'annual_budget_transaction_payload.g.dart';

@freezed
class AnnualBudgetTransactionPayLoad with _$AnnualBudgetTransactionPayLoad {
  const factory AnnualBudgetTransactionPayLoad({
    num? AnnualBudgetTransactionId,
    String? AnnualBudgetId,
    String? TransactionDescripion,
    num? TransactionCategoryId,
    String? TransactionCategoryName,
    num? TransactionAmount,
    num? TransactionAttribute1,
    num? IsLocal,
    bool? IsActive,
    bool? IsIncome,
    num? CanDelete,
  }) = _AnnualBudgetTransactionPayLoad;
  factory AnnualBudgetTransactionPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetTransactionPayLoadFromJson(json);
}
