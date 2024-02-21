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
    final natureOfInjuries = await cmoDatabaseMasterService.getNatureOfInjuryByGroupSchemeId(farm.groupSchemeId);
    final jobDescriptions = await cmoDatabaseMasterService.getJobDescriptions();

    emit(
      state.copyWith(
        items: items,
        filteredItems: items,
        farmerWorkers: workers,
        natureOfInjuries: natureOfInjuries,
        jobDescriptions: jobDescriptions,
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

  String getNatureOfInjuryNameByNatureOfInjuryId(int? natureOfInjuryId) {
    if (natureOfInjuryId == null) return '';
    return state.natureOfInjuries
            .firstWhereOrNull(
                (element) => element.natureOfInjuryId == natureOfInjuryId)
            ?.natureOfInjuryName ??
        '';
  }

  String getJobDescriptionNameByJobDescriptionId(int? jobDescriptionId) {
    if (jobDescriptionId == null) return '';
    return state.jobDescriptions
            .firstWhereOrNull(
                (element) => element.jobDescriptionId == jobDescriptionId)
            ?.jobDescriptionName ??
        '';
  }
}
