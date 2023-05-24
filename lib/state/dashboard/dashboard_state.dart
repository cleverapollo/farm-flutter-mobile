part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.loading = false,
    this.error,
    this.totalStakeholders,
    this.totalWorkers,
  });

  final bool loading;
  final Object? error;
  final int? totalWorkers;
  final int? totalStakeholders;

  DashboardState copyWith({
    bool? loading,
    Object? error,
    int? totalStakeholders,
    int? totalWorkers,
  }) {
    return DashboardState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      totalStakeholders: totalStakeholders ?? this.totalStakeholders,
      totalWorkers: totalWorkers ?? this.totalWorkers,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        totalStakeholders,
      ];
}
