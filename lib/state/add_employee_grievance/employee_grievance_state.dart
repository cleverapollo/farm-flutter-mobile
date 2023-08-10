part of 'employee_grievance_cubit.dart';

class EmployeeGrievanceState {
  EmployeeGrievanceState({
    this.items = const [],
    this.isDataReady = false,
  });

  final bool isDataReady;
  final List<GrievanceRegister> items;

  EmployeeGrievanceState copyWith({
    List<GrievanceRegister>? items,
    bool? isDataReady,
  }) {
    return EmployeeGrievanceState(
      items: items ?? this.items,
      isDataReady: isDataReady ?? this.isDataReady,
    );
  }
}
