import 'package:cmo/model/user_info.dart';
import 'package:cmo/service/cmo_api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends HydratedCubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoState.loading());

  Future<void> getUser(BuildContext context) async {
    final res = await cmoApi.getUser(context: context);
    debugPrint('[UserInfoCubit] data: $res');

    if (res != null) {
      // * success
      emit(UserInfoState.data(userInfo: res));
    } else {
      // * error
      emit(UserInfoState.error());
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
