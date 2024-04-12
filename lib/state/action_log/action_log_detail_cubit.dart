import 'package:cmo/di.dart';
import 'package:cmo/enum/action_log_status_filter_enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:cmo/ui/components/base/base_state.dart';

part 'action_log_detail_state.dart';

class ActionLogDetailCubit extends Cubit<ActionLogDetailState> {
  ActionLogDetailCubit(ActionLog? actionLog)
      : super(
          ActionLogDetailState(
            actionLog: actionLog ?? ActionLog(
              createDT: DateTime.now(),
              actionLogNo: DateTime.now().millisecondsSinceEpoch.toString(),
            ),
          ),
        ) {
    initData();
  }

  Future<void> initData() async {
    final activeRmu = await configService.getActiveRegionalManager();
    emit(
      state.copyWith(
        activeRMU: activeRmu,
      ),
    );
  }

  void changeMajorAction(bool isMajor) {
    emit(
      state.copyWith(
        actionLog: state.actionLog.copyWith(isMajor: isMajor),
      ),
    );
  }

  void onDateRaisedChanged(DateTime? value) {
    emit(
      state.copyWith(
        isEditing: true,
          actionLog: state.actionLog.copyWith(dateRaised: value),
      ),
    );
  }

  void onDueDateChanged(DateTime? value) {
    emit(
      state.copyWith(
        isEditing: true,
        actionLog: state.actionLog.copyWith(dueDate: value),
      ),
    );
  }
}
