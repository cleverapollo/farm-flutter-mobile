import 'package:cmo/di.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';

part 'stake_holder_complaint_state.dart';

class StateHolderComplaintCubit extends Cubit<StakeHolderComplaintState> {
  StateHolderComplaintCubit()
      : super(
          StakeHolderComplaintState(),
        ) {
    _onInit();
  }

  Future<void> _onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final items = await cmoDatabaseMasterService
          .getComplaintsAndDisputesRegisterByFarmId(
        farm?.farmId ?? '',
      );
      emit(state.copyWith(
        items: items,
        isDataReady: true,
      ));
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onUpdateItem(int index, ComplaintsAndDisputesRegister updatedItem) {
    final items = [...state.items];
    items[index] = updatedItem;
    emit(
      state.copyWith(
        items: items,
      ),
    );
  }

  void onInsertNewItem(ComplaintsAndDisputesRegister newItem) {
    emit(
      state.copyWith(
        items: [...state.items, newItem],
      ),
    );
  }
}
