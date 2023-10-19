part of 'add_biological_control_cubit.dart';

class AddBiologicalControlState {
  AddBiologicalControlState({
    required this.agent,
    this.isAddNew = true,
    this.isDataReady = false,
    this.selectStakeHolder,
    this.stakeHolders = const [],
    this.monitorings = const [],
    this.agentTypes = const [],
    this.isSelectControlAgentError = false,
  });

  final bool isDataReady;
  final bool isAddNew;
  StakeHolder? selectStakeHolder;
  BiologicalControlAgent agent;
  final List<StakeHolder> stakeHolders;
  final List<MonitoringRequirement> monitorings;
  final List<BiologicalControlAgentType> agentTypes;
  final bool isSelectControlAgentError;

  AddBiologicalControlState copyWith({
    bool? isDataReady,
    BiologicalControlAgent? agent,
    StakeHolder? selectStakeHolder,
    List<StakeHolder>? stakeHolders,
    List<MonitoringRequirement>? monitorings,
    List<BiologicalControlAgentType>? agentTypes,
    bool? isSelectControlAgentError,
  }) {
    return AddBiologicalControlState(
      isDataReady: isDataReady ?? this.isDataReady,
      agent: agent ?? this.agent,
      selectStakeHolder: selectStakeHolder ?? this.selectStakeHolder,
      stakeHolders: stakeHolders ?? this.stakeHolders,
      monitorings: monitorings ?? this.monitorings,
      agentTypes: agentTypes ?? this.agentTypes,
      isAddNew: isAddNew,
      isSelectControlAgentError: isSelectControlAgentError ?? this.isSelectControlAgentError,
    );
  }
}
