import 'package:cmo/l10n/l10n.dart';

enum AreaUnitEnum {
  rai,
  acres,
  ha;

  String get valueName {
    switch (this) {
      case AreaUnitEnum.rai:
        return 'rai';
      case AreaUnitEnum.acres:
        return 'acres';
      case AreaUnitEnum.ha:
        return LocaleKeys.ha_unit.tr();
    }
  }

  double? convertHaToDisplayAreaUnit(double? ha) {
    if  (ha == null) return null;
    switch (this) {
      case AreaUnitEnum.ha:
        return ha;
      case AreaUnitEnum.acres:
        return ha * 2.47105;
      case AreaUnitEnum.rai:
        return ha * 6.25;
    }
  }
}
