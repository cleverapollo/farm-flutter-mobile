import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'aai_detail_state.dart';

class AAIDetailCubit extends Cubit<AAIDetailState> {
  AAIDetailCubit({
    required AccidentAndIncident accidentAndIncident,
    required bool isAddNew,
  }) : super(
          AAIDetailState(
            accidentAndIncident: accidentAndIncident,
            isAddNew: isAddNew,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      emit(state.copyWith(isDataReady: false));
      final farm = await configService.getActiveFarm();
      final workers = await cmoDatabaseMasterService
          .getFarmerWorkersByFarmId(farm?.farmId ?? '');

      final natureOfInjuries = await cmoDatabaseMasterService
          .getNatureOfInjuryByGroupSchemeId(farm?.groupSchemeId ?? 0);

      final propertyDamaged = await cmoDatabaseMasterService
          .getPropertyDamagedByGroupSchemeId(farm?.groupSchemeId ?? 0);

      final jobDescriptions = <WorkerJobDescription>[];
      final workerId = state.accidentAndIncident.workerId;
      if (workerId != null) {
        final jobs = await cmoDatabaseMasterService
            .getWorkerJobDescriptionByWorkerId(workerId.toString());
        jobDescriptions.addAll(jobs);
      }

      final aaiRegisterPropertyDamages = await cmoDatabaseMasterService
          .getAllAccidentAndIncidentRegisterPropertyDamagedByAccidentAndIncidentRegisterNo(
        state.accidentAndIncident.accidentAndIncidentRegisterNo ?? '',
      );

      emit(
        state.copyWith(
          workers: workers,
          natureOfInjuries: natureOfInjuries,
          propertyDamaged: propertyDamaged,
          jobDescriptions: jobDescriptions,
          lostTimeInDay: _calculateTimeLost(),
          selectedPropertyDamages: aaiRegisterPropertyDamages,
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
        accidentAndIncident: state.accidentAndIncident.copyWith(dateRecieved: dateTime),
        isDateReportedError: dateTime == null,
      ),
    );
  }

  void onDateOfIncidentChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident: state.accidentAndIncident.copyWith(dateOfIncident: dateTime),
        isDateIncidentError: dateTime == null,
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
    emit(
      state.copyWith(
        accidentAndIncident: state.accidentAndIncident.copyWith(
          comment: comment,
        ),
      ),
    );
  }

  void onSelectPropertyDamaged(
    List<AccidentAndIncidentPropertyDamaged> selectedPropertyDamaged,
  ) {
    emit(
      state.copyWith(
        selectedPropertyDamages: selectedPropertyDamaged,
      ),
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
        workerSelect: worker,
        isWorkerError: worker == null,
        jobDescriptions: jobDescriptions,
        accidentAndIncident: state.accidentAndIncident.copyWith(
          workerId: worker?.workerId,
          workerName: worker?.firstName,
          jobDescriptionId: null,
          jobDescriptionName: null,
        ),
      ),
    );
  }

  Future<void> onWorkerSelectedByAddNew(FarmerWorker? worker) async {
    emit(state.copyWith(isDataReady: false));
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    final farm = await configService.getActiveFarm();
    final workers = await cmoDatabaseMasterService
        .getFarmerWorkersByFarmId(farm?.farmId ?? '');

    emit(state.copyWith(workers: workers));

    final jobDescriptions = await cmoDatabaseMasterService
        .getWorkerJobDescriptionByWorkerId(worker?.workerId ?? '');

    emit(
      state.copyWith(
        isDataReady: true,
        jobDescriptions: jobDescriptions,
        accidentAndIncident: state.accidentAndIncident.copyWith(
          workerId: worker?.workerId,
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
    emit(state.copyWith(jobDescriptionSelect: jobDesc));
  }

  String _calculateTimeLost() {
    final aai = state.accidentAndIncident;
    return aai.dateResumeWork != null && aai.dateOfIncident != null
        ? aai.dateResumeWork!.difference(aai.dateOfIncident!).inDays.toString()
        : '';
  }

  void onNatureOfInjurySelected(NatureOfInjury? selectNatureOfInjury) {
    state.accidentAndIncident = state.accidentAndIncident.copyWith(
      natureOfInjuryId: selectNatureOfInjury?.natureOfInjuryId,
      natureOfInjuryName: selectNatureOfInjury?.natureOfInjuryName,
    );

    emit(state.copyWith(natureOfInjurySelect: selectNatureOfInjury));
  }

  bool onValidateRequireField() {
    if (state.accidentAndIncident.workerId == null ||
        state.accidentAndIncident.dateRecieved == null ||
        state.accidentAndIncident.dateOfIncident == null) {
      emit(
        state.copyWith(
          isWorkerError: state.accidentAndIncident.workerId == null,
          isDateReportedError: state.accidentAndIncident.dateRecieved == null,
          isDateIncidentError: state.accidentAndIncident.dateOfIncident == null,
        ),
      );

      return true;
    }

    if (state.accidentAndIncident.dateOfIncident != null &&
        state.accidentAndIncident.dateRecieved != null &&
        state.accidentAndIncident.dateRecieved!.isBefore(state.accidentAndIncident.dateOfIncident!)) {
      showSnackError(msg: 'Reported date must be on or after incident date');
      return true;
    }

    if (state.accidentAndIncident.dateResumeWork != null &&
        state.accidentAndIncident.dateResumeWork!.isBefore(state.accidentAndIncident.dateOfIncident!)) {
      showSnackError(msg: 'Resume work date must be on or after incident date');
      return true;
    }

    return false;
  }

  Future<void> onSave({required void Function(int?) onSuccess}) async {
    if (onValidateRequireField()) {
      return;
    }

    final farm = await configService.getActiveFarm();
    var aai = state.accidentAndIncident;
    aai = aai.copyWith(
      farmId: farm?.farmId,
      accidentAndIncidentRegisterId: null,
      isActive: true,
      isMasterDataSynced: false,
      updateDT: DateTime.now(),
      createDT: aai.createDT ?? DateTime.now(),
    );

    int? resultId;

    final databaseService = cmoDatabaseMasterService;

    final futures = <Future<void>>[];

    for (final item in state.selectedPropertyDamages) {
      futures.add(
        cmoDatabaseMasterService.cacheAccidentAndIncidentPropertyDamagedFromFarm(
          item.copyWith(
            accidentAndIncidentRegisterNo: aai.accidentAndIncidentRegisterNo,
          ),
        ),
      );
    }

    await Future.wait(futures);

    await (await databaseService.db).writeTxn(() async {
      resultId = await databaseService.cacheAccidentAndIncident(
        aai.copyWith(
          dateOfIncident:
              state.accidentAndIncident.dateOfIncident ?? DateTime.now(),
        ),
      );
    });

    if (resultId != null) {
      onSuccess(resultId);
    }
  }
}
