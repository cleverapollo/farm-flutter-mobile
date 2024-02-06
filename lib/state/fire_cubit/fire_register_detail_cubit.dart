import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fire_register_detail_state.dart';

class FireRegisterDetailCubit extends Cubit<FireRegisterDetailState> {
  FireRegisterDetailCubit(FireRegister? fireRegister)
      : super(
          FireRegisterDetailState(
            fireRegister: fireRegister ??
                FireRegister(
                  fireRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
                  isActive: true,
                  isMasterdataSynced: false,
                  createDT: DateTime.now(),
                  updateDT: DateTime.now(),
                ),
          ),
        ) {
    initialize();
  }

  Future<void> initialize() async {
    emit(state.copyWith(loading: true));
    final farm = await configService.getActiveFarm();
    final fireCauses = await cmoDatabaseMasterService
        .getFireCauseByGroupSchemeId(farm?.groupSchemeId ?? 0);

    final firePhotos = await cmoDatabaseMasterService.getAllFireRegisterPhotosByFireRegisterNo(
      state.fireRegister?.fireRegisterNo,
    );

    final fireCauseSelect = state.fireCauses.firstWhereOrNull(
      (e) => e.fireCauseId == state.fireRegister?.fireCauseId,
    );

    emit(
      state.copyWith(
        fireCauseSelect: fireCauseSelect,
        firePhotos: firePhotos,
        fireCauses: fireCauses,
        loading: false,
        activeFarm: farm,
        fireRegister: state.fireRegister?.copyWith(
          farmId: state.fireRegister?.farmId ?? farm?.farmId,
        ),
      ),
    );
  }

  void onDataChange({
    FireCause? fireCauseSelect,
    DateTime? date,
    DateTime? extinguished,
    double? areaBurnt,
    double? commercialAreaLoss,
    double? lat,
    double? lng,
    String? comment,
    List<String>? selectAsiPhotoBase64s,
  }) {
    if (date != null &&
        state.fireRegister?.extinguished != null &&
        date.isAfter(state.fireRegister!.extinguished!)) {
      showSnackError(msg: 'Extinguished date must be after detected date');
      emit(state.copyWith(fireRegister: state.fireRegister?.cleanDateData(isDetected: true)));
      return;
    }

    if (extinguished != null &&
        state.fireRegister?.date != null &&
        extinguished.isBefore(state.fireRegister!.date!)) {
      showSnackError(msg: 'Extinguished date must be after detected date');
      emit(state.copyWith(fireRegister: state.fireRegister?.cleanDateData(isExtinguished: true)));
      return;
    }

    emit(
      state.copyWith(
        fireCauseSelect: fireCauseSelect ?? state.fireCauseSelect,
        fireRegister: state.fireRegister?.copyWith(
          fireRegisterId: null,
          date: date ?? state.fireRegister?.date,
          areaBurnt: areaBurnt ?? state.fireRegister?.areaBurnt,
          commercialAreaLoss: commercialAreaLoss ?? state.fireRegister?.commercialAreaLoss,
          latitude: lat ?? state.fireRegister?.latitude,
          longitude: lng ?? state.fireRegister?.longitude,
          comment: comment ?? state.fireRegister?.comment,
          extinguished: extinguished ?? state.fireRegister?.extinguished,
          fireCauseId: fireCauseSelect?.fireCauseId ?? state.fireRegister?.fireCauseId,
          fireCauseName: fireCauseSelect?.fireCauseName ?? state.fireRegister?.fireCauseName,
        ),
      ),
    );
  }

  void onUpdatePhoto(String base64Image) {
    var randomId = generatorInt32Id();
    final firePhoto = FireRegisterPhoto(
      isMasterdataSynced: false,
      photo: base64Image,
      fireRegisterPhotoNo: DateTime.now().millisecondsSinceEpoch.toString(),
      fireRegisterPhotoId: randomId++,
      fireRegisterNo: state.fireRegister?.fireRegisterNo,
      fireRegisterId: state.fireRegister?.fireRegisterId,
      isActive: true,
      createDT: DateTime.now(),
      updateDT: DateTime.now(),
    );

    emit(state.copyWith(firePhotos: state.firePhotos + [firePhoto]));
  }

  void onRemovePhoto(int? fireRegisterPhotoId) {
    final firePhotos = state.firePhotos;
    firePhotos.removeWhere((element) => element.fireRegisterPhotoId == fireRegisterPhotoId);
    emit(
      state.copyWith(
        firePhotos: firePhotos,
      ),
    );
  }

  bool reactMaximumUploadedPhoto() {
    return state.firePhotos.length >= Constants.MAX_UPLOADED_REGISTER_PHOTOS;
  }

  Future<void> onSave({required VoidCallback onSuccess}) async {
    if (state.fireRegister?.extinguished != null &&
        state.fireRegister?.date != null &&
        state.fireRegister!.date!.isAfter(state.fireRegister!.extinguished!)) {
      showSnackError(msg: 'Extinguished date must be after detected date');
      return;
    }

    await cmoDatabaseMasterService.removeAllFireRegisterPhotosByFireRegisterNo(
      state.fireRegister?.fireRegisterNo,
    );

    for (final item in state.firePhotos) {
      await cmoDatabaseMasterService.cacheFirePhotoModel(
        item.copyWith(
          isMasterdataSynced: false,
        ),
      );
    }

    await cmoDatabaseMasterService.cacheFireRegister(
      state.fireRegister!.copyWith(
        isMasterdataSynced: false,
      ),
      isDirect: false,
    );

    onSuccess();
  }
}
