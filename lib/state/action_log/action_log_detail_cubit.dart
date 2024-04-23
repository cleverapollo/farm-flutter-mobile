import 'package:cmo/di.dart';
import 'package:cmo/enum/action_log_status_filter_enum.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:cmo/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/ui/components/base/base_state.dart';

part 'action_log_detail_state.dart';

class ActionLogDetailCubit extends Cubit<ActionLogDetailState> {
  ActionLogDetailCubit(ActionLog? actionLog)
      : super(
          ActionLogDetailState(
            actionLog: actionLog ?? ActionLog(
              createDT: DateTime.now(),
              actionLogId: DateTime.now().millisecondsSinceEpoch,
              dateRaised: DateTime.now(),
              dueDate: DateTime.now(),
            ),
          ),
        ) {
    initData();
  }

  Future<void> initData() async {
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
        photos: photos,
      ),
    );
  }

  void changeMajorAction(bool isMajor) {
    emit(
      state.copyWith(
        isEditing: true,
        actionLog: state.actionLog.copyWith(isMajor: isMajor),
      ),
    );
  }

  void onSelectActionType(ActionType actionType) {
    emit(
      state.copyWith(
        isEditing: true,
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
        selectedActionRaisedByUser: user,
        actionLog: state.actionLog.copyWith(
          raisedByName: user.fullName,
          raisedBy: user.userId,
        ),
      ),
    );
  }

  void onDateRaisedChanged(DateTime? value) {
    emit(
      state.copyWith(
        isEditing: true,
          actionLog: state.actionLog.copyWith(dateRaised: value),
      ),
    );
  }

  void onDueDateChanged(DateTime? value) {
    emit(
      state.copyWith(
        isEditing: true,
        actionLog: state.actionLog.copyWith(dueDate: value),
      ),
    );
  }

  void onSelectMember(List<Farm> selectedMembers) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedMembers: selectedMembers,
        haveChangeMember: true,
      ),
    );
  }

  void onRemoveMember(Farm member) {
    final selectedMembers = state.selectedMembers;
    selectedMembers.remove(member);
    emit(
      state.copyWith(
        isEditing: true,
        selectedMembers: selectedMembers,
        haveChangeMember: true,
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
        haveChangePhoto: true,
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
          haveChangePhoto: true,
        ),
      );
    }
  }

  void onSelectReason(RejectReason reason) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedReason: reason,
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


  Future<void> deactivateOldActionLog() async {
    if (!state.actionLog.isMasterDataSynced) {
      await cmoDatabaseMasterService.removeActionLog(state.actionLog.id);
    }

    if (state.haveChangeMember) {
      await cmoDatabaseMasterService.cacheActionLog(
        state.actionLog.copyWith(
          updateDT: DateTime.now(),
          isMasterDataSynced: false,
          isActive: false,
        ),
      );
    }

    if (state.haveChangePhoto) {
      final photos = await cmoDatabaseMasterService.getActionLogPhotosByActionLogId(state.actionLog.actionLogId);
      for(final photo in photos) {
        await cmoDatabaseMasterService.cacheActionLogPhoto(
          photo.copyWith(
            isMasterdataSynced: false,
            isActive: false,
          ),
        );
      }
    }
  }

  Future<void> onSave() async {
    try {
      emit(state.copyWith(loading: true));
      if (state.actionLog.isMasterDataSynced) {
        await cmoDatabaseMasterService.cacheActionLog(
          state.actionLog.copyWith(
            updateDT: DateTime.now(),
            isMasterDataSynced: false,
            isActive: false,
          ),
        );
      } else {

      }

      final actionLog = state.actionLog.copyWith(
        updateDT: DateTime.now(),
        isMasterDataSynced: false,
      );

      var now = DateTime.now().millisecondsSinceEpoch;
      // await cmoDatabaseMasterService.removeActionLog(actionLog.id);
      // await cmoDatabaseMasterService.removeAllActionLogPhotosByActionLogId(actionLog.id);
      for(final member in state.selectedMembers) {
        await cmoDatabaseMasterService.cacheActionLog(
          actionLog.copyWith(
            actionLogId: now,
            farmId: member.farmId,
            farmName: member.farmName,
            updateDT: DateTime.now(),
            isMasterDataSynced: false,
          ),
        );

        if (state.photos.isNotBlank) {
          for (final photo in state.photos) {
            await cmoDatabaseMasterService.cacheActionLogPhoto(
              photo.copyWith(
                actionLogId: now,
              ),
            );
          }
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

        now++;
      }
    } catch (e) {
      logger.e('Cannot save $e');
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
