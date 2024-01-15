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
    final traineeRegisters = await cmoDatabaseMasterService.getAllTraineeRegisters();
    final trainingTypes = await cmoDatabaseMasterService.getAllTrainingTypes();

    emit(
      state.copyWith(
        isDataReady: true,
        items: items,
        filterItems: items,
        traineeRegisters: traineeRegisters,
        trainingTypes: trainingTypes,
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

  String getTotalTrainee(String? trainingRegisterNo) {
    if (trainingRegisterNo.isBlank) return '';
    final listTrainee = state.traineeRegisters
        .where((element) => element.trainingRegisterNo == trainingRegisterNo);
    return listTrainee.isBlank ? '' : listTrainee.length.toString();
  }

  String getTrainingTypeNameByTrainingTypeId(int? trainingTypeId) {
    if (trainingTypeId == null) return '';
    return state.trainingTypes
        .firstWhereOrNull((element) => element.trainingTypeId == trainingTypeId)
        ?.trainingTypeName ??
        '';
  }
}
