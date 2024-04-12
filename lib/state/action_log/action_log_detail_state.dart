part of 'action_log_detail_cubit.dart';

class ActionLogDetailState extends BaseState {
  const ActionLogDetailState({
    super.loading = false,
    super.error,
    super.isEditing = false,
    required this.actionLog,
    this.activeRMU,
  });

  final ResourceManagerUnit? activeRMU;
  final ActionLog actionLog;

  ActionLogDetailState copyWith({
    ResourceManagerUnit? activeRMU,
    bool? loading,
    bool? isEditing,
    ActionLog? actionLog,
  }) {
    return ActionLogDetailState(
      activeRMU: activeRMU ?? this.activeRMU,
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
      actionLog: actionLog ?? this.actionLog,
    );
  }
}
