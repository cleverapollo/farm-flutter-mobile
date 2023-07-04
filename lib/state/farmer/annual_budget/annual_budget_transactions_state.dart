part of 'annual_budget_transactions_cubit.dart';

class AnnualBudgetTransactionsState {
  const AnnualBudgetTransactionsState({
    this.loading = false,
    this.error,
    this.annualBudget,
    this.annualBudgetTransaction,
    this.listAnnualBudgetTransactions = const <AnnualBudgetTransaction>[],
    this.filterAnnualBudgetTransactions = const <AnnualBudgetTransaction>[],
    this.listAnnualBudgetTransactionCategories = const <AnnualBudgetTransactionCategory>[],
    this.isEditing = false,
    this.indexTab = 0,
    this.selectedCategory,
  });

  final List<AnnualBudgetTransaction> listAnnualBudgetTransactions;
  final List<AnnualBudgetTransaction> filterAnnualBudgetTransactions;
  final List<AnnualBudgetTransactionCategory>listAnnualBudgetTransactionCategories;
  final AnnualBudgetTransactionCategory? selectedCategory;
  final AnnualBudgetTransaction? annualBudgetTransaction;
  final AnnualBudget? annualBudget;
  final Object? error;
  final bool loading;
  final bool isEditing;
  final int indexTab;

  AnnualBudgetTransactionsState copyWith({
    bool? loading,
    Object? error,
    List<AnnualBudgetTransaction>? listAnnualBudgetTransactions,
    List<AnnualBudgetTransaction>? filterAnnualBudgetTransactions,
    List<AnnualBudgetTransactionCategory>?listAnnualBudgetTransactionCategories,
    AnnualBudget? annualBudget,
    AnnualBudgetTransaction? annualBudgetTransaction,
    bool? isEditing,
    int? indexTab,
    AnnualBudgetTransactionCategory? selectedCategory,
  }) {
    return AnnualBudgetTransactionsState(
      isEditing: isEditing ?? this.isEditing,
      error: error ?? this.error,
      loading: loading ?? this.loading,
      annualBudget: annualBudget ?? this.annualBudget,
      annualBudgetTransaction: annualBudgetTransaction ?? this.annualBudgetTransaction,
      listAnnualBudgetTransactions: listAnnualBudgetTransactions ?? this.listAnnualBudgetTransactions,
      filterAnnualBudgetTransactions: filterAnnualBudgetTransactions ?? this.filterAnnualBudgetTransactions,
      listAnnualBudgetTransactionCategories: listAnnualBudgetTransactionCategories ?? this.listAnnualBudgetTransactionCategories,
      indexTab: indexTab ?? this.indexTab,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  AnnualBudgetTransactionsState cleanCache() {
    return AnnualBudgetTransactionsState(
      error: error,
      loading: loading,
      indexTab: indexTab,
      listAnnualBudgetTransactions: listAnnualBudgetTransactions,
      filterAnnualBudgetTransactions: filterAnnualBudgetTransactions,
      listAnnualBudgetTransactionCategories: listAnnualBudgetTransactionCategories,
    );
  }
}
