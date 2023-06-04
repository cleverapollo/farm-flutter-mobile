part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.loading = false,
    this.error,
    this.totalStakeholders,
    this.totalWorkers,
    this.totalIncompleteAssessments,
    this.totalAssessments,
    this.totalCompletedAssessments,
    this.totalUnsyncBehave,
    this.rmDashboardInfo,
  });

  final bool loading;
  final Object? error;
  final int? totalWorkers;
  final int? totalStakeholders;
  final int? totalIncompleteAssessments;
  final int? totalCompletedAssessments;
  final int? totalAssessments;
  final int? totalUnsyncBehave;
  final RMDashboardInfo? rmDashboardInfo;

  DashboardState copyWith({
    bool? loading,
    Object? error,
    int? totalStakeholders,
    int? totalWorkers,
    int? totalIncompleteAssessments,
    int? totalCompletedAssessments,
    int? totalAssessments,
    int? totalUnsyncBehave,
    RMDashboardInfo? rmDashboardInfo,
  }) {
    return DashboardState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      totalStakeholders: totalStakeholders ?? this.totalStakeholders,
      totalWorkers: totalWorkers ?? this.totalWorkers,
      totalAssessments: totalAssessments ?? this.totalAssessments,
      totalCompletedAssessments: totalCompletedAssessments ?? this.totalCompletedAssessments,
      totalIncompleteAssessments: totalIncompleteAssessments ?? this.totalIncompleteAssessments,
      totalUnsyncBehave: totalUnsyncBehave ?? this.totalUnsyncBehave,
      rmDashboardInfo: rmDashboardInfo ?? this.rmDashboardInfo,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        error,
        totalStakeholders,
        totalWorkers,
        totalAssessments,
        totalCompletedAssessments,
        totalIncompleteAssessments,
        totalUnsyncBehave,
      ];
}

class RMDashboardInfo {
  int onboardedMembers;
  int incompletedMembers;
  int totalMembers;

  RMDashboardInfo({
    this.onboardedMembers = 0,
    this.incompletedMembers = 0,
    this.totalMembers = 0,
  });
}
