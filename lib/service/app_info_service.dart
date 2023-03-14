import 'package:cmo/env/env.dart';

enum AppType {
  behave,
  resourceManager,
  farmer,
}

class AppInfoService {
  String get version => '1.0.0';
  String get appName => 'Behave';
  String get pubsubApiKey => Env.pubsubApiKey;
  AppType get type => AppType.behave;
}
