import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/widgets.dart';

import 'member_slimf_section.dart';

class SlimfCompliantLimitation2Content extends StatelessWidget {
  const SlimfCompliantLimitation2Content({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textStyles.bodyNormal,
        children: [
          TextSpan(
            text: LocaleKeys.slimf_compliant_limitation_2_content_1.tr(),
          ),
          superScript(context, text: 'm3'),
          TextSpan(
            text: ' ${LocaleKeys.slimf_compliant_limitation_2_content_2.tr()}',
          ),
        ],
      ),
    );
  }
}
