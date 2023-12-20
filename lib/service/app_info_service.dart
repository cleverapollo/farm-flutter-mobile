import 'dart:io';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppInfoService {
  String? appName;
  String? version;

  Future<void> initDataForAppInfoService() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    appName = packageInfo.appName;
  }

  Future<bool> checkForUpdate() async {
    final checkForUpdate = await cmoPerformApiService.checkUpdate();
    final currentVersion = version?.getExtendedVersionNumber();
    final latestVersion = checkForUpdate?.versionNumber?.getExtendedVersionNumber();
    if (currentVersion != null && latestVersion != null) {
      return currentVersion.compareTo(latestVersion) == -1;
    }

    return false;
  }

  Future<void> goToStore() async {
    var storePath = '';
    if (Platform.isAndroid) {
      storePath = 'https://play.google.com/store/apps/details?id=cmo.empower.com&pcampaignid=web_share';
    } else {
      storePath = 'https://apps.apple.com/vn/app/cmo-empower/id6461161566';
    }

    if (storePath.isEmpty) {
      return;
    }

    if (await canLaunchUrlString(storePath)) {
      await launchUrlString(
        storePath,
        mode: LaunchMode.externalApplication,
      );
    } else {
      showSnackError(msg: 'Could not go to Store.');
    }
  }
}
