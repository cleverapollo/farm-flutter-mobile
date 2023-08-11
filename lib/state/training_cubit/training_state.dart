part of 'training_cubit.dart';

class TrainingState {
  TrainingState({
    this.items = const [],
    this.isDataReady = false,
  });

  final bool isDataReady;
  final List<TrainingRegister> items;

  TrainingState copyWith({
    List<TrainingRegister>? items,
    bool? isDataReady,
  }) {
    return TrainingState(
      items: items ?? this.items,
      isDataReady: isDataReady ?? this.isDataReady,
    );
  }
}
