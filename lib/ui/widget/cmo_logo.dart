import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/theme/app_theme.dart';
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
          'Empower',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: context.colors.blue,
          ),
        ),
      ],
    );
  }
}
