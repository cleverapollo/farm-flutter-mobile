import 'package:cmo/di.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/issue_type/issue_type.dart';
import 'package:cmo/model/labour_management/farmer_worker.dart';
import 'package:cmo/model/sanction_register/sanction_register.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisciplinariesCubit extends Cubit<DisciplinariesState> {
  DisciplinariesCubit() : super(const DisciplinariesState()) {
    initConfigData();
  }

  Future<void> onChangeStatus(bool isOpen) async {
    emit(state.copyWith(isLoading: true));

    final result = await cmoDatabaseMasterService
        .getSanctionRegisterByFarmId(state.farmId!, isOpen: isOpen);

    emit(state.copyWith(
        sanctionRegisters: result, isOpen: isOpen, isLoading: false));
  }

  Future<void> initData() async {
    emit(state.copyWith(isLoading: true));

    await initConfigData();

    final result = await cmoDatabaseMasterService
        .getSanctionRegisterByFarmId(state.farmId!);
    emit(state.copyWith(isLoading: false));

    if (result.isNotEmpty) {
      emit(state.copyWith(sanctionRegisters: result));
    }
  }

  Future<void> initConfigData() async {
    final farm = await configService.getActiveFarm();

    emit(state.copyWith(
        farmId: farm?.farmId, groupSchemeId: farm?.groupSchemeId.toString()));
  }

  Future<void> initAddData() async {
    emit(state.copyWith(isLoading: true));

    await initConfigData();

    final futures = <Future<dynamic>>[];

    var workers = <FarmerWorker>[];
    var issueTypes = <IssueType>[];
    var camps = <Camp>[];

    futures
      ..add(
        cmoDatabaseMasterService
            .getFarmerWorkersByFarmId(state.farmId!)
            .then((value) => workers = value),
      )
      ..add(
        cmoDatabaseMasterService
            .getIssueTypeByGroupSchemeId(int.parse(state.groupSchemeId!))
            .then((value) => issueTypes = value),
      )
      ..add(
        cmoDatabaseMasterService
            .getCampByFarmId(int.parse(state.farmId!))
            .then((value) => camps = value),
      );

    await Future.wait(futures).then((_) {
      emit(state.copyWith(
        workers: workers,
        issueTypes: issueTypes,
        camps: camps,
        isLoading: false,
      ));
    });
  }

  void onChangeData({
    FarmerWorker? selectWorker,
    Camp? selectCamp,
    IssueType? selectIssue,
    DateTime? dateIssue,
    String? campOrCompartment,
    String? comment,
    String? signatureImage,
    String? signatureDate,
    String? signaturePoint,
    bool? carRaised,
    bool? carClosed,
  }) {
    if (state.data == null) {
      emit(state.copyWith(data: const SanctionRegister()));
    }

    String? carRaisedDate;
    String? carClosedDate;

    if (carRaised == true && state.data?.carRaisedDate == null) {
      carRaisedDate = DateTime.now().toIso8601String();
    }
    if (carRaised == false && state.data?.carRaisedDate != null) {
      carRaisedDate = null;
    }
    if (carRaised == null) {
      carRaisedDate = state.data?.carRaisedDate;
    }

    if (carClosed == true && state.data?.carClosedDate == null) {
      carClosedDate = DateTime.now().toIso8601String();
    }
    if (carClosed == false && state.data?.carClosedDate != null) {
      carClosedDate = null;
    }
    if (carClosed == null) {
      carClosedDate = state.data?.carClosedDate;
    }

    emit(state.copyWith(
        data: state.data?.copyWith(
            sanctionRegisterId:
                DateTime.now().millisecondsSinceEpoch.toString(),
            workerId:
                (selectWorker?.workerId ?? state.data?.workerId).toString(),
            campOrCompartment:
                campOrCompartment ?? state.data?.campOrCompartment,
            comment: comment ?? state.data?.comment,
            dateReceived: dateIssue ?? state.data?.dateReceived,
            signatureDate: signatureDate ?? state.data?.signatureDate,
            signatureImage: signatureImage ?? state.data?.signatureImage,
            issueTypeId: selectIssue?.issueTypeId ?? state.data?.issueTypeId,
            issueTypeName:
                selectIssue?.issueTypeName ?? state.data?.issueTypeName,
            campId: selectCamp?.campId ?? state.data?.campId,
            campName: selectCamp?.campName ?? state.data?.campName,
            carRaisedDate: carRaisedDate,
            carClosedDate: carClosedDate,
            displayWorkerName:
                '${selectWorker?.firstName} ${selectWorker?.surname}')));
  }

  void onClearSignaturePad() {
    emit(state.copyWith(
        data: state.data?.copyWith(
      signatureDate: null,
      signatureImage: null,
      signaturePoints: null,
    )));
  }

  Future<void> onSave(BuildContext context) async {
    final canSave = state.data?.dateReceived != null;

    if (!canSave) return showSnackError(msg: 'Required fields are missing');

    await cmoDatabaseMasterService
        .cacheSanctionRegisterFromFarm(state.data!.copyWith(
      isActive: true,
      isSynced: false,
      isLocal: true,
      farmId: state.farmId,
    ))
        .then((value) {
      if (value != null) {
        showSnackSuccess(msg: 'Save Disciplinaries $value Successfully');
        Navigator.pop(context);
        initData();
      } else {
        showSnackError(msg: 'Something was wrong, please try again.');
      }
    });
  }
}
