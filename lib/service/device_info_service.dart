import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  BaseDeviceInfo? _info;

  String? androidId;

  Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      _info = await deviceInfo.androidInfo;
    } else {
      _info = await deviceInfo.iosInfo;
    }

    if (Platform.isAndroid) {
      androidId = await const AndroidId().getId();
    }
  }

  T? _getInfoByOS<T>(
    T Function(AndroidDeviceInfo) android,
    T Function(IosDeviceInfo) ios,
  ) {
    final info = _info;
    if (info == null) return null;

    if (Platform.isAndroid) {
      return android(info as AndroidDeviceInfo);
    } else {
      return ios(info as IosDeviceInfo);
    }
  }

  String? get deviceId => _getInfoByOS<String?>(
        (i) => androidId ?? i.id,
        (i) => i.identifierForVendor,
      );

  String? get device => _getInfoByOS<String?>(
        (i) => i.model,
        (i) => i.utsname.machine,
      );

  String? get os => _getInfoByOS<String?>(
        (i) => 'Android ${i.version.release}',
        (i) => 'iOS ${i.model}',
      );

  String? get version => _getInfoByOS<String?>(
        (i) => i.version.sdkInt.toString(),
        (i) => i.systemName.toString(),
      );
}
