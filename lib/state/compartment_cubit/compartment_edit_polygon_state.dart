part of 'compartment_edit_polygon_cubit.dart';

class CompartmentEditPolygonState extends BaseState {
  final List<CompartmentMapDetail> listCompartmentMapDetails;
  final CompartmentMapDetail? selectedCompartmentMapDetails;
  final CompartmentMapDetail? compartmentMapDetailByCameraPosition;
  final List<Compartment> listCompartments;
  final Compartment selectedCompartment;
  final String farmId;
  final bool isUpdating;
  final bool isCompletePolygon;
  final List<Marker> editingMarkers;
  final List<Marker> temporaryMarkers;
  final List<Marker> displayMarkers;
  final Marker? selectedEditedMarker;
  final Polyline? selectedEditedPolyline;
  final CameraPosition? currentCameraPosition;
  final bool isChanged;
  final List<List<Marker>> listMarkersHistory;
  final LatLngBounds? visibleRegion;
  final MapType mapType;

  bool get isSelectedCompartmentMapDetails =>
      compartmentMapDetailByCameraPosition?.compartment.localCompartmentId ==
      selectedCompartmentMapDetails?.compartment.localCompartmentId;

  CompartmentEditPolygonState({
    required this.selectedCompartment,
    required this.farmId,
    this.listCompartments = const <Compartment>[],
    this.listCompartmentMapDetails = const <CompartmentMapDetail>[],
    this.editingMarkers = const <Marker>[],
    this.temporaryMarkers = const <Marker>[],
    this.displayMarkers = const <Marker>[],
    this.isUpdating = false,
    this.isCompletePolygon = false,
    this.selectedCompartmentMapDetails,
    this.compartmentMapDetailByCameraPosition,
    super.loading,
    super.error,
    super.isEditing,
    this.listMarkersHistory = const <List<Marker>>[],
    this.selectedEditedPolyline,
    this.selectedEditedMarker,
    this.currentCameraPosition,
    this.isChanged = false,
    this.visibleRegion,
    this.mapType = MapType.satellite,
  });

  CompartmentEditPolygonState copyWith({
    bool? loading,
    bool? isEditing,
    Object? error,
    Compartment? selectedCompartment,
    String? farmId,
    List<Compartment>? listCompartments,
    List<CompartmentMapDetail>? listCompartmentMapDetails,
    CompartmentMapDetail? selectedCompartmentMapDetails,
    CompartmentMapDetail? compartmentMapDetailByCameraPosition,
    List<Marker>? editingMarkers,
    List<Marker>? temporaryMarkers,
    List<Marker>? displayMarkers,
    bool? isUpdating,
    bool? isCompletePolygon,
    bool? isChanged,
    Marker? selectedEditedMarker,
    CameraPosition? currentCameraPosition,
    Polyline? selectedEditedPolyline,
    List<List<Marker>>? listMarkersHistory,
    LatLngBounds? visibleRegion,
    MapType? mapType,
  }) {
    return CompartmentEditPolygonState(
      farmId: farmId ?? this.farmId,
      selectedCompartment: selectedCompartment ?? this.selectedCompartment,
      listCompartments: listCompartments ?? this.listCompartments,
      listCompartmentMapDetails: listCompartmentMapDetails ?? this.listCompartmentMapDetails,
      selectedCompartmentMapDetails: selectedCompartmentMapDetails ?? this.selectedCompartmentMapDetails,
      compartmentMapDetailByCameraPosition: compartmentMapDetailByCameraPosition,
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
      error: error ?? this.error,
      isUpdating: isUpdating ?? this.isUpdating,
      isCompletePolygon: isCompletePolygon ?? this.isCompletePolygon,
      isChanged: isChanged ?? this.isChanged,
      currentCameraPosition: currentCameraPosition ?? this.currentCameraPosition,
      editingMarkers: editingMarkers ?? this.editingMarkers,
      temporaryMarkers: temporaryMarkers ?? this.temporaryMarkers,
      displayMarkers: displayMarkers ?? this.displayMarkers,
      selectedEditedMarker: selectedEditedMarker ?? this.selectedEditedMarker,
      selectedEditedPolyline: selectedEditedPolyline ?? this.selectedEditedPolyline,
      listMarkersHistory: listMarkersHistory ?? this.listMarkersHistory,
      visibleRegion: visibleRegion ?? this.visibleRegion,
      mapType: mapType ?? this.mapType,
    );
  }

  CompartmentEditPolygonState resetEditingMarkers({
    bool isCleanSelectedEditedMarker = true,
    bool isCleanSelectedEditedPolyline = true,
    bool isCleanEditingMarkers = true,
    bool isCleanTemporaryMarkers = true,
  }) {
    return CompartmentEditPolygonState(
      farmId: farmId,
      selectedCompartment: selectedCompartment,
      listCompartments: listCompartments,
      listCompartmentMapDetails: listCompartmentMapDetails,
      selectedCompartmentMapDetails: selectedCompartmentMapDetails,
      compartmentMapDetailByCameraPosition: compartmentMapDetailByCameraPosition,
      loading: loading,
      error: error,
      isEditing: isEditing,
      isUpdating: isUpdating,
      isCompletePolygon: isCompletePolygon,
      currentCameraPosition: currentCameraPosition,
      editingMarkers: isCleanEditingMarkers ? <Marker>[] : editingMarkers,
      temporaryMarkers: isCleanTemporaryMarkers ? <Marker>[] : temporaryMarkers,
      displayMarkers: isCleanTemporaryMarkers ? <Marker>[] : displayMarkers,
      selectedEditedMarker: isCleanSelectedEditedMarker ? null : selectedEditedMarker,
      selectedEditedPolyline: isCleanSelectedEditedPolyline ? null : selectedEditedPolyline,
      isChanged: isChanged,
      listMarkersHistory: listMarkersHistory,
      visibleRegion: visibleRegion,
      mapType: mapType,
    );
  }
}
