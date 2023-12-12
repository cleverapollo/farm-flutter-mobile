part of 'employee_grievance_cubit.dart';

class EmployeeGrievanceState {
  EmployeeGrievanceState({
    this.items = const [],
    this.filterItems = const <GrievanceRegister>[],
    this.isDataReady = false,
    this.statusFilter = StatusFilterEnum.open,
  });

  final bool isDataReady;
  final List<GrievanceRegister> items;
  final List<GrievanceRegister> filterItems;
  final StatusFilterEnum statusFilter;

  EmployeeGrievanceState copyWith({
    List<GrievanceRegister>? items,
    List<GrievanceRegister>? filterItems,
    bool? isDataReady,
    StatusFilterEnum? statusFilter,
  }) {
    return EmployeeGrievanceState(
      items: items ?? this.items,
      isDataReady: isDataReady ?? this.isDataReady,
      filterItems: filterItems ?? this.filterItems,
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}
