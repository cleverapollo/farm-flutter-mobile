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
    this.filteringText,
  });

  final ResourceManagerUnit? activeRMU;
  final UserRoleEnum? activeUserRole;
  final ActionLogStatusFilterEnum statusFilter;
  final List<ActionLog> openActions;
  final List<ActionLog> closedActions;
  final List<ActionLog> displayList;
  final String? filteringText;

  ActionLogManagementState copyWith({
    ResourceManagerUnit? activeRMU,
    UserRoleEnum? activeUserRole,
    ActionLogStatusFilterEnum? statusFilter,
    List<ActionLog>? openActions,
    List<ActionLog>? closedActions,
    List<ActionLog>? displayList,
    String? filteringText,
  }) {
    return ActionLogManagementState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeUserRole: activeUserRole ?? this.activeUserRole,
      statusFilter: statusFilter ?? this.statusFilter,
      openActions: openActions ?? this.openActions,
      closedActions: closedActions ?? this.closedActions,
      displayList: displayList ?? this.displayList,
      filteringText: filteringText ?? this.filteringText,
    );
  }
}
