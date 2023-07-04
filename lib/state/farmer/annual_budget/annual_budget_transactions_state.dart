part of 'annual_budget_transactions_cubit.dart';

class AnnualBudgetTransactionsState {
  const AnnualBudgetTransactionsState({
    this.loading = false,
    this.error,
    this.annualBudget,
    this.activeFarm,
    this.annualBudgetTransaction,
    this.listAnnualBudgetTransactions = const <AnnualBudgetTransaction>[],
    this.filterAnnualBudgetTransactions = const <AnnualBudgetTransaction>[],
    this.listAnnualBudgetTransactionCategories = const <AnnualBudgetTransactionCategory>[],
    this.listAnnualFarmProductions = const <AnnualFarmProduction>[],
    this.isEditing = false,
    this.indexTab = 0,
  });

  final List<AnnualBudgetTransaction> listAnnualBudgetTransactions;
  final List<AnnualBudgetTransaction> filterAnnualBudgetTransactions;
  final List<AnnualBudgetTransactionCategory>listAnnualBudgetTransactionCategories;
  final Farm? activeFarm;
  final AnnualBudgetTransaction? annualBudgetTransaction;
  final AnnualBudget? annualBudget;

  final List<AnnualFarmProduction> listAnnualFarmProductions;
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
    List<AnnualFarmProduction>? listAnnualFarmProductions,
    AnnualBudget? annualBudget,
    AnnualBudgetTransaction? annualBudgetTransaction,
    Farm? activeFarm,
    bool? isEditing,
    int? indexTab,
  }) {
    return AnnualBudgetTransactionsState(
      activeFarm: activeFarm ?? this.activeFarm,
      isEditing: isEditing ?? this.isEditing,
      error: error ?? this.error,
      loading: loading ?? this.loading,
      annualBudget: annualBudget ?? this.annualBudget,
      annualBudgetTransaction: annualBudgetTransaction ?? this.annualBudgetTransaction,
      listAnnualBudgetTransactions: listAnnualBudgetTransactions ?? this.listAnnualBudgetTransactions,
      filterAnnualBudgetTransactions: filterAnnualBudgetTransactions ?? this.filterAnnualBudgetTransactions,
      listAnnualFarmProductions: listAnnualFarmProductions ?? this.listAnnualFarmProductions,
      listAnnualBudgetTransactionCategories: listAnnualBudgetTransactionCategories ?? this.listAnnualBudgetTransactionCategories,
      indexTab: indexTab ?? this.indexTab,
    );
  }

  AnnualBudgetTransactionsState cleanCache() {
    return AnnualBudgetTransactionsState(
      error: error,
      loading: loading,
      listAnnualBudgetTransactions: listAnnualBudgetTransactions,
      filterAnnualBudgetTransactions: filterAnnualBudgetTransactions,
      listAnnualFarmProductions: listAnnualFarmProductions,
      listAnnualBudgetTransactionCategories:
          listAnnualBudgetTransactionCategories,
    );
  }
}
