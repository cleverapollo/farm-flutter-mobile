import 'dart:ui';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/di.dart';
import 'package:cmo/ui/snack/snack_helper.dart';

part 'illegal_activity_detail_state.dart';

class IllegalActivityDetailCubit extends Cubit<IllegalActivityDetailState> {
  IllegalActivityDetailCubit(IllegalActivityRegister? illegalActivityRegister)
      : super(
          IllegalActivityDetailState(
            illegalActivityRegister: illegalActivityRegister ?? IllegalActivityRegister(
              isMasterdataSynced: false,
              isActive: true,
              updateDT: DateTime.now(),
              createDT: DateTime.now(),
              dateReceived: DateTime.now(),
              illegalActivityNo: DateTime.now().microsecondsSinceEpoch.toString(),
            ),
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final activeUser = await configService.getActiveUser();
      emit(
        state.copyWith(
          activeFarm: farm,
          illegalActivityRegister: state.illegalActivityRegister?.copyWith(
            farmId: state.illegalActivityRegister?.farmId ?? farm?.farmId,
            complaintName: state.illegalActivityRegister?.complaintName ?? activeUser?.fullName ?? '',
            dateReceived: DateTime.now(),
          ),
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    }
  }

  void onChangeIssueRaised(String value) {
    emit(
      state.copyWith(
        illegalActivityRegister: state.illegalActivityRegister?.copyWith(
          issueRaised: value,
        ),
      ),
    );
  }

  void onClosureDetailChanged(String value) {
    emit(
      state.copyWith(
        illegalActivityRegister: state.illegalActivityRegister?.copyWith(
          closureDetails: value,
        ),
      ),
    );
  }

  void onDateReceivedChanged(DateTime? value) {
    emit(
      state.copyWith(
        illegalActivityRegister: state.illegalActivityRegister?.copyWith(
          dateReceived: value,
          dateClosed: state.illegalActivityRegister?.dateClosed != null &&
                  value != null &&
                  state.illegalActivityRegister!.dateClosed!.isBefore(value)
              ? value
              : state.illegalActivityRegister?.dateClosed,
        ),
      ),
    );
  }

  void onDateClosedChanged(DateTime? value) {
    emit(
      state.copyWith(
        illegalActivityRegister: state.illegalActivityRegister?.copyWith(
          dateClosed: value,
        ),
      ),
    );
  }

  void onCommentChanged(String value) {
    emit(
      state.copyWith(
        illegalActivityRegister: state.illegalActivityRegister?.copyWith(
          comment: value,
        ),
      ),
    );
  }

  bool onValidateRequireField() {
    if (state.illegalActivityRegister?.dateClosed != null &&
        state.illegalActivityRegister?.dateReceived != null &&
        state.illegalActivityRegister!.dateClosed!.isBefore(state.illegalActivityRegister!.dateReceived!)) {
      emit(
        state.copyWith(
          dateClosedErrorText: 'Closed date must be after received date',
          isDateClosedError: true,
        ),
      );

      return false;
    }

    if (state.illegalActivityRegister?.issueRaised == null ||
        state.illegalActivityRegister!.issueRaised.isBlank) {
      emit(
        state.copyWith(
          isIssueRaisedError: true,
        ),
      );
      return false;
    }

    return true;
  }

  Future<void> onSave({required VoidCallback onSuccess,}) async {
    if (!onValidateRequireField()) {
      return;
    }

    await cmoDatabaseMasterService.cacheIllegalActivityRegister(
      state.illegalActivityRegister?.copyWith(
        isMasterdataSynced: false,
        updateDT: DateTime.now(),
      ),
    );
    onSuccess.call();
  }
}
