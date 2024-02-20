import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/state/fire_cubit/fire_state.dart';
import 'package:cmo/ui/components/select_location/select_location_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireCubit extends Cubit<FireState> {
  FireCubit() : super(const FireState()) {
    initLoadData();
  }

  Future<void> initLoadData() async {
    emit(state.copyWith(isLoading: true));
    final farm = await configService.getActiveFarm();

    final result = await cmoDatabaseMasterService.getFireRegistersByFarmId(
        farmId: farm?.farmId);

    final fireCauses = await cmoDatabaseMasterService.getFireCauseByGroupSchemeId(farm?.groupSchemeId);

    emit(
      state.copyWith(
        data: result,
        dataSearch: result,
        isLoading: false,
        activeFarm: farm,
        fireCauses: fireCauses,
      ),
    );
  }

  void onSearch(String? input) {
    final listSearch = <FireRegister>[];

    if (input.isNullOrEmpty) {
      return emit(state.copyWith(data: state.dataSearch));
    }
    for (final item in state.data) {
      if (item.fireRegisterNo?.contains(input!) == true) {
        listSearch.add(item);
      }
    }
    emit(state.copyWith(data: listSearch));
  }

  Future<void> onChangeStatus(bool isOpen) async {
    final farm = await configService.getActiveFarm();

    final result = await cmoDatabaseMasterService.getFireRegistersByFarmId(
        farmId: farm?.farmId, isOpen: isOpen);

    emit(state.copyWith(
        data: result, dataSearch: result, isOpen: isOpen, isLoading: false));
  }

  String getFireCauseName(int? fireCauseId) {
    return state.fireCauses
            .firstWhereOrNull((element) => element.fireCauseId == fireCauseId)
            ?.fireCauseName ??
        '';
  }
}
