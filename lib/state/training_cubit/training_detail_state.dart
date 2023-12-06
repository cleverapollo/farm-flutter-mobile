part of 'training_detail_cubit.dart';

class TrainingDetailState {
  TrainingDetailState({
    required this.training,
    required this.farm,
    this.isAddNew = true,
    this.isDataReady = false,
    this.trainingTypes = const [],
    this.workers = const [],
    this.isTrainingTypeError = false,
    this.isDateError = false,
    this.isTrainerNameError = false,
    this.isTraineeNameError = false,
  });

  final bool isDataReady;
  final bool isAddNew;
  final Farm farm;
  TrainingRegister training;
  final List<TrainingType> trainingTypes;
  final List<FarmerWorker> workers;
  final bool isTrainingTypeError;
  final bool isDateError;
  final bool isTrainerNameError;
  final bool isTraineeNameError;

  TrainingDetailState copyWith({
    bool? isDataReady,
    TrainingRegister? training,
    List<TrainingType>? trainingTypes,
    List<FarmerWorker>? workers,
    bool? isTrainingTypeError,
    bool? isDateError,
    bool? isTrainerNameError,
    bool? isTraineeNameError,
  }) {
    return TrainingDetailState(
      farm: farm,
      isDataReady: isDataReady ?? this.isDataReady,
      training: training ?? this.training,
      workers: workers ?? this.workers,
      trainingTypes: trainingTypes ?? this.trainingTypes,
      isAddNew: isAddNew,
      isTrainingTypeError: isTrainingTypeError ?? this.isTrainingTypeError,
      isTrainerNameError: isTrainerNameError ?? this.isTrainerNameError,
      isDateError: isDateError ?? this.isDateError,
      isTraineeNameError: isTraineeNameError ?? this.isTraineeNameError,
    );
  }
}
