import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/rm_asi/asi_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsiCubit extends Cubit<AsiState> {
  AsiCubit(String farmId, {String? campId}) : super(AsiState(farmId: farmId, campId: campId)) {
    loadAsis();
  }

  Future<void> loadAsis() async {
    try {
      var data = await cmoDatabaseMasterService.getAsiRegisterByFarmId(state.farmId);
      final asiTypes = await cmoDatabaseMasterService.getAsiTypes();

      if (state.campId != null) {
        data = data.where((element) => element.campId == state.campId).toList();
      }
      emit(
        state.copyWith(
          listAsi: data,
          filterAsi: data,
          asiTypes: asiTypes,
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
                    element.compartmentName
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

  String getAsiTypeName(Asi asi) {
    return state.asiTypes
            .firstWhereOrNull((element) => element.asiTypeId == asi.asiTypeId)
            ?.asiTypeName ??
        '';
  }
}
