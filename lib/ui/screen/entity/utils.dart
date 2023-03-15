import 'package:cmo/di.dart';
import 'package:cmo/service/app_info_service.dart';
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
  Widget? screen;

  if (appInfoService.type == AppType.behave) {
    screen = const EntityBehaveScreen();
  }
  if (appInfoService.type == AppType.resourceManager) {
    screen = const EntityScreen();
  }
  return screen;
}
