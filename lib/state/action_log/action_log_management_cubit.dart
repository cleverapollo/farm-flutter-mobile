import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/ui/components/base/base_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'action_log_management_state.dart';

class ActionLogManagementCubit extends Cubit<ActionLogManagementState> {
  ActionLogManagementCubit()
      : super(
          ActionLogManagementState(
            firstDateUpcomingFilter: DateTime.now(),
            lastDateUpcomingFilter: DateTime.now(),
            selectedDateUpcomingFilter: DateTime.now(),
          ),
        ) {
    initData();
  }

  Future<void> initData() async {
    final activeRmu = await configService.getActiveRegionalManager();
    final activeUserRole = await configService.getActiveUserRole();
    emit(
      state.copyWith(
        activeRMU: activeRmu,
        activeUserRole: activeUserRole,
        upcomingActionLogTimeFiltersEnum: UpcomingActionLogTimeFilter.values,
      ),
    );

    await refresh();
  }

  Future<void> refresh() async {
    final closedActions = await cmoDatabaseMasterService.getActionLogs(isClosed: true);
    final openActions = await cmoDatabaseMasterService.getActionLogs();
    emit(
      state.copyWith(
        openActions: openActions,
        closedActions: closedActions,
      ),
    );

    applyFilter();
  }


  void onTapUpcomingTimeFilterDropdown() {
    emit(state.copyWith(isOpenedUpcomingFilter: !state.isOpenedUpcomingFilter));
  }

  void selectUpcomingTimeFilter(DateTime? dateTime) {
    if (dateTime == null) return;
    emit(
      state.copyWith(
        selectedDateUpcomingFilter: dateTime,
      ),
    );

    updateUpcomingTimeRange();
    applyFilter();
  }

  void updateUpcomingTimeRange() {
    var firstDateUpcomingFilter = state.firstDateUpcomingFilter;
    var lastDateUpcomingFilter = state.lastDateUpcomingFilter;
    switch(state.selectedUpcomingActionLogTimeFilter) {
      case UpcomingActionLogTimeFilter.day:
        firstDateUpcomingFilter = state.selectedDateUpcomingFilter;
        lastDateUpcomingFilter = state.selectedDateUpcomingFilter;
        break;
      case UpcomingActionLogTimeFilter.week:
        firstDateUpcomingFilter = state.selectedDateUpcomingFilter.firstDayOfWeek;
        lastDateUpcomingFilter = state.selectedDateUpcomingFilter.lastDayOfWeek;
        break;
      case UpcomingActionLogTimeFilter.month:
        firstDateUpcomingFilter = state.selectedDateUpcomingFilter.firstDayOfMonth;
        lastDateUpcomingFilter = state.selectedDateUpcomingFilter.lastDayOfMonth;
        break;
    }

    emit(
      state.copyWith(
        firstDateUpcomingFilter: firstDateUpcomingFilter,
        lastDateUpcomingFilter: lastDateUpcomingFilter,
      ),
    );

    applyFilter();
  }

  void selectUpcomingTimeRangeEnumFilter(UpcomingActionLogTimeFilter? filterEnum) {
    emit(
      state.copyWith(
        selectedUpcomingActionLogTimeFilter: filterEnum,
        isOpenedUpcomingFilter: false,
      ),
    );

    updateUpcomingTimeRange();
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
      case ActionLogStatusFilterEnum.upcoming:
        filteringItems = state.openActions;
        break;
      case ActionLogStatusFilterEnum.closed:
        filteringItems = state.closedActions;
        break;
    }

    if (state.statusFilter == ActionLogStatusFilterEnum.upcoming) {
      filteringItems.sort((first, second) {
        return first.dueDate!.compareTo(second.dueDate!);
      });

      switch (state.selectedUpcomingActionLogTimeFilter) {
        case UpcomingActionLogTimeFilter.day:
          filteringItems = filteringItems
              .where(
                (element) => element.dueDate.isSameDate(state.firstDateUpcomingFilter),
              )
              .toList();
          break;
        case UpcomingActionLogTimeFilter.week:
        case UpcomingActionLogTimeFilter.month:
          filteringItems = filteringItems
              .where(
                (element) =>
                    element.dueDate != null &&
                    element.dueDate!.isAfter(state.firstDateUpcomingFilter) &&
                    element.dueDate!.isBefore(state.lastDateUpcomingFilter),
              )
              .toList();
          break;
      }
    } else if (state.filteringText.isNotBlank) {
      filteringItems = filteringItems
          .where(
            (element) =>
                element.actionName.isNotBlank && element.actionName!.toLowerCase().contains(state.filteringText!.toLowerCase()) ||
                element.farmName.isNotBlank && element.farmName!.toLowerCase().contains(state.filteringText!.toLowerCase()),
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
