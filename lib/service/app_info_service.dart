import 'package:cmo/env/env.dart';
import 'package:cmo/model/app_mode.dart';
export '../model/app_mode.dart';

AppMode getAppTypeFromEnv() {
  if (Env.appMode == 'behave') {
    return AppMode.behave();
  }
  if (Env.appMode == 'resource_manager') {
    return AppMode.resourceManager();
  }
  if (Env.appMode == 'farmer') {
    return AppMode.farmer();
  }

  return AppMode.behave();
}

class AppInfoService {
  String get version => '1.0.0';
  String get appName => 'Behave';
  String get databaseName => 'cmo.db';
  int get sqfliteImportPageSize => 100;
  String get pubsubApiKey => Env.pubsubApiKey;
  AppMode get mode => getAppTypeFromEnv();
}
