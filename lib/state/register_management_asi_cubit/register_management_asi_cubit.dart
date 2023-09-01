import 'package:cmo/di.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMAsiCubit extends Cubit<RMAsiState> {
  RMAsiCubit() : super(const RMAsiState());

  Future<bool> initConfig() async {
    try {
      if (state.farmId != null && state.groupSchemeId != null) return true;

      final farm = await configService.getActiveFarm();

      emit(
        state.copyWith(
          farmId: farm?.farmId,
          groupSchemeId: farm?.groupSchemeId,
          farmName: farm?.farmName,
        ),
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> initAddData({Asi? initData}) async {
    final initResult = await initConfig();

    if (!initResult) return;

    if (initData != null) {
      emit(state.copyWith(
        asiData: initData,
        asiDataBeforeEdit: initData,
      ));
    } else {
      emit(state.copyWith(
        asiData: Asi(
          localId: DateTime.now().millisecondsSinceEpoch,
          asiRegisterNo: DateTime.now().millisecondsSinceEpoch.toString(),
          date: DateTime.now(),
          farmId: state.farmId,
        ),
      ));
    }

    final result = await cmoDatabaseMasterService
        .getAsiTypeByGroupSchemeId(state.groupSchemeId!);
    final photos = await cmoDatabaseMasterService
        .getAllAsiPhotoByAsiRegisterNo(state.asiData.asiRegisterNo);
    final compartments = await cmoDatabaseMasterService
        .getCompartmentByFarmId(state.farmId ?? '');

    emit(state.copyWith(
      asiTypes: result,
      isDataReady: true,
      asiPhotos: photos,
      asiCompartments: compartments ?? [],
    ));
  }

  Future<void> initListData() async {
    final initResult = await initConfig();

    if (!initResult) return;

    final result =
        await cmoDatabaseMasterService.getAsiRegisterByFarmId(state.farmId!);

    if (result.isNotEmpty) {
      emit(state.copyWith(asisData: result));
    }
  }

  void onCommentChanged(String comment) {
    emit(
      state.copyWith(
          asiData: state.asiData.copyWith(
        comment: comment,
      )),
    );
  }

  void onChangeData({
    Compartment? asiCompartment,
    AsiType? asiType,
    double? lat,
    double? lng,
    DateTime? dateTimeCaptured,
    bool? carRaised,
    bool? carClosed,
    String? comment,
    List<String> selectAsiPhotoBase64s = const <String>[],
  }) {
    String? carRaisedDate;
    String? carClosedDate;

    if (carRaised == true && state.asiData.carRaisedDate == null) {
      carRaisedDate = DateTime.now().toIso8601String();
    }
    if (carRaised == false && state.asiData.carRaisedDate != null) {
      carRaisedDate = null;
    }
    if (carRaised == null) {
      carRaisedDate = state.asiData.carRaisedDate;
    }

    if (carClosed == true && state.asiData.carClosedDate == null) {
      carClosedDate = DateTime.now().toIso8601String();
    }
    if (carClosed == false && state.asiData.carClosedDate != null) {
      carClosedDate = null;
    }
    if (carClosed == null) {
      carClosedDate = state.asiData.carClosedDate;
    }

    final asiPhotos = <AsiPhoto>[];

    asiPhotos.addAll(state.asiPhotos);

    if (selectAsiPhotoBase64s.isNotEmpty) {
      asiPhotos.addAll(selectAsiPhotoBase64s
          .map((e) => AsiPhoto(
                asiRegisterId: state.asiData.asiRegisterId,
                asiRegisterNo: state.asiData.asiRegisterNo,
                asiRegisterPhotoNo: state.asiData.asiRegisterNo,
                photo: e,
                isActive: true,
                isMasterdataSynced: false,
                photoName: DateTime.now().microsecondsSinceEpoch.toString(),
              ))
          .toList());
    }

    emit(
      state.copyWith(
        asiData: state.asiData.copyWith(
          asiTypeId: asiType?.asiTypeId ?? state.asiData.asiTypeId,
          asiTypeName: asiType?.asiTypeName ?? state.asiData.asiTypeName,
          latitude: lat ?? state.asiData.latitude,
          longitude: lng ?? state.asiData.longitude,
          date: dateTimeCaptured ?? state.asiData.date,
          carRaisedDate: carRaisedDate,
          carClosedDate: carClosedDate,
          comment: comment ?? state.asiData.comment,
          localCompartmentId: asiCompartment?.localCompartmentId ??
              state.asiData.localCompartmentId,
          compartmentName:
              asiCompartment?.unitNumber ?? state.asiData.compartmentName,
          managementUnitId: asiCompartment?.managementUnitId ??
              state.asiData.managementUnitId,
        ),
        asiPhotos: asiPhotos,
      ),
    );
  }

  Future<void> onSave(BuildContext context) async {
    if (state.asiData.asiTypeId == null ||
        state.asiData.latitude == null ||
        state.asiData.localCompartmentId == null) {
      return showSnackError(msg: 'Required fields are missing.');
    }

    for (final item in state.asiPhotos) {
      await cmoDatabaseMasterService.cacheAsiPhoto(item);
    }

    var isMasterDataSynced = false;

    if (state.asiDataBeforeEdit.isMasterdataSynced ?? false) {
      if (state.asiData != state.asiDataBeforeEdit) {
        isMasterDataSynced = false;
      } else {
        isMasterDataSynced = true;
      }
    }

    await cmoDatabaseMasterService
        .cacheAsi(state.asiData.copyWith(
      isMasterdataSynced: isMasterDataSynced,
      isActive: true,
    ))
        .then((value) {
      if (value != null) {
        showSnackSuccess(msg: 'Save ASI $value Successfully');
        Navigator.of(context).pop(value);
      } else {
        showSnackError(msg: 'Something was wrong, please try again.');
      }
    });
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
