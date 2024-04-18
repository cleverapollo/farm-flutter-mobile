import 'package:cmo/di.dart';
import 'package:cmo/enum/action_log_status_filter_enum.dart';
import 'package:cmo/enum/enum.dart';
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
    final completedMembers = await cmoDatabaseMasterService.getFarmsByRMUnit(
      activeRmu?.regionalManagerUnitId,
      isCompleted: true,
    );

    final selectedReason = rejectReasons.firstWhereOrNull(
          (element) => element.rejectReasonId == state.actionLog.rejectReasonId,
    );

    final selectedMembers = completedMembers
        .where(
          (element) =>
              state.actionLog.members.isNotBlank &&
              state.actionLog.members!.contains(element.farmId),
        )
        .toList();

    emit(
      state.copyWith(
        activeRMU: activeRmu,
        activeUserRole: activeUserRole,
        completedMembers: completedMembers,
        rejectReasons: rejectReasons,
        selectedMembers: selectedMembers,
        selectedReason: selectedReason,
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
      ),
    );
  }

  void onSelectActionCategory(ActionCategory category) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedActionCategory: category,
      ),
    );
  }

  void onSelectRaisedByUser(ActionRaisedByUser user) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedActionRaisedByUser: user,
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

  void onSelectMember(List<Farm> selectedFarms) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedMembers: selectedFarms,
      ),
    );
  }

  void onRemoveMember(Farm trainee) {
    final selectedMembers = state.selectedMembers;
    selectedMembers.remove(trainee);
    emit(
      state.copyWith(
        isEditing: true,
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
      actionLogId: state.actionLog.actionLogId,
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
    final photos = state.photos;
    photos.removeWhere(
      (element) => element.actionLogPhotoId == actionLogPhotoId,
    );
    emit(
      state.copyWith(
        photos: photos,
        isEditing: true,
      ),
    );
  }

  void onSelectReason(RejectReason reason) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedReason: reason,
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
          actionDescription: description,
        ),
      ),
    );
  }

  Future<void> onSave() async {

  }
}
