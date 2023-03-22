import 'package:flutter/material.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';

class CmoLogo extends StatelessWidget {
  const CmoLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Assets.images.logo.image(fit: BoxFit.scaleDown),
        const SizedBox(height: 19),
        Text(
          LocaleKeys.empower.tr(),
          style: context.textStyles.headlineBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
