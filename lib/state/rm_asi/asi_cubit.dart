import 'package:cmo/di.dart';
import 'package:cmo/state/rm_asi/asi_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsiCubit extends Cubit<AsiState> {
  AsiCubit(String farmId, {String? campId}) : super(AsiState(farmId: farmId, campId: campId));

  Future<void> loadAsis() async {
    try {
      var data =
          await cmoDatabaseMasterService.getAsiRegisterByFarmId(state.farmId);
      if (state.campId != null) {
        data = data.where((element) => element.campId == state.campId).toList();
      }
      emit(
        state.copyWith(
          listAsi: data,
          filterAsi: data,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void searching(String? input) {
    if (input == null || input.isEmpty) {
      emit(
        state.copyWith(
          filterAsi: state.listAsi,
        ),
      );
    } else {
      emit(
        state.copyWith(
          filterAsi: state.listAsi
              .where(
                (element) =>
                    element.asiTypeName
                        ?.toString()
                        .toLowerCase()
                        .contains(input.toLowerCase()) ??
                    false,
              )
              .toList(),
        ),
      );
    }
  }
}
