import 'package:flutter/material.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: child,
      ),
    );
  }
}
