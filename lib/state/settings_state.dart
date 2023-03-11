part of 'settings_cubit.dart';

enum LandingPage {
  dashboard('dashboard'),
  auditS('audit_s'),
  memberManagement('memberManagement');

  const LandingPage(this.localeKey);

  final String localeKey;
}

class SettingsState extends Equatable {
  final Locale locale;

  final LandingPage landingPage;

  final ThemeMode themeMode;

  const SettingsState({
    required this.locale,
    required this.landingPage,
    required this.themeMode,
  });

  SettingsState copyWith({
    Locale? locale,
    LandingPage? landingPage,
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      landingPage: landingPage ?? this.landingPage,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        landingPage,
        themeMode,
      ];
}
