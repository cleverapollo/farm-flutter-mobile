import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:cmo/l10n/l10n.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit({required Locale locale})
      : super(
          SettingsState(
            locale: locale,
            landingPage: LandingPage.dashboard,
            themeMode: ThemeMode.light,
          ),
        );

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

  bool shouldShowLunarCalendar() {
    return state.locale == AppLocale.th || state.locale == AppLocale.vi;
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    final locale = json['locale'] as String?;
    final landingPage = json['landingPage'] as String?;
    final themeMode = json['themeMode'] as String?;

    return SettingsState(
      locale: AppLocale.all.firstWhere(
        (e) => e.languageCode == locale,
        orElse: () => AppLocale.en,
      ),
      landingPage: LandingPage.values.firstWhere(
        (e) => e.name == landingPage,
        orElse: () => LandingPage.dashboard,
      ),
      themeMode: ThemeMode.values.firstWhere(
        (e) => e.name == themeMode,
        orElse: () => ThemeMode.light,
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {
      'locale': state.locale.languageCode,
      'landingPage': state.landingPage.localeKey,
      'themeMode': state.themeMode.name,
    };
  }
}
