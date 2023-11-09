part of 'compartment_maps_summaries_cubit.dart';

class CompartmentMapDetail extends Object {
  final Compartment compartment;
  final List<Marker> markers;
  final List<LatLng> polygons;

  CompartmentMapDetail({
    required this.compartment,
    this.markers = const <Marker>[],
    this.polygons = const <LatLng>[],
  });

  CompartmentMapDetail copyWith({
    List<Marker>? markers,
    List<LatLng>? polygons,
    Compartment? compartment,
  }) {
    return CompartmentMapDetail(
      compartment: compartment ?? this.compartment,
      polygons: polygons ?? this.polygons,
      markers: markers ?? this.markers,
    );
  }

  LatLng centerPoint() {
    if (polygons.isBlank) {
      return Constants.mapCenter;
    }

    double centerLat = 0;
    double centerLng = 0;

    for (final item in polygons) {
      centerLat += item.latitude;
      centerLng += item.longitude;
    }

    return LatLng(centerLat / polygons.length, centerLng / polygons.length);
  }

  double getPerimeter() {
    return MapUtils.computePerimeterInKm(polygons);
  }
}

class CompartmentMapsSummariesState {
  final List<CompartmentMapDetail> listCompartmentMapDetails;
  final CompartmentMapDetail? selectedCompartmentMapDetails;
  final CompartmentMapDetail? compartmentMapDetailByCameraPosition;
  final List<Compartment> listCompartments;
  final Compartment selectedCompartment;
  final bool loading;
  final Object? error;
  final bool isEditing;
  final List<Marker> editingMarkers;
  final Marker? selectedEditedMarker;

  CompartmentMapsSummariesState({
    required this.selectedCompartment,
    this.listCompartments = const <Compartment>[],
    this.listCompartmentMapDetails = const <CompartmentMapDetail>[],
    this.editingMarkers = const <Marker>[],
    this.isEditing = false,
    this.selectedCompartmentMapDetails,
    this.compartmentMapDetailByCameraPosition,
    this.loading = false,
    this.error,
    this.selectedEditedMarker,
  });

  CompartmentMapsSummariesState copyWith({
    bool? loading,
    Object? error,
    Compartment? selectedCompartment,
    List<Compartment>? listCompartments,
    List<CompartmentMapDetail>? listCompartmentMapDetails,
    CompartmentMapDetail? selectedCompartmentMapDetails,
    CompartmentMapDetail? compartmentMapDetailByCameraPosition,
    List<Marker>? editingMarkers,
    bool? isEditing,
    Marker? selectedEditedMarker,
  }) {
    return CompartmentMapsSummariesState(
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      listCompartments: listCompartments ?? this.listCompartments,
      listCompartmentMapDetails: listCompartmentMapDetails ?? this.listCompartmentMapDetails,
      selectedCompartmentMapDetails: selectedCompartmentMapDetails ?? this.selectedCompartmentMapDetails,
      compartmentMapDetailByCameraPosition: compartmentMapDetailByCameraPosition,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      editingMarkers: editingMarkers ?? this.editingMarkers,
      isEditing: isEditing ?? this.isEditing,
      selectedEditedMarker: selectedEditedMarker ?? this.selectedEditedMarker,
    );
  }

  CompartmentMapsSummariesState resetEditingMarkers() {
    return CompartmentMapsSummariesState(
      selectedCompartment: selectedCompartment,
      listCompartments: listCompartments,
      listCompartmentMapDetails: listCompartmentMapDetails,
      selectedCompartmentMapDetails: selectedCompartmentMapDetails,
      compartmentMapDetailByCameraPosition: compartmentMapDetailByCameraPosition,
      loading: loading,
      error: error,
      isEditing: isEditing,
    );
  }
}
