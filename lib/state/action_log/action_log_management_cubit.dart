import 'package:cmo/di.dart';
import 'package:cmo/enum/action_log_status_filter_enum.dart';
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
    emit(
      state.copyWith(
        activeRMU: activeRmu,
      ),
    );
  }

  void onFilterGroupChanged(ActionLogStatusFilterEnum statusFilter) {
    emit(
      state.copyWith(
        statusFilter: statusFilter,
      ),
    );
    applyFilter();
  }

  void applyFilter() {
    List<ActionLog>? filteringItems;
    switch (state.statusFilter) {
      case ActionLogStatusFilterEnum.open:
      case ActionLogStatusFilterEnum.upcoming:
      case ActionLogStatusFilterEnum.closed:
        break;
    }

    // emit(
    //   state.copyWith(
    //     filteringFarms: filteringItems,
    //   ),
    // );
  }
}
