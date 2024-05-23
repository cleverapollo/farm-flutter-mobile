import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

    var centerLat = 0.0;
    var centerLng = 0.0;

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