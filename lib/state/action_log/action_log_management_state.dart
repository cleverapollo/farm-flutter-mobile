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
    this.upcomingActionLogTimeFiltersEnum = const <UpcomingActionLogTimeFilter>[],
    this.selectedUpcomingActionLogTimeFilter = UpcomingActionLogTimeFilter.day,
    this.filteringText,
    this.isOpenedUpcomingFilter = false,
    required this.firstDateUpcomingFilter,
    required this.lastDateUpcomingFilter,
    required this.selectedDateUpcomingFilter,
  });

  final ResourceManagerUnit? activeRMU;
  final UserRoleEnum? activeUserRole;
  final ActionLogStatusFilterEnum statusFilter;
  final List<ActionLog> openActions;
  final List<ActionLog> closedActions;
  final List<ActionLog> displayList;
  final String? filteringText;
  final List<UpcomingActionLogTimeFilter> upcomingActionLogTimeFiltersEnum;
  final UpcomingActionLogTimeFilter selectedUpcomingActionLogTimeFilter;
  final DateTime selectedDateUpcomingFilter;
  final DateTime firstDateUpcomingFilter;
  final DateTime lastDateUpcomingFilter;
  final bool isOpenedUpcomingFilter;

  ActionLogManagementState copyWith({
    ResourceManagerUnit? activeRMU,
    UserRoleEnum? activeUserRole,
    ActionLogStatusFilterEnum? statusFilter,
    List<ActionLog>? openActions,
    List<ActionLog>? closedActions,
    List<ActionLog>? displayList,
    String? filteringText,
    List<UpcomingActionLogTimeFilter>? upcomingActionLogTimeFiltersEnum,
    UpcomingActionLogTimeFilter? selectedUpcomingActionLogTimeFilter,
    bool? isOpenedUpcomingFilter,
    DateTime? firstDateUpcomingFilter,
    DateTime? lastDateUpcomingFilter,
    DateTime? selectedDateUpcomingFilter,
  }) {
    return ActionLogManagementState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeUserRole: activeUserRole ?? this.activeUserRole,
      statusFilter: statusFilter ?? this.statusFilter,
      openActions: openActions ?? this.openActions,
      closedActions: closedActions ?? this.closedActions,
      displayList: displayList ?? this.displayList,
      filteringText: filteringText ?? this.filteringText,
      isOpenedUpcomingFilter: isOpenedUpcomingFilter ?? this.isOpenedUpcomingFilter,
      upcomingActionLogTimeFiltersEnum: upcomingActionLogTimeFiltersEnum ?? this.upcomingActionLogTimeFiltersEnum,
      selectedUpcomingActionLogTimeFilter: selectedUpcomingActionLogTimeFilter ?? this.selectedUpcomingActionLogTimeFilter,
      firstDateUpcomingFilter: firstDateUpcomingFilter ?? this.firstDateUpcomingFilter,
      lastDateUpcomingFilter: lastDateUpcomingFilter ?? this.lastDateUpcomingFilter,
      selectedDateUpcomingFilter: selectedDateUpcomingFilter ?? this.selectedDateUpcomingFilter,
    );
  }
}
