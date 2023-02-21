import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  BaseDeviceInfo? _info;

  Future<void> init() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      _info = await deviceInfo.androidInfo;
    } else {
      _info = await deviceInfo.iosInfo;
    }
  }

  T? _getInfoByOS<T>(
    T Function(AndroidDeviceInfo) android,
    T Function(IosDeviceInfo) ios,
  ) {
    if (_info == null) return null;

    if (Platform.isAndroid) {
      return android(_info as AndroidDeviceInfo);
    } else {
      return ios(_info as IosDeviceInfo);
    }
  }

  String? get deviceId => _getInfoByOS<String?>(
        (i) => i.id,
        (i) => i.identifierForVendor,
      );

  String? get device => _getInfoByOS<String?>(
        (i) => i.model,
        (i) => i.utsname.machine,
      );

  String? get os => _getInfoByOS<String?>(
        (i) => 'Android ${i.version.release}',
        (i) => 'iOS ${i.systemVersion}',
      );
}
