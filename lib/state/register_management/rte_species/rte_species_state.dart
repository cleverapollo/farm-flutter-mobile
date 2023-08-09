part of 'rte_species_cubit.dart';

class RteSpeciesState {
  const RteSpeciesState({
    this.listWorkers = const <FarmerWorker>[],
    this.filterWorkers = const <FarmerWorker>[],
    this.listJobDescriptions = const <JobDescription>[],
    this.filterJobDescriptions = const <JobDescription>[],
    this.loading = false,
    this.error,
    this.activeFarm,
    this.listWorkerJobDescriptions = const <WorkerJobDescription>[],
  });

  final Object? error;
  final bool loading;
  final List<FarmerWorker> listWorkers;
  final List<FarmerWorker> filterWorkers;
  final List<JobDescription> listJobDescriptions;
  final List<JobDescription> filterJobDescriptions;
  final Farm? activeFarm;
  final List<WorkerJobDescription> listWorkerJobDescriptions;

  RteSpeciesState copyWith({
    bool? loading,
    Object? error,
    List<FarmerWorker>? listWorkers,
    List<FarmerWorker>? filterWorkers,
    List<JobDescription>? listJobDescriptions,
    List<JobDescription>? filterJobDescriptions,
    Farm? activeFarm,
    List<WorkerJobDescription>? listWorkerJobDescriptions,
  }) {
    return RteSpeciesState(
      loading: loading ?? this.loading,
      listWorkers: listWorkers ?? this.listWorkers,
      filterWorkers: filterWorkers ?? this.filterWorkers,
      error: error ?? this.error,
      listJobDescriptions: listJobDescriptions ?? this.listJobDescriptions,
      filterJobDescriptions:
      filterJobDescriptions ?? this.filterJobDescriptions,
      activeFarm: activeFarm ?? this.activeFarm,
      listWorkerJobDescriptions:
      listWorkerJobDescriptions ?? this.listWorkerJobDescriptions,
    );
  }
}
