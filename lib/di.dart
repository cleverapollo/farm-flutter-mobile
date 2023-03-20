import 'package:cmo/service/app_info_service.dart';
import 'package:cmo/service/cmo_api_service.dart';
import 'package:cmo/service/cmo_database_master_service.dart';
import 'package:cmo/service/cmo_database_service.dart';
import 'package:cmo/service/device_info_service.dart';
import 'package:cmo/service/entity_service.dart';
import 'package:get_it/get_it.dart';

final _get = GetIt.instance;

DeviceInfoService get deviceInfoService => _get<DeviceInfoService>();

AppInfoService get appInfoService => _get<AppInfoService>();

EntityService get entityService => _get<EntityService>();

CmoApiService get cmoApiService => _get<CmoApiService>();

CmoDatabaseService get cmoDatabaseService => _get<CmoDatabaseService>();

CmoDatabaseMasterService get cmoDatabaseMasterService =>
    _get<CmoDatabaseMasterService>();

Future<void> registerGetIt() async {
  _get.registerLazySingleton(() => DeviceInfoService());
  _get.registerLazySingleton(() => AppInfoService());
  _get.registerLazySingleton(() => EntityService());
  _get.registerLazySingleton(() => CmoApiService());
  _get.registerLazySingleton(() => CmoDatabaseService());
  _get.registerLazySingleton(() => CmoDatabaseMasterService());

  await _get.allReady();
}
