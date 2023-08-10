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
            isDataReady: false,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      final complaints = <StakeHolder>[];
      final farm = await configService.getActiveFarm();

      final result = await cmoDatabaseMasterService
          .getFarmStakeHolderByFarmId(farm?.farmId ?? '');

      for (final item in result) {
        final stakeholders = await cmoDatabaseMasterService
            .getStakeHoldersByStakeHolderId(item.stakeHolderId ?? '');
        complaints.addAll(stakeholders);
      }
      emit(
        state.copyWith(
          isDataReady: true,
          complaints: complaints,
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
    state.complaint = state.complaint.copyWith(
      dateReceived: value,
    );
  }

  void onDateClosedChanged(DateTime? value) {
    state.complaint = state.complaint.copyWith(
      dateClosed: value,
    );
  }

  void onStateHolderChanged(StakeHolder? stakeHolder) {
    state.complaint = state.complaint.copyWith(
      complaintsAndDisputesRegisterName: stakeHolder?.stakeholderName,
      stakeholderName: stakeHolder?.stakeholderName,
      stakeholderId: stakeHolder?.stakeHolderId,
    );
  }

  void onCommentChanged(String comment) {
    state.complaint = state.complaint.copyWith(
      comment: comment,
    );
  }
}
