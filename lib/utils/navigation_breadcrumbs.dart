import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/string.dart';

class NavigationBreadcrumbs {

  NavigationBreadcrumbs() {
    initNavigationBreadcrumbs();
  }

  String? farmName;
  List<String?> previousSectionName = <String>[];
  String? currentSectionName;

  Future<void> initNavigationBreadcrumbs() async {
    final currentRole = await configService.getActiveUserRole();
    switch (currentRole) {
      case UserRoleEnum.regionalManager:
        final activeGS = await configService.getActiveGroupScheme();
        final activeRmu = await configService.getActiveRegionalManager();

        if (activeGS?.groupSchemeName != null && activeGS!.groupSchemeName!.isNotBlank) {
          previousSectionName.add(activeGS.groupSchemeName);
        }

        if (activeRmu?.regionalManagerUnitName != null && activeRmu!.regionalManagerUnitName.isNotBlank) {
          previousSectionName.add(activeRmu.regionalManagerUnitName);
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
      previousSectionName.add(currentSectionName);
      currentSectionName = sectionName;
    } else {
      currentSectionName = previousSectionName.last;
      previousSectionName.removeLast();
    }
  }
}
