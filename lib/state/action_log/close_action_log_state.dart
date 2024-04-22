part of 'close_action_log_cubit.dart';

class CloseActionLogState extends BaseState {
  const CloseActionLogState({
    super.loading = false,
    super.error,
    super.isEditing = false,
    super.isDataReady,
    required this.actionLog,
    this.activeRMU,
    this.activeFarm,
    this.activeUserRole,
    this.photos = const <ActionLogPhoto>[],
    this.removedPhotos = const <ActionLogPhoto>[],
  });

  final ResourceManagerUnit? activeRMU;
  final Farm? activeFarm;
  final ActionLog actionLog;
  final List<ActionLogPhoto> photos;
  final List<ActionLogPhoto> removedPhotos;
  final UserRoleEnum? activeUserRole;

  CloseActionLogState copyWith({
    ResourceManagerUnit? activeRMU,
    Farm? activeFarm,
    bool? loading,
    bool? isDataReady,
    bool? isEditing,
    ActionLog? actionLog,
    List<ActionLogPhoto>? photos,
    List<ActionLogPhoto>? removedPhotos,
    UserRoleEnum? activeUserRole,
  }) {
    return CloseActionLogState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeFarm: activeFarm ?? this.activeFarm,
      activeUserRole: activeUserRole ?? this.activeUserRole,
      loading: loading ?? this.loading,
      isDataReady: isDataReady ?? this.isDataReady,
      isEditing: isEditing ?? this.isEditing,
      actionLog: actionLog ?? this.actionLog,
      photos: photos ?? this.photos,
      removedPhotos: removedPhotos ?? this.removedPhotos,
    );
  }
}

