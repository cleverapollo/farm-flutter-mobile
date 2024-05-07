import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'action_log_management_state.dart';

class ActionLogManagementCubit extends Cubit<ActionLogManagementState> {
  ActionLogManagementCubit() : super(const ActionLogManagementState()) {
    initData();
  }

  Future<void> initData() async {
    final activeRmu = await configService.getActiveRegionalManager();
    final activeUserRole = await configService.getActiveUserRole();
    emit(
      state.copyWith(
        activeRMU: activeRmu,
        activeUserRole: activeUserRole,
      ),
    );

    await refresh();
  }

  Future<void> refresh() async {
    final closedActions = await cmoDatabaseMasterService.getActionLogs(isClosed: true);
    final openActions = await cmoDatabaseMasterService.getActionLogs();

    final dueActionLogs = <ActionLog>[];
    final overdueActionLogs = <ActionLog>[];
    final upcomingActionLogs = <ActionLog>[];

    DateTime? overdueDate;
    DateTime? upcomingDate;

    for (final actionLog in openActions) {
      if (DateTime.now().isSameDate(actionLog.dueDate)) {
        dueActionLogs.add(actionLog);
      } else if (actionLog.dueDate != null) {
        if (DateTime.now().isAfter(actionLog.dueDate!)) {
          if (overdueDate == null || overdueDate.isBefore(actionLog.dueDate!)) {
            overdueDate = actionLog.dueDate;
          }

          overdueActionLogs.add(actionLog);
        } else if (DateTime.now().isBefore(actionLog.dueDate!)) {
          if (upcomingDate == null || upcomingDate.isBefore(actionLog.dueDate!)) {
            upcomingDate = actionLog.dueDate;
          }

          upcomingActionLogs.add(actionLog);
        }
      }
    }

    emit(
      state.copyWith(
        openActions: openActions,
        closedActions: closedActions,
        dueActionLogs: dueActionLogs,
        overdueActionLogs: overdueActionLogs.where((element) => element.dueDate.isSameDate(overdueDate)).toList(),
        upcomingActionLogs: upcomingActionLogs.where((element) => element.dueDate.isSameDate(upcomingDate)).toList(),
      ),
    );

    applyFilter();
  }

  void onFilterGroupChanged(ActionLogStatusFilterEnum statusFilter) {
    emit(
      state.copyWith(
        statusFilter: statusFilter,
      ),
    );
    applyFilter();
  }

  Future<void> onSearchTextChanged(String? value) async {
    await Future.delayed(const Duration(milliseconds: 200));
    emit(
      state.copyWith(
        filteringText: value,
      ),
    );
    applyFilter();
  }

  void applyFilter() {
    var filteringItems = <ActionLog>[];
    switch (state.statusFilter) {
      case ActionLogStatusFilterEnum.open:
        filteringItems = state.openActions;
        break;
      case ActionLogStatusFilterEnum.closed:
        filteringItems = state.closedActions;
        break;
      case ActionLogStatusFilterEnum.upcoming:
        break;
    }

    if (state.filteringText.isNotBlank && state.statusFilter != ActionLogStatusFilterEnum.upcoming) {
      filteringItems = filteringItems
          .where(
            (element) =>
                element.actionName.isNotBlank &&
                element.actionName!
                    .toLowerCase()
                    .contains(state.filteringText!.toLowerCase()),
          )
          .toList();
    }

    emit(
      state.copyWith(
        displayList: filteringItems,
      ),
    );
  }
}
