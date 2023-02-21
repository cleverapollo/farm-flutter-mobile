import 'package:cmo/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LandingPage {
  dashboard('dashboard'),
  auditS('audit_s'),
  memberManagement('memberManagement');

  const LandingPage(this.localeKey);

  final String localeKey;
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required Locale locale})
      : super(SettingsState(
          locale: locale,
          landingPage: LandingPage.dashboard,
          themeMode: ThemeMode.light,
        ));

  void changeLanguage(BuildContext context, Locale locale) {
    if (locale == state.locale) return;

    EasyLocalization.of(context)?.setLocale(locale);
    emit(state.copyWith(locale: locale));
  }

  void changeLandingPage(LandingPage page) {
    emit(state.copyWith(landingPage: page));
  }

  void changeThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }
}

class SettingsState {
  final Locale locale;

  final LandingPage landingPage;

  final ThemeMode themeMode;

  SettingsState({
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
}
