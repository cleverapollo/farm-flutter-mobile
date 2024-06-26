import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
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

      final aaiPhotos = await cmoDatabaseMasterService.getAllAAIRegisterPhotoByAAIRegisterNo(
        state.accidentAndIncident.accidentAndIncidentRegisterNo,
      );

      propertyDamaged.sort((first, second) {
        return (first.propertyDamagedName ?? '')
            .toLowerCase()
            .compareTo((second.propertyDamagedName ?? '').toLowerCase());
      });

      final jobDescriptions = <WorkerJobDescription>[];
      final workerId = state.accidentAndIncident.workerId;
      if (workerId != null) {
        final jobs = await cmoDatabaseMasterService
            .getWorkerJobDescriptionByWorkerId(workerId.toString());
        jobDescriptions.addAll(jobs);
      }

      final aaiRegisterPropertyDamages = await cmoDatabaseMasterService
          .getAllAAIPropertyDamagedByAccidentAndIncidentRegisterNo(
        state.accidentAndIncident.accidentAndIncidentRegisterNo,
      );

      final selectedPropertyDamages = propertyDamaged
          .where((e) =>
              aaiRegisterPropertyDamages.firstWhereOrNull((element) =>
                  element.propertyDamagedId == e.propertyDamagedId) !=
              null)
          .toList();

      emit(
        state.copyWith(
          workers: workers,
          natureOfInjuries: natureOfInjuries,
          propertyDamaged: propertyDamaged,
          jobDescriptions: jobDescriptions,
          lostTimeInDay: _calculateTimeLost(),
          selectedPropertyDamages: selectedPropertyDamages,
          aaiPhotos: aaiPhotos,
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
        isEditing: true,
      ),
    );
  }

  void onDateOfIncidentChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident: state.accidentAndIncident.copyWith(dateOfIncident: dateTime),
        isDateIncidentError: dateTime == null,
        isEditing: true,
      ),
    );
    onCalculateLostTimeInDay();
  }

  void onDateResumeChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        accidentAndIncident:
            state.accidentAndIncident.copyWith(dateResumeWork: dateTime),
        isEditing: true,
      ),
    );

    onCalculateLostTimeInDay();
  }

  void onWorkDisableChanged({bool? workerDisabled}) {
    emit(
      state.copyWith(
        isEditing: true,
        accidentAndIncident: state.accidentAndIncident.copyWith(
          workerDisabled: workerDisabled,
        ),
      ),
    );
  }

  void onCommentChanged(String? comment) {
    emit(
      state.copyWith(
        isEditing: true,
        accidentAndIncident: state.accidentAndIncident.copyWith(
          comment: comment,
        ),
      ),
    );
  }

  void onSelectPropertyDamaged(
    List<PropertyDamaged> selectedPropertyDamaged,
  ) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedPropertyDamages: selectedPropertyDamaged,
      ),
    );
  }

  void onCalculateLostTimeInDay() {
    emit(
      state.copyWith(
        isEditing: true,
        lostTimeInDay: _calculateTimeLost(),
      ),
    );
  }

  Future<void> onWorkerSelected(FarmerWorker? worker) async {
    final jobDescriptions = await cmoDatabaseMasterService
        .getWorkerJobDescriptionByWorkerId(worker?.workerId ?? '');
    emit(
      state.copyWith(
        isEditing: true,
        workerSelect: worker,
        isWorkerError: worker == null,
        jobDescriptions: jobDescriptions,
        accidentAndIncident: state.accidentAndIncident.copyWith(
          workerId: worker?.workerId,
          workerName: worker?.fullName,
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

    emit(
      state.copyWith(
        isEditing: true,
        jobDescriptionSelect: jobDesc,
      ),
    );
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

    emit(
      state.copyWith(
        natureOfInjurySelect: selectNatureOfInjury,
        isEditing: true,
      ),
    );
  }

  void onUpdatePhoto(String base64Image) {
    var randomId = generatorInt32Id();
    final aaiPhoto = AccidentAndIncidentPhoto(
      isMasterdataSynced: false,
      photo: base64Image,
      accidentAndIncidentRegisterPhotoNo: DateTime.now().millisecondsSinceEpoch.toString(),
      accidentAndIncidentRegisterPhotoId: randomId++,
      accidentAndIncidentRegisterNo: state.accidentAndIncident.accidentAndIncidentRegisterNo,
      accidentAndIncidentRegisterId: state.accidentAndIncident.accidentAndIncidentRegisterId,
      isActive: true,
      createDT: DateTime.now(),
      updateDT: DateTime.now(),
    );

    emit(
      state.copyWith(
        aaiPhotos: state.aaiPhotos + [aaiPhoto],
        isEditing: true,
      ),
    );
  }

  void onRemovePhoto(int? accidentAndIncidentRegisterPhotoId) {
    final aaiPhotos = state.aaiPhotos;
    aaiPhotos.removeWhere(
      (element) =>
          element.accidentAndIncidentRegisterPhotoId ==
          accidentAndIncidentRegisterPhotoId,
    );
    emit(
      state.copyWith(
        aaiPhotos: aaiPhotos,
        isEditing: true,
      ),
    );
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

  bool reactMaximumUploadedPhoto() {
    return state.aaiPhotos.length >= Constants.MAX_UPLOADED_REGISTER_PHOTOS;
  }

  Future<void> onSave({required void Function(int?) onSuccess}) async {
    if (onValidateRequireField()) {
      return;
    }

    final farm = await configService.getActiveFarm();

    await cmoDatabaseMasterService.removeAllAAIPhotoModelsByAccidentAndIncidentRegisterNo(state.accidentAndIncident.accidentAndIncidentRegisterNo);

    for (final item in state.aaiPhotos) {
      await cmoDatabaseMasterService.cacheAAIPhotoModel(
        item.copyWith(
          isMasterdataSynced: false,
        ),
      );
    }

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

    futures.add(cmoDatabaseMasterService.removeAllPropertyDamagedByAccidentAndIncidentRegisterNo(state.accidentAndIncident.accidentAndIncidentRegisterNo));
    var now = DateTime.now().microsecondsSinceEpoch;
    for (final item in state.selectedPropertyDamages) {
      now++;
      futures.add(
        cmoDatabaseMasterService.cacheAccidentAndIncidentPropertyDamaged(
          AccidentAndIncidentPropertyDamaged(
            accidentAndIncidentRegisterPropertyDamagedNo: now.toString(),
            propertyDamagedId: item.propertyDamagedId,
            accidentAndIncidentRegisterNo: aai.accidentAndIncidentRegisterNo,
            accidentAndIncidentRegisterId: aai.accidentAndIncidentRegisterId,
            isActive: true,
            isMasterdataSynced: false,
          ),

          isDirect: false,
        ),
      );
    }

    await Future.wait(futures);

    resultId = await databaseService.cacheAccidentAndIncident(
      aai.copyWith(
        dateOfIncident:
        state.accidentAndIncident.dateOfIncident ?? DateTime.now(),
      ),

      isDirect: false,
    );

    if (resultId != null) {
      onSuccess(resultId);
    }
  }
}
