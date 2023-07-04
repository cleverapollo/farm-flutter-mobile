import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'annual_budget_transaction_category.freezed.dart';

part 'annual_budget_transaction_category.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AnnualBudgetTransactionCategory with _$AnnualBudgetTransactionCategory {
  const factory AnnualBudgetTransactionCategory({
    @JsonKey(name: 'AnnualBudgetTransactionCategoryId')
        int? annualBudgetTransactionCategoryId,
    @JsonKey(name: 'AnnualBudgetTransactionCategoryName')
        String? annualBudgetTransactionCategoryName,
    @JsonKey(name: 'AnnualBudgetTransactionCategoryCode')
        String? annualBudgetTransactionCategoryCode,
    @Default(true) @JsonKey(name: 'IsIncome') bool? isIncome,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsCalculated') bool? isCalculated,
  }) = _AnnualBudgetTransactionCategory;

  const AnnualBudgetTransactionCategory._();

  factory AnnualBudgetTransactionCategory.fromJson(Map<String, dynamic> json) =>
      _$AnnualBudgetTransactionCategoryFromJson(json);

  @override
  Id get id => annualBudgetTransactionCategoryId ?? Isar.autoIncrement;
}
