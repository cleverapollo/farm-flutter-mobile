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
    this.removedPhotos = const <ActionLogPhoto>[],
    this.actionTypes = const <ActionType>[],
    this.actionRaisedByUser = const <ActionRaisedByUser>[],
    this.selectedReason,
    this.activeUserRole,
    this.selectedActionType,
    this.selectedActionRaisedByUser,
    this.isActionNameError = false,
    this.isActionTypeError = false,
    this.isRaisedByError = false,
    this.isMemberFieldError = false,
    this.isRejectReasonError = false,
  });

  final ResourceManagerUnit? activeRMU;
  final ActionLog actionLog;
  final List<Farm> completedMembers;
  final List<Farm> selectedMembers;
  final List<RejectReason> rejectReasons;
  final List<ActionLogPhoto> photos;
  final List<ActionLogPhoto> removedPhotos;
  final List<ActionType> actionTypes;
  final List<ActionRaisedByUser> actionRaisedByUser;
  final ActionType? selectedActionType;
  final ActionRaisedByUser? selectedActionRaisedByUser;
  final RejectReason? selectedReason;
  final UserRoleEnum? activeUserRole;
  final bool isActionNameError;
  final bool isActionTypeError;
  final bool isRaisedByError;
  final bool isMemberFieldError;
  final bool isRejectReasonError;

  ActionLogDetailState copyWith({
    ResourceManagerUnit? activeRMU,
    bool? loading,
    bool? isEditing,
    ActionLog? actionLog,
    List<Farm>? completedMembers,
    List<Farm>? selectedMembers,
    List<RejectReason>? rejectReasons,
    List<ActionLogPhoto>? photos,
    List<ActionLogPhoto>? removedPhotos,
    List<ActionType>? actionTypes,
    List<ActionRaisedByUser>? actionRaisedByUser,
    ActionType? selectedActionType,
    ActionRaisedByUser? selectedActionRaisedByUser,
    RejectReason? selectedReason,
    UserRoleEnum? activeUserRole,
    bool? isActionNameError,
    bool? isActionTypeError,
    bool? isRaisedByError,
    bool? isMemberFieldError,
    bool? isRejectReasonError,
  }) {
    return ActionLogDetailState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeUserRole: activeUserRole ?? this.activeUserRole,
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
      actionLog: actionLog ?? this.actionLog,
      selectedMembers: selectedMembers ?? this.selectedMembers,
      completedMembers: completedMembers ?? this.completedMembers,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      photos: photos ?? this.photos,
      removedPhotos: removedPhotos ?? this.removedPhotos,
      actionTypes: actionTypes ?? this.actionTypes,
      actionRaisedByUser: actionRaisedByUser ?? this.actionRaisedByUser,
      selectedReason: selectedReason ?? this.selectedReason,
      selectedActionType: selectedActionType ?? this.selectedActionType,
      selectedActionRaisedByUser: selectedActionRaisedByUser ?? this.selectedActionRaisedByUser,
      isActionNameError: isActionNameError ?? this.isActionNameError,
      isActionTypeError: isActionTypeError ?? this.isActionTypeError,
      isRaisedByError: isRaisedByError ?? this.isRaisedByError,
      isMemberFieldError: isMemberFieldError ?? this.isMemberFieldError,
      isRejectReasonError: isRejectReasonError ?? this.isRejectReasonError,
    );
  }
}
