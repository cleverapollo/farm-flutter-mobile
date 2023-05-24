part of 'labour_management_cubit.dart';

class LabourManagementState {
  const LabourManagementState({
    this.listWorkers = const <FarmerWorker>[],
    this.filterWorkers = const <FarmerWorker>[],
    this.listJobDescriptions = const <JobDescription>[],
    this.filterJobDescriptions = const <JobDescription>[],
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;
  final List<FarmerWorker> listWorkers;
  final List<FarmerWorker> filterWorkers;
  final List<JobDescription> listJobDescriptions;
  final List<JobDescription> filterJobDescriptions;

  LabourManagementState copyWith({
    bool? loading,
    Object? error,
    List<FarmerWorker>? listWorkers,
    List<FarmerWorker>? filterWorkers,
    List<JobDescription>? listJobDescriptions,
    List<JobDescription>? filterJobDescriptions,
  }) {
    return LabourManagementState(
      loading: loading ?? this.loading,
      listWorkers: listWorkers ?? this.listWorkers,
      filterWorkers: filterWorkers ?? this.filterWorkers,
      error: error ?? this.error,
      listJobDescriptions: listJobDescriptions ?? this.listJobDescriptions,
      filterJobDescriptions: filterJobDescriptions ?? this.filterJobDescriptions,
    );
  }
}
