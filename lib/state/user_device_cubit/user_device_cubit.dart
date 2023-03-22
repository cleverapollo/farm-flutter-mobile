import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'package:cmo/di.dart';
import 'package:cmo/model/user_device.dart';

part 'user_device_state.dart';

class UserDeviceCubit extends HydratedCubit<UserDeviceState> {
  UserDeviceCubit() : super(UserDeviceState.loading());

  Future<void> createUserDevice(BuildContext context) async {
    emit(UserDeviceState.loading());
    final res = await cmoApiService.createUserDevice(
      appName: appInfoService.appName,
      appVersionNumber: appInfoService.version,
      deviceId: deviceInfoService.deviceId ?? '',
      deviceOS: deviceInfoService.os,
      deviceVersion: deviceInfoService.version,
    );
    if (res != null) {
      emit(UserDeviceState.data(userDevice: res));
    } else {
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
