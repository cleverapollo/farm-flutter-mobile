import 'package:cmo/model/resource_manager_unit.dart';

class ResourceManagerUnitState {
  const ResourceManagerUnitState({
    this.isResourceManagerUnitLoading = false,
    this.resourceManagerUnits = const [],
    this.selectedResourceManagerUnit,
  });

  final bool isResourceManagerUnitLoading;
  final List<ResourceManagerUnit> resourceManagerUnits;
  final ResourceManagerUnit? selectedResourceManagerUnit;

  ResourceManagerUnitState copyWith({
    bool? isResourceManagerUnitLoading,
    List<ResourceManagerUnit>? resourceManagerUnits,
    ResourceManagerUnit? selectedResourceManagerUnit,
  }) {
    return ResourceManagerUnitState(
      isResourceManagerUnitLoading: isResourceManagerUnitLoading ?? this.isResourceManagerUnitLoading,
      resourceManagerUnits: resourceManagerUnits ?? this.resourceManagerUnits,
      selectedResourceManagerUnit:
          selectedResourceManagerUnit ?? this.selectedResourceManagerUnit,
    );
  }
}
