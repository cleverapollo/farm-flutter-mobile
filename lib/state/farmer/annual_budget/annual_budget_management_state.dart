part of 'annual_budget_management_cubit.dart';

class AnnualBudgetManagementState {
  const AnnualBudgetManagementState({
    this.loading = false,
    this.error,
    this.annualBudget,
    this.activeFarm,
    this.listAnnualBudgets = const <AnnualBudget>[],
    this.filterAnnualBudgets = const <AnnualBudget>[],
    this.listAnnualFarmProductions = const <AnnualFarmProduction>[],
    this.isEditing = false,
  });

  final List<AnnualBudget> listAnnualBudgets;
  final List<AnnualBudget> filterAnnualBudgets;
  final List<AnnualFarmProduction> listAnnualFarmProductions;
  final AnnualBudget? annualBudget;
  final Farm? activeFarm;
  final Object? error;
  final bool loading;
  final bool isEditing;

  AnnualBudgetManagementState copyWith({
    bool? loading,
    Object? error,
    List<AnnualBudget>? listAnnualBudgets,
    List<AnnualBudget>? filterAnnualBudgets,
    List<AnnualFarmProduction>? listAnnualFarmProductions,
    AnnualBudget? annualBudget,
    Farm? activeFarm,
    bool? isEditing,
  }) {
    return AnnualBudgetManagementState(
      activeFarm: activeFarm ?? this.activeFarm,
      isEditing: isEditing ?? this.isEditing,
      error: error ?? this.error,
      loading: loading ?? this.loading,
      annualBudget: annualBudget ?? this.annualBudget,
      listAnnualBudgets: listAnnualBudgets ?? this.listAnnualBudgets,
      filterAnnualBudgets: filterAnnualBudgets ?? this.filterAnnualBudgets,
      listAnnualFarmProductions: listAnnualFarmProductions ?? this.listAnnualFarmProductions,
    );
  }

  AnnualBudgetManagementState cleanCache() {
    return AnnualBudgetManagementState(
      error: error,
      loading: loading,
      listAnnualBudgets: listAnnualBudgets,
      filterAnnualBudgets: filterAnnualBudgets,
      listAnnualFarmProductions: listAnnualFarmProductions,
    );
  }
}
