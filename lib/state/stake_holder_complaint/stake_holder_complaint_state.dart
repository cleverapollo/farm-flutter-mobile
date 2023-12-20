part of 'stake_holder_complaint_cubit.dart';

class StakeHolderComplaintState {
  StakeHolderComplaintState({
    this.isDataReady = false,
    this.items = const [],
    this.filterItems = const [],
    this.statusFilter = StatusFilterEnum.open,
  });

  final bool isDataReady;
  final List<ComplaintsAndDisputesRegister> items;
  final List<ComplaintsAndDisputesRegister> filterItems;
  final StatusFilterEnum statusFilter;

  StakeHolderComplaintState copyWith({
    List<ComplaintsAndDisputesRegister>? items,
    List<ComplaintsAndDisputesRegister>? filterItems,
    bool? isDataReady,
    StatusFilterEnum? statusFilter,
  }) {
    return StakeHolderComplaintState(
      items: items ?? this.items,
      isDataReady: isDataReady ?? this.isDataReady,
      filterItems: filterItems ?? this.filterItems,
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}
