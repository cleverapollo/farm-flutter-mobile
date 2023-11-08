import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map_toolkit;

class MapUtils {
  static map_toolkit.LatLng convertLatLng(LatLng latLng) {
    return map_toolkit.LatLng(
      latLng.latitude,
      latLng.longitude,
    );
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
