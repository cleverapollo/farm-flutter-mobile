import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_header_tile.dart';
import 'package:flutter/material.dart';

class CreateWorkerScreen extends StatelessWidget {
  const CreateWorkerScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CreateWorkerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.createWorker.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          CmoHeaderTile(title: LocaleKeys.details.tr()),
        ],
      ),
    );
  }
}
