import 'package:cmo/service/app_info_service.dart';
import 'package:cmo/service/device_info_service.dart';
import 'package:get_it/get_it.dart';

final _get = GetIt.instance;

DeviceInfoService get deviceInfoService => _get<DeviceInfoService>();

AppInfoService get appInfoService => _get<AppInfoService>();

Future<void> registerGetIt() async {
  _get.registerLazySingleton(() => DeviceInfoService());
  _get.registerLazySingleton(() => AppInfoService());

  await _get.allReady();
}
