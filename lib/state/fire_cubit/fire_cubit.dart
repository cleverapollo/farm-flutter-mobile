import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/model/fire/fire_register.dart';
import 'package:cmo/model/fire_cause/fire_cause.dart';
import 'package:cmo/state/fire_cubit/fire_state.dart';
import 'package:cmo/ui/screens/perform/farmer_member/register_management/select_location/select_location_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FireCubit extends Cubit<FireState> {
  FireCubit() : super(const FireState());

  Future<void> initLoadData() async {
    emit(state.copyWith(isLoading: true));
    final farm = await configService.getActiveFarm();

    final result = await cmoDatabaseMasterService.getFireRegistersByFarmId(
        farmId: farm?.farmId);

    emit(
      state.copyWith(
        data: result,
        dataSearch: result,
        isLoading: false,
        activeFarm: farm,
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

  Future<void> initAddData({
    FireRegister? fireRegister,
    required LocationModel locationModel,
  }) async {
    emit(state.copyWith(isLoading: true));

    final farm = await configService.getActiveFarm();

    final fireCauses = await cmoDatabaseMasterService
        .getFireCauseByGroupSchemeId(farm?.groupSchemeId ?? 0);

    emit(state.copyWith(
      fireCauses: fireCauses,
      isLoading: false,
      activeFarm: farm,
    ));

    if (fireRegister != null) {
      final fireCauseSelect = state.fireCauses
          .firstWhereOrNull((e) => e.fireCauseId == fireRegister.fireCauseId);

      emit(state.copyWith(
        fireCauseSelect: fireCauseSelect,
        fireRegister: fireRegister,
        fireRegisterBeforeEdit: fireRegister,
        asiPhotos: fireRegister.asiPhotos
            ?.map((e) => AsiPhoto(
                  asiRegisterNo:
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  asiRegisterPhotoNo:
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  photo: e,
                  isActive: true,
                  isMasterdataSynced: false,
                  photoName: DateTime.now().microsecondsSinceEpoch.toString(),
                ))
            .toList() ?? [],
      ));
    }
  }
}
