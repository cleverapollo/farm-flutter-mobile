part of 'action_log_management_cubit.dart';

class ActionLogManagementState extends BaseState {
  const ActionLogManagementState({
    super.loading = false,
    super.error,
    this.activeRMU,
    this.activeUserRole,
    this.statusFilter = ActionLogStatusFilterEnum.open,
    this.openActions = const <ActionLog>[],
    this.closedActions = const <ActionLog>[],
    this.displayList = const <ActionLog>[],
    this.overdueActionLogs = const <ActionLog>[],
    this.dueActionLogs = const <ActionLog>[],
    this.upcomingActionLogs = const <ActionLog>[],
    this.upcomingActionLogTimeFiltersEnum = const <UpcomingActionLogTimeFilter>[],
    this.selectedUpcomingActionLogTimeFilter = UpcomingActionLogTimeFilter.day,
    this.filteringText,
    this.isOpenedUpcomingFilter = false,
    this.upcomingDateTimeFilter,
  });

  final ResourceManagerUnit? activeRMU;
  final UserRoleEnum? activeUserRole;
  final ActionLogStatusFilterEnum statusFilter;
  final List<ActionLog> openActions;
  final List<ActionLog> closedActions;
  final List<ActionLog> displayList;
  final String? filteringText;
  final List<ActionLog> overdueActionLogs;
  final List<ActionLog> dueActionLogs;
  final List<ActionLog> upcomingActionLogs;
  final List<UpcomingActionLogTimeFilter> upcomingActionLogTimeFiltersEnum;
  final UpcomingActionLogTimeFilter selectedUpcomingActionLogTimeFilter;
  final DateTime? upcomingDateTimeFilter;
  final bool isOpenedUpcomingFilter;

  ActionLogManagementState copyWith({
    ResourceManagerUnit? activeRMU,
    UserRoleEnum? activeUserRole,
    ActionLogStatusFilterEnum? statusFilter,
    List<ActionLog>? openActions,
    List<ActionLog>? closedActions,
    List<ActionLog>? displayList,
    String? filteringText,
    List<ActionLog>? overdueActionLogs,
    List<ActionLog>? dueActionLogs,
    List<ActionLog>? upcomingActionLogs,
    List<UpcomingActionLogTimeFilter>? upcomingActionLogTimeFiltersEnum,
    UpcomingActionLogTimeFilter? selectedUpcomingActionLogTimeFilter,
    bool? isOpenedUpcomingFilter,
    DateTime? upcomingDateTimeFilter,
  }) {
    return ActionLogManagementState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeUserRole: activeUserRole ?? this.activeUserRole,
      statusFilter: statusFilter ?? this.statusFilter,
      openActions: openActions ?? this.openActions,
      closedActions: closedActions ?? this.closedActions,
      displayList: displayList ?? this.displayList,
      filteringText: filteringText ?? this.filteringText,
      overdueActionLogs: overdueActionLogs ?? this.overdueActionLogs,
      dueActionLogs: dueActionLogs ?? this.dueActionLogs,
      upcomingActionLogs: upcomingActionLogs ?? this.upcomingActionLogs,
      isOpenedUpcomingFilter: isOpenedUpcomingFilter ?? this.isOpenedUpcomingFilter,
      upcomingActionLogTimeFiltersEnum: upcomingActionLogTimeFiltersEnum ?? this.upcomingActionLogTimeFiltersEnum,
      selectedUpcomingActionLogTimeFilter: selectedUpcomingActionLogTimeFilter ?? this.selectedUpcomingActionLogTimeFilter,
      upcomingDateTimeFilter: upcomingDateTimeFilter ?? this.upcomingDateTimeFilter,
    );
  }
}

extension ActionLogManagementStateExtension on ActionLogManagementState {
  int get totalUpcoming => overdueActionLogs.length + dueActionLogs.length + upcomingActionLogs.length;
}
