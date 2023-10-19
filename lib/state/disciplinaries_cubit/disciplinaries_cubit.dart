import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/issue_type/issue_type.dart';
import 'package:cmo/model/labour_management/farmer_worker.dart';
import 'package:cmo/model/sanction_register/sanction_register.dart';
import 'package:cmo/state/disciplinaries_cubit/disciplinaries_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
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

  Future<void> initAddData({SanctionRegister? data}) async {
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
      ));
    });

    if (data != null) {
      final selectWorker = state.workers
          .firstWhereOrNull((element) => element.workerId == data.workerId);

      final selectCamp = state.camps
          .firstWhereOrNull((element) => element.campId == data.campId);

      final selectIssue = state.issueTypes.firstWhereOrNull(
          (element) => element.issueTypeId == data.issueTypeId);

      emit(state.copyWith(
        data: data,
        dataBeforeEdit: data,
        selectWorker: selectWorker,
        selectCamp: selectCamp,
        selectIssue: selectIssue,
      ));
    } else {
      emit(state.copyWith(data: const SanctionRegister()));
    }

    emit(state.copyWith(isLoading: false));
  }

  void onSelectWorker(FarmerWorker selectWorker) {
    emit(
      state.copyWith(
        isSelectWorkerError: false,
        selectWorker: selectWorker,
        data: state.data?.copyWith(
          workerId: selectWorker.workerId.toString(),
          displayWorkerName: '${selectWorker.firstName ?? ''} ${selectWorker.surname ?? ''}',
        ),
      ),
    );
  }

  void onSelectIssue(IssueType selectIssue) {
    emit(
      state.copyWith(
        isDisciplinariesIssueError: false,
        selectIssue: selectIssue,
        data: state.data?.copyWith(
          issueTypeId: selectIssue.issueTypeId,
          issueTypeName: selectIssue.issueTypeName,
        ),
      ),
    );
  }

  void onSelectDateIssued(DateTime? dateIssue) {
    emit(
      state.copyWith(
        isDateIssuedError: false,
        data: state.data?.copyWith(
          dateReceived: dateIssue ?? state.data?.dateReceived,
        ),
      ),
    );
  }

  void onChangeData({
    String? campOrCompartment,
    String? descriptionOfSanction,
    String? comment,
    String? signatureImage,
    String? signatureDate,
    String? signaturePoint,
  }) {
    emit(state.copyWith(
      data: state.data?.copyWith(
        sanctionRegisterId: state.data?.sanctionRegisterId ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        campOrCompartment: campOrCompartment ?? state.data?.campOrCompartment,
        descriptionOfSanction: descriptionOfSanction ?? state.data?.descriptionOfSanction,
        comment: comment ?? state.data?.comment,
        signatureDate: signatureDate ?? state.data?.signatureDate,
        signatureImage: signatureImage ?? state.data?.signatureImage,
      ),
    ));
  }

  void onClearSignaturePad() {
    emit(state.copyWith(
        data: state.data?.copyWith(
      signatureDate: null,
      signatureImage: null,
      signaturePoints: null,
    )));
  }

  void validateRequiredField() {
    emit(
      state.copyWith(
        isDateIssuedError: state.data?.dateReceived == null,
        isSelectWorkerError: state.data?.workerId == null || state.data!.workerId.isBlank,
        isDisciplinariesIssueError: state.data?.issueTypeId == null,
      ),
    );
  }

  Future<bool> onSave() async {
    try {
      validateRequiredField();
      final haveError = state.isDateIssuedError ||
          state.isSelectWorkerError ||
          state.isDisciplinariesIssueError;

      if (haveError) {
        return false;
      }

      var isSynced = false;

      if (state.dataBeforeEdit?.isSynced ?? false) {
        if (state.dataBeforeEdit != state.data) {
          isSynced = false;
        } else {
          isSynced = true;
        }
      }

      final result = await cmoDatabaseMasterService
          .cacheSanctionRegisterFromFarm(state.data!.copyWith(
        isActive: true,
        isSynced: isSynced,
        isLocal: !isSynced,
        farmId: state.farmId,
      ));

      if (result != null) {
        showSnackSuccess(msg: 'Save Disciplinaries $result Successfully');
      } else {
        showSnackError(msg: 'Something was wrong, please try again.');
      }

      return result != null;
    } catch (e) {
      showSnackError(msg: 'Something was wrong, please try again.');
      return false;
    }
  }
}
