import 'package:flutter/material.dart';

import 'package:cmo/di.dart';
import 'package:cmo/ui/screen/entity/entity_behave_screen.dart';
import 'package:cmo/ui/screen/entity/entity_farmer_screen.dart';
import 'package:cmo/ui/screen/entity/entity_resource_manager_screen.dart';

Widget entityScreenByType() {
  return appInfoService.mode.join(
    (behave) => const EntityBehaveScreen(),
    (resourceManager) => const EntityResourceManagerScreen(),
    (farmer) => const EntityFarmerScreen(),
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
