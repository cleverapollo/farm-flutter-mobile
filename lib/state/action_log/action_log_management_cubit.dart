import 'package:cmo/di.dart';
import 'package:cmo/enum/action_log_status_filter_enum.dart';
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
    final closedActions = [
      ActionLog(
        dueDate: DateTime.now(),
        dateRaised: DateTime.now(),
        actionName:
        '10.13.1 Waste is collected, transported and disposed of มีการรวบรวม ขนส่ง และกําจัดของเสีย (Template Name)',
        createDT: DateTime.now(),
        updateDT: DateTime.now(),
        actionCategoryId: 'Waste Management',
        actionCategoryName: 'Waste Management',
        actionLogId: DateTime.now().millisecondsSinceEpoch,
        actionTypeId: 'Audit',
        actionTypeName: 'Audit',
        isMajor: true,
        raisedBy: DateTime.now().millisecondsSinceEpoch,
        raisedByName: 'Zinhle Kunene',
        rejectReasonName: 'rejectReasonName',
        rejectReasonId: DateTime.now().millisecondsSinceEpoch,
        closingDate: DateTime.now(),
        isClosed: true,
        actionDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        closingComment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      ),
    ];

    final openActions = [
      ActionLog(
        dueDate: DateTime.now(),
        dateRaised: DateTime.now(),
        actionName: '10.12.1 Waste is collected, transported and disposed of มีการรวบรวม ขนส่ง และกําจัดของเสีย (Template Name)',
        createDT: DateTime.now(),
        updateDT: DateTime.now(),
        actionCategoryId: 'Waste Management',
        actionCategoryName: 'Waste Management',
        actionLogId: DateTime.now().millisecondsSinceEpoch,
        actionTypeId: 'Audit',
        actionTypeName: 'Audit',
        isMajor: true,
        raisedBy: DateTime.now().millisecondsSinceEpoch,
        raisedByName: 'Zinhle Kunene',
        rejectReasonName: 'rejectReasonName',
        actionDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        rejectReasonId: DateTime.now().millisecondsSinceEpoch,
      ),
      ActionLog(
        dueDate: DateTime.now(),
        dateRaised: DateTime.now(),
        actionName: '10.14.1 Waste is collected, transported and disposed of มีการรวบรวม ขนส่ง และกําจัดของเสีย (Template Name)',
        createDT: DateTime.now(),
        updateDT: DateTime.now(),
        actionCategoryId: 'Waste Management',
        actionCategoryName: 'Waste Management',
        actionLogId: DateTime.now().millisecondsSinceEpoch,
        actionTypeId: 'Audit',
        actionTypeName: 'Audit',
        isMajor: false,
        raisedBy: DateTime.now().millisecondsSinceEpoch,
        raisedByName: 'Zinhle Kunene',
        rejectReasonName: 'rejectReasonName',
        actionDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        rejectReasonId: DateTime.now().millisecondsSinceEpoch,
      ),
    ];

    emit(
      state.copyWith(
        openActions: openActions,
        closedActions: closedActions,
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
