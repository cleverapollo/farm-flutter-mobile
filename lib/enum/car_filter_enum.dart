// status = 0 -> all cases;
// status = 1 -> the question without xbone;
// status = 2 -> the question with xbone;
import 'package:cmo/l10n/l10n.dart';

enum CarFilterEnum {
  noCars(-1),
  allCARs(0),
  minorCARs(1),
  majorCARs(2);

  const CarFilterEnum(this.data);

  final int data;

  String get valueName {
    switch (this) {
      case CarFilterEnum.noCars:
        return LocaleKeys.no_cars.tr();
      case CarFilterEnum.allCARs:
        return LocaleKeys.all_cars.tr();
      case CarFilterEnum.minorCARs:
        return LocaleKeys.minor.tr();
      case CarFilterEnum.majorCARs:
        return LocaleKeys.major.tr();
    }
  }
}
