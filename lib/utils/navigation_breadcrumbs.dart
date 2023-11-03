import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/string.dart';
import 'package:flutter/widgets.dart';

class NavigationBreadcrumbs {

  NavigationBreadcrumbs();

  String? farmName;
  final previousSectionName = ValueNotifier<List<String>>(<String>[]);

  Future<void> initNavigationBreadcrumbs() async {
    previousSectionName.value = <String>[];
    final currentRole = await configService.getActiveUserRole();
    switch (currentRole) {
      case UserRoleEnum.regionalManager:
        final activeGS = await configService.getActiveGroupScheme();
        final activeRmu = await configService.getActiveRegionalManager();

        if (activeGS?.groupSchemeName != null && activeGS!.groupSchemeName!.isNotBlank) {
          previousSectionName.value.add(activeGS.groupSchemeName!);
        }

        if (activeRmu?.regionalManagerUnitName != null && activeRmu!.regionalManagerUnitName.isNotBlank) {
          previousSectionName.value.add(activeRmu.regionalManagerUnitName!);
        }

        break;
      case UserRoleEnum.farmerMember:
        final activeFarm = await configService.getActiveFarm();
        if (activeFarm?.farmName != null && activeFarm!.farmName!.isNotBlank) {
          previousSectionName.value.add(activeFarm.farmName!);
        }

        break;
      case UserRoleEnum.behave:
      case null:
        break;
    }
  }

  void updateCurrentSectionName(String? sectionName) {
    if (sectionName.isNotBlank) {
      previousSectionName.value = List.from(previousSectionName.value)..add(sectionName!);
    } else {
      if (sectionName == null) {
        previousSectionName.value = List.from(previousSectionName.value)..removeLast();
      } else {
        return;
      }
    }
  }

  void logout() {
    previousSectionName.value = <String>[];
  }
}
