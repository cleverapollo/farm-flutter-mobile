part of 'labour_management_cubit.dart';

class LabourManagementState {
  const LabourManagementState({
    this.listWorkers = const <FarmerWorker>[],
    this.filterWorkers = const <FarmerWorker>[],
    this.loading = false,
    this.error,
  });

  final Object? error;
  final bool loading;
  final List<FarmerWorker> listWorkers;
  final List<FarmerWorker> filterWorkers;

  LabourManagementState copyWith({
    bool? loading,
    Object? error,
    List<FarmerWorker>? listWorkers,
    List<FarmerWorker>? filterWorkers,
  }) {
    return LabourManagementState(
      loading: loading ?? this.loading,
      listWorkers: listWorkers ?? this.listWorkers,
      filterWorkers: filterWorkers ?? this.filterWorkers,
      error: error ?? this.error,
    );
  }
}
