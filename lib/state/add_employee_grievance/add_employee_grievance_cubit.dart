import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/di.dart';
import 'package:cmo/ui/snack/snack_helper.dart';

part 'add_employee_grievance_state.dart';

class AddEmployeeGrievanceCubit extends Cubit<AddEmployeeGrievanceState> {
  AddEmployeeGrievanceCubit({
    required Farm farm,
    required GrievanceRegister employeeGrievance,
    required bool isAddNew,
  }) : super(
          AddEmployeeGrievanceState(
            farm: farm,
            employeeGrievance: employeeGrievance,
            isAddNew: isAddNew,
            isDataReady: false,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      final farm = state.farm;
      final workers =
          await cmoDatabaseMasterService.getFarmerWorkersByFarmId(farm.farmId);
      final grievanceIssues = await cmoDatabaseMasterService
          .getGrievanceIssueByGroupSchemeId(farm.groupSchemeId ?? 0);
      emit(
        state.copyWith(
          isDataReady: true,
          workers: workers,
          grievanceIssues: grievanceIssues,
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onActionTakenChanged(String value) {
    state.employeeGrievance = state.employeeGrievance.copyWith(
      actionTaken: value,
    );
  }

  void onClosureDetailChanged(String value) {
    state.employeeGrievance = state.employeeGrievance.copyWith(
      closureDetails: value,
    );
  }

  void onDateReceivedChanged(DateTime? value) {
    state.employeeGrievance = state.employeeGrievance.copyWith(
      dateReceived: value,
    );
  }

  void onDateClosedChanged(DateTime? value) {
    state.employeeGrievance = state.employeeGrievance.copyWith(
      dateClosed: value,
    );
  }

  void onGrievanceIssueChanged(GrievanceIssue? issue) {
    emit(
      state.copyWith(
        employeeGrievance: state.employeeGrievance.copyWith(
          grievanceIssueId: issue?.grievanceIssueId,
          grievanceIssueName: issue?.grievanceIssueName,
        ),
      ),
    );
  }

  void onFarmWorkerChanged(FarmerWorker? worker) {
    emit(
      state.copyWith(
        employeeGrievance: state.employeeGrievance.copyWith(
          workerId: worker?.workerId,
          workerName: worker?.firstName,
        ),
      ),
    );
  }

  void onAllocatedChanged(FarmerWorker? worker) {
    emit(
      state.copyWith(
        employeeGrievance: state.employeeGrievance.copyWith(
          allocatedToUserId: worker?.workerId,
          allocatedToName: worker?.firstName,
        ),
      ),
    );
  }

  void onCommentChanged(String? comment) {
    state.employeeGrievance = state.employeeGrievance.copyWith(
      comment: comment,
    );
  }
}
