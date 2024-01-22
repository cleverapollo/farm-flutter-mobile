import 'dart:ui';

abstract class AppLocale {
  static const fallback = en;

  static const en = Locale('en');
  static const fr = Locale('fr');
  static const ms = Locale('ms');
  static const th = Locale('th');
  static const zu = Locale('zu');
  static const vi = Locale('vi');

  static List<Locale> get all => [
        en,
        fr,
        ms,
        th,
        zu,
        vi,
      ];
}
