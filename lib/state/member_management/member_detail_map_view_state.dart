part of 'member_detail_map_view_cubit.dart';
class MemberDetailMapViewState {
  const MemberDetailMapViewState({
    this.farm,
    this.isLoading = false,
    this.isShowCompartmentName = false,
    this.isShowASI = false,
    this.isShowRTE = false,
    this.markers = const <Marker>[],
    this.selectedCompartment,
    this.compartments = const <Compartment>[],
    this.filterCompartments = const <Compartment>[],
    this.currentUserRole,
    this.rteSpecies = const <RteSpecies>[],
    this.asis = const <Asi>[],
    this.visibleRegion,
    this.mapType = MapType.satellite,
  });

  final Farm? farm;
  final bool isLoading;
  final bool isShowCompartmentName;
  final bool isShowASI;
  final bool isShowRTE;
  final List<Compartment> compartments;
  final List<Compartment> filterCompartments;
  final Compartment? selectedCompartment;
  final List<Marker> markers;
  final UserRoleEnum? currentUserRole;
  final List<Asi> asis;
  final List<RteSpecies> rteSpecies;
  final LatLngBounds? visibleRegion;
  final MapType mapType;

  MemberDetailMapViewState copyWith({
    Farm? farm,
    bool? isLoading,
    bool? isShowCompartmentName,
    bool? isShowASI,
    bool? isShowRTE,
    Compartment? selectedCompartment,
    List<Marker>? markers,
    List<Compartment>? compartments,
    List<Compartment>? filterCompartments,
    UserRoleEnum? currentUserRole,
    List<Asi>? asis,
    List<RteSpecies>? rteSpecies,
    LatLngBounds? visibleRegion,
    MapType? mapType,
  }) {
    return MemberDetailMapViewState(
      farm: farm ?? this.farm,
      isLoading: isLoading ?? this.isLoading,
      isShowCompartmentName: isShowCompartmentName ?? this.isShowCompartmentName,
      isShowASI: isShowASI ?? this.isShowASI,
      isShowRTE: isShowRTE ?? this.isShowRTE,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      markers: markers ?? this.markers,
      compartments: compartments ?? this.compartments,
      filterCompartments: filterCompartments ?? this.filterCompartments,
      currentUserRole: currentUserRole ?? this.currentUserRole,
      asis: asis ?? this.asis,
      rteSpecies: rteSpecies ?? this.rteSpecies,
      visibleRegion: visibleRegion ?? this.visibleRegion,
      mapType: mapType ?? this.mapType,
    );
  }
}