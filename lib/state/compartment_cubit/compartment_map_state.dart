part of 'compartment_map_cubit.dart';

class CompartmentMapState {
  CompartmentMapState({
    this.loading = false,
    this.error,
    this.markers = const <Marker>[],
    this.tempMarkers = const <Marker>[],
    this.points = const <LatLng>[],
  });

  final Object? error;
  final bool loading;
  final List<Marker> markers;
  final List<Marker> tempMarkers;
  final List<LatLng>? points;

  CompartmentMapState copyWith({
    bool? loading,
    Object? error,
    List<Marker>? markers,
    List<Marker>? tempMarkers,
    List<LatLng>? points,
  }) {
    return CompartmentMapState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      markers: markers ?? this.markers,
      tempMarkers: tempMarkers ?? this.tempMarkers,
      points: points ?? this.points,
    );
  }
}
