part of 'site_management_plan_cubit.dart';

class SiteManagementPlanState extends Equatable {
  const SiteManagementPlanState({
    this.loading = false,
    this.error,
    this.activeFarm,
    this.totalAnnualFarmProductions,
    this.totalAnnualBudgets,
    this.campCount,
    this.campTonnesOfBiomass,
    this.compartmentCount,
    this.compartmentTotalArea,
  });

  final bool loading;
  final Object? error;
  final Farm? activeFarm;
  final int? totalAnnualFarmProductions;
  final int? totalAnnualBudgets;
  final int? campCount;
  final double? campTonnesOfBiomass;
  final int? compartmentCount;
  final double? compartmentTotalArea;

  SiteManagementPlanState copyWith({
    bool? loading,
    Object? error,
    Farm? activeFarm,
    int? totalAnnualFarmProductions,
    int? totalAnnualBudgets,
    int? campCount,
    double? campTonnesOfBiomass,
    int? compartmentCount,
    double? compartmentTotalArea,
  }) {
    return SiteManagementPlanState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      activeFarm: activeFarm ?? this.activeFarm,
      totalAnnualFarmProductions:
          totalAnnualFarmProductions ?? this.totalAnnualFarmProductions,
      totalAnnualBudgets: totalAnnualBudgets ?? this.totalAnnualBudgets,
      campCount: campCount ?? this.campCount,
      campTonnesOfBiomass: campTonnesOfBiomass ?? this.campTonnesOfBiomass,
      compartmentCount: compartmentCount ?? this.compartmentCount,
      compartmentTotalArea: compartmentTotalArea ?? this.compartmentTotalArea,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        activeFarm,
        totalAnnualFarmProductions,
        totalAnnualBudgets,
        campCount,
        campTonnesOfBiomass,
        compartmentCount,
        compartmentTotalArea
      ];
}
