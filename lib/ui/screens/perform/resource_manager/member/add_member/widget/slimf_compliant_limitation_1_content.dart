import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/widgets.dart';

import 'member_slimf_section.dart';

class SlimfCompliantLimitation1Content extends StatelessWidget {
  const SlimfCompliantLimitation1Content({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textStyles.bodyNormal,
        children: [
          TextSpan(
            text: LocaleKeys.slimf_compliant_limitation_1_content_1.tr(),
          ),
          superScript(context),
          TextSpan(
            text:
                ' \n${LocaleKeys.slimf_compliant_limitation_1_content_2.tr()}',
          ),
          superScript(context),
          TextSpan(
            text: ' ${LocaleKeys.slimf_compliant_limitation_1_content_3.tr()}',
          ),
          superScript(context),
          TextSpan(
            text: '\n${LocaleKeys.example.tr()}: ',
            style: context.textStyles.titleBold.copyWith(
              color: context.colors.black,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: LocaleKeys.slimf_compliant_limitation_1_content_4.tr(),
          ),
          superScript(context, text: 'ha'),
          TextSpan(
            text: ' ${LocaleKeys.slimf_compliant_limitation_1_content_5.tr()}',
          ),
          superScript(context, text: 'm3'),
          TextSpan(
            text: ' ${LocaleKeys.slimf_compliant_limitation_1_content_6.tr()}',
          ),
        ],
      ),
    );
  }
}
