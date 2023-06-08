import 'package:cmo/di.dart';
import 'package:cmo/enum/user_role_enum.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends HydratedCubit<UserInfoState> {
  UserInfoCubit() : super(const UserInfoState());

  Future<void> getUserDataAfterLogin(
      BuildContext context, UserRoleConfig userRole) async {
    final deviceInfoCubit = context.read<UserDeviceCubit>();

    final futures = <Future<dynamic>>[];

    futures
      ..add(getUserInfoAndUserRoles(context, userRole))
      ..add(getCompaniesByUserId(context, userRole))
      ..add(deviceInfoCubit.createUserDevice(context, userRole));

    await Future.wait(futures);
  }

  Future<void> getUserInfoWithRole({
    required bool haveBehave,
    required bool havePerform,
  }) async {
    if (!havePerform) {
      emit(state.copyWith(isBehave: true));
      await getBehaveUserInfo();
    } else {
      await getPerformUserInfo();
      if (!state.checkRegionalManagerRoleType) {
        emit(state.copyWith(isFarmer: true));
      } else if (haveBehave) {
        await getBehaveUserInfo();
        emit(
          state.copyWith(
            isBehave: true,
            isRM: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isBehave: false,
            isRM: true,
          ),
        );
      }
    }
  }

  Future<void> getBehaveUserInfo() async {
    emit(state.copyWith(loading: true));
    final res = await cmoBehaveApiService.getBehaveUser();
    if (res != null) {
      emit(state.copyWith(behaveUserInfo: res));
    }

    emit(state.copyWith(loading: false));
  }

  Future<void> getPerformUserInfo() async {
    emit(state.copyWith(loading: true));
    final res = await cmoPerformApiService.getPerformUser();
    if (res != null) {
      emit(state.copyWith(performUserInfo: res));
    }

    emit(state.copyWith(loading: false));
  }

  Future<void> getUserInfoAndUserRoles(
      BuildContext context, UserRoleConfig userRole) async {
    // final res = await cmoPerformApiService.getUser(userRole);
    //
    // if (res == null) {
    //   return emit(UserInfoState.error());
    // }
    //
    // final roles = await cmoPerformApiService.getUserRoles(
    //     userId: res.userId!, userRole: userRole);
    // final futures = <Future<dynamic>>[];
    //
    // if (res.listRoles != null) {
    //   for (final item in res.listRoles!) {
    //     futures.add(
    //       cmoDatabaseService.cacheUserRole(
    //           userId: res.userId!, roleName: item.roleName ?? ''),
    //     );
    //   }
    // }
    //
    // for (final UserRolePortal item in roles ?? []) {
    //   futures.add(
    //     cmoDatabaseService.cacheUserRolePortal(
    //         userId: res.userId!,
    //         portalId: item.portalId!,
    //         portalName: item.portalName!),
    //   );
    // }
    //
    // await Future.wait(futures);
    //
    // await configService.setActiveUser(userInfo: res);
    // emit(UserInfoState.data(userInfo: res, userRoles: roles, userRole: userRole));
  }


  Future<void> getCompaniesByUserId(
      BuildContext context, UserRoleConfig userRole) async {
    // final res = await cmoPerformApiService.getUser(userRole);
    //
    // if (res != null) {
    //   final result =
    //       await cmoPerformApiService.getCompaniesByUserId(userId: res.userId!);
    //
    //   if (result == null || result.isEmpty) return;
    //
    //   final futures = <Future<dynamic>>[];
    //
    //   for (final item in result) {
    //     futures.add(cmoDatabaseMasterService.cacheCompany(item));
    //   }
    //
    //   await Future.wait(futures);
    // }
  }

  Future setActiveUserRole({required UserRoleEnum userRole}) {
    return configService.setActiveUserRole(userRole: userRole);
  }

  @override
  Future<void> clear() async {
    // emit(UserInfoState.loading());
    return super.clear();
  }

  @override
  UserInfoState? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    // return UserInfoState.data(userInfo: UserInfo.fromJson(json));
  }

  @override
  Map<String, dynamic>? toJson(UserInfoState state) {
    // return state.join(
    //   (loading) => null,
    //   (data) {
    //     return data.userInfo?.toJson();
    //   },
    //   (error) => null,
    // );
  }
}
