import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
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
    emit(
      state.copyWith(
        isDataReady: true,
        items: items,
        filterItems: items,
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
}
