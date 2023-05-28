import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_budget_transaction.freezed.dart';
part 'annual_budget_transaction.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualBudgetTransaction with _$AnnualBudgetTransaction {
  const factory AnnualBudgetTransaction({
    @JsonKey(name: 'AnnualBudgetTransactionId') int? annualBudgetTransactionId,
    @JsonKey(name: 'AnnualBudgetId') int? annualBudgetId,
    @JsonKey(name: 'TransactionDescripion') String? transactionDescripion,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'TransactionCategoryId') int? transactionCategoryId,
    @JsonKey(name: 'TransactionCategoryName') String? transactionCategoryName,
    @JsonKey(name: 'TransactionAmount') int? transactionAmount,
    @JsonKey(name: 'TransactionAttribute1') int? transactionAttribute1,
    @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'IsIncome') bool? isIncome,
    @JsonKey(name: 'CanDelete') int? canDelete,
  }) = _AnnualBudgetTransaction;

  const AnnualBudgetTransaction._();

  factory AnnualBudgetTransaction.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetTransactionFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
