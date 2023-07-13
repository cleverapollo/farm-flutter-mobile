import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/annual_budget_transaction_payload/annual_budget_transaction_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_budget_transaction.freezed.dart';

part 'annual_budget_transaction.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualBudgetTransaction with _$AnnualBudgetTransaction {
  const factory AnnualBudgetTransaction({
    @JsonKey(name: 'AnnualBudgetTransactionId') int? annualBudgetTransactionId,
    @JsonKey(name: 'AnnualBudgetId') String? annualBudgetId,
    @JsonKey(name: 'TransactionDescription') String? transactionDescription,
    @JsonKey(name: 'TransactionCategoryId') int? transactionCategoryId,
    @JsonKey(name: 'TransactionCategoryName') String? transactionCategoryName,
    @JsonKey(name: 'TransactionAmount') double? transactionAmount,
    @JsonKey(name: 'TransactionAttribute1') double? transactionAttribute1,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsIncome') bool? isIncome,
    @Default(1) @JsonKey(name: 'CanDelete') int? canDelete,
    @Default(1) @JsonKey(name: 'IsLocal') int? isLocal,
  }) = _AnnualBudgetTransaction;

  const AnnualBudgetTransaction._();

  factory AnnualBudgetTransaction.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetTransactionFromJson(json);

  @override
  Id get id => annualBudgetTransactionId ?? Isar.autoIncrement;
}

extension AnnualBudgetTransactionX on AnnualBudgetTransaction {
  AnnualBudgetTransactionPayLoad toPayLoad() {
    return AnnualBudgetTransactionPayLoad(
      AnnualBudgetTransactionId: annualBudgetTransactionId,
      AnnualBudgetId: annualBudgetId,
      TransactionDescripion: transactionDescription,
      TransactionCategoryId: transactionCategoryId,
      TransactionCategoryName: transactionCategoryName,
      TransactionAmount: transactionAmount,
      TransactionAttribute1: transactionAttribute1,
      IsLocal: isLocal,
      IsActive: isActive,
      IsIncome: isIncome,
      CanDelete: canDelete,
    );
  }
}
