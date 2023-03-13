enum AppType {
  behave,
  resourceManager,
  farmer,
}

class AppInfoService {
  String get version => '1.0.0';
  String get appName => 'Behave';
  AppType get type => AppType.behave;
}
