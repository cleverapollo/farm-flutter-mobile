part of 'assessment_cubit.dart';

class AssessmentState {
  const AssessmentState({
    this.loading = false,
    this.error,
    this.data,
    this.cacheCreateData,
  });

  final bool loading;
  final Object? error;
  final Assessment? data;
  final Map<String, dynamic>? cacheCreateData;

  AssessmentState copyWith({
    bool? loading,
    Object? error,
    Assessment? data,
    Map<String, dynamic>? cacheCreateData,
  }) {
    return AssessmentState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      data: data ?? this.data,
      cacheCreateData: cacheCreateData ?? this.cacheCreateData,
    );
  }
}
