part of 'training_cubit.dart';

class TrainingState {
  TrainingState({
    this.items = const <TrainingRegister>[],
    this.filterItems = const <TrainingRegister>[],
    this.isDataReady = false,
  });

  final bool isDataReady;
  final List<TrainingRegister> items;
  final List<TrainingRegister> filterItems;

  TrainingState copyWith({
    List<TrainingRegister>? items,
    List<TrainingRegister>? filterItems,
    bool? isDataReady,
  }) {
    return TrainingState(
      items: items ?? this.items,
      filterItems: filterItems ?? this.filterItems,
      isDataReady: isDataReady ?? this.isDataReady,
    );
  }
}
