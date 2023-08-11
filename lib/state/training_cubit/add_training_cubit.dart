import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/di.dart';
import 'package:cmo/ui/snack/snack_helper.dart';

part 'add_training_state.dart';

class AddTrainingCubit extends Cubit<AddTrainingState> {
  AddTrainingCubit({
    required Farm farm,
    required TrainingRegister training,
    required bool isAddNew,
  }) : super(
          AddTrainingState(
            farm: farm,
            training: training,
            isAddNew: isAddNew,
          ),
        ) {
    onInit();
  }

  Future<void> onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final trainingTypes = await cmoDatabaseMasterService
          .getTrainingTypeByGroupSchemeId(farm?.groupSchemeId ?? 0);
      final workers = await cmoDatabaseMasterService
          .getFarmerWorkersByFarmId(farm?.farmId ?? '');

      emit(
        state.copyWith(
          isDataReady: true,
          trainingTypes: trainingTypes,
          workers: workers,
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onTrainingTypeChanged(TrainingType? trainingType) {
    state.training = state.training.copyWith(
      trainingTypeId: trainingType?.trainingTypeId ?? 0,
      trainingTypeName: trainingType?.trainingTypeName ?? '',
    );
  }

  void onWorkerChanged(FarmerWorker? worker) {
    state.training = state.training.copyWith(
      workerId: worker?.workerId ?? '',
      workerName: worker?.firstName ?? '',
    );
  }

  void onTrainerChanged(String? trainer) {
    state.training = state.training.copyWith(
      trainerName: trainer,
    );
  }

  void onExpiryDateChanged(DateTime? dateTime) {
    print(dateTime);
    state.training = state.training.copyWith(
      expiryDate: dateTime,
    );
  }

  void onDateIssuedChanged(DateTime? dateTime) {
    state.training = state.training.copyWith(
      date: dateTime,
    );
  }

  void onCommentChanged(String? comment) {
    state.training = state.training.copyWith(
      comment: comment,
    );
  }
}
