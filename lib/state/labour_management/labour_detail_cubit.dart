import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
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
    emit(state.copyWith(loading: true));
    try {
      final activeFarm = await configService.getActiveFarm();
      final data = await cmoDatabaseMasterService.getJobDescriptions();
      final selectedWorkerJobDescriptions = await cmoDatabaseMasterService.getWorkerJobDescriptionByWorkerId(state.farmerWorker.workerId);

      emit(
        state.copyWith(
          activeFarm: activeFarm,
          listJobDescriptions: data,
          filterJobDescriptions: data,
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
      ),
    );
  }

  void onChangeDateOfBirth(DateTime? dateTime) {
    if (dateTime != null) {
      emit(
        state.copyWith(
          farmerWorker: state.farmerWorker.copyWith(
            dateOfBirth: dateTime.toIso8601String(),
          ),
        ),
      );
    }
  }

  void onChangeFirstName(String? inputValue) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          firstName: inputValue,
        ),
      ),
    );
  }

  void onChangeSecondFirstName(String? inputValue) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          surname: inputValue,
        ),
      ),
    );
  }

  void onChangeSurname(String? inputValue) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          surname: inputValue,
        ),
      ),
    );
  }

  void onChangeSecondSurname(String? inputValue) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          firstName: inputValue,
        ),
      ),
    );
  }

  void onChangeIdNumber(String? inputValue) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          idNumber: inputValue,
        ),
      ),
    );
  }

  void onChangeDriveLicenseNumber(String? inputValue) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          driverLicenseNumber: inputValue,
        ),
      ),
    );
  }

  void onChangePhoneNumber(String? inputValue) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          phoneNumber: inputValue,
        ),
      ),
    );
  }

  void onSelectGender(int genderId) {
    emit(
      state.copyWith(
        farmerWorker: state.farmerWorker.copyWith(
          genderId: genderId,
        ),
      ),
    );
  }

  void onSelectJobDescription(List<WorkerJobDescription> selectedWorkerJobDescriptions) {
    emit(
      state.copyWith(
        selectedWorkerJobDescriptions: selectedWorkerJobDescriptions,
      ),
    );
  }

  Future<void> loadListJobDescriptions() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getJobDescriptions();

      emit(
        state.copyWith(
          listJobDescriptions: data,
          filterJobDescriptions: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void searchJobDescription(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterJobDescriptions: state.listJobDescriptions,
          ),
        );
      } else {
        final filteredItems = state.listJobDescriptions
            .where(
              (element) =>
          element.jobDescriptionName
              ?.toLowerCase()
              .contains(searchText.toLowerCase()) ??
              false,
        )
            .toList();

        emit(
          state.copyWith(
            filterJobDescriptions: filteredItems,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  bool onValidateRequireField() {
    if (state.farmerWorker.firstName.isNullOrEmpty || state.farmerWorker.surname.isNullOrEmpty || state.farmerWorker.idNumber.isNullOrEmpty || state.farmerWorker.phoneNumber.isNullOrEmpty) {
      emit(
        state.copyWith(
          isFirstNameError: state.farmerWorker.firstName.isNullOrEmpty,
          isLastNameNameError: state.farmerWorker.surname.isNullOrEmpty,
          isIdNumberError: state.farmerWorker.idNumber.isNullOrEmpty,
          isPhoneNumberError: state.farmerWorker.phoneNumber.isNullOrEmpty,
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
    await cmoDatabaseMasterService
        .deletedWorkerJobDescriptionByJobDescriptionId(
            state.farmerWorker.workerId);
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

    final resultId = await cmoDatabaseMasterService.cacheWorkerFromFarm(
      state.farmerWorker.copyWith(
        genderId: state.farmerWorker.genderId ?? 1,
        isLocal: true,
        isActive: true,
        updateDT: DateTime.now(),
      ),
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
