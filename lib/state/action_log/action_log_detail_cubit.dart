import 'package:cmo/di.dart';
import 'package:cmo/enum/action_log_status_filter_enum.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/ui/components/base/base_state.dart';

part 'action_log_detail_state.dart';

class ActionLogDetailCubit extends Cubit<ActionLogDetailState> {
  ActionLogDetailCubit(ActionLog? actionLog)
      : super(
          ActionLogDetailState(
            actionLog: actionLog ??
                ActionLog(
                  createDT: DateTime.now(),
                  actionLogId: DateTime.now().millisecondsSinceEpoch,
                  dateRaised: DateTime.now(),
                  dueDate: DateTime.now().add(const Duration(days: 365)),
                ),
          ),
        ) {
    initData();
  }

  Future<void> initData() async {
    final activeUser = await configService.getActiveUser();
    final activeUserRole = await configService.getActiveUserRole();
    final activeRmu = await configService.getActiveRegionalManager();
    final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
    final actionTypes = await cmoDatabaseMasterService.getActionTypes();
    final users = await cmoDatabaseMasterService.getActionRaisedByUsers();

    final completedMembers = await cmoDatabaseMasterService.getFarmsByRMUnit(
      activeRmu?.regionalManagerUnitId,
      isCompleted: true,
    );

    final photos = await cmoDatabaseMasterService.getActionLogPhotosByActionLogId(state.actionLog.actionLogId);

    final selectedReason = rejectReasons.firstWhereOrNull(
          (element) => element.rejectReasonId == state.actionLog.rejectReasonId,
    );

    final selectedMembers = completedMembers
        .where(
          (element) =>
              state.actionLog.farmId.isNotBlank &&
              state.actionLog.farmId == element.farmId,
        )
        .toList();

    final selectedActionType = actionTypes.firstWhereOrNull((element) => element.actionLogTypeId == state.actionLog.actionTypeId);

    final selectedActionRaisedByUser = users.firstWhereOrNull((element) => element.userId == (state.actionLog.raisedBy ?? activeUser?.userId));

    if (state.actionLog.raisedBy == null) {
      emit(
        state.copyWith(
          actionLog: state.actionLog.copyWith(
            raisedByName: selectedActionRaisedByUser?.fullName,
            raisedBy: selectedActionRaisedByUser?.userId,
          ),
        ),
      );
    }

    emit(
      state.copyWith(
        activeRMU: activeRmu,
        activeUserRole: activeUserRole,
        completedMembers: completedMembers,
        rejectReasons: rejectReasons,
        actionTypes: actionTypes,
        actionRaisedByUser: users,
        selectedMembers: selectedMembers,
        selectedReason: selectedReason,
        selectedActionType: selectedActionType,
        selectedActionRaisedByUser: selectedActionRaisedByUser,
        photos: photos,
      ),
    );
  }

  void changeMajorAction(bool isMajor) {
    emit(
      state.copyWith(
        isEditing: true,
        maxDueDays: isMajor ? 90 : 365,
        actionLog: state.actionLog.copyWith(
          isMajor: isMajor,
          dueDate: (state.actionLog.dateRaised ?? DateTime.now()).add(
            Duration(days: isMajor ? 90 : 365),
          ),
        ),
      ),
    );
  }

  void onSelectActionType(ActionType actionType) {
    emit(
      state.copyWith(
        isEditing: true,
        isActionTypeError: false,
        selectedActionType: actionType,
        actionLog: state.actionLog.copyWith(
          actionTypeName: actionType.actionLogTypeName,
          actionTypeId: actionType.actionLogTypeId,
        ),
      ),
    );
  }

  void onSelectRaisedByUser(ActionRaisedByUser user) {
    emit(
      state.copyWith(
        isEditing: true,
        isRaisedByError: false,
        selectedActionRaisedByUser: user,
        actionLog: state.actionLog.copyWith(
          raisedByName: user.fullName,
          raisedBy: user.userId,
        ),
      ),
    );
  }

  void onDateRaisedChanged(DateTime? value) {
    if (value != null) {
      emit(
        state.copyWith(
          isEditing: true,
          actionLog: state.actionLog.copyWith(
            dateRaised: value,
            dueDate: value.add(
              Duration(days: state.maxDueDays),
            ),
          ),
        ),
      );
    }
  }

  void onDueDateChanged(DateTime? value) {
    if (value != null && state.actionLog.dateRaised != null &&
        value.subtract(Duration(days: state.maxDueDays)).isBefore(state.actionLog.dateRaised!)) {
      emit(
        state.copyWith(
          isEditing: true,
          actionLog: state.actionLog.copyWith(dueDate: value),
        ),
      );
    } else {
      showSnackError(msg: 'Due Date must be less than ${state.maxDueDays} days from Date Raised');
    }
  }

  void onSelectMember(List<Farm> selectedMembers) {
    emit(
      state.copyWith(
        isEditing: true,
        isMemberFieldError: false,
        selectedMembers: selectedMembers,
      ),
    );
  }

  void onRemoveMember(Farm member) {
    final selectedMembers = state.selectedMembers;
    selectedMembers.remove(member);
    emit(
      state.copyWith(
        isEditing: true,
        isMemberFieldError: false,
        selectedMembers: selectedMembers,
      ),
    );
  }

  bool reactMaximumUploadedPhoto() {
    return state.photos.length >= Constants.MAX_UPLOADED_REGISTER_PHOTOS;
  }

  void onUpdatePhoto(String base64Image) {
    final photo = ActionLogPhoto(
      isMasterdataSynced: false,
      photo: base64Image,
      actionLogPhotoId: DateTime.now().millisecondsSinceEpoch,
      isActive: true,
      createDT: DateTime.now(),
      updateDT: DateTime.now(),
    );

    emit(
      state.copyWith(
        photos: state.photos + [photo],
        isEditing: true,
      ),
    );
  }

  void onRemovePhoto(int? actionLogPhotoId) {
    final removedPhoto = state.photos.firstWhereOrNull((element) => element.actionLogPhotoId == actionLogPhotoId);
    if (removedPhoto != null) {
      final photos = List<ActionLogPhoto>.from(state.photos);
      final removedPhotos = List<ActionLogPhoto>.from(state.removedPhotos);
      removedPhotos.add(removedPhoto);
      photos.remove(removedPhoto);

      emit(
        state.copyWith(
          photos: photos,
          removedPhotos: removedPhotos,
          isEditing: true,
        ),
      );
    }
  }

  void onSelectReason(RejectReason reason) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedReason: reason,
        isRejectReasonError: false,
        actionLog: state.actionLog.copyWith(
          rejectReasonName: reason.rejectReasonName,
          rejectReasonId: reason.rejectReasonId,
        ),
      ),
    );
  }

  void onChangeActionName(String? actionName) {
    emit(
      state.copyWith(
        isEditing: true,
        isActionNameError: false,
        actionLog: state.actionLog.copyWith(
          actionName: actionName,
        ),
      ),
    );
  }

  void onChangeActionDescription(String? description) {
    emit(
      state.copyWith(
        isEditing: true,
        actionLog: state.actionLog.copyWith(
          ncAction: description,
        ),
      ),
    );
  }

  bool onValidateRequiredField() {
    final isActionNameError = state.actionLog.actionName.isBlank;
    final isActionTypeError = state.actionLog.actionTypeId == null;
    final isRaisedByError = state.actionLog.raisedBy == null;
    final isMemberFieldError = state.selectedMembers.isBlank;
    final isRejectReasonError = state.actionLog.rejectReasonId == null;

    emit(
      state.copyWith(
        isActionNameError: isActionNameError,
        isActionTypeError: isActionTypeError,
        isRaisedByError: isRaisedByError,
        isMemberFieldError: isMemberFieldError,
        isRejectReasonError: isRejectReasonError,
      ),
    );

    return isActionNameError ||
        isActionTypeError ||
        isRaisedByError ||
        isMemberFieldError ||
        isRejectReasonError;
  }

  Future<void> deactivateOldActionLog() async {
    if (!state.actionLog.isMasterDataSynced) {
      await cmoDatabaseMasterService.removeActionLog(state.actionLog.id);
      await cmoDatabaseMasterService
          .removeAllActionLogPhotosByActionLogId(state.actionLog.id);
    } else {
      await cmoDatabaseMasterService.cacheActionLog(
        state.actionLog.copyWith(
          updateDT: DateTime.now(),
          isMasterDataSynced: false,
          isActive: false,
        ),
      );

      final photos = await cmoDatabaseMasterService.getActionLogPhotosByActionLogId(state.actionLog.actionLogId);
      for (final photo in photos) {
        await cmoDatabaseMasterService.cacheActionLogPhoto(
          photo.copyWith(
            isMasterdataSynced: false,
            isActive: false,
          ),
        );
      }
    }
  }

  Future<void> onSave({required void Function() onSuccess}) async {
    if (onValidateRequiredField()) {
      return;
    }

    try {
      emit(state.copyWith(loading: true));
      await deactivateOldActionLog();
      final actionLog = state.actionLog.copyWith(
        updateDT: DateTime.now(),
        isMasterDataSynced: false,
      );

      var now = DateTime.now().millisecondsSinceEpoch;
      for(final member in state.selectedMembers) {
        await cmoDatabaseMasterService.cacheActionLog(
          actionLog.copyWith(
            actionLogId: now,
            farmId: member.farmId,
            farmName: member.farmName,
          ),
        );

        if (state.photos.isNotBlank) {
          for (final photo in state.photos) {
            await cmoDatabaseMasterService.cacheActionLogPhoto(
              photo.copyWith(
                actionLogId: now,
                actionLogPhotoId: DateTime.now().microsecondsSinceEpoch,
              ),
            );
          }
        }

        now++;
      }

      if (state.removedPhotos.isNotBlank) {
        for (final photo in state.removedPhotos) {
          if (photo.isMasterdataSynced) {
            await cmoDatabaseMasterService.cacheActionLogPhoto(
              photo.copyWith(
                isMasterdataSynced: false,
                isActive: false,
              ),
            );
          } else {
            await cmoDatabaseMasterService.removeActionLogPhoto(photo.id);
          }
        }
      }

      onSuccess();
    } catch (e) {
      showSnackError(msg: 'Cannot save action log');
      logger.e('Cannot save $e');
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
