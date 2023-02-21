import 'dart:ui';

abstract class AppLocale {
  static const en = Locale('en', 'US');

  static const fr = Locale('fr', 'FR');

  static List<Locale> get all => [en, fr];
}
