import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/widgets.dart';

import 'slimf_and_mpo_section.dart';

class SlimfCompliantLimitation2 extends StatelessWidget {
  const SlimfCompliantLimitation2({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textStyles.titleBold.copyWith(
          color: context.colors.black,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: LocaleKeys.slimf_compliant_limitation_2_param_1
                .tr()
                .toUpperCase(),
          ),
          superScript(
            context,
            text: 'M3'.toUpperCase(),
            textStyle: context.textStyles.titleBold.copyWith(
              color: context.colors.black,
            ),
          ),
          TextSpan(
            text:
                ' ${LocaleKeys.slimf_compliant_limitation_2_param_2.tr().toUpperCase()}',
          ),
        ],
      ),
    );
  }
}
