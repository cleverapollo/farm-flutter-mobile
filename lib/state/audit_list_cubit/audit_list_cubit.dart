import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'audit_list_state.dart';

class AuditListCubit extends HydratedCubit<AuditListState> {
  AuditListCubit() : super(const AuditListState());

  void changeIndexTab(int index) {
    emit(state.copyWith(indexTab: index));
  }

  Future<void> loadIncomplete() async {
    emit(state.copyWith(loadingIncomplete: true));
    try {
      final service = cmoDatabaseService;
      final data = await service.getAllAuditsIncomplete();
      emit(state.copyWith(dataIncomplete: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loadingIncomplete: false));
    }
  }

  Future<void> loadCompleted() async {
    emit(state.copyWith(loadingCompleted: true));
    try {
      final service = cmoDatabaseService;
      final data = await service.getAllAuditsCompleted();
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
      final data = await service.getAllAuditsSynced();
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
    showSnackSuccess(
      msg: '${LocaleKeys.removeAudit.tr()} ${item.auditId}!',
    );

    return refresh();
  }

  Future<void> refresh() async {
    await loadIncomplete();
    await loadCompleted();
    await loadSynced();
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
