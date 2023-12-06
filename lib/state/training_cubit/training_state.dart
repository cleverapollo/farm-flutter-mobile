part of 'training_cubit.dart';

class TrainingState {
  TrainingState({
    this.items = const <TrainingRegister>[],
    this.filterItems = const <TrainingRegister>[],
    this.isDataReady = false,
    this.statusFilter = StatusFilterEnum.open,
  });

  final bool isDataReady;
  final List<TrainingRegister> items;
  final List<TrainingRegister> filterItems;
  final StatusFilterEnum statusFilter;

  TrainingState copyWith({
    List<TrainingRegister>? items,
    List<TrainingRegister>? filterItems,
    bool? isDataReady,
    StatusFilterEnum? statusFilter,
  }) {
    return TrainingState(
      items: items ?? this.items,
      filterItems: filterItems ?? this.filterItems,
      isDataReady: isDataReady ?? this.isDataReady,
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}
