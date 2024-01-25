import 'package:cmo/di.dart';
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
                  isActive: 1,
                  isLocal: 1,
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
      final selectedWorkerJobDescriptions = await cmoDatabaseMasterService
          .getWorkerJobDescriptionByWorkerId(state.farmerWorker.workerId);
      emit(
        state.copyWith(
          activeFarm: activeFarm,
          listJobDescriptions: data,
          filterJobDescriptions: data,
          listWorkerJobDescriptions: selectedWorkerJobDescriptions,
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

  @override
  LabourDetailState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(LabourDetailState state) {
    return null;
  }
}
