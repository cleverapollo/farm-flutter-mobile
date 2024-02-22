import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/resource_manager_unit.dart';

import '../../model/model.dart';
enum MemberManagementViewMode {
  listView,
  mapView
}

enum MemberManagementStatusFilter {
  incomplete,
  complete
}

class MemberManagementState {
  const MemberManagementState({
    this.activeRMU,
    this.activeGroupScheme,
    this.filteringFarms = const [],
    this.incompleteFarms = const <Farm>[],
    this.completedFarms = const <Farm>[],
    this.allCompartments = const <Compartment>[],
    this.allRiskProfileQuestions = const <RiskProfileQuestion>[],
    this.allFarmMemberRiskProfileAnswers = const <FarmMemberRiskProfileAnswer>[],
    this.allFarmMemberObjectives = const <FarmMemberObjective>[],
    this.allFarmMemberObjectiveAnswers = const <FarmMemberObjectiveAnswer>[],
    this.filteringText,
    this.isLoading = false,
    this.viewMode = MemberManagementViewMode.listView,
    this.statusFilter = MemberManagementStatusFilter.incomplete,
    this.selectedFarm,
  });

  final GroupScheme? activeGroupScheme;
  final ResourceManagerUnit? activeRMU;

  final bool isLoading;
  final List<Farm> incompleteFarms;
  final List<Farm> completedFarms;
  final List<Compartment> allCompartments;
  final List<RiskProfileQuestion> allRiskProfileQuestions;
  final List<FarmMemberRiskProfileAnswer> allFarmMemberRiskProfileAnswers;
  final List<FarmMemberObjective> allFarmMemberObjectives;
  final List<FarmMemberObjectiveAnswer> allFarmMemberObjectiveAnswers;
  final List<Farm> filteringFarms;
  final String? filteringText;
  final MemberManagementViewMode viewMode;
  final MemberManagementStatusFilter statusFilter;
  final Farm? selectedFarm;

  MemberManagementState copyWith({
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
    bool? isLoading,
    MemberManagementViewMode? viewMode,
    MemberManagementStatusFilter? statusFilter,
    Farm? selectedFarm,
  }) {
    return MemberManagementState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeGroupScheme: activeGroupScheme ?? this.activeGroupScheme,
      isLoading: isLoading ?? this.isLoading,
      completedFarms: completedFarms ?? this.completedFarms,
      incompleteFarms: incompleteFarms ?? this.incompleteFarms,
      allCompartments: allCompartments ?? this.allCompartments,
      allRiskProfileQuestions: allRiskProfileQuestions ?? this.allRiskProfileQuestions,
      allFarmMemberRiskProfileAnswers: allFarmMemberRiskProfileAnswers ?? this.allFarmMemberRiskProfileAnswers,
      allFarmMemberObjectives: allFarmMemberObjectives ?? this.allFarmMemberObjectives,
      allFarmMemberObjectiveAnswers: allFarmMemberObjectiveAnswers ?? this.allFarmMemberObjectiveAnswers,
      filteringFarms: filteringFarms ?? this.filteringFarms,
      filteringText: filteringText ?? this.filteringText,
      viewMode: viewMode ?? this.viewMode,
      statusFilter: statusFilter ?? this.statusFilter,
      selectedFarm: selectedFarm ?? this.selectedFarm,
    );
  }
}
