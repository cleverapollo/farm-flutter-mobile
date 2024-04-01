part of 'settings_cubit.dart';

enum LandingPage {
  dashboard('dashboard'),
  auditS('audit_s'),
  memberManagement('memberManagement');

  const LandingPage(this.localeKey);

  final String localeKey;
}

class SettingsState extends Equatable {

  const SettingsState({
    required this.locale,
    required this.landingPage,
    required this.themeMode,
    this.settingConfig = const SettingConfig(),
  });
  final Locale locale;

  final LandingPage landingPage;

  final ThemeMode themeMode;

  final SettingConfig settingConfig;

  SettingsState copyWith({
    Locale? locale,
    LandingPage? landingPage,
    ThemeMode? themeMode,
    SettingConfig? settingConfig,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      landingPage: landingPage ?? this.landingPage,
      themeMode: themeMode ?? this.themeMode,
      settingConfig: settingConfig ?? this.settingConfig,
    );
  }

  @override
  List<Object?> get props => [
        locale,
        landingPage,
        themeMode,
        settingConfig,
      ];
}
