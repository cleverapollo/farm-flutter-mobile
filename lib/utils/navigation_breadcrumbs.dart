import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/string.dart';
import 'package:flutter/widgets.dart';

class NavigationBreadcrumbs {

  NavigationBreadcrumbs() {
    initNavigationBreadcrumbs();
  }

  String? farmName;
  final previousSectionName = ValueNotifier<List<String>>(<String>[]);

  Future<void> initNavigationBreadcrumbs() async {
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
      case UserRoleEnum.behave:
      default:
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
}
