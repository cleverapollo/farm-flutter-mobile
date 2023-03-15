import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_option_tile.dart';
import 'package:flutter/material.dart';

class NewAssessmentScreen extends StatelessWidget {
  const NewAssessmentScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const NewAssessmentScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.newAssessment.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
      ),
      body: Column(
        children: [
          Row(),
          CmoOptionTile(
            title: LocaleKeys.jobType.tr(),
            value: ' ',
            shouldShowArrow: false,
          ),
        ],
      ),
    );
  }
}
