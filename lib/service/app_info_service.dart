import 'package:cmo/env/env.dart';
import 'package:cmo/model/app_mode.dart';

export '../model/app_mode.dart';

AppMode getAppTypeFromEnv() {
  if (Env.cmoAppMode == 'behave') {
    return AppMode.behave();
  }
  if (Env.cmoAppMode == 'resource_manager') {
    return AppMode.resourceManager();
  }
  if (Env.cmoAppMode == 'farmer') {
    return AppMode.farmer();
  }

  return AppMode.behave();
}

class AppInfoService {
  String get version => '1.0.1';
  String get appName => 'Behave';
  String get databaseName => 'cmo.db';
  int get sqfliteImportPageSize => 100;
  String get pubsubApiKey => Env.cmoPubsubApiKey;
  AppMode get mode => getAppTypeFromEnv();
}
