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

  Future<void> getUserInfoWithRole({
    required bool haveBehave,
    required bool havePerform,
  }) async {
    emit(state.copyWith(loading: true));
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

    emit(state.copyWith(loading: false));
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

  Future<void> setActiveUserInfo({required bool isBehave}) async {
    if (isBehave && state.behaveUserInfo != null) {
      await configService.setActiveUser(userInfo: state.behaveUserInfo!);
    } else if (state.performUserInfo != null){
      await configService.setActiveUser(userInfo: state.performUserInfo!);
    }
  }

  @override
  Future<void> clear() async {
    emit(const UserInfoState());
    return super.clear();
  }

  @override
  UserInfoState? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
  }

  @override
  Map<String, dynamic>? toJson(UserInfoState state) {
    return null;
  }
}
