import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cm_option_tile.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.settings.tr(),
        trailing: Assets.icons.icClose.svgBlack,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          CmoHeaderTile(title: LocaleKeys.preferences.tr()),
          CmoOptionTile(title: LocaleKeys.landingPage.tr()),
          CmoOptionTile(title: LocaleKeys.language.tr()),
          CmoHeaderTile(title: LocaleKeys.units.tr()),
          CmoOptionTile(title: LocaleKeys.distanceUnits.tr()),
          CmoOptionTile(title: LocaleKeys.area.tr()),
        ],
      ),
    );
  }
}
