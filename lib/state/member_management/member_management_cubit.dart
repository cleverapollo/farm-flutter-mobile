import 'package:cmo/di.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/member_management/member_management_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberManagementCubit extends Cubit<MemberManagementState> {
  MemberManagementCubit() : super(const MemberManagementState());

  Future<void> init(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final groupScheme = await configService.getActiveGroupScheme();
    final rmUnit = await configService.getActiveRegionalManager();
    if (rmUnit?.id == null) {
      return;
    }
    final data = await cmoDatabaseMasterService.getFarmsByRMUnit(rmUnit!.id);
    if (data == null) {
      return;
    }

    final allFarms = <Farm>[];

    final addMemberCubit = context.read<AddMemberCubit>();

    for (final farm in data) {
      await addMemberCubit.initAddMember(farm: farm);
      await addMemberCubit.stepCount();

      allFarms.add(farm.copyWith(
        stepCount: addMemberCubit.state.farm?.stepCount,
        isGroupSchemeMember: addMemberCubit.state.farm?.isGroupSchemeMember,
      ));
    }

    emit(state.copyWith(
      groupScheme: groupScheme,
      resourceManagerUnit: rmUnit,
      allFarms: allFarms,
    ));
    _applySearch(isInCompleteSelected: true);

    await initDataCompartments();
    await initDataRiskProfileQuestion();
    await initDataFarmMemberObjectives();
    emit(state.copyWith(isLoading: false));
  }

  Future<void> initDataCompartments() async {
    final compartments = await cmoDatabaseMasterService.getAllCompartments();
    emit(
      state.copyWith(
        allCompartments: compartments,
      ),
    );
  }

  Future<void> initDataRiskProfileQuestion() async {
    final activeGroupScheme = await configService.getActiveGroupScheme();

    final riskProfileQuestions =
        await cmoDatabaseMasterService.getRiskProfileQuestionByGroupSchemeId(
      activeGroupScheme?.groupSchemeId,
    );

    final farmMemberRiskProfileAnswer =
        await cmoDatabaseMasterService.getAllFarmMemberRiskProfileAnswers();

    emit(
      state.copyWith(
        allRiskProfileQuestions: riskProfileQuestions,
        allFarmMemberRiskProfileAnswers: farmMemberRiskProfileAnswer,
      ),
    );
  }

  Future<void> initDataFarmMemberObjectives() async {
    final activeGroupScheme = await configService.getActiveGroupScheme();

    final farmMemberObjective =
        await cmoDatabaseMasterService.getAllFarmMemberObjectiveByGroupSchemeId(
      activeGroupScheme?.groupSchemeId,
    );

    final farmMemberObjectiveAnswers =
        await cmoDatabaseMasterService.getAllFarmMemberObjectiveAnswer();

    emit(
      state.copyWith(
        allFarmMemberObjectives: farmMemberObjective,
        allFarmMemberObjectiveAnswers: farmMemberObjectiveAnswers,
      ),
    );
  }

  Future reload() async {
    emit(state.copyWith(isLoading: true));
    final rmUnit = await configService.getActiveRegionalManager();
    if (rmUnit?.id == null) {
      return;
    }
    var data = await cmoDatabaseMasterService.getFarmsByRMUnit(rmUnit!.id);
    emit(state.copyWith(allFarms: data));
    _applySearch(isInCompleteSelected: state.isInCompleteSelected);
    await initDataCompartments();
    await initDataRiskProfileQuestion();
    await initDataFarmMemberObjectives();
    emit(state.copyWith(isLoading: false));
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
    await cmoDatabaseMasterService.cacheFarmAddMember(farm.copyWith(isActive: false));
    showSnackSuccess(
      msg: '${LocaleKeys.remove.tr()} ${farm.id}!',
    );

    await reload();
  }
}
