part of 'assessment_cubit.dart';

class AssessmentState extends Equatable {
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

  int? get cacheContractorId => int.tryParse(
        cacheCreateData?['ContractorId']?.toString() ?? '',
      );

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

  @override
  List<Object?> get props =>
      [loading, error, data, cacheCreateData, Json.tryEncode(cacheCreateData)];
}
