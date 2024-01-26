import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'labour_management_state.dart';

class LabourManagementCubit extends HydratedCubit<LabourManagementState> {
  LabourManagementCubit() : super(const LabourManagementState()) {
    init();
  }

  Future<void> init() async {
    final activeFarm = await configService.getActiveFarm();
    emit(state.copyWith(activeFarm: activeFarm));
    await loadListWorkers();
  }

  Future<void> loadListWorkers() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;

      if (state.activeFarm?.farmId == null) return;
      final data =
          await service.getFarmerWorkersByFarmId(state.activeFarm!.farmId);

      emit(
        state.copyWith(
          listWorkers: data,
          filterWorkers: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void searching(String? searchText) {
    emit(state.copyWith(loading: true));
    try {
      if (searchText == null || searchText.isEmpty) {
        emit(
          state.copyWith(
            filterWorkers: state.listWorkers,
          ),
        );
      } else {
        final filteredItems = state.listWorkers
            .where(
              (element) =>
                  (element.firstName
                          ?.toLowerCase()
                          .contains(searchText.toLowerCase()) ??
                      false) ||
                  (element.surname
                          ?.toLowerCase()
                          .contains(searchText.toLowerCase()) ??
                      false),
            )
            .toList();

        emit(
          state.copyWith(
            filterWorkers: filteredItems,
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

  Future<void> onRemoveLabour(FarmerWorker worker) async {
    await cmoDatabaseMasterService.removeFarmerWorker(worker.id);
    await cmoDatabaseMasterService.deletedWorkerJobDescriptionByJobDescriptionId(worker.workerId);

    showSnackSuccess(
      msg: '${LocaleKeys.remove.tr()} ${worker.id}!',
    );

    await loadListWorkers();
  }

  @override
  LabourManagementState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(LabourManagementState state) {
    return null;
  }
}
