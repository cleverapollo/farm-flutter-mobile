part of 'illegal_activity_management_cubit.dart';

class IllegalActivityManagementState {
  IllegalActivityManagementState({
    this.items = const [],
    this.filterItems = const [],
    this.statusFilter = StatusFilterEnum.open,
    this.activeFarm,
    this.inputSearch,
  });

  final List<IllegalActivityRegister> items;
  final List<IllegalActivityRegister> filterItems;
  final StatusFilterEnum statusFilter;
  final Farm? activeFarm;
  final String? inputSearch;

  IllegalActivityManagementState copyWith({
    Farm? activeFarm,
    List<IllegalActivityRegister>? items,
    List<IllegalActivityRegister>? filterItems,
    StatusFilterEnum? statusFilter,
    String? inputSearch,
  }) {
    return IllegalActivityManagementState(
      activeFarm: activeFarm ?? this.activeFarm,
      items: items ?? this.items,
      filterItems: filterItems ?? this.filterItems,
      statusFilter: statusFilter ?? this.statusFilter,
      inputSearch: inputSearch ?? this.inputSearch,
    );
  }
}
