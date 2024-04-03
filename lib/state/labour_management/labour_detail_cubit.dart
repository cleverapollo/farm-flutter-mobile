import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'labour_detail_state.dart';

class LabourDetailCubit extends HydratedCubit<LabourDetailState> {
  LabourDetailCubit(FarmerWorker? farmerWorker)
      : super(
          LabourDetailState(
            farmerWorker: farmerWorker ??
                FarmerWorker(
                  createDT: DateTime.now(),
                  updateDT: DateTime.now(),
                  workerId: DateTime.now().millisecondsSinceEpoch.toString(),
                  isActive: true,
                  isLocal: true,
                ),
          ),
        ) {
    init();
  }

  Future<void> init() async {
    emit(
      state.copyWith(
        loading: true,
        isEditing: false,
      ),
    );
    try {
      final activeFarm = await configService.getActiveFarm();
      final jobDescriptions = await cmoDatabaseMasterService.getJobDescriptions();
      final selectedWorkerJobDescriptions = await cmoDatabaseMasterService.getWorkerJobDescriptionByWorkerId(state.farmerWorker.workerId);

      emit(
        state.copyWith(
          activeFarm: activeFarm,
          listJobDescriptions: jobDescriptions,
          selectedWorkerJobDescriptions: selectedWorkerJobDescriptions,
          farmerWorker: state.farmerWorker.copyWith(
            farmId: state.farmerWorker.farmId ?? activeFarm?.farmId,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void onSelectAvatar(String photoPath) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          photo: photoPath,
        ),
        isEditing: true,
      ),
    );
  }

  void onChangeDateOfBirth(DateTime? dateTime) {
    if (dateTime != null) {
      emit(
        state.copyWith(
          isEditing: true,
          farmerWorker: state.farmerWorker.copyWith(
            dateOfBirth: dateTime,
          ),
        ),
      );
    }
  }

  void onChangeFirstName(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          firstName: inputValue,
        ),
      ),
    );
  }

  void onChangeSecondFirstName(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          secondFirstName: inputValue,
        ),
      ),
    );
  }

  void onChangeSurname(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          surname: inputValue,
        ),
      ),
    );
  }

  void onChangeSecondSurname(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          secondSurname: inputValue,
        ),
      ),
    );
  }

  void onChangeIdNumber(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          idNumber: inputValue,
        ),
      ),
    );
  }

  void onChangeDriveLicenseNumber(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          driverLicenseNumber: inputValue,
        ),
      ),
    );
  }

  void onChangePhoneNumber(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          phoneNumber: inputValue,
        ),
      ),
    );
  }

  void onSelectGender(int genderId) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          genderId: genderId,
        ),
      ),
    );
  }

  void onSelectForeigner(bool isForeigner) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          isForeigner: isForeigner,
        ),
      ),
    );
  }

  void onChangeWorkPermitNumber(String? inputValue) {
    emit(
      state.copyWith(
        isEditing: true,
        farmerWorker: state.farmerWorker.copyWith(
          workPermitNumber: inputValue,
        ),
      ),
    );
  }

  void onSelectJobDescription(List<JobDescription> selectedJobDescriptions) {
    emit(
      state.copyWith(
        isEditing: true,
        selectedWorkerJobDescriptions: selectedJobDescriptions
            .map(
              (e) => WorkerJobDescription(
                workerId: state.farmerWorker.workerId.toString(),
                jobDescriptionId: e.jobDescriptionId,
                jobDescriptionName: e.jobDescriptionName,
                createDT: DateTime.now(),
                updateDT: DateTime.now(),
                isActive: true,
              ),
            )
            .toList(),
      ),
    );
  }

  List<JobDescription> getListSelectedJobDescriptions() {
    return state.selectedWorkerJobDescriptions
        .map(
          (e) => JobDescription(
            jobDescriptionId: e.jobDescriptionId,
            jobDescriptionName: e.jobDescriptionName,
          ),
        )
        .toList();
  }

  bool onValidateRequireField() {
    final isFirstNameError = state.farmerWorker.firstName.isNullOrEmpty;
    final isLastNameNameError = state.farmerWorker.surname.isNullOrEmpty;
    final isIdNumberError = state.farmerWorker.idNumber.isNullOrEmpty;
    final isPhoneNumberError = state.farmerWorker.phoneNumber.isNullOrEmpty;
    final isWorkPermitNumberError = state.farmerWorker.isForeigner != null &&
        state.farmerWorker.isForeigner! &&
        state.farmerWorker.workPermitNumber.isNullOrEmpty;

    if (isFirstNameError ||
        isLastNameNameError ||
        isIdNumberError ||
        isPhoneNumberError) {
      emit(
        state.copyWith(
          isFirstNameError: isFirstNameError,
          isLastNameNameError: isLastNameNameError,
          isIdNumberError: isIdNumberError,
          isPhoneNumberError: isPhoneNumberError,
          isWorkPermitNumberError: isWorkPermitNumberError,
        ),
      );

      return true;
    }

    if (state.farmerWorker.isUnder16()) {
      showSnackError(msg: LocaleKeys.error_message_labour_under_16.tr());
      return true;
    }

    return false;
  }

  Future<void> onSave({
    required void Function(int?) onSuccess,
  }) async {
    if (onValidateRequireField()) {
      return;
    }

    final futures = <Future<int?>>[];
    await cmoDatabaseMasterService.deletedWorkerJobDescriptionByJobDescriptionId(
      state.farmerWorker.workerId,
    );
    var count = await cmoDatabaseMasterService.getCountWorkerJobDescription();
    count++;
    for (final item in state.selectedWorkerJobDescriptions) {
      futures.add(
        cmoDatabaseMasterService.cacheWorkerJobDescription(
          item.copyWith(workerJobDescriptionId: count++),
        ),
      );
    }

    await Future.wait(futures);

    final resultId = await cmoDatabaseMasterService.cacheFarmerWorker(
      state.farmerWorker.copyWith(
        genderId: state.farmerWorker.genderId ?? 1,
        isLocal: true,
        isActive: true,
        updateDT: DateTime.now(),
      ),
      isDirect: false,
    );

    onSuccess(resultId);
  }

  @override
  LabourDetailState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(LabourDetailState state) {
    return null;
  }
}
