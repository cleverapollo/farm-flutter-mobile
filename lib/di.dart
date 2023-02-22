import 'package:cmo/service/app_info_service.dart';
import 'package:cmo/service/device_info_service.dart';
import 'package:cmo/service/entity_service.dart';
import 'package:get_it/get_it.dart';

final _get = GetIt.instance;

DeviceInfoService get deviceInfoService => _get<DeviceInfoService>();

AppInfoService get appInfoService => _get<AppInfoService>();

EntityService get entityService => _get<EntityService>();

Future<void> registerGetIt() async {
  _get.registerLazySingleton(() => DeviceInfoService());
  _get.registerLazySingleton(() => AppInfoService());
  _get.registerLazySingleton(() => EntityService());

  await _get.allReady();
}
