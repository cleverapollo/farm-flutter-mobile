import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/model/fire_cause/fire_cause.dart';
import 'package:cmo/state/fire_cubit/fire_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireCubit extends Cubit<FireState> {
  FireCubit() : super(const FireState());

  Future<void> initLoadData() async {
    emit(state.copyWith(isLoading: true));
    final farm = await configService.getActiveFarm();

    final result = await cmoDatabaseMasterService.getFireRegistersByFarmId(
        farmId: farm?.farmId);

    emit(state.copyWith(data: result, dataSearch: result, isLoading: false));
  }

  void onSearch(String? input) {
    final listSearch = <FireRegister>[];

    if (input.isNullOrEmpty) {
      return emit(state.copyWith(data: state.dataSearch));
    }
    for (final item in state.data) {
      if (item.fireRegisterNo?.contains(input!) == true) {
        listSearch.add(item);
      }
    }
    emit(state.copyWith(data: listSearch));
  }

  Future<void> onChangeStatus(bool isOpen) async {
    final farm = await configService.getActiveFarm();

    final result = await cmoDatabaseMasterService.getFireRegistersByFarmId(
        farmId: farm?.farmId, isOpen: isOpen);

    emit(state.copyWith(
        data: result, dataSearch: result, isOpen: isOpen, isLoading: false));
  }

  Future<void> initAddData({FireRegister? fireRegister}) async {
    emit(state.copyWith(isLoading: true));

    final farm = await configService.getActiveFarm();

    final fireCauses = await cmoDatabaseMasterService
        .getFireCauseByGroupSchemeId(farm?.groupSchemeId ?? 0);

    emit(state.copyWith(
      fireCauses: fireCauses,
      isLoading: false,
    ));

    if (fireRegister != null) {
      final fireCauseSelect = state.fireCauses
          .firstWhereOrNull((e) => e.fireCauseId == fireRegister.fireCauseId);

      emit(state.copyWith(
        fireCauseSelect: fireCauseSelect,
        fireRegister: fireRegister,
        fireRegisterBeforeEdit: fireRegister,
        asiPhotos: fireRegister.asiPhotos
            ?.map((e) => AsiPhoto(
                  asiRegisterNo:
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  asiRegisterPhotoNo:
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  photo: e,
                  isActive: true,
                  isMasterdataSynced: false,
                  photoName: DateTime.now().microsecondsSinceEpoch.toString(),
                ))
            .toList() ?? [],
      ));
    }
  }

  void onDataChange({
    FireCause? fireCauseSelect,
    bool? carRaised,
    bool? carClosed,
    DateTime? date,
    DateTime? extinguished,
    double? areaBurnt,
    double? commercialAreaLoss,
    double? lat,
    double? lng,
    String? comment,
    List<String>? selectAsiPhotoBase64s,
  }) {
    String? carRaisedDate;
    String? carClosedDate;

    if (carRaised == true && state.fireRegister.carRaisedDate == null) {
      carRaisedDate = DateTime.now().toIso8601String();
    }
    if (carRaised == false && state.fireRegister.carRaisedDate != null) {
      carRaisedDate = null;
    }
    if (carRaised == null) {
      carRaisedDate = state.fireRegister.carRaisedDate;
    }

    if (carClosed == true && state.fireRegister.carClosedDate == null) {
      carClosedDate = DateTime.now().toIso8601String();
    }
    if (carClosed == false && state.fireRegister.carClosedDate != null) {
      carClosedDate = null;
    }
    if (carClosed == null) {
      carClosedDate = state.fireRegister.carClosedDate;
    }

    final asiPhotos = <AsiPhoto>[];

    asiPhotos.addAll(state.asiPhotos);

    if (true == selectAsiPhotoBase64s?.isNotEmpty) {
      asiPhotos.addAll(selectAsiPhotoBase64s!
          .map((e) => AsiPhoto(
                asiRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
                asiRegisterPhotoNo:
                    DateTime.now().millisecondsSinceEpoch.toString(),
                photo: e,
                isActive: true,
                isMasterdataSynced: false,
                photoName: DateTime.now().microsecondsSinceEpoch.toString(),
              ))
          .toList());
    }

    emit(state.copyWith(
      fireRegister: state.fireRegister.copyWith(
        fireRegisterId: null,
        carRaisedDate: carRaisedDate,
        carClosedDate: carClosedDate,
        date: date ?? state.fireRegister.date,
        areaBurnt: areaBurnt ?? state.fireRegister.areaBurnt,
        commercialAreaLoss:
            commercialAreaLoss ?? state.fireRegister.commercialAreaLoss,
        latitude: lat ?? state.fireRegister.latitude,
        longitude: lng ?? state.fireRegister.longitude,
        comment: comment ?? state.fireRegister.comment,
        extinguished: extinguished ?? state.fireRegister.extinguished,
        fireCauseId:
            fireCauseSelect?.fireCauseId ?? state.fireRegister.fireCauseId,
        fireCauseName:
            fireCauseSelect?.fireCauseName ?? state.fireRegister.fireCauseName,
        asiPhotos: selectAsiPhotoBase64s ?? state.fireRegister.asiPhotos,
      ),
      fireCauseSelect: fireCauseSelect ?? state.fireCauseSelect,
      asiPhotos: asiPhotos,
    ));
  }

  Future<int?> onSave() async {
    final farm = await configService.getActiveFarm();

    var isMasterSynced = false;

    if (state.fireRegisterBeforeEdit.isMasterdataSynced == true) {
      if (state.fireRegisterBeforeEdit != state.fireRegister) {
        isMasterSynced = false;
      } else {
        isMasterSynced = true;
      }
    }

    return cmoDatabaseMasterService.cacheFireRegisterFromFarm(state.fireRegister
        .copyWith(
            farmId: farm?.farmId,
            fireRegisterNo: state.fireRegister.fireRegisterNo ??
                DateTime.now().millisecondsSinceEpoch.toString(),
            isActive: true,
            isMasterdataSynced: isMasterSynced));
  }

  void onUpdateAsiPhoto(AsiPhoto asiPhoto) {
    final listAsiPhotos = [...state.asiPhotos];
    listAsiPhotos.removeWhere(
        (element) => element.asiRegisterPhotoNo == asiPhoto.asiRegisterPhotoNo);
    listAsiPhotos.add(asiPhoto);
    emit(state.copyWith(asiPhotos: listAsiPhotos));
  }

  void onRemoveAsiPhoto(AsiPhoto asiPhoto) {
    final listAsiPhotos = [...state.asiPhotos];
    listAsiPhotos.remove(asiPhoto);
    emit(state.copyWith(asiPhotos: listAsiPhotos));
  }
}
