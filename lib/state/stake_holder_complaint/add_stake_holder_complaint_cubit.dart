import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/di.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';

part 'add_stake_holder_complaint_state.dart';

class AddStakeHolderComplaintCubit extends Cubit<AddStakeHolderComplaintState> {
  AddStakeHolderComplaintCubit({
    required Farm farm,
    required ComplaintsAndDisputesRegister complaint,
    required bool isAddNew,
  }) : super(
    AddStakeHolderComplaintState(
      farm: farm,
      complaint: complaint,
            isAddNew: isAddNew,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final stakeholders = await cmoDatabaseMasterService.getStakeHolders();
      emit(
        state.copyWith(
          isDataReady: true,
          stakeholders: stakeholders,
          complaint: state.complaint.copyWith(
            farmId: farm?.farmId ?? '',
          ),
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onIssueDescriptionChanged(String value) {
    state.complaint = state.complaint.copyWith(
        issueDescription: value,
    );
  }

  void onClosureDetailChanged(String value) {
    state.complaint = state.complaint.copyWith(
      closureDetails: value,
    );
  }

  void onDateReceivedChanged(DateTime? value) {
    emit(
      state.copyWith(
        complaint: state.complaint.copyWith(
          dateReceived: value,
          dateClosed: state.complaint.dateClosed != null &&
                  value != null &&
                  state.complaint.dateClosed!.isBefore(value)
              ? value
              : state.complaint.dateClosed,
        ),
      ),
    );
  }

  void onDateClosedChanged(DateTime? value) {
    emit(
      state.copyWith(
        complaint: state.complaint.copyWith(
          dateClosed: value,
        ),
      ),
    );
  }

  void onStateHolderChanged(StakeHolder? stakeHolder) {
    emit(
      state.copyWith(
        complaint: state.complaint.copyWith(
          complaintsAndDisputesRegisterName: stakeHolder?.stakeholderName,
          stakeholderName: stakeHolder?.stakeholderName,
          stakeholderId: stakeHolder?.stakeHolderId,
        ),
      ),
    );
  }

  void onCommentChanged(String comment) {
    state.complaint = state.complaint.copyWith(
      comment: comment,
    );
  }

  bool onValidateRequireField() {
    if (state.complaint.dateClosed != null &&
        state.complaint.dateReceived != null &&
        state.complaint.dateClosed!.isBefore(state.complaint.dateReceived!)) {
      emit(
        state.copyWith(
          dateClosedErrorText: 'Closed date must be after received date',
          isDateClosedError: true,
        ),
      );

      return true;
    }

    return false;
  }
}
