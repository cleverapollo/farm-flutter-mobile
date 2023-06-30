part of 'annual_farm_production_cubit.dart';

class AnnualFarmProductionState {
  const AnnualFarmProductionState({
    this.loading = false,
    this.error,
    this.annualFarmProduction,
    this.activeFarm,
    this.listAnnualFarmProductions = const <AnnualFarmProduction>[],
    this.filterAnnualFarmProductions = const <AnnualFarmProduction>[],
    this.isEditing = false,
  });

  final List<AnnualFarmProduction> listAnnualFarmProductions;
  final List<AnnualFarmProduction> filterAnnualFarmProductions;
  final AnnualFarmProduction? annualFarmProduction;
  final Farm? activeFarm;
  final Object? error;
  final bool loading;
  final bool isEditing;

  AnnualFarmProductionState copyWith({
    bool? loading,
    Object? error,
    List<AnnualFarmProduction>? listAnnualFarmProductions,
    List<AnnualFarmProduction>? filterAnnualFarmProductions,
    AnnualFarmProduction? annualFarmProduction,
    Farm? activeFarm,
    bool? isEditing,
  }) {
    return AnnualFarmProductionState(
      activeFarm: activeFarm ?? this.activeFarm,
      isEditing: isEditing ?? this.isEditing,
      error: error ?? this.error,
      loading: loading ?? this.loading,
      annualFarmProduction: annualFarmProduction ?? this.annualFarmProduction,
      listAnnualFarmProductions:
          listAnnualFarmProductions ?? this.listAnnualFarmProductions,
      filterAnnualFarmProductions:
          filterAnnualFarmProductions ?? this.filterAnnualFarmProductions,
    );
  }

  AnnualFarmProductionState cleanCache() {
    return AnnualFarmProductionState(
      error: error,
      loading: loading,
      listAnnualFarmProductions: listAnnualFarmProductions,
      filterAnnualFarmProductions: filterAnnualFarmProductions,
    );
  }
}
