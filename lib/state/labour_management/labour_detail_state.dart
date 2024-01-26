part of 'labour_detail_cubit.dart';

class LabourDetailState {
  const LabourDetailState({
    required this.farmerWorker,
    this.listJobDescriptions = const <JobDescription>[],
    this.filterJobDescriptions = const <JobDescription>[],
    this.loading = false,
    this.error,
    this.activeFarm,
    this.selectedWorkerJobDescriptions = const <WorkerJobDescription>[],
    this.isFirstNameError = false,
    this.isLastNameNameError = false,
    this.isIdNumberError = false,
    this.isPhoneNumberError = false,
  });

  final Object? error;
  final bool loading;
  final List<JobDescription> listJobDescriptions;
  final List<JobDescription> filterJobDescriptions;
  final Farm? activeFarm;
  final List<WorkerJobDescription> selectedWorkerJobDescriptions;
  final FarmerWorker farmerWorker;
  final bool isFirstNameError;
  final bool isLastNameNameError;
  final bool isIdNumberError;
  final bool isPhoneNumberError;

  LabourDetailState copyWith({
    FarmerWorker? farmerWorker,
    bool? loading,
    Object? error,
    List<JobDescription>? listJobDescriptions,
    List<JobDescription>? filterJobDescriptions,
    Farm? activeFarm,
    List<WorkerJobDescription>? selectedWorkerJobDescriptions,
    bool? isFirstNameError,
    bool? isLastNameNameError,
    bool? isIdNumberError,
    bool? isPhoneNumberError,
  }) {
    return LabourDetailState(
      farmerWorker: farmerWorker ?? this.farmerWorker,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      listJobDescriptions: listJobDescriptions ?? this.listJobDescriptions,
      filterJobDescriptions:
      filterJobDescriptions ?? this.filterJobDescriptions,
      activeFarm: activeFarm ?? this.activeFarm,
      selectedWorkerJobDescriptions: selectedWorkerJobDescriptions ?? this.selectedWorkerJobDescriptions,
      isFirstNameError: isFirstNameError ?? this.isFirstNameError,
      isLastNameNameError: isLastNameNameError ?? this.isLastNameNameError,
      isIdNumberError: isIdNumberError ?? this.isIdNumberError,
      isPhoneNumberError: isPhoneNumberError ?? this.isPhoneNumberError,
    );
  }
}
