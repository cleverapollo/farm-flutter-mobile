import 'package:cmo/di.dart';
import 'package:cmo/ui/screens/behave/entity/entity_behave_screen.dart';
import 'package:cmo/ui/screens/perform/farmer_member/entity/entity_farmer_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/entity/entity_resource_manager_screen.dart';
import 'package:flutter/material.dart';

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
