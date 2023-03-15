import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/screen/assessments/new_assessment_screen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
import 'package:cmo/ui/widget/cmo_app_bar.dart';
import 'package:cmo/ui/widget/cmo_buttons.dart';
import 'package:flutter/material.dart';

class AssessmentsScreen extends StatelessWidget {
  const AssessmentsScreen({super.key});

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AssessmentsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.assessments.tr(),
        leading: Assets.icons.icArrowLeft.svgBlack,
        onTapLeading: Navigator.of(context).pop,
        trailing: Assets.icons.icAdd.svgBlack,
        onTapTrailing: () => NewAssessmentScreen.push(context),
      ),
      body: Column(
        children: [
          Row(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                  child: CmoFilledButton(
                    onTap: () {},
                    title: LocaleKeys.started.tr(),
                    titleStyle: context.textStyles.bodyBold.white
                        .copyWith(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: CmoFilledButton(
                    onTap: () {},
                    disable: true,
                    title: LocaleKeys.completed.tr(),
                    titleStyle: context.textStyles.bodyBold.white
                        .copyWith(fontSize: 12),
                  ),
                ),
                Expanded(
                  child: CmoFilledButton(
                    onTap: () {},
                    disable: true,
                    title: LocaleKeys.synced.tr(),
                    titleStyle: context.textStyles.bodyBold.white
                        .copyWith(fontSize: 12),
                  ),
                ),
              ].withSpaceBetween(width: 8),
            ),
          ),
        ],
      ),
    );
  }
}
