part of 'add_training_cubit.dart';

class AddTrainingState {
  AddTrainingState({
    required this.training,
    required this.farm,
    this.isAddNew = true,
    this.isDataReady = false,
    this.trainingTypes = const [],
    this.workers = const [],
  });

  final bool isDataReady;
  final bool isAddNew;
  final Farm farm;
  TrainingRegister training;
  final List<TrainingType> trainingTypes;
  final List<FarmerWorker> workers;

  AddTrainingState copyWith({
    bool? isDataReady,
    TrainingRegister? training,
    List<TrainingType>? trainingTypes,
    List<FarmerWorker>? workers,
  }) {
    return AddTrainingState(
      farm: farm,
      isDataReady: isDataReady ?? this.isDataReady,
      training: training ?? this.training,
      workers: workers ?? this.workers,
      trainingTypes: trainingTypes ?? this.trainingTypes,
      isAddNew: isAddNew,
    );
  }
}
