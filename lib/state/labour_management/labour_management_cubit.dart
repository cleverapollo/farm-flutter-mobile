import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/labour_management/farmer_worker.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'labour_management_state.dart';

List<FarmerWorker> _mockData = [
  FarmerWorker(
    jobTitle: 'Manager',
    firstName: 'Leon Chetty',
  ),
  FarmerWorker(
    jobTitle: 'Supervisor',
    firstName: 'Joe Soap ',
  ),
  FarmerWorker(
    jobTitle: 'Supervisor',
    firstName: 'Leon Chetty',
  ),
];

class LabourManagementCubit extends HydratedCubit<LabourManagementState> {
  LabourManagementCubit() : super(const LabourManagementState());

  Future<void> loadListWorkers() async {
    emit(state.copyWith(loading: true));
    try {
      final service = cmoDatabaseMasterService;
      final data = await service.getFarmerWorkersByFarmId(1553253093156);
      emit(state.copyWith(listWorkers: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> removeAudit(Audit item) async {
    await cmoDatabaseMasterService.removeAudit(item.auditId!);
    showSnackSuccess(
      msg: '${LocaleKeys.removeAudit.tr()} ${item.auditId}!',
    );
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
                  (element.lastName
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

  @override
  LabourManagementState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(LabourManagementState state) {
    return null;
  }
}
