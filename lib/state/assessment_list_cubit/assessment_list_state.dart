part of 'assessment_list_cubit.dart';

class AssessmentListState {
  const AssessmentListState({
    this.dataStarted = const <Assessment>[],
    this.dataCompleted = const <Assessment>[],
    this.dataSynced = const <Assessment>[],
    this.loadingStarted = false,
    this.loadingCompleted = false,
    this.loadingSynced = false,
    this.indexTab = 0,
    this.error,
  });

  final bool loadingStarted;
  final bool loadingCompleted;
  final bool loadingSynced;
  final Object? error;
  final int indexTab;

  final List<Assessment> dataStarted;
  final List<Assessment> dataCompleted;
  final List<Assessment> dataSynced;

  AssessmentListState copyWith({
    bool? loadingStarted,
    bool? loadingCompleted,
    bool? loadingSynced,
    Object? error,
    int? indexTab,
    List<Assessment>? dataStarted,
    List<Assessment>? dataCompleted,
    List<Assessment>? dataSynced,
    Map<String, dynamic>? cacheCreateData,
  }) {
    return AssessmentListState(
      loadingStarted: loadingStarted ?? this.loadingStarted,
      loadingCompleted: loadingCompleted ?? this.loadingCompleted,
      loadingSynced: loadingSynced ?? this.loadingSynced,
      error: error ?? this.error,
      indexTab: indexTab ?? this.indexTab,
      dataStarted: dataStarted ?? this.dataStarted,
      dataCompleted: dataCompleted ?? this.dataCompleted,
      dataSynced: dataSynced ?? this.dataSynced,
    );
  }
}
