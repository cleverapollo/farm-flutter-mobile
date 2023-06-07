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

  Future<void> createUserDevice(
      BuildContext context, UserRoleConfig userRole) async {
    final user = await cmoPerformApiService.getUser(userRole);

    List<UserRolePortal>? result = [];

    if (user?.userId != null) {
      result = await cmoPerformApiService.getUserRoles(
          userId: user!.userId!, userRole: userRole);
    }
    emit(UserDeviceState.loading());
    final res = await cmoPerformApiService.createUserDevice(
      appName: appInfoService.appName,
      appVersionNumber: appInfoService.version,
      deviceId: deviceInfoService.deviceId ?? '',
      deviceOS: deviceInfoService.os,
      deviceVersion: deviceInfoService.version,
    );
    if (res != null) {
      for (final UserRolePortal item in result ?? []) {
        if (item.isBehaveRole) {
          await cmoDatabaseService.cacheUserDevice(res);
        }
      }

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
