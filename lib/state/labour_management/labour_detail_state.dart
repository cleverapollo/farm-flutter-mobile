part of 'labour_detail_cubit.dart';

class LabourDetailState {
  const LabourDetailState({
    this.farmerWorker,
    this.listJobDescriptions = const <JobDescription>[],
    this.filterJobDescriptions = const <JobDescription>[],
    this.loading = false,
    this.error,
    this.activeFarm,
    this.listWorkerJobDescriptions = const <WorkerJobDescription>[],
  });

  final Object? error;
  final bool loading;
  final List<JobDescription> listJobDescriptions;
  final List<JobDescription> filterJobDescriptions;
  final Farm? activeFarm;
  final List<WorkerJobDescription> listWorkerJobDescriptions;
  final FarmerWorker? farmerWorker;

  LabourDetailState copyWith({
    FarmerWorker? farmerWorker,
    bool? loading,
    Object? error,
    List<JobDescription>? listJobDescriptions,
    List<JobDescription>? filterJobDescriptions,
    Farm? activeFarm,
    List<WorkerJobDescription>? listWorkerJobDescriptions,
  }) {
    return LabourDetailState(
      farmerWorker: farmerWorker ?? this.farmerWorker,
      loading: loading ?? this.loading,
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
