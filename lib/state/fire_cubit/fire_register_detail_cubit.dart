import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fire_register_detail_state.dart';

class FireRegisterDetailCubit extends Cubit<FireRegisterDetailState> {
  FireRegisterDetailCubit() : super(const FireRegisterDetailState());

  Future<void> initialize({
    FireRegister? fireRegister,
    required LocationModel locationModel,
  }) async {
    emit(state.copyWith(loading: true));

    final farm = await configService.getActiveFarm();

    final fireCauses = await cmoDatabaseMasterService
        .getFireCauseByGroupSchemeId(farm?.groupSchemeId ?? 0);

    emit(
      state.copyWith(
        fireCauses: fireCauses,
        loading: false,
        activeFarm: farm,
      ),
    );

    if (fireRegister != null) {
      final fireCauseSelect = state.fireCauses
          .firstWhereOrNull((e) => e.fireCauseId == fireRegister.fireCauseId);

      emit(
        state.copyWith(
          fireCauseSelect: fireCauseSelect,
          fireRegister: fireRegister.copyWith(
            longitude: locationModel.longitude,
            latitude: locationModel.latitude,
            createDT: fireRegister.createDT ?? DateTime.now(),
            updateDT: DateTime.now(),
          ),
        ),
      );
    } else {
      emit(state.copyWith(
        fireRegister: FireRegister(
          longitude: locationModel.longitude,
          latitude: locationModel.latitude,
          farmId: farm?.farmId,
          fireRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
          isActive: true,
          isMasterdataSynced: false,
          createDT: DateTime.now(),
          updateDT: DateTime.now(),
        ),
      ),);
    }
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

  Future<void> onSave({required VoidCallback onSuccess}) async {
    if (state.fireRegister?.extinguished != null && state.fireRegister?.date != null && state.fireRegister!.date!.isAfter(state.fireRegister!.extinguished!)) {
      showSnackError(msg: 'Extinguished date must be after detected date');
      return;
    }

    await cmoDatabaseMasterService.cacheFireRegisterFromFarm(state.fireRegister!);
    onSuccess();
  }
}
