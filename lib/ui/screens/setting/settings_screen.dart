import 'package:cmo/enum/enum.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';

class SettingsScreen extends BaseStatefulWidget {
  const SettingsScreen({super.key}) : super(screenName: 'Settings Screen');

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseStatefulWidgetState<SettingsScreen> {
  late final SettingsCubit settingsCubit = context.watch<SettingsCubit>();

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.settings.tr(),
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          CmoHeaderTile(title: LocaleKeys.preferences.tr()),
          _SettingsOptionPicker<LandingPage>(
            title: LocaleKeys.landingPage.tr(),
            value: settingsCubit.state.landingPage,
            items: LandingPage.values,
            itemToString: (i) => i.localeKey.tr(),
            onTap: (i) => settingsCubit.changeLandingPage(i),
          ),
          _SettingsOptionPicker<Locale>(
            title: LocaleKeys.language.tr(),
            value: settingsCubit.state.locale,
            items: AppLocale.all,
            itemToString: (i) => LocaleKeys.locale.tr(gender: i.languageCode),
            onTap: (i) => settingsCubit.changeLanguage(context, i),
          ),
          _SettingsOptionPicker<ThemeMode>(
            title: LocaleKeys.appearance.tr(),
            value: settingsCubit.state.themeMode,
            items: const [ThemeMode.light, ThemeMode.dark],
            itemToString: (i) => LocaleKeys.theme.tr(gender: i.name),
            onTap: (i) => settingsCubit.changeThemeMode(i),
          ),
          CmoHeaderTile(title: LocaleKeys.units.tr()),
          _SettingsOptionPicker<DateFormatEnum>(
            title: LocaleKeys.date_format.tr(),
            value: settingsCubit.state.settingConfig.dateFormatEnum,
            items: DateFormatEnum.values,
            itemToString: (i) => i.valueName,
            onTap: settingsCubit.changeDateFormat,
          ),
          _SettingsOptionPicker<DistanceUnitEnum>(
            title: LocaleKeys.distanceUnits.tr(),
            value: settingsCubit.state.settingConfig.distanceUnitEnum,
            items: DistanceUnitEnum.values,
            itemToString: (i) => i.valueName,
            onTap: settingsCubit.changeDistanceUnit,
          ),
          _SettingsOptionPicker<AreaUnitEnum>(
            title: LocaleKeys.area.tr(),
            value: settingsCubit.state.settingConfig.areaUnitEnum,
            items: AreaUnitEnum.values,
            itemToString: (i) => i.valueName,
            onTap: settingsCubit.changeAreaUnit,
          ),
        ],
      ),
    );
  }
}

class _SettingsOptionPicker<T> extends StatelessWidget {
  const _SettingsOptionPicker({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.itemToString,
    required this.onTap,
  });

  final String title;

  final T value;

  final List<T> items;

  final String Function(T) itemToString;

  final void Function(T) onTap;

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: () {
        final button = context.findRenderObject()! as RenderBox;
        final overlay = Navigator.of(context)
            .overlay!
            .context
            .findRenderObject()! as RenderBox;

        final position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(const Offset(1, 0), ancestor: overlay),
            button.localToGlobal(
              button.size.bottomRight(const Offset(1, 0)),
              ancestor: overlay,
            ),
          ),
          Offset.zero & overlay.size,
        );
        showMenu<T>(
          context: context,
          position: position,
          items: items
              .map(
                (i) => PopupMenuItem<T>(
                  onTap: () => onTap(i),
                  child: Text(
                    itemToString(i),
                    style: context.textStyles.bodyNormal,
                  ),
                ),
              )
              .toList(),
        );
      },
      child: CmoOptionTile(
        title: title,
        value: itemToString(value),
      ),
    );
  }
}
