import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'aai_state.dart';

class AAICubit extends Cubit<AAIState> {
  AAICubit() : super(const AAIState()) {
    onInit();
  }

  Future<void> onInit() async {
    final farm = await configService.getActiveFarm();
    final items = await cmoDatabaseMasterService.getAccidentAndIncidentRegistersByFarmId(farm!.farmId);
    final workers = await cmoDatabaseMasterService.getFarmerWorkersByFarmId(farm.farmId);
    emit(
      state.copyWith(
        items: items,
        filteredItems: items,
        farmerWorkers: workers,
      ),
    );

    onFilterStatus(state.statusFilter);
  }

  void onFilterStatus(StatusFilterEnum statusFilter) {
    emit(
      state.copyWith(
        statusFilter: statusFilter,
      ),
    );

    applyFilter();
  }

  void searching(String? inputSearch) {
    emit(state.copyWith(inputSearch: inputSearch));
    applyFilter();
  }

  void applyFilter() {
    var filterItems = state.items;
    switch (state.statusFilter) {
      case StatusFilterEnum.open:
        filterItems = state.items
            .where((element) => element.dateResumeWork == null)
            .toList();
        break;
      case StatusFilterEnum.closed:
        filterItems = state.items
            .where((element) => element.dateResumeWork != null)
            .toList();
        break;
    }

    if (state.inputSearch.isNotBlank) {
      filterItems = filterItems
          .where(
            (element) => element.accidentAndIncidentRegisterNo.isNotBlank && element.accidentAndIncidentRegisterNo!.contains(state.inputSearch!),
      )
          .toList();
    }

    emit(
      state.copyWith(
        filteredItems: filterItems,
      ),
    );
  }

  String getWorkerNameByWorkerId(String? workerId) {
    if (workerId.isBlank) return '';
    return state.farmerWorkers
        .firstWhereOrNull((element) => element.workerId == workerId)
        ?.fullName ??
        '';
  }
}
