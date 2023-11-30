import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'compartment_state.dart';

class CompartmentCubit extends HydratedCubit<CompartmentState> {
  CompartmentCubit(String farmId, {String? campId})
      : super(CompartmentState(farmId: farmId, campId: campId));

  Future<void> initData() async {
    await loadListCompartment();
    final groupScheme = await configService.getActiveGroupScheme();
    final farm = await configService.getActiveFarm();
    final groupSchemeId = groupScheme?.groupSchemeId ?? farm?.groupSchemeId;
    final areaTypes = await cmoDatabaseMasterService.getAreaTypesByGroupSchemeId(groupSchemeId);
    emit(state.copyWith(areaTypes: areaTypes));
  }

  Future<void> loadListCompartment() async {
    emit(state.copyWith(loading: true));
    try {
      final userRole = await configService.getActiveUserRole();
      switch (userRole) {
        case UserRoleEnum.farmerMember:
          final farm = await configService.getActiveFarm();

          var data = await cmoDatabaseMasterService
              .getCompartmentByFarmId(farm?.farmId ?? '');
          if (data != null && state.campId != null) {
            data = data
                .where((element) => element.campId == state.campId)
                .toList();
          }
          emit(state.copyWith(listCompartment: data));
          break;
        case UserRoleEnum.regionalManager:
          final activeGroupScheme = await configService.getActiveGroupScheme();
          final data = await cmoDatabaseMasterService
              .getCompartmentsByGroupSchemeIdAndFarmId(
            groupSchemeId: activeGroupScheme?.groupSchemeId,
            farmId: state.farmId,
          );

          emit(state.copyWith(listCompartment: data));
          break;
        case UserRoleEnum.behave:
          break;
        default:
          break;
      }
    } catch (e) {
      emit(state.copyWith(error: e));
      showSnackError(msg: e.toString());
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  bool isConservationArea(Compartment compartment) {
    final conservationAreaType = state.areaTypes.firstWhereOrNull(
      (element) =>
          element.areaTypeName.isNotBlank &&
          element.areaTypeName!.toLowerCase().contains(
                'Conservation Area'.toLowerCase(),
              ),
    );

    return compartment.areaTypeId != null &&
        compartment.areaTypeId == conservationAreaType?.areaTypeId;
  }

  @override
  CompartmentState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(CompartmentState state) {
    return null;
  }
}
