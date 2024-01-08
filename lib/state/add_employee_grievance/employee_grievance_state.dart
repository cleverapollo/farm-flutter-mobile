part of 'employee_grievance_cubit.dart';

class EmployeeGrievanceState {
  EmployeeGrievanceState({
    this.items = const [],
    this.filterItems = const <GrievanceRegister>[],
    this.farmerWorkers = const <FarmerWorker>[],
    this.isDataReady = false,
    this.statusFilter = StatusFilterEnum.open,
  });

  final bool isDataReady;
  final List<GrievanceRegister> items;
  final List<GrievanceRegister> filterItems;
  final StatusFilterEnum statusFilter;
  final List<FarmerWorker> farmerWorkers;

  EmployeeGrievanceState copyWith({
    List<GrievanceRegister>? items,
    List<GrievanceRegister>? filterItems,
    List<FarmerWorker>? farmerWorkers,
    bool? isDataReady,
    StatusFilterEnum? statusFilter,
  }) {
    return EmployeeGrievanceState(
      items: items ?? this.items,
      isDataReady: isDataReady ?? this.isDataReady,
      filterItems: filterItems ?? this.filterItems,
      statusFilter: statusFilter ?? this.statusFilter,
      farmerWorkers: farmerWorkers ?? this.farmerWorkers,
    );
  }
}
