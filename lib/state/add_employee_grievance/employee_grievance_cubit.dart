import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'employee_grievance_state.dart';

class EmployeeGrievanceCubit extends Cubit<EmployeeGrievanceState> {
  EmployeeGrievanceCubit()
      : super(
          EmployeeGrievanceState(),
        ) {
    _onInit();
  }

  Future<void> _onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final items = await cmoDatabaseMasterService
          .getEmployeeGrievancesByFarmId(farm!.farmId);
      final workers = await cmoDatabaseMasterService.getFarmerWorkersByFarmId(farm.farmId ?? '');
      emit(
        state.copyWith(
          items: items,
          filterItems: items,
          isDataReady: true,
          farmerWorkers: workers,
        ),
      );

      applyFilter();
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onFilterStatus(StatusFilterEnum statusFilter) {
    emit(
      state.copyWith(
        statusFilter: statusFilter,
      ),
    );

    applyFilter();
  }

  void applyFilter() {
    var filterItems = <GrievanceRegister>[];
    switch (state.statusFilter) {
      case StatusFilterEnum.open:
        filterItems = state.items
            .where((element) => element.dateClosed == null && element.closureDetails.isBlank)
            .toList();
        break;
      case StatusFilterEnum.closed:
        filterItems = state.items
            .where((element) => element.dateClosed != null || element.closureDetails.isNotBlank)
            .toList();
        break;
    }

    emit(
      state.copyWith(
        filterItems: filterItems,
      ),
    );
  }

  void onUpdateItem(int index, GrievanceRegister updatedItem) {
    final items = [...state.items];
    items[index] = updatedItem;
    emit(
      state.copyWith(
        items: items,
      ),
    );

    applyFilter();
  }

  void onInsertNewItem(GrievanceRegister newItem) {
    emit(
      state.copyWith(
        items: [...state.items, newItem],
      ),
    );

    applyFilter();
  }

  String getWorkerNameByWorkerId(String? workerId) {
    if (workerId.isBlank) return '';
    return state.farmerWorkers
            .firstWhereOrNull((element) => element.workerId == workerId)
            ?.fullName ??
        '';
  }
}
