import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/resource_manager_unit.dart';

import '../../model/model.dart';

class MemberManagementState {
  const MemberManagementState({
    this.allFarms = const [],
    this.allCompartments = const <Compartment>[],
    this.allRiskProfileQuestions = const <RiskProfileQuestion>[],
    this.allFarmMemberRiskProfileAnswers = const <FarmMemberRiskProfileAnswer>[],
    this.allFarmMemberObjectives = const <FarmMemberObjective>[],
    this.allFarmMemberObjectiveAnswers = const <FarmMemberObjectiveAnswer>[],
    this.filteringFarms = const [],
    this.resourceManagerUnit,
    this.groupScheme,
    this.filteringText,
    this.isInCompleteSelected = true,
    this.isLoading = false,
  });

  final bool isLoading;
  final List<Farm> allFarms;
  final List<Compartment> allCompartments;
  final List<RiskProfileQuestion> allRiskProfileQuestions;
  final List<FarmMemberRiskProfileAnswer> allFarmMemberRiskProfileAnswers;
  final List<FarmMemberObjective> allFarmMemberObjectives;
  final List<FarmMemberObjectiveAnswer> allFarmMemberObjectiveAnswers;
  final ResourceManagerUnit? resourceManagerUnit;
  final GroupScheme? groupScheme;
  final List<Farm> filteringFarms;
  final String? filteringText;
  final bool isInCompleteSelected;

  MemberManagementState copyWith({
    List<Farm>? allFarms,
    List<Compartment>? allCompartments,
    List<RiskProfileQuestion>? allRiskProfileQuestions,
    List<FarmMemberRiskProfileAnswer>? allFarmMemberRiskProfileAnswers,
    List<FarmMemberObjective>? allFarmMemberObjectives,
    List<FarmMemberObjectiveAnswer>? allFarmMemberObjectiveAnswers,
    ResourceManagerUnit? resourceManagerUnit,
    GroupScheme? groupScheme,
    List<Farm>? filteringFarms,
    String? filteringText,
    bool? isInCompleteSelected,
    bool? isLoading,
  }) {
    return MemberManagementState(
      isLoading: isLoading ?? this.isLoading,
      allFarms: allFarms ?? this.allFarms,
      allCompartments: allCompartments ?? this.allCompartments,
      allRiskProfileQuestions: allRiskProfileQuestions ?? this.allRiskProfileQuestions,
      allFarmMemberRiskProfileAnswers: allFarmMemberRiskProfileAnswers ?? this.allFarmMemberRiskProfileAnswers,
      allFarmMemberObjectives: allFarmMemberObjectives ?? this.allFarmMemberObjectives,
      allFarmMemberObjectiveAnswers: allFarmMemberObjectiveAnswers ?? this.allFarmMemberObjectiveAnswers,
      resourceManagerUnit: resourceManagerUnit ?? this.resourceManagerUnit,
      groupScheme: groupScheme ?? this.groupScheme,
      filteringFarms: filteringFarms ?? this.filteringFarms,
      filteringText: filteringText ?? this.filteringText,
      isInCompleteSelected: isInCompleteSelected ?? this.isInCompleteSelected,
    );
  }
}
