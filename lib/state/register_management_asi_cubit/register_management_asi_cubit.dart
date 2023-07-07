import 'package:cmo/di.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/asi_type/asi_type.dart';
import 'package:cmo/state/register_management_asi_cubit/register_management_asi_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RMAsiCubit extends Cubit<RMAsiState> {
  RMAsiCubit() : super(const RMAsiState());

  Future<bool> initConfig() async {
    try {
      if (state.farmId != null && state.groupSchemeId != null) return true;

      final farm = await configService.getActiveFarm();

      emit(state.copyWith(
          farmId: farm?.farmId, groupSchemeId: farm?.groupSchemeId));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> initAddData() async {
    final initResult = await initConfig();

    if (!initResult) return;

    final result = await cmoDatabaseMasterService
        .getAsiTypeByGroupSchemeId(state.groupSchemeId!);

    emit(state.copyWith(asiTypes: result));
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

  void onChangeData({
    AsiType? asiType,
    double? lat,
    double? lng,
    DateTime? dateTimeCaptured,
    bool? carRaised,
    bool? carClosed,
    String? comment,
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

    emit(
      state.copyWith(
          asiData: state.asiData.copyWith(
        asiTypeName:
            asiType != null ? asiType.asiTypeName : state.asiData.asiTypeName,
        latitude: lat ?? state.asiData.latitude,
        longitude: lng ?? state.asiData.longitude,
        date: dateTimeCaptured ?? state.asiData.date,
        carRaisedDate: carRaisedDate,
        carClosedDate: carClosedDate,
        comment: comment ?? state.asiData.comment,
      )),
    );
  }

  Future<void> onSave() async {
    if (state.asiData != const Asi()) {
      await cmoDatabaseMasterService
          .cacheAsi(state.asiData.copyWith(
        farmId: state.farmId,
        asiRegisterId: DateTime.now().microsecondsSinceEpoch.toString(),
        isActive: true,
        isMasterdataSynced: false,
      ))
          .then((value) {
        if (value != null) {
          showSnackSuccess(msg: 'Save ASI Successfully}');
        } else {
          showSnackError(msg: 'Something was wrong, please try again.');
        }
      });
    }
  }
}
