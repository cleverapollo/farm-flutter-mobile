part of 'labour_detail_cubit.dart';

class LabourDetailState extends BaseState {
  const LabourDetailState({
    required this.farmerWorker,
    this.listJobDescriptions = const <JobDescription>[],
    this.activeFarm,
    this.selectedWorkerJobDescriptions = const <WorkerJobDescription>[],
    this.isFirstNameError = false,
    this.isLastNameNameError = false,
    this.isIdNumberError = false,
    this.isPhoneNumberError = false,
    this.isWorkPermitNumberError = false,
    super.isEditing,
    super.loading = false,
    super.error,
  }) : super();

  final List<JobDescription> listJobDescriptions;
  final Farm? activeFarm;
  final List<WorkerJobDescription> selectedWorkerJobDescriptions;
  final FarmerWorker farmerWorker;
  final bool isFirstNameError;
  final bool isLastNameNameError;
  final bool isIdNumberError;
  final bool isPhoneNumberError;
  final bool isWorkPermitNumberError;

  LabourDetailState copyWith({
    FarmerWorker? farmerWorker,
    bool? loading,
    Object? error,
    List<JobDescription>? listJobDescriptions,
    Farm? activeFarm,
    List<WorkerJobDescription>? selectedWorkerJobDescriptions,
    bool? isFirstNameError,
    bool? isLastNameNameError,
    bool? isIdNumberError,
    bool? isPhoneNumberError,
    bool? isWorkPermitNumberError,
    bool? isEditing,
  }) {
    return LabourDetailState(
      isEditing: isEditing ?? this.isEditing,
      farmerWorker: farmerWorker ?? this.farmerWorker,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      listJobDescriptions: listJobDescriptions ?? this.listJobDescriptions,
      activeFarm: activeFarm ?? this.activeFarm,
      selectedWorkerJobDescriptions: selectedWorkerJobDescriptions ?? this.selectedWorkerJobDescriptions,
      isFirstNameError: isFirstNameError ?? this.isFirstNameError,
      isLastNameNameError: isLastNameNameError ?? this.isLastNameNameError,
      isIdNumberError: isIdNumberError ?? this.isIdNumberError,
      isPhoneNumberError: isPhoneNumberError ?? this.isPhoneNumberError,
      isWorkPermitNumberError: isWorkPermitNumberError ?? this.isWorkPermitNumberError,
    );
  }
}
