import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'employee_grievance_state.dart';

class EmployeeGrievanceCubit extends Cubit<EmployeeGrievanceState> {
  EmployeeGrievanceCubit()
      : super(
          EmployeeGrievanceState(),
        ) {
    _onInit();
  }

  Future<void> _onInit() async {
    try {
      final farm = await configService.getActiveFarm();
      final items = await cmoDatabaseMasterService
          .getEmployeeGrievancesByFarmId(farm!.farmId);
      emit(
        state.copyWith(
          items: items,
          isDataReady: true,
        ),
      );
    } catch (e) {
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(isDataReady: true));
    }
  }

  void onUpdateItem(int index, GrievanceRegister updatedItem) {
    final items = [...state.items];
    items[index] = updatedItem;
    emit(
      state.copyWith(
        items: items,
      ),
    );
  }

  void onInsertNewItem(GrievanceRegister newItem) {
    emit(
      state.copyWith(
        items: [...state.items, newItem],
      ),
    );
  }
}
