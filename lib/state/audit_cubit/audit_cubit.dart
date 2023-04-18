import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'audit_state.dart';

class AuditCubit extends HydratedCubit<AuditState> {
  AuditCubit() : super(const AuditState());

  void updateCacheCreateData(Map<String, dynamic> data) {
    emit(
      state.copyWith(
        cacheCreateData: data,
      ),
    );
  }

  void cleanCache() {
    emit(state.copyWith(cacheCreateData: <String, dynamic>{}));
  }

  Future<bool> submit(
    Audit value,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      final service = cmoDatabaseService;
      int? newId;
      newId = await service.cacheAudit(value);
      showSnackSuccess(msg: 'Save audit success with id: $newId');
    } catch (e) {
      showSnackError(msg: e.toString());
      return false;
    } finally {
      emit(state.copyWith(loading: false));
    }

    return true;
  }

  @override
  AuditState? fromJson(Map<String, dynamic> json) {
    return AuditState(cacheCreateData: json);
  }

  @override
  Map<String, dynamic>? toJson(AuditState state) {
    return state.cacheCreateData;
  }
}
