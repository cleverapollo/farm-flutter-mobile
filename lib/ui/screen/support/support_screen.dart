import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:cmo/di.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SupportScreen()),
    );
  }

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  void initState() {
    super.initState();
    deviceInfoService.init().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.support.tr(),
        trailing: Assets.icons.icClose.svgBlack,
        onTapTrailing: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          CmoHeaderTile(title: LocaleKeys.debugInfo.tr()),
          buildInfo(
            title: LocaleKeys.deviceID.tr(),
            value: deviceInfoService.deviceId,
          ),
          buildInfo(
            title: LocaleKeys.device.tr(),
            value: deviceInfoService.device,
          ),
          buildInfo(
            title: LocaleKeys.os.tr(),
            value: deviceInfoService.os,
          ),
          buildInfo(
            title: LocaleKeys.appVersion.tr(),
            value: appInfoService.version,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CmoFilledButton(
                title: LocaleKeys.copyToClipBoard.tr(),
                onTap: () {
                  final info = '${deviceInfoService.deviceId}'
                      '|${deviceInfoService.device}'
                      '|${deviceInfoService.os}'
                      '|${appInfoService.version}';
                  Clipboard.setData(ClipboardData(text: info));
                },
              ),
              CmoFilledButton(
                title: LocaleKeys.email.tr(),
                onTap: () {
                  launchUrl(
                    Uri.parse('mailto:support@cmo.org?subject=Support'),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            indent: 0,
            endIndent: 0,
            height: 1,
            thickness: 1,
            color: context.colors.grey,
          ),
        ],
      ),
    );
  }

  Widget buildInfo({required String title, required String? value}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$title:',
            style: context.textStyles.bodyBold,
          ),
          Text(value ?? '--'),
        ],
      ),
    );
  }
}
