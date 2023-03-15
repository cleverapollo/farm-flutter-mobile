import 'package:cmo/di.dart';
import 'package:cmo/ui/screen/entity/entity_behave_screen.dart';
import 'package:cmo/ui/screen/entity/entity_screen.dart';
import 'package:flutter/material.dart';

void pushEntityScreen(BuildContext context) {
  final screen = entityScreenByType();
  if (screen != null) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }
}

Widget? entityScreenByType() {
  return appInfoService.mode.join(
    (behave) => const EntityBehaveScreen(),
    (resourceManager) => const EntityScreen(),
    (farmer) => const EntityScreen(),
  );
}
