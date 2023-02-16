import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:flutter/material.dart';

import 'screen_base.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      child: Column(
        children: [
          const CmoLogo(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Assets.images.splashBg.image(fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
