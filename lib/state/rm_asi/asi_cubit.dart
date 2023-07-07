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
      emit(state.copyWith(listAsi: data));
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
