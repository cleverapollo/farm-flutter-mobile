import 'package:cmo/enum/enum.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model/model.dart';

class MemberManagementState {
  const MemberManagementState({
    this.activeRMU,
    this.activeGroupScheme,
    this.filteringFarms = const [],
    this.incompleteFarms = const <Farm>[],
    this.completedFarms = const <Farm>[],
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
    this.visibleRegion,
  });

  final GroupScheme? activeGroupScheme;
  final ResourceManagerUnit? activeRMU;

  final bool isLoading;
  final List<Farm> incompleteFarms;
  final List<Farm> completedFarms;
  final List<RiskProfileQuestion> allRiskProfileQuestions;
  final List<FarmMemberRiskProfileAnswer> allFarmMemberRiskProfileAnswers;
  final List<FarmMemberObjective> allFarmMemberObjectives;
  final List<FarmMemberObjectiveAnswer> allFarmMemberObjectiveAnswers;
  final List<Farm> filteringFarms;
  final String? filteringText;
  final MemberManagementViewMode viewMode;
  final MemberManagementStatusFilter statusFilter;
  final Farm? selectedFarm;
  final Compartment? selectedCompartment;
  final bool isShowSiteName;
  final List<Marker> markers;
  final LatLngBounds? visibleRegion;

  MemberManagementState copyWith({
    List<Farm>? incompleteFarms,
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
    LatLngBounds? visibleRegion,
  }) {
    return MemberManagementState(
      activeRMU: activeRMU ?? this.activeRMU,
      activeGroupScheme: activeGroupScheme ?? this.activeGroupScheme,
      isLoading: isLoading ?? this.isLoading,
      completedFarms: completedFarms ?? this.completedFarms,
      incompleteFarms: incompleteFarms ?? this.incompleteFarms,
      allRiskProfileQuestions: allRiskProfileQuestions ?? this.allRiskProfileQuestions,
      allFarmMemberRiskProfileAnswers: allFarmMemberRiskProfileAnswers ?? this.allFarmMemberRiskProfileAnswers,
      allFarmMemberObjectives: allFarmMemberObjectives ?? this.allFarmMemberObjectives,
      allFarmMemberObjectiveAnswers: allFarmMemberObjectiveAnswers ?? this.allFarmMemberObjectiveAnswers,
      filteringFarms: filteringFarms ?? this.filteringFarms,
      filteringText: filteringText ?? this.filteringText,
      viewMode: viewMode ?? this.viewMode,
      statusFilter: statusFilter ?? this.statusFilter,
      selectedFarm: selectedFarm ?? this.selectedFarm,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      isShowSiteName: isShowSiteName ?? this.isShowSiteName,
      markers: markers ?? this.markers,
      visibleRegion: visibleRegion ?? this.visibleRegion,
    );
  }
}
