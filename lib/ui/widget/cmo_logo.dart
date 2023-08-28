import 'package:flutter/material.dart';

import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/ui/theme/theme.dart';

class CmoLogo extends StatelessWidget {
  final bool shouldShowCompanyName;

  const CmoLogo({
    super.key,
    this.shouldShowCompanyName = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Assets.images.logo.image(fit: BoxFit.scaleDown),
        const SizedBox(height: 19),
        if (shouldShowCompanyName)
          Text(
            'Empower',
            style: context.textStyles.headlineBold,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
