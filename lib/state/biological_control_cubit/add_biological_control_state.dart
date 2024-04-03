part of 'add_biological_control_cubit.dart';

class AddBiologicalControlState extends BaseState {
  AddBiologicalControlState({
    required this.agent,
    this.isAddNew = true,
    this.isDataReady = false,
    this.selectStakeHolder,
    this.stakeHolders = const [],
    this.monitorings = const [],
    this.agentTypes = const [],
    this.countries = const <Country>[],
    this.isSelectControlAgentError = false,
    super.isEditing,
  });

  final bool isDataReady;
  final bool isAddNew;
  StakeHolder? selectStakeHolder;
  BiologicalControlAgent agent;
  final List<StakeHolder> stakeHolders;
  final List<MonitoringRequirement> monitorings;
  final List<BiologicalControlAgentType> agentTypes;
  final List<Country> countries;
  final bool isSelectControlAgentError;

  AddBiologicalControlState copyWith({
    bool? isDataReady,
    bool? isEditing,
    BiologicalControlAgent? agent,
    StakeHolder? selectStakeHolder,
    List<StakeHolder>? stakeHolders,
    List<MonitoringRequirement>? monitorings,
    List<BiologicalControlAgentType>? agentTypes,
    List<Country>? countries,
    bool? isSelectControlAgentError,
  }) {
    return AddBiologicalControlState(
      isEditing: isEditing ?? this.isEditing,
      isDataReady: isDataReady ?? this.isDataReady,
      agent: agent ?? this.agent,
      selectStakeHolder: selectStakeHolder ?? this.selectStakeHolder,
      stakeHolders: stakeHolders ?? this.stakeHolders,
      monitorings: monitorings ?? this.monitorings,
      agentTypes: agentTypes ?? this.agentTypes,
      isAddNew: isAddNew,
      countries: countries ?? this.countries,
      isSelectControlAgentError: isSelectControlAgentError ?? this.isSelectControlAgentError,
    );
  }
}
