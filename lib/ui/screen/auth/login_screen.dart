import 'package:cmo/ui/screen/screen_base.dart';
import 'package:cmo/ui/widget/cmo_logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      child: Column(
        children: [
          const CmoLogo(),
        ],
      ),
    );
  }
}
