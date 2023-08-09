import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';

part 'add_aai_state.dart';

class AddAAICubit extends Cubit<AddAAIState> {
  AddAAICubit({
    required AccidentAndIncident accidentAndIncident,
    required bool isAddNew,
  }) : super(
          AddAAIState(
            accidentAndIncident: accidentAndIncident,
            isAddNew: isAddNew,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final workers = await cmoDatabaseMasterService
          .getFarmerWorkersByFarmId(farm?.farmId ?? '');

      final natureOfInjuries = await cmoDatabaseMasterService
          .getNatureOfInjuryByGroupSchemeId(farm?.groupSchemeId ?? 0);

      final propertyDamaged = await cmoDatabaseMasterService
          .getPropertyDamagedByGroupSchemeId(farm?.groupSchemeId ?? 0);

      final jobDescriptions = <WorkerJobDescription>[];
      final workerId = state.accidentAndIncident.workerId;
      if(workerId != null) {
        final jobs = await cmoDatabaseMasterService.getWorkerJobDescriptionByWorkerId(workerId.toString());
        jobDescriptions.addAll(jobs);
      }

      emit(
        state.copyWith(
          workers: workers,
          natureOfInjuries: natureOfInjuries,
          propertyDamaged: propertyDamaged,
          jobDescriptions: jobDescriptions,
          lostTimeInDay: _calculateTimeLost(),
          isDataReady: true,
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onDateReceiveChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident:
            state.accidentAndIncident.copyWith(dateRecieved: dateTime),
      ),
    );
  }

  void onDateOfIncidentChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident:
            state.accidentAndIncident.copyWith(dateOfIncident: dateTime),
      ),
    );
    onCalculateLostTimeInDay();
  }

  void onDateResumeChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident:
            state.accidentAndIncident.copyWith(dateResumeWork: dateTime),
      ),
    );
    onCalculateLostTimeInDay();
  }

  void onDateOfBirthChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident: state.accidentAndIncident.copyWith(
          dateOfBirth: dateTime,
        ),
      ),
    );
  }

  void onWorkDisableChanged({bool? workerDisabled}) {
    emit(
      state.copyWith(
        accidentAndIncident: state.accidentAndIncident.copyWith(
          workerDisabled: workerDisabled,
        ),
      ),
    );
  }

  void onCommentChanged(String? comment) {
    state.accidentAndIncident = state.accidentAndIncident.copyWith(
      comment: comment,
    );
  }

  void onCalculateLostTimeInDay() {
    emit(state.copyWith(lostTimeInDay: _calculateTimeLost()));
  }

  Future<void> onWorkerSelected(FarmerWorker? worker) async {
    final jobDescriptions = await cmoDatabaseMasterService
        .getWorkerJobDescriptionByWorkerId(worker?.workerId ?? '');
    emit(
      state.copyWith(
        jobDescriptions: jobDescriptions,
        accidentAndIncident: state.accidentAndIncident.copyWith(
          workerId: int.tryParse(worker?.workerId ?? ''),
          workerName: worker?.firstName,
          jobDescriptionId: null,
          jobDescriptionName: null,
        ),
      ),
    );
  }

  void onJobDescriptionSelected(WorkerJobDescription? jobDesc) {
    state.accidentAndIncident = state.accidentAndIncident.copyWith(
      jobDescriptionId: jobDesc?.jobDescriptionId,
      jobDescriptionName: jobDesc?.jobDescriptionName,
    );
  }

  String _calculateTimeLost() {
    final aai = state.accidentAndIncident;
    return aai.dateResumeWork != null &&
        aai.dateOfIncident != null
        ? aai.dateResumeWork!.difference(aai.dateOfIncident!).inDays.toString()
        : '';
  }

  void onNatureOfInjurySelected(NatureOfInjury? selectNatureOfInjury) {
    state.accidentAndIncident = state.accidentAndIncident.copyWith(
      natureOfInjuryId: selectNatureOfInjury?.natureOfInjuryId,
      natureOfInjuryName: selectNatureOfInjury?.natureOfInjuryName,
    );
  }

}
