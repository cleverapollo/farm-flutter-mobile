part of 'annual_farm_production_cubit.dart';

class AnnualFarmProductionState {
  const AnnualFarmProductionState({
    this.listWorkers = const <FarmerWorker>[],
    this.filterWorkers = const <FarmerWorker>[],
    this.listJobDescriptions = const <JobDescription>[],
    this.filterJobDescriptions = const <JobDescription>[],
    this.loading = false,
    this.error,
    this.annualFarmProduction,
  });

  final Object? error;
  final bool loading;
  final List<FarmerWorker> listWorkers;
  final List<FarmerWorker> filterWorkers;
  final List<JobDescription> listJobDescriptions;
  final List<JobDescription> filterJobDescriptions;
  final AnnualFarmProduction? annualFarmProduction;

  AnnualFarmProductionState copyWith({
    bool? loading,
    Object? error,
    List<FarmerWorker>? listWorkers,
    List<FarmerWorker>? filterWorkers,
    List<JobDescription>? listJobDescriptions,
    List<JobDescription>? filterJobDescriptions,
    AnnualFarmProduction? annualFarmProduction,
  }) {
    return AnnualFarmProductionState(
      loading: loading ?? this.loading,
      listWorkers: listWorkers ?? this.listWorkers,
      filterWorkers: filterWorkers ?? this.filterWorkers,
      error: error ?? this.error,
      listJobDescriptions: listJobDescriptions ?? this.listJobDescriptions,
      filterJobDescriptions: filterJobDescriptions ?? this.filterJobDescriptions,
      annualFarmProduction: annualFarmProduction ?? this.annualFarmProduction,
    );
  }
}
