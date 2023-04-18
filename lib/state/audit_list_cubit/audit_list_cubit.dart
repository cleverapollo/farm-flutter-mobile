import 'package:cmo/di.dart';
import 'package:cmo/model/assessment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'audit_list_state.dart';

class AuditListCubit extends HydratedCubit<AuditListState> {
  AuditListCubit() : super(const AuditListState());

  void changeIndexTab(int index) {
    emit(state.copyWith(indexTab: index));
  }

  Future<void> loadStarted() async {
    emit(state.copyWith(loadingStarted: true));
    try {
      final service = cmoDatabaseService;
      // final data = await service.getAllAssessmentsStarted();
      final data = <Audit>[
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
      ];
      emit(state.copyWith(dataIncomplete: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingStarted: false));
    }
  }

  Future<void> loadCompleted() async {
    emit(state.copyWith(loadingCompleted: true));
    try {
      final service = cmoDatabaseService;
      // final data = await service.getAllAssessmentsCompleted();
      final data = <Audit>[
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
      ];
      emit(state.copyWith(dataCompleted: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingCompleted: false));
    }
  }

  Future<void> loadSynced() async {
    emit(state.copyWith(loadingSynced: true));
    try {
      final service = cmoDatabaseService;
      // final data = await service.getAllAssessmentsSynced();
      final data = <Audit>[
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
        Audit(auditId: DateTime.now().millisecondsSinceEpoch, compartmentName: 'compartmentName', createTime: DateTime.now(), siteName: 'siteName'),
      ];
      emit(state.copyWith(dataSynced: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingSynced: false));
    }
  }

  Future<void> removeAudit(Audit item) async {
    await cmoDatabaseService.removeAssessment(item.auditId!);
    return loadStarted();
  }

  @override
  AuditListState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AuditListState state) {
    return null;
  }
}
