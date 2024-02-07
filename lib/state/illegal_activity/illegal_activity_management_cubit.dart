import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';

part 'illegal_activity_management_state.dart';

class IllegalActivityManagementCubit extends Cubit<IllegalActivityManagementState> {
  IllegalActivityManagementCubit()
      : super(
    IllegalActivityManagementState(),
        ) {
    init();
  }

  Future<void> init() async {
    try {
      final farm = await configService.getActiveFarm();
      final items = await cmoDatabaseMasterService.getAllIllegalActivityRegisters();
      emit(
        state.copyWith(
          items: items,
          filterItems: items,
          activeFarm: farm,
        ),
      );

      applyFilter();
    } catch (e) {
      showSnackError(msg: e.toString());
    }
  }

  void onSearch(String? inputSearch) {
    emit(
      state.copyWith(
        inputSearch: inputSearch,
      ),
    );

    applyFilter();
  }

  void onFilterStatus(StatusFilterEnum statusFilter) {
    emit(
      state.copyWith(
        statusFilter: statusFilter,
      ),
    );

    applyFilter();
  }

  void applyFilter() {
    var filterItems = <IllegalActivityRegister>[];
    switch (state.statusFilter) {
      case StatusFilterEnum.open:
        filterItems = state.items.where((element) => element.dateClosed == null).toList();
        break;
      case StatusFilterEnum.closed:
        filterItems = state.items.where((element) => element.dateClosed != null).toList();
        break;
    }

    if (state.inputSearch.isNotBlank) {
      filterItems = filterItems
          .where(
            (element) =>
                element.issueRaised != null &&
                element.issueRaised!.contains(state.inputSearch!),
          )
          .toList();
    }

    emit(
      state.copyWith(
        filterItems: filterItems,
      ),
    );
  }
}
