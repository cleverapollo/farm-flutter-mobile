import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/locale_keys.g.dart';
import 'package:cmo/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CmoLogo extends StatelessWidget {
  const CmoLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Assets.images.logo.image(fit: BoxFit.scaleDown),
        const SizedBox(height: 19),
        Text(
          LocaleKeys.empower,
          style: context.textStyles.headlineBold,
        ),
      ],
    );
  }
}
