import 'package:cmo/di.dart';
import 'package:cmo/enum/action_log_status_filter_enum.dart';
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
              actionLogNo: DateTime.now().millisecondsSinceEpoch.toString(),
            ),
          ),
        ) {
    initData();
  }

  Future<void> initData() async {
    final activeRmu = await configService.getActiveRegionalManager();
    final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
    final completedMembers = await cmoDatabaseMasterService.getFarmsByRMUnit(
      activeRmu?.regionalManagerUnitId,
      isCompleted: true,
    );

    final selectedReason = rejectReasons.firstWhereOrNull(
          (element) => element.rejectReasonId == state.actionLog.reasonId,
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
        actionLog: state.actionLog.copyWith(isMajor: isMajor),
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
    var randomId = generatorInt32Id();
    final photo = ActionLogPhoto(
      isMasterdataSynced: false,
      photo: base64Image,
      actionLogPhotoNo: DateTime.now().millisecondsSinceEpoch.toString(),
      actionLogPhotoId: randomId++,
      actionLogNo: state.actionLog.actionLogNo,
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
}
