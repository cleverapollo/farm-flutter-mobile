import 'package:cmo/service/cmo_behave_api_service.dart';
import 'package:cmo/service/config_service.dart';
import 'package:get_it/get_it.dart';

import 'package:cmo/service/app_info_service.dart';
import 'package:cmo/service/cmo_perform_api_service.dart';
import 'package:cmo/service/cmo_database_master_service.dart';
import 'package:cmo/service/device_info_service.dart';
import 'package:cmo/service/entity_service.dart';

final _get = GetIt.instance;

DeviceInfoService get deviceInfoService => _get<DeviceInfoService>();

AppInfoService get appInfoService => _get<AppInfoService>();

EntityService get entityService => _get<EntityService>();

CmoBehaveApiService get cmoBehaveApiService => _get<CmoBehaveApiService>();

CmoPerformApiService get cmoPerformApiService => _get<CmoPerformApiService>();

CmoDatabaseMasterService get cmoDatabaseMasterService =>
    _get<CmoDatabaseMasterService>();

ConfigService get configService => _get<ConfigService>();

Future<void> registerGetIt() async {
  _get.registerLazySingleton(() => DeviceInfoService());
  _get.registerLazySingleton(() => AppInfoService());
  _get.registerLazySingleton(() => EntityService());
  _get.registerLazySingleton(() => CmoBehaveApiService());
  _get.registerLazySingleton(() => CmoPerformApiService());
  _get.registerLazySingleton(() => CmoDatabaseMasterService());
  _get.registerLazySingleton(() => ConfigService());

  await _get.allReady();
}
