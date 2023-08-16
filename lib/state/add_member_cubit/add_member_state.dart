import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/asi.dart';
import 'package:cmo/model/compartment/compartment.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/data/farm_property_ownership_type.dart';
import 'package:cmo/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_member_state.freezed.dart';

@freezed
class AddMemberState with _$AddMemberState {
  const factory AddMemberState({
    @Default(false) bool isLoading,
    Farm? farm,
    @Default(AddMemberSLIMF()) AddMemberSLIMF addMemberSLIMF,
    @Default(AddMemberMPO()) AddMemberMPO addMemberMPO,
    @Default(AddMemberMDetails()) AddMemberMDetails addMemberMDetails,
    @Default(AddMemberSDetails()) AddMemberSDetails addMemberSDetails,
    @Default(FarmMemberObjectivesState()) FarmMemberObjectivesState farmMemberObjectivesState,
    @Default(AddMemberContract()) AddMemberContract addMemberContract,
    @Default(AddMemberSAF()) AddMemberSAF addMemberSAF,
    @Default(FarmMemberRiskAssessmentsState()) FarmMemberRiskAssessmentsState farmMemberRiskAssessmentsState,
    @Default(AddMemberClose()) AddMemberClose addMemberClose,
  }) = _AddMemberState;
}

extension AddMemberStateExtension on AddMemberState {
  AddMemberState cleanCache() {
    return const AddMemberState();
  }
}

@freezed
class AddMemberSAF with _$AddMemberSAF {
  const factory AddMemberSAF({
    @Default(false) bool isComplete,
    String? signatureImage,
    String? signaturePoints,
    String? signatureDate,
  }) = _AddMemberSAF;
}

@freezed
class AddMemberClose with _$AddMemberClose {
  const factory AddMemberClose({
    @Default(false) bool isComplete,
    bool? isClose,
  }) = _AddMemberClose;
}

@freezed
class AddMemberContract with _$AddMemberContract {
  const factory AddMemberContract({
    @Default(false) bool isComplete,
    bool? isAccept,
  }) = _AddMemberContract;
}

@freezed
class AddMemberSLIMF with _$AddMemberSLIMF {
  const factory AddMemberSLIMF({
    @Default(false) bool isComplete,
    @Default(false) bool isSectionCollapse,
    bool? isSlimfCompliant,
  }) = _AddMemberSLIMF;
}

@freezed
class AddMemberMPO with _$AddMemberMPO {
  const factory AddMemberMPO({
    @Default(false) bool isComplete,
    @Default(false) bool isExpansionOpen,
    @Default(true) bool isSectionCollapse,
    FarmPropertyOwnershipType? propertyTypeSelected,
    @Default([]) List<FarmPropertyOwnershipType> propertyTypes,
  }) = _AddMemberMPO;
}

@freezed
class AddMemberMDetails with _$AddMemberMDetails {
  const factory AddMemberMDetails({
    @Default(false) bool isComplete,
    @Default(false) bool isFirstNameError,
    @Default(false) bool isLastNameError,
    @Default(false) bool isIdNumberError,
    @Default(false) bool isMobileNumberError,
    @Default(true) bool isSectionCollapse,
    Key? sectionKey,
    String? firstName,
    String? lastName,
    String? idNumber,
    String? mobileNumber,
    String? emailAddress,
  }) = _AddMemberMDetails;
}

@freezed
class AddMemberSDetails with _$AddMemberSDetails {
  const factory AddMemberSDetails({
    @Default(false) bool isComplete,
    @Default(false) bool isCompleteSiteLocation,
    @Default(false) bool isCompleteCompartments,
    @Default(false) bool isExpansionOpen,
    @Default(false) bool isSiteNameError,
    @Default(false) bool isTownError,
    @Default(false) bool isProvinceError,
    @Default(true) bool isSectionCollapse,
    Key? sectionKey,
    String? siteName,
    String? town,
    String? province,
    @Default(AddMemberSiteLocations())
        AddMemberSiteLocations addMemberSiteLocations,
    @Default(AddMemberCompartmentsState())
        AddMemberCompartmentsState addMemberCompartmentsState,
    @Default(AddMemberAsisState()) AddMemberAsisState addMemberAsisState,
  }) = _AddMemberSDetails;
}

extension AddMemberSDetailsExtension on AddMemberSDetails {
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
class AddMemberSiteLocations with _$AddMemberSiteLocations {
  const factory AddMemberSiteLocations({
    double? lat,
    double? lng,
    String? address,
  }) = _AddMemberSiteLocations;
}

@freezed
class AddMemberCompartmentsState with _$AddMemberCompartmentsState {
  const factory AddMemberCompartmentsState({
    @Default([]) List<Compartment> compartments,
    double? farmSize,
  }) = _AddMemberCompartmentsState;
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
    @Default(<RiskProfileQuestion>[]) List<RiskProfileQuestion> listRiskProfileQuestions,
    @Default(<FarmMemberRiskProfileAnswer>[]) List<FarmMemberRiskProfileAnswer> listFarmMemberRiskProfileAnswers,
    @Default(true) bool isSectionCollapse,
    Key? sectionKey,
  }) = _FarmMemberRiskAssessmentsState;
}

extension FarmMemberRiskAssessmentsStateExtension
    on FarmMemberRiskAssessmentsState {
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
    @Default(<FarmMemberObjective>[]) List<FarmMemberObjective> listFarmMemberObjectives,
    @Default(<FarmObjectiveOption>[]) List<FarmObjectiveOption> listFarmObjectiveOptions,
    @Default(<FarmMemberObjectiveAnswer>[]) List<FarmMemberObjectiveAnswer> listFarmMemberObjectiveAnswers,
    @Default(true) bool isSectionCollapse,
  }) = _FarmMemberObjectivesState;
}

extension FarmMemberObjectivesStateExtension on FarmMemberObjectivesState {
  bool get isComplete => listFarmMemberObjectiveAnswers.firstWhereOrNull((element) => element.farmObjectiveOptionId == null) == null;

  String getFarmMemberObjectiveAnswerTitle(int farmMemberObjectiveId) {
    final answer = listFarmMemberObjectiveAnswers.firstWhereOrNull((element) => element.farmMemberObjectiveId == farmMemberObjectiveId);
    if (answer != null) {
      final answerTitle = listFarmObjectiveOptions.firstWhereOrNull(
        (element) => element.farmObjectiveOptionId == answer.farmObjectiveOptionId,
      );

      if (answerTitle == null) return '';
      return answerTitle.farmObjectiveOptionName ?? '';
    }

    return '';
  }

  FarmMemberObjectiveAnswer? getFarmMemberObjectiveAnswer(int farmMemberObjectiveId) {
    final answer = listFarmMemberObjectiveAnswers.firstWhereOrNull((element) => element.farmMemberObjectiveId == farmMemberObjectiveId);
    return answer;
  }
}
