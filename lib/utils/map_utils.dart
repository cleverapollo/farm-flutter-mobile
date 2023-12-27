import 'dart:ui';

import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map_toolkit;

import 'utils.dart';

class MapUtils {
  static LatLng getCenterPositionFromPolyline(Polyline polyline) {
    return LatLng(
      (polyline.points.first.latitude + polyline.points.last.latitude) / 2,
      (polyline.points.first.longitude + polyline.points.last.longitude) / 2,
    );
  }

  static LatLng generateLatLngFromMarker(Marker marker) {
    return LatLng(marker.position.latitude, marker.position.longitude);
  }

  static Future<Marker> generateMarkerFromLatLng(LatLng position, {
    void Function(MarkerId)? onTap,
    void Function(LatLng, MarkerId)? onDrag,
    bool draggable = false,
    bool shouldShowCustomIconMarker = true,
  }) async {
    return Marker(
      markerId: MarkerId('place_name_${position.latitude}_${position.longitude}'),
      position: position,
      onTap: () => onTap?.call(MarkerId('place_name_${position.latitude}_${position.longitude}')),
      draggable: draggable,
      onDrag: (latLng) {
        onDrag?.call(
          latLng,
          MarkerId('place_name_${position.latitude}_${position.longitude}'),
        );
      },
      icon: shouldShowCustomIconMarker
          ? await BitmapDescriptorHelper.getBitmapDescriptorFromSvgAsset(
              Assets.icons.mapPolygonPoint.path,
              const Size(8, 8),
            )
          : BitmapDescriptor.defaultMarker,
    );
  }

  static Marker copyMarkerValue(
    Marker marker, {
    void Function(MarkerId)? onTap,
    void Function(LatLng, MarkerId)? onDrag,
    bool draggable = false,
  }) {
    return Marker(markerId: MarkerId('place_name_${marker.position.latitude}_${marker.position.longitude}_${DateTime.now().microsecondsSinceEpoch}'),).copyWith(
      positionParam: marker.position,
      iconParam: marker.icon,
      draggableParam: marker.draggable,
      onTapParam: () => onTap?.call(MarkerId('place_name_${marker.position.latitude}_${marker.position.longitude}_${DateTime.now().microsecondsSinceEpoch}')),
      onDragParam: (latLng) {
        onDrag?.call(
          latLng,
          MarkerId('place_name_${marker.position.latitude}_${marker.position.longitude}_${DateTime.now().microsecondsSinceEpoch}'),
        );
      },
    );
  }

  static map_toolkit.LatLng convertLatLng(LatLng latLng) {
    return map_toolkit.LatLng(
      latLng.latitude,
      latLng.longitude,
    );
  }

  static double computeAreaInHa(List<LatLng>? polygon) {
    if (polygon.isBlank || polygon!.length <= 2) {
      return 0;
    }

    final mapToolkitPolygon = polygon.map(convertLatLng).toList();
    return map_toolkit.SphericalUtil.computeArea(mapToolkitPolygon) / 10000;
  }

  static double computePerimeterInKm(List<LatLng>? polygon) {
    if (polygon.isBlank || polygon!.length <= 2) {
      return 0;
    }

    final mapToolkitPolygon = polygon.map(convertLatLng).toList();

    var perimeter = 0.0;

    for (var index = 1; index < mapToolkitPolygon.length; index++) {
      perimeter += map_toolkit.SphericalUtil.computeDistanceBetween(
        mapToolkitPolygon[index - 1],
        mapToolkitPolygon[index],
      );
    }

    perimeter += map_toolkit.SphericalUtil.computeDistanceBetween(
      mapToolkitPolygon[mapToolkitPolygon.length - 1],
      mapToolkitPolygon[0],
    );

    return perimeter / 1000;
  }

  static bool checkPositionInsidePolygon({
    required LatLng latLng,
    required List<LatLng> polygon,
  }) {
    return map_toolkit.PolygonUtil.containsLocation(
      convertLatLng(latLng),
      polygon.map(convertLatLng).toList(),
      false,
    );
  }

  static Future<void> checkLocationPermission({
    required VoidCallback onAllowed,
  }) async {
    await Geolocator.checkPermission().then((permission) async {
      switch (permission) {
        case LocationPermission.whileInUse:
        case LocationPermission.always:
          onAllowed();
          break;
        case LocationPermission.unableToDetermine:
        case LocationPermission.denied:
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.whileInUse ||
              permission == LocationPermission.always) {
            onAllowed();
          }

          break;
        case LocationPermission.deniedForever:
          break;
      }
    });
  }
}
