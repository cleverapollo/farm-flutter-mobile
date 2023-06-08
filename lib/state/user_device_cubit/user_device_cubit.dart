import 'package:cmo/di.dart';
import 'package:cmo/model/user_device.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'user_device_state.dart';

class UserDeviceCubit extends HydratedCubit<UserDeviceState> {
  UserDeviceCubit() : super(UserDeviceState.loading());

  Future<void> createBehaveUserDevice() async {
    emit(UserDeviceState.loading());
    final res = await cmoBehaveApiService.createUserDevice(
      appName: appInfoService.appName,
      appVersionNumber: appInfoService.version,
      deviceId: deviceInfoService.deviceId ?? '',
      deviceOS: deviceInfoService.os,
      deviceVersion: deviceInfoService.version,
    );
    if (res != null) {
      await cmoDatabaseMasterService.cacheUserDevice(res);
      emit(UserDeviceState.data(userDevice: res));
    }
    else {
      emit(UserDeviceState.error());
    }
  }

  Future<void> createPerformUserDevice() async {
    emit(UserDeviceState.loading());
    final res = await cmoPerformApiService.createUserDevice(
      appName: appInfoService.appName,
      appVersionNumber: appInfoService.version,
      deviceId: deviceInfoService.deviceId ?? '',
      deviceOS: deviceInfoService.os,
      deviceVersion: deviceInfoService.version,
    );
    if (res != null) {
      await cmoDatabaseMasterService.cacheUserDevice(res);
      emit(UserDeviceState.data(userDevice: res));
    }
    else {
      emit(UserDeviceState.error());
    }
  }

  UserDevice? get data => state.join(
        (loading) => null,
        (data) => data.userDevice,
        (error) => null,
      );

  @override
  Future<void> clear() async {
    emit(UserDeviceState.loading());
    return super.clear();
  }

  @override
  UserDeviceState? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return UserDeviceState.data(userDevice: UserDevice.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(UserDeviceState state) {
    return state.join(
      (loading) => null,
      (data) {
        return data.userDevice?.toJson();
      },
      (error) => null,
    );
  }
}
