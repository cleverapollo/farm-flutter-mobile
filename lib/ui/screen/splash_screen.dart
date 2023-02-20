import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/screen/auth/login_screen.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:flutter/material.dart';

import 'screen_base.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      LoginScreen.push(context);
    });
  }

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
