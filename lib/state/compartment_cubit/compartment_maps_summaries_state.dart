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

  double getAreaInHa() {
    return MapUtils.computeAreaInHa(polygons);
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
  final bool isUpdating;
  final bool isCompletePolygon;
  final List<Marker> editingMarkers;
  final List<Marker> temporaryMarkers;
  final Marker? selectedEditedMarker;
  final CameraPosition? currentCameraPosition;

  bool get isAddingNew => selectedCompartment.polygon.isBlank;

  bool get isSelectedCompartmentMapDetails =>
      compartmentMapDetailByCameraPosition?.compartment.localCompartmentId ==
      selectedCompartmentMapDetails?.compartment.localCompartmentId;

  CompartmentMapsSummariesState({
    required this.selectedCompartment,
    this.listCompartments = const <Compartment>[],
    this.listCompartmentMapDetails = const <CompartmentMapDetail>[],
    this.editingMarkers = const <Marker>[],
    this.temporaryMarkers = const <Marker>[],
    this.isUpdating = false,
    this.isCompletePolygon = false,
    this.selectedCompartmentMapDetails,
    this.compartmentMapDetailByCameraPosition,
    this.loading = false,
    this.error,
    this.selectedEditedMarker,
    this.currentCameraPosition,
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
    List<Marker>? temporaryMarkers,
    bool? isUpdating,
    bool? isCompletePolygon,
    Marker? selectedEditedMarker,
    CameraPosition? currentCameraPosition,
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
      temporaryMarkers: temporaryMarkers ?? this.temporaryMarkers,
      isUpdating: isUpdating ?? this.isUpdating,
      isCompletePolygon: isCompletePolygon ?? this.isCompletePolygon,
      selectedEditedMarker: selectedEditedMarker ?? this.selectedEditedMarker,
      currentCameraPosition: currentCameraPosition ?? this.currentCameraPosition,
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
      isUpdating: isUpdating,
      isCompletePolygon: isCompletePolygon,
      currentCameraPosition: currentCameraPosition,
    );
  }
}
