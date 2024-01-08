import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'training_state.dart';

class TrainingCubit extends Cubit<TrainingState> {
  TrainingCubit()
      : super(
          TrainingState(),
        ) {
    onLoadData();
  }

  Future<void> onLoadData() async {
    final farm = await configService.getActiveFarm();
    final items = await cmoDatabaseMasterService.getTrainingByFarmId(farm!.farmId);
    final workers = await cmoDatabaseMasterService.getFarmerWorkersByFarmId(farm.farmId ?? '');
    emit(
      state.copyWith(
        isDataReady: true,
        items: items,
        filterItems: items,
        farmerWorkers: workers,
      ),
    );

    onFilterStatus(state.statusFilter);
  }

  void onFilterStatus(StatusFilterEnum statusFilter) {
    var filterItems = <TrainingRegister>[];
    switch (statusFilter) {
      case StatusFilterEnum.open:
        filterItems = state.items.where((element) => element.expiryDate == null).toList();
        break;
      case StatusFilterEnum.closed:
        filterItems = state.items.where((element) => element.expiryDate != null).toList();
        break;
    }

    emit(
      state.copyWith(
        filterItems: filterItems,
        statusFilter: statusFilter,
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
