part of 'action_log_management_cubit.dart';

class ActionLogManagementState extends BaseState {
  const ActionLogManagementState({
    super.loading = false,
    super.error,
    this.activeRMU,
    this.statusFilter = ActionLogStatusFilterEnum.open,
  });

  final ResourceManagerUnit? activeRMU;
  final ActionLogStatusFilterEnum statusFilter;

  ActionLogManagementState copyWith({
    ResourceManagerUnit? activeRMU,
    ActionLogStatusFilterEnum? statusFilter,
  }) {
    return ActionLogManagementState(
      activeRMU: activeRMU ?? this.activeRMU,
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}
