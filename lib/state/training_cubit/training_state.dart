part of 'training_cubit.dart';

class TrainingState {
  TrainingState({
    this.items = const <TrainingRegister>[],
    this.filterItems = const <TrainingRegister>[],
    this.isDataReady = false,
    this.statusFilter = StatusFilterEnum.open,
    this.traineeRegisters = const <TraineeRegister>[],
    this.trainingTypes = const <TrainingType>[],
  });

  final bool isDataReady;
  final List<TrainingRegister> items;
  final List<TrainingRegister> filterItems;
  final StatusFilterEnum statusFilter;
  final List<TraineeRegister> traineeRegisters;
  final List<TrainingType> trainingTypes;

  TrainingState copyWith({
    List<TrainingRegister>? items,
    List<TrainingRegister>? filterItems,
    List<TraineeRegister>? traineeRegisters,
    List<TrainingType>? trainingTypes,
    bool? isDataReady,
    StatusFilterEnum? statusFilter,
  }) {
    return TrainingState(
      items: items ?? this.items,
      filterItems: filterItems ?? this.filterItems,
      isDataReady: isDataReady ?? this.isDataReady,
      statusFilter: statusFilter ?? this.statusFilter,
      trainingTypes: trainingTypes ?? this.trainingTypes,
      traineeRegisters: traineeRegisters ?? this.traineeRegisters,
    );
  }
}
