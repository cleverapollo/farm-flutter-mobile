part of 'compartment_maps_summaries_cubit.dart';

class CompartmentMapsSummariesState {
  final List<Compartment> listCompartments;
  final Compartment selectedCompartment;
  final List<Marker> markers;
  final bool loading;
  final Object? error;
  final Set<Polygon> polygon;

  CompartmentMapsSummariesState({
    required this.listCompartments,
    required this.selectedCompartment,
    this.loading = false,
    this.error,
    this.markers = const <Marker>[],
    this.polygon = const <Polygon>{},
  });

  CompartmentMapsSummariesState copyWith({
    bool? loading,
    Object? error,
    List<Marker>? markers,
    List<LatLng>? points,
    Compartment? selectedCompartment,
    List<Compartment>? listCompartments,
    Set<Polygon>? polygon,
  }) {
    return CompartmentMapsSummariesState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      markers: markers ?? this.markers,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      listCompartments: listCompartments ?? this.listCompartments,
      polygon: polygon ?? this.polygon,
    );
  }
}
