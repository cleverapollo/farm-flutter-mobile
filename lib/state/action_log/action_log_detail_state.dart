part of 'action_log_detail_cubit.dart';

class ActionLogDetailState extends BaseState {
  const ActionLogDetailState({
    super.loading = false,
    super.error,
    super.isEditing = false,
    required this.actionLog,
    this.activeRMU,
    this.completedMembers = const <Farm>[],
    this.selectedMembers = const <Farm>[],
    this.rejectReasons = const <RejectReason>[],
    this.photos = const <ActionLogPhoto>[],
    this.selectedReason,
  });

  final ResourceManagerUnit? activeRMU;
  final ActionLog actionLog;
  final List<Farm> completedMembers;
  final List<Farm> selectedMembers;
  final List<RejectReason> rejectReasons;
  final List<ActionLogPhoto> photos;
  final RejectReason? selectedReason;

  ActionLogDetailState copyWith({
    ResourceManagerUnit? activeRMU,
    bool? loading,
    bool? isEditing,
    ActionLog? actionLog,
    List<Farm>? completedMembers,
    List<Farm>? selectedMembers,
    List<RejectReason>? rejectReasons,
    List<ActionLogPhoto>? photos,
    RejectReason? selectedReason,
  }) {
    return ActionLogDetailState(
      activeRMU: activeRMU ?? this.activeRMU,
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
      actionLog: actionLog ?? this.actionLog,
      selectedMembers: selectedMembers ?? this.selectedMembers,
      completedMembers: completedMembers ?? this.completedMembers,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      photos: photos ?? this.photos,
      selectedReason: selectedReason ?? this.selectedReason,
    );
  }
}
