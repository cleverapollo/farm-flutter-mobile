import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/di.dart';
import 'package:cmo/ui/snack/snack_helper.dart';

part 'training_detail_state.dart';

class TrainingDetailCubit extends Cubit<TrainingDetailState> {
  TrainingDetailCubit({
    required Farm farm,
    required TrainingRegister training,
    required bool isAddNew,
  }) : super(
          TrainingDetailState(
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
    emit(
      state.copyWith(
        isTrainingTypeError: trainingType == null,
        training: state.training.copyWith(
          trainingTypeId: trainingType?.trainingTypeId ?? 0,
          trainingTypeName: trainingType?.trainingTypeName ?? '',
        ),
      ),
    );
  }

  void onWorkerChanged(FarmerWorker? worker) {
    emit(
      state.copyWith(
        isTraineeNameError: worker == null,
        training: state.training.copyWith(
          workerId: worker?.workerId ?? '',
          workerName: worker?.fullName ?? '',
        ),
      ),
    );
  }

  void onTrainerChanged(String? trainer) {
    emit(
      state.copyWith(
        isTrainerNameError: trainer.isBlank,
        training: state.training.copyWith(
          trainerName: trainer,
        ),
      ),
    );
  }

  void onExpiryDateChanged(DateTime? dateTime) {
    if(dateTime == null) return;
    if (state.training.date != null && dateTime.millisecondsSinceEpoch < state.training.date!.millisecondsSinceEpoch) {
      showSnackError(msg: 'Expiry date must be after training date');
      return;
    }

    emit(
      state.copyWith(
        training: state.training.copyWith(
          expiryDate: dateTime,
        ),
      ),
    );
  }

  void onDateIssuedChanged(DateTime? dateTime) {
    emit(
      state.copyWith(
        isDateError: dateTime == null,
        training: state.training.copyWith(
          date: dateTime,
        ),
      ),
    );
  }

  void onCommentChanged(String? comment) {
    emit(
      state.copyWith(
        training: state.training.copyWith(
          comment: comment,
        ),
      ),
    );
  }

  void onSign(String? image, String? point) {
    emit(
      state.copyWith(
        training: state.training.copyWith(
          signatureImage: image,
          signaturePoints: point,
          signatureDate: DateTime.now(),
        ),
      ),
    );
  }

  void onClearSignature() {
    emit(
      state.copyWith(
        training: state.training.copyWith(
          signatureImage: null,
          signaturePoints: null,
          signatureDate: null,
        ),
      ),
    );
  }

  bool onValidateRequireField() {
    if (state.training.date == null ||
        state.training.workerId == null ||
        state.training.trainerName.isBlank ||
        state.training.trainingTypeId == null) {
      emit(
        state.copyWith(
          isDateError: state.training.date == null,
          isTraineeNameError: state.training.workerId == null,
          isTrainerNameError: state.training.trainerName.isBlank,
          isTrainingTypeError: state.training.trainingTypeId == null,
        ),
      );
      return true;
    }

    if (state.training.expiryDate != null && state.training.expiryDate!.isBefore(state.training.date!)) {
      showSnackError(msg: 'Expiry date must be after training date');
      return true;
    }

    return false;
  }

  Future<void> onSave({
    required void Function(int?) onSuccess,
  }) async {
    if (onValidateRequireField()) {
      return;
    }

    var training = state.training;
    training = training.copyWith(
      isActive: true,
      isMasterdataSynced: false,
      updateDT: DateTime.now(),
      createDT: training.createDT ?? DateTime.now(),
    );

    int? resultId;

    final databaseService = cmoDatabaseMasterService;

    await (await databaseService.db).writeTxn(() async {
      resultId = await databaseService.cacheTraining(training);
    });

    if (resultId != null) {
      onSuccess(resultId);
    }
  }
}
