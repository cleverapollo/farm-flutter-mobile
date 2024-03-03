import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MemberManagementCubit extends Cubit<MemberManagementState> {
  MemberManagementCubit() : super(const MemberManagementState()) {
    init();
  }

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final groupScheme = await configService.getActiveGroupScheme();
    final rmUnit = await configService.getActiveRegionalManager();

    emit(
      state.copyWith(
        activeGroupScheme: groupScheme,
        activeRMU: rmUnit,
      ),
    );

    await refresh();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> refresh() async {
    await getListFarms();
    await getListRiskProfileQuestionsAndAnswers();
    await getListFarmMemberObjectivesAndAnswers();
    applyFilter();
  }

  Future<void> getListFarms() async {
    final incompleteFarms = await cmoDatabaseMasterService.getFarmsByRMUnit(
      state.activeRMU?.regionalManagerUnitId,
      isCompleted: false,
      includedAsi: true,
      includedCompartments: true,
    );
    final completedFarms = await cmoDatabaseMasterService.getFarmsByRMUnit(
      state.activeRMU?.regionalManagerUnitId,
      isCompleted: true,
      includedAsi: true,
      includedCompartments: true,
    );
    emit(
      state.copyWith(
        incompleteFarms: incompleteFarms,
        completedFarms: completedFarms,
      ),
    );
  }

  Future<void> getListRiskProfileQuestionsAndAnswers() async {
    final riskProfileQuestions = await cmoDatabaseMasterService.getRiskProfileQuestionByGroupSchemeId(
      state.activeGroupScheme?.groupSchemeId,
    );

    final farmMemberRiskProfileAnswer = await cmoDatabaseMasterService.getAllFarmMemberRiskProfileAnswers();

    emit(
      state.copyWith(
        allRiskProfileQuestions: riskProfileQuestions,
        allFarmMemberRiskProfileAnswers: farmMemberRiskProfileAnswer,
      ),
    );
  }

  Future<void> getListFarmMemberObjectivesAndAnswers() async {
    final farmMemberObjective = await cmoDatabaseMasterService.getAllFarmMemberObjectiveByGroupSchemeId(
      state.activeGroupScheme?.groupSchemeId,
    );

    final farmMemberObjectiveAnswers = await cmoDatabaseMasterService.getAllFarmMemberObjectiveAnswer();

    emit(
      state.copyWith(
        allFarmMemberObjectives: farmMemberObjective,
        allFarmMemberObjectiveAnswers: farmMemberObjectiveAnswers,
      ),
    );
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
        filteringFarms: state.completedFarms,
      ),
    );
  }

  Future<void> onShowMemberDetailMapView() async {
    emit(
      state.copyWith(
        viewMode: MemberManagementViewMode.mapDetailView,
      ),
    );

    await generateListMarker();
  }

  Future<void> updateShowSiteName() async {
    emit(
      state.copyWith(
        isShowSiteName: !state.isShowSiteName,
      ),
    );

    await generateListMarker();
  }

  void updateSelectedFarm(Farm farm) {
    emit(
      state.copyWith(
        selectedFarm: farm,
      ),
    );
  }

  Future<void> onSearchTextChanged(String? value) async {
    await Future.delayed(const Duration(milliseconds: 200));
    emit(
      state.copyWith(
        filteringText: value,
      ),
    );
    applyFilter();
  }

  void onFilterGroupChanged(MemberManagementStatusFilter statusFilter) {
    emit(
      state.copyWith(
        statusFilter: statusFilter,
      ),
    );
    applyFilter();
  }

  void applyFilter() {
    List<Farm>? filteringItems;
    switch (state.statusFilter) {
      case MemberManagementStatusFilter.incomplete:
        filteringItems = state.incompleteFarms;
        break;
      case MemberManagementStatusFilter.complete:
        filteringItems = state.completedFarms;
        break;
    }

    if (state.filteringText.isNotBlank) {
      filteringItems = filteringItems.where((element) {
        final searchStr = state.filteringText!.toLowerCase();
        final existFarmName = element.farmName?.toLowerCase().contains(searchStr) ?? false;
        final existFirstName = element.firstName?.toLowerCase().contains(searchStr) ?? false;
        final existLastName = element.lastName?.toLowerCase().contains(searchStr) ?? false;
        return existFarmName || existFirstName || existLastName;
      }).toList();
    }

    emit(
      state.copyWith(
        filteringFarms: filteringItems,
      ),
    );
  }

  Future<void> onRemoveFarm(Farm farm) async {
    await cmoDatabaseMasterService.cacheFarm(
      farm.copyWith(
        isActive: false,
        isMasterDataSynced: false,
      ),
    );

    showSnackSuccess(
      msg: '${LocaleKeys.remove.tr()} ${farm.id}!',
    );

    await refresh();
  }

  double calculateTotalFarmSizeRmu() {
    var totalSizes = 0.0;
    for(final farm in state.completedFarms) {
      totalSizes += farm.calculateFarmSizeBasedOnCompartments();
    }

    return totalSizes;
  }

  Future<void> generateListMarker() async {
    final markers = <Marker>[];
    if (state.completedFarms.isNotBlank && state.isShowSiteName) {
      for (final farm in state.completedFarms) {
        for (final compartment in farm.compartments ?? <Compartment>[]) {
          final centerPoint = compartment.centerPoint();
          final marker = Marker(
            markerId: MarkerId('place_name_${centerPoint.latitude}_${centerPoint.longitude}'),
            position: centerPoint,
            icon: await BitmapDescriptorHelper.getBytesFromCanvasDynamic(
              title: farm.farmName,
              // subtitle: 'managementUnitName',
            ),
          );

          markers.add(marker);
        }
      }
    }

    emit(
      state.copyWith(
        markers: markers,
      ),
    );
  }
}
