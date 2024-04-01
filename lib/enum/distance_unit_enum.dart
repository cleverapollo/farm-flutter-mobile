enum DistanceUnitEnum {
  km,
  yards,
  miles;

  String get valueName {
    switch (this) {
      case DistanceUnitEnum.km:
        return 'km';
      case DistanceUnitEnum.yards:
        return 'yards';
      case DistanceUnitEnum.miles:
        return 'miles';
    }
  }

  double? convertKmToDisplayDistanceUnit(double? km) {
    if  (km == null) return null;
    switch (this) {
      case DistanceUnitEnum.km:
        return km;
      case DistanceUnitEnum.yards:
        return km * 1093.61;
      case DistanceUnitEnum.miles:
        return km * 0.621371;
    }
  }
}
