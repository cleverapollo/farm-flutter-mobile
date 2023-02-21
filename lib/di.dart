import 'package:cmo/service/app_info_service.dart';
import 'package:cmo/service/device_info_service.dart';
import 'package:get_it/get_it.dart';

final get = GetIt.instance;

Future<void> registerGetIt() async {
  get.registerLazySingleton(() => DeviceInfoService());
  get.registerLazySingleton(() => AppInfoService());

  await get.allReady();
}
