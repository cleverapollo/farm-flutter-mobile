import 'package:flutter/material.dart';

import 'package:cmo/di.dart';
import 'package:cmo/ui/screen/entity/behave_entity_screen.dart';
import 'package:cmo/ui/screen/entity/farmer_entity_screen.dart';
import 'package:cmo/ui/screen/entity/resource_manager_entity_screen.dart';

Widget entityScreenByType() {
  return appInfoService.mode.join(
    (behave) => const BehaveEntityScreen(),
    (resourceManager) => const ResourceManagerEntityScreen(),
    (farmer) => const FarmerEntityScreen(),
  );
}

void pushEntityScreen(BuildContext context) {
  final screen = entityScreenByType();

  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (_) => screen,
    ),
  );
}
