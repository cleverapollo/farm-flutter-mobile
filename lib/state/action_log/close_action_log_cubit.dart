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

part 'close_action_log_state.dart';

class CloseActionLogCubit extends Cubit<CloseActionLogState> {
  CloseActionLogCubit(ActionLog actionLog)
      : super(
          CloseActionLogState(
            actionLog: actionLog.copyWith(
              closingDate: DateTime.now(),
            ),
          ),
        ) {
    initData();
  }

  Future<void> initData() async {
    final activeUserRole = await configService.getActiveUserRole();
    final activeRmu = await configService.getActiveRegionalManager();
    final activeFarm = await configService.getActiveFarm();

    emit(
      state.copyWith(
        activeRMU: activeRmu,
        activeUserRole: activeUserRole,
        activeFarm: activeFarm,
        isDataReady: true,
      ),
    );
  }

  void onClosingDateChanged(DateTime? value) {
    emit(
      state.copyWith(
        isEditing: true,
        actionLog: state.actionLog.copyWith(closingDate: value),
      ),
    );
  }

  void onChangeClosingComment(String? closingComment) {
    emit(
      state.copyWith(
        isEditing: true,
        actionLog: state.actionLog.copyWith(
          closingComment: closingComment,
        ),
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

  Future<void> onClose() async {

  }
}
