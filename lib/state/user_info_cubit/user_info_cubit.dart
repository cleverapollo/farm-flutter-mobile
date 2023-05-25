import 'package:cmo/di.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends HydratedCubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoState.loading());

  Future<void> getUserInfoAndUserRoles(BuildContext context) async {
    final res = await cmoApiService.getUser();

    if (res != null) {
      final roles = await cmoApiService.getUserRoles(userId: res.userId!);
      final futures = <Future<dynamic>>[];

      if (res.listRoles != null) {
        for (var item in res.listRoles!) {
          futures.add(
            cmoDatabaseService.cacheUserRole(
                userId: res.userId!, roleName: item.roleName ?? ''),
          );
        }
      }

      for (final UserRolePortal item in roles ?? []) {
        futures.add(
          cmoDatabaseService.cacheUserRolePortal(
              userId: res.userId!,
              portalId: item.portalId!,
              portalName: item.portalName!),
        );
      }

      await Future.wait(futures);

      emit(UserInfoState.data(userInfo: res, userRoles: roles));
    } else {
      emit(UserInfoState.error());
    }
  }

  Future<void> getCompaniesByUserId(BuildContext context) async {
    final res = await cmoApiService.getUser();

    if (res != null) {
      final result =
          await cmoApiService.getCompaniesByUserId(userId: res.userId!);

      if (result == null || result.isEmpty) return;

      final futures = <Future<dynamic>>[];

      for (final item in result) {
        futures.add(cmoDatabaseMasterService.cacheCompany(item));
      }

      await Future.wait(futures);
    }
  }

  UserInfo? get data => state.join(
        (loading) => null,
        (data) => data.userInfo,
        (error) => null,
      );

  @override
  Future<void> clear() async {
    emit(UserInfoState.loading());
    return super.clear();
  }

  @override
  UserInfoState? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return UserInfoState.data(userInfo: UserInfo.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(UserInfoState state) {
    return state.join(
      (loading) => null,
      (data) {
        return data.userInfo?.toJson();
      },
      (error) => null,
    );
  }
}
