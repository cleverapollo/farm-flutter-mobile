part of 'compartment_cubit.dart';

class CompartmentState {
  const CompartmentState({
    this.listCompartment = const <Compartment>[],
    this.filterCompartment = const <Compartment>[],
    this.areaTypes = const <AreaType>[],
    this.farmId = '',
    this.campId,
    this.loading = false,
    this.error,
    this.totalSize = 0.0,
    this.viewMode = MemberManagementViewMode.listView,
    this.currentUserRole,
    this.activeFarm,
  });

  final Farm? activeFarm;
  final Object? error;
  final bool loading;
  final List<Compartment> listCompartment;
  final List<Compartment> filterCompartment;
  final List<AreaType> areaTypes;
  final String farmId;
  final String? campId;
  final double totalSize;
  final MemberManagementViewMode viewMode;
  final UserRoleEnum? currentUserRole;

  CompartmentState copyWith({
    bool? loading,
    Object? error,
    List<Compartment>? listCompartment,
    List<Compartment>? filterCompartment,
    List<AreaType>? areaTypes,
    String? farmId,
    String? campId,
    double? totalSize,
    MemberManagementViewMode? viewMode,
    UserRoleEnum? currentUserRole,
    Farm? activeFarm,
  }) {
    return CompartmentState(
      loading: loading ?? this.loading,
      listCompartment: listCompartment ?? this.listCompartment,
      filterCompartment: filterCompartment ?? this.filterCompartment,
      currentUserRole: currentUserRole ?? this.currentUserRole,
      error: error ?? this.error,
      farmId: farmId ?? this.farmId,
      campId: campId ?? this.campId,
      areaTypes: areaTypes ?? this.areaTypes,
      totalSize: totalSize ?? this.totalSize,
      viewMode: viewMode ?? this.viewMode,
      activeFarm: activeFarm ?? this.activeFarm,
    );
  }
}

extension CompartmentStateExtension on CompartmentState {
  Farm? getFullFarInformation() {
    return activeFarm?.copyWith(
      compartments: listCompartment,
    );
  }
}