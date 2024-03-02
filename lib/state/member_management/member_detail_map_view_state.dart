part of 'member_detail_map_view_cubit.dart';
class MemberDetailMapViewState {
  const MemberDetailMapViewState({
    this.farm,
    this.isLoading = false,
    this.isShowCompartmentName = false,
    this.isShowASI = false,
    this.markers = const <Marker>[],
    this.selectedCompartment,
    this.compartments = const <Compartment>[],
    this.filterCompartments = const <Compartment>[],
    this.currentUserRole,
  });

  final Farm? farm;
  final bool isLoading;
  final bool isShowCompartmentName;
  final bool isShowASI;
  final List<Compartment> compartments;
  final List<Compartment> filterCompartments;
  final Compartment? selectedCompartment;
  final List<Marker> markers;
  final UserRoleEnum? currentUserRole;

  MemberDetailMapViewState copyWith({
    Farm? farm,
    bool? isLoading,
    bool? isShowCompartmentName,
    bool? isShowASI,
    Compartment? selectedCompartment,
    List<Marker>? markers,
    List<Compartment>? compartments,
    List<Compartment>? filterCompartments,
    UserRoleEnum? currentUserRole,
  }) {
    return MemberDetailMapViewState(
      farm: farm ?? this.farm,
      isLoading: isLoading ?? this.isLoading,
      isShowCompartmentName: isShowCompartmentName ?? this.isShowCompartmentName,
      isShowASI: isShowASI ?? this.isShowASI,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      markers: markers ?? this.markers,
      compartments: compartments ?? this.compartments,
      filterCompartments: filterCompartments ?? this.filterCompartments,
      currentUserRole: currentUserRole ?? this.currentUserRole,
    );
  }
}