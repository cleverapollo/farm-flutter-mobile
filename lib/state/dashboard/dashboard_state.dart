part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.loading = false,
    this.error,
    this.totalStakeholders,
  });

  final bool loading;
  final Object? error;
  final int? totalStakeholders;

  DashboardState copyWith({
    bool? loading,
    Object? error,
    int? totalStakeholders,
  }) {
    return DashboardState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      totalStakeholders: totalStakeholders ?? this.totalStakeholders,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        totalStakeholders,
      ];
}
