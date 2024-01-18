import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    await getListFarms();
    await getListCompartment();
    await getListRiskProfileQuestionsAndAnswers();
    await getListFarmMemberObjectivesAndAnswers();
    _applySearch(isInCompleteSelected: true);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> getListFarms() async {
    final listFarms = await cmoDatabaseMasterService.getFarmsByRMUnit(state.activeRMU?.regionalManagerUnitId);

    emit(
      state.copyWith(
        allFarms: listFarms,
      ),
    );
  }

  Future<void> getListCompartment() async {
    final compartments = await cmoDatabaseMasterService.getAllCompartments();
    emit(
      state.copyWith(
        allCompartments: compartments,
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

  Future<void> reload() async {
    await getListFarms();
    await getListCompartment();
    await getListRiskProfileQuestionsAndAnswers();
    await getListFarmMemberObjectivesAndAnswers();
    _applySearch(isInCompleteSelected: state.isInCompleteSelected);
  }

  void onSearchTextChanged(String? value) {
    _applySearch(
        searchText: value, isInCompleteSelected: state.isInCompleteSelected);
  }

  void onFilterGroupChanged(bool isInCompleteSelected) {
    _applySearch(
        searchText: state.filteringText,
        isInCompleteSelected: isInCompleteSelected);
  }

  void _applySearch({String? searchText, required bool isInCompleteSelected}) {
    var filteringItems = state.allFarms.where((element) => !isInCompleteSelected
        ? element.isGroupSchemeMember == true
        : element.isGroupSchemeMember != true);
    if (searchText?.isNotEmpty ?? false) {
      filteringItems = filteringItems.where((element) {
        final searchStr = searchText!.toLowerCase();
        final existFarmName =
            element.farmName?.toLowerCase().contains(searchStr) ?? false;
        final existFirstName =
            element.firstName?.toLowerCase().contains(searchStr) ?? false;
        final existLastName =
            element.lastName?.toLowerCase().contains(searchStr) ?? false;
        return existFarmName || existFirstName || existLastName;
      });
    }
    emit(state.copyWith(
      filteringFarms: filteringItems.toList(),
      filteringText: searchText ?? '',
      isInCompleteSelected: isInCompleteSelected,
    ));
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

    await reload();
  }
}
