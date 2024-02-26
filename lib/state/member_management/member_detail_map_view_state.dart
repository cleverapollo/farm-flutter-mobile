part of 'member_detail_map_view_cubit.dart';
class MemberDetailMapViewState {
  const MemberDetailMapViewState({
    this.farm,
    this.allRiskProfileQuestions = const <RiskProfileQuestion>[],
    this.allFarmMemberRiskProfileAnswers = const <FarmMemberRiskProfileAnswer>[],
    this.allFarmMemberObjectives = const <FarmMemberObjective>[],
    this.allFarmMemberObjectiveAnswers = const <FarmMemberObjectiveAnswer>[],
    this.markers = const <Marker>[],
    this.filteringText,
    this.isLoading = false,
    this.viewMode = MemberManagementViewMode.listView,
    this.statusFilter = MemberManagementStatusFilter.incomplete,
    this.selectedFarm,
    this.selectedCompartment,
    this.isShowSiteName = false,
  });

  final Farm? farm;

  final bool isLoading;
  final List<RiskProfileQuestion> allRiskProfileQuestions;
  final List<FarmMemberRiskProfileAnswer> allFarmMemberRiskProfileAnswers;
  final List<FarmMemberObjective> allFarmMemberObjectives;
  final List<FarmMemberObjectiveAnswer> allFarmMemberObjectiveAnswers;
  final String? filteringText;
  final MemberManagementViewMode viewMode;
  final MemberManagementStatusFilter statusFilter;
  final Farm? selectedFarm;
  final Compartment? selectedCompartment;
  final bool isShowSiteName;
  final List<Marker> markers;

  MemberDetailMapViewState copyWith({
    Farm? farm,
    List<Farm>? completedFarms,
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
    Compartment? selectedCompartment,
    bool? isShowSiteName,
    List<Marker>? markers,
  }) {
    return MemberDetailMapViewState(
      farm: farm ?? this.farm,

      isLoading: isLoading ?? this.isLoading,
      allRiskProfileQuestions: allRiskProfileQuestions ?? this.allRiskProfileQuestions,
      allFarmMemberRiskProfileAnswers: allFarmMemberRiskProfileAnswers ?? this.allFarmMemberRiskProfileAnswers,
      allFarmMemberObjectives: allFarmMemberObjectives ?? this.allFarmMemberObjectives,
      allFarmMemberObjectiveAnswers: allFarmMemberObjectiveAnswers ?? this.allFarmMemberObjectiveAnswers,
      filteringText: filteringText ?? this.filteringText,
      viewMode: viewMode ?? this.viewMode,
      statusFilter: statusFilter ?? this.statusFilter,
      selectedFarm: selectedFarm ?? this.selectedFarm,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      isShowSiteName: isShowSiteName ?? this.isShowSiteName,
      markers: markers ?? this.markers,
    );
  }
}