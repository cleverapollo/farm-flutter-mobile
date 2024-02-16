import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/env/env.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:cmo/ui/widget/cmo_option_tile.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LegalScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.legal.tr(),
        trailing: Assets.icons.icUpdatedCloseButton.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          CmoHeaderTile(title: LocaleKeys.information.tr()),
          CmoTappable(
            onTap: () async {
              final activeUserRole = await configService.getActiveUserRole();
              late Uri uri;
              if (activeUserRole == UserRoleEnum.behave) {
                uri = Uri.https(Env.cmoApiUrl, '/behave/Terms');
              } else {
                uri = Uri.https(Env.cmoApiUrl, '/Terms');
              }
              launchUrl(uri);
            },
            child: CmoOptionTile(title: LocaleKeys.termsConditions.tr()),
          ),
          CmoTappable(
            onTap: () async {
              final activeUserRole = await configService.getActiveUserRole();
              late Uri uri;
              if (activeUserRole == UserRoleEnum.behave) {
                uri = Uri.https(Env.cmoApiUrl, '/cmo/behave/Privacy');
              } else {
                uri = Uri.https(Env.cmoApiUrl, '/cmo/Privacy');
              }
              launchUrl(uri);
            },
            child: CmoOptionTile(title: LocaleKeys.privacyPolicy.tr()),
          ),
        ],
      ),
    );
  }
}
