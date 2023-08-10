part of 'add_employee_grievance_cubit.dart';

class AddEmployeeGrievanceState {
  AddEmployeeGrievanceState({
    required this.employeeGrievance,
    required this.farm,
    this.isAddNew = true,
    this.isDataReady = false,
    this.grievanceIssues = const [],
    this.workers = const [],
  });

  final Farm farm;
  final bool isDataReady;
  final bool isAddNew;
  GrievanceRegister employeeGrievance;
  final List<GrievanceIssue> grievanceIssues;
  final List<FarmerWorker> workers;


  AddEmployeeGrievanceState copyWith({
    bool? isDataReady,
    GrievanceRegister? employeeGrievance,
    List<GrievanceIssue>? grievanceIssues,
    List<FarmerWorker>? workers,
  }) {
    return AddEmployeeGrievanceState(
      isDataReady: isDataReady ?? this.isDataReady,
      employeeGrievance: employeeGrievance ?? this.employeeGrievance,
      grievanceIssues: grievanceIssues ?? this.grievanceIssues,
      workers: workers ?? this.workers,
      farm: farm,
    );
  }
}
