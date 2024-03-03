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
      : super(CompartmentState(farmId: farmId, campId: campId)) {
    initData();
  }

  Future<void> initData() async {
    final groupScheme = await configService.getActiveGroupScheme();
    final farm = await configService.getActiveFarm();
    final groupSchemeId = groupScheme?.groupSchemeId ?? farm?.groupSchemeId;

    final areaTypes = await cmoDatabaseMasterService.getAreaTypesByGroupSchemeId(groupSchemeId);
    final userRole = await configService.getActiveUserRole();

    emit(
      state.copyWith(
        areaTypes: areaTypes,
        currentUserRole: userRole,
        activeFarm: farm,
      ),
    );

    await loadListCompartment();
  }

  Future<void> loadListCompartment() async {
    emit(state.copyWith(loading: true));
    try {
      var listCompartment = <Compartment>[];

      switch (state.currentUserRole) {
        case UserRoleEnum.farmerMember:
          final farm = await configService.getActiveFarm();

          listCompartment = await cmoDatabaseMasterService
              .getCompartmentByFarmId(farm?.farmId ?? '');
          if (state.campId != null) {
            listCompartment = listCompartment
                .where((element) => element.campId == state.campId)
                .toList();
          }
          break;
        case UserRoleEnum.regionalManager:
          final activeGroupScheme = await configService.getActiveGroupScheme();
          listCompartment = await cmoDatabaseMasterService
              .getCompartmentsByGroupSchemeIdAndFarmId(
            groupSchemeId: activeGroupScheme?.groupSchemeId,
            farmId: state.farmId,
          );
          break;
        case UserRoleEnum.behave:
          break;
        default:
          break;
      }

      var totalSize = 0.0;
      for (final compartment in listCompartment) {
        totalSize += compartment.polygonArea ?? 0.0;
      }

      emit(
        state.copyWith(
          listCompartment: listCompartment,
          filterCompartment: listCompartment,
          totalSize: totalSize,
        ),
      );
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

  void onChangeViewMode() {
    var currentViewMode = state.viewMode;
    if (currentViewMode == MemberManagementViewMode.mapView) {
      currentViewMode =  MemberManagementViewMode.listView;
    } else {
      currentViewMode =  MemberManagementViewMode.mapView;
    }

    emit(
      state.copyWith(
        viewMode: currentViewMode,
        filterCompartment: state.listCompartment,
      ),
    );
  }

  void onSearchCompartment(String? searchText) {
    var filteringItems = state.listCompartment;
    if (searchText.isNotBlank) {
      filteringItems = filteringItems
          .where(
            (element) => (element.unitNumber ?? '').toLowerCase().contains(
                  searchText!.toLowerCase(),
                ),
          )
          .toList();
    }

    emit(
      state.copyWith(
        filterCompartment: filteringItems,
      ),
    );
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
