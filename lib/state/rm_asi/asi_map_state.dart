import 'package:cmo/model/model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AsiMapState {
  AsiMapState({
    required this.asi,
    this.compartments = const <Compartment>[],
    this.isLoading = false,
    this.marker,
    this.outlinedCompartment,
    this.currentCameraPosition,
    this.outlineMarker = const <Marker>[],
  });

  final List<Compartment> compartments;
  final Asi asi;
  final Marker? marker;
  final bool isLoading;
  final Compartment? outlinedCompartment;
  final CameraPosition? currentCameraPosition;
  final List<Marker> outlineMarker;

  AsiMapState copyWith({
    bool? isLoading,
    List<Compartment>? compartments,
    Asi? asi,
    Marker? marker,
    Compartment? outlinedCompartment,
    CameraPosition? currentCameraPosition,
    List<Marker>? outlineMarker,
    bool isClearMarker = false,
    bool isClearOutlineCompartment = false,
  }) {
    return AsiMapState(
      isLoading: isLoading ?? this.isLoading,
      compartments: compartments ?? this.compartments,
      asi: asi ?? this.asi,
      currentCameraPosition: currentCameraPosition ?? this.currentCameraPosition,
      marker: isClearMarker ? null : (marker ?? this.marker),
      outlinedCompartment: isClearOutlineCompartment
          ? null
          : (outlinedCompartment ?? this.outlinedCompartment),
      outlineMarker: isClearOutlineCompartment
          ? []
          : (outlineMarker ?? this.outlineMarker),
    );
  }
}
