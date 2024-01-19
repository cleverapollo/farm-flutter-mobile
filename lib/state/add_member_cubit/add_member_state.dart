import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_member_state.freezed.dart';

@freezed
class MemberDetailState with _$MemberDetailState {
  const factory MemberDetailState({
    @Default(false) bool isLoading,
    required Farm? farm,
    GroupScheme? activeGroupScheme,
    @Default(MemberSLIMFState()) MemberSLIMFState memberSLIMFState,
    @Default(MemberPropertyOwnershipState()) MemberPropertyOwnershipState memberPropertyOwnershipState,
    @Default(MemberDetailSectionState()) MemberDetailSectionState memberDetailSectionState,
    @Default(MemberSiteDetailsState()) MemberSiteDetailsState memberSiteDetailsState,
    @Default(FarmMemberObjectivesState())
        FarmMemberObjectivesState farmMemberObjectivesState,
    @Default(AddMemberContract()) AddMemberContract addMemberContract,
    @Default(AddMemberSAF()) AddMemberSAF addMemberSAF,
    @Default(FarmMemberRiskAssessmentsState())
        FarmMemberRiskAssessmentsState farmMemberRiskAssessmentsState,
  }) = _MemberDetailState;
}

extension MemberDetailStateExtension on MemberDetailState {
  bool get isAllCompleted {
    return memberSLIMFState.isComplete &&
        memberPropertyOwnershipState.isComplete &&
        memberDetailSectionState.isComplete &&
        memberSiteDetailsState.isComplete &&
        farmMemberObjectivesState.isComplete &&
        addMemberSAF.isComplete &&
        farmMemberRiskAssessmentsState.isComplete;
  }
}

@freezed
class AddMemberSAF with _$AddMemberSAF {
  const factory AddMemberSAF({
    @Default(false) bool isComplete,
    @Default(false) bool isExpanded,
    String? signatureImage,
    String? signaturePoints,
    String? signatureDate,
  }) = _AddMemberSAF;
}

@freezed
class AddMemberContract with _$AddMemberContract {
  const factory AddMemberContract({
    @Default(false) bool isComplete,
    bool? isAccept,
  }) = _AddMemberContract;
}

@freezed
class MemberSLIMFState with _$MemberSLIMFState {
  const factory MemberSLIMFState({
    @Default(false) bool isComplete,
    @Default(false) bool isSectionCollapse,
    bool? isSlimfCompliant,
  }) = _MemberSLIMFState;
}

@freezed
class MemberPropertyOwnershipState with _$MemberPropertyOwnershipState {
  const factory MemberPropertyOwnershipState({
    @Default(false) bool isComplete,
    @Default(true) bool isSectionCollapse,
    FarmPropertyOwnershipType? propertyTypeSelected,
    @Default([]) List<FarmPropertyOwnershipType> propertyTypes,
  }) = _MemberPropertyOwnershipState;
}

@freezed
class MemberDetailSectionState with _$MemberDetailSectionState {
  const factory MemberDetailSectionState({
    @Default(false) bool isFirstNameError,
    @Default(false) bool isLastNameError,
    @Default(false) bool isIdNumberError,
    @Default(false) bool isMobileNumberError,
    @Default(false) bool isEmailError,
    @Default(true) bool isSectionCollapse,
    Key? sectionKey,
    String? firstName,
    String? lastName,
    String? idNumber,
    String? mobileNumber,
    String? emailAddress,
  }) = _MemberDetailSectionState;
}

extension MemberDetailsStateExtension on MemberDetailSectionState {
  bool get isComplete {
    return firstName.isNotBlank &&
        lastName.isNotBlank &&
        idNumber.isNotBlank &&
        idNumber!.length >= 8 &&
        mobileNumber.isNotBlank &&
        mobileNumber!.length >= 8;
  }
}

@freezed
class MemberSiteDetailsState with _$MemberSiteDetailsState {
  const factory MemberSiteDetailsState({
    @Default(false) bool isCompleteASI,
    @Default(false) bool isExpansionOpen,
    @Default(false) bool isSiteNameError,
    @Default(false) bool isTownError,
    @Default(false) bool isProvinceError,
    @Default(true) bool isSectionCollapse,
    Key? sectionKey,
    String? siteName,
    String? town,
    String? province,
    double? lat,
    double? lng,
    @Default(AddMemberAsisState()) AddMemberAsisState addMemberAsisState,
  }) = _MemberSiteDetailsState;
}

extension MemberSiteDetailsStateExtension on MemberSiteDetailsState {
  bool get isComplete {
    return siteName.isNotBlank &&
        town.isNotBlank &&
        province.isNotBlank &&
        isCompleteSiteLocation;
  }

  bool get isCompleteSiteLocation {
    return lat != null && lng != null;
  }

  String initAddressForSiteLocation() {
    var address = '';
    if (town != null) {
      address = town!;
    }

    if (province != null) {
      if (address.isNotEmpty) {
        address = '$address, $province';
      } else {
        address = province!;
      }
    }

    return address;
  }
}

@freezed
class AddMemberAsisState with _$AddMemberAsisState {
  const factory AddMemberAsisState({
    @Default([]) List<Asi> asis,
  }) = _AddMemberAsisState;
}

@freezed
class FarmMemberRiskAssessmentsState with _$FarmMemberRiskAssessmentsState {
  const factory FarmMemberRiskAssessmentsState({
    @Default(<RiskProfileQuestion>[])
        List<RiskProfileQuestion> listRiskProfileQuestions,
    @Default(<FarmMemberRiskProfileAnswer>[])
        List<FarmMemberRiskProfileAnswer> listFarmMemberRiskProfileAnswers,
    @Default(true) bool isSectionCollapse,
    Key? sectionKey,
  }) = _FarmMemberRiskAssessmentsState;
}

extension FarmMemberRiskAssessmentsStateExtension on FarmMemberRiskAssessmentsState {

  bool get isComplete => listFarmMemberRiskProfileAnswers.firstWhereOrNull((element) => element.answer == null) == null;

  FarmMemberRiskProfileAnswer? getFarmMemberRiskProfileAnswer(
    int riskProfileQuestionId,
  ) {
    final answer = listFarmMemberRiskProfileAnswers.firstWhereOrNull(
      (element) => element.riskProfileQuestionId == riskProfileQuestionId,
    );

    return answer;
  }
}

@freezed
class FarmMemberObjectivesState with _$FarmMemberObjectivesState {
  const factory FarmMemberObjectivesState({
    @Default(<FarmMemberObjective>[])
        List<FarmMemberObjective> listFarmMemberObjectives,
    @Default(<FarmObjectiveOption>[])
        List<FarmObjectiveOption> listFarmObjectiveOptions,
    @Default(<FarmMemberObjectiveAnswer>[])
        List<FarmMemberObjectiveAnswer> listFarmMemberObjectiveAnswers,
    @Default(true) bool isSectionCollapse,
  }) = _FarmMemberObjectivesState;
}

extension FarmMemberObjectivesStateExtension on FarmMemberObjectivesState {
  bool get isComplete => listFarmMemberObjectiveAnswers.firstWhereOrNull((element) => element.farmObjectiveOptionId == null) == null;

  String getFarmMemberObjectiveAnswerTitle(int farmMemberObjectiveId) {
    final answer = listFarmMemberObjectiveAnswers.firstWhereOrNull(
        (element) => element.farmMemberObjectiveId == farmMemberObjectiveId);
    if (answer != null) {
      final answerTitle = listFarmObjectiveOptions.firstWhereOrNull(
        (element) =>
            element.farmObjectiveOptionId == answer.farmObjectiveOptionId,
      );

      if (answerTitle == null) return '';
      return answerTitle.farmObjectiveOptionName ?? '';
    }

    return '';
  }

  FarmMemberObjectiveAnswer? getFarmMemberObjectiveAnswer(
      int farmMemberObjectiveId) {
    final answer = listFarmMemberObjectiveAnswers.firstWhereOrNull(
        (element) => element.farmMemberObjectiveId == farmMemberObjectiveId);
    return answer;
  }
}
