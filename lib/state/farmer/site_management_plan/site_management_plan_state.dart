part of 'site_management_plan_cubit.dart';

class SiteManagementPlanState extends Equatable {
  const SiteManagementPlanState({
    this.loading = false,
    this.error,
    this.activeFarm,
    this.totalAnnualFarmProductions,
    this.totalAnnualBudgets,
  });

  final bool loading;
  final Object? error;
  final Farm? activeFarm;
  final int? totalAnnualFarmProductions;
  final int? totalAnnualBudgets;

  SiteManagementPlanState copyWith({
    bool? loading,
    Object? error,
    Farm? activeFarm,
    int? totalAnnualFarmProductions,
    int? totalAnnualBudgets,
  }) {
    return SiteManagementPlanState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      activeFarm: activeFarm ?? this.activeFarm,
      totalAnnualFarmProductions: totalAnnualFarmProductions ?? this.totalAnnualFarmProductions,
      totalAnnualBudgets: totalAnnualBudgets ?? this.totalAnnualBudgets,
    );
  }

  @override
  List<Object?> get props => [
    loading,
    error,
    activeFarm,
    totalAnnualFarmProductions,
    totalAnnualBudgets,
  ];
}