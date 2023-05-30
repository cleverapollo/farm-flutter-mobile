import 'package:cmo/env/env.dart';
import 'package:cmo/model/app_mode.dart';

export '../model/app_mode.dart';

class AppInfoService {
  String get version => '1.0.1';
  String get appName => 'Behave';
  String get databaseName => 'cmo.db';
  int get sqfliteImportPageSize => 100;
  String get pubsubApiKey => Env.cmoPubsubApiKey;
}
