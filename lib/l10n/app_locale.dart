import 'dart:ui';

enum AppLocale {
  en(Locale('en', 'US')),
  fr(Locale('fr', 'FR'));

  const AppLocale(this.locale);

  final Locale locale;

  static Locale get fallback => en.locale;

  static List<Locale> get all =>
      values.map((e) => e.locale).toList(growable: false);
}
