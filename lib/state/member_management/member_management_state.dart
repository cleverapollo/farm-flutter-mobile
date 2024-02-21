import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/resource_manager_unit.dart';

import '../../model/model.dart';

class MemberManagementState {
  const MemberManagementState({
    this.activeRMU,
    this.activeGroupScheme,
    this.allFarms = const [],
    this.filteringFarms = const [],
    this.incompleteFarms = const <Farm>[],
    this.completedFarms = const <Farm>[],
    this.allCompartments = const <Compartment>[],
    this.allRiskProfileQuestions = const <RiskProfileQuestion>[],
    this.allFarmMemberRiskProfileAnswers = const <FarmMemberRiskProfileAnswer>[],
    this.allFarmMemberObjectives = const <FarmMemberObjective>[],
    this.allFarmMemberObjectiveAnswers = const <FarmMemberObjectiveAnswer>[],
    this.filteringText,
    this.isInCompleteSelected = true,
    this.isLoading = false,
  });

  final GroupScheme? activeGroupScheme;
  final ResourceManagerUnit? activeRMU;

  final bool isLoading;
  final List<Farm> allFarms;
  final List<Farm> incompleteFarms;
  final List<Farm> completedFarms;
  final List<Compartment> allCompartments;
  final List<RiskProfileQuestion> allRiskProfileQuestions;
  final List<FarmMemberRiskProfileAnswer> allFarmMemberRiskProfileAnswers;
  final List<FarmMemberObjective> allFarmMemberObjectives;
  final List<FarmMemberObjectiveAnswer> allFarmMemberObjectiveAnswers;
  final List<Farm> filteringFarms;
  final String? filteringText;
  final bool isInCompleteSelected;

  MemberManagementState copyWith({
    List<Farm>? allFarms,
    List<Farm>? incompleteFarms,
    List<Farm>? completedFarms,
    List<Compartment>? allCompartments,
    List<RiskProfileQuestion>? allRiskProfileQuestions,
    List<FarmMemberRiskProfileAnswer>? allFarmMemberRiskProfileAnswers,
    List<FarmMemberObjective>? allFarmMemberObjectives,
    List<FarmMemberObjectiveAnswer>? allFarmMemberObjectiveAnswers,
    ResourceManagerUnit? activeRMU,
    GroupScheme? activeGroupScheme,
    List<Farm>? filteringFarms,
    String? filteringText,
    bool? isInCompleteSelected,
    bool? isLoading,
  }) {
    return MemberManagementState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeGroupScheme: activeGroupScheme ?? this.activeGroupScheme,
      isLoading: isLoading ?? this.isLoading,
      allFarms: allFarms ?? this.allFarms,
      completedFarms: completedFarms ?? this.completedFarms,
      incompleteFarms: incompleteFarms ?? this.incompleteFarms,
      allCompartments: allCompartments ?? this.allCompartments,
      allRiskProfileQuestions: allRiskProfileQuestions ?? this.allRiskProfileQuestions,
      allFarmMemberRiskProfileAnswers: allFarmMemberRiskProfileAnswers ?? this.allFarmMemberRiskProfileAnswers,
      allFarmMemberObjectives: allFarmMemberObjectives ?? this.allFarmMemberObjectives,
      allFarmMemberObjectiveAnswers: allFarmMemberObjectiveAnswers ?? this.allFarmMemberObjectiveAnswers,
      filteringFarms: filteringFarms ?? this.filteringFarms,
      filteringText: filteringText ?? this.filteringText,
      isInCompleteSelected: isInCompleteSelected ?? this.isInCompleteSelected,
    );
  }
}
