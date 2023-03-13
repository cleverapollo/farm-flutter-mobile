import 'package:cmo/service/cmo_api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'user_info_state.dart';

class AuthCubit extends HydratedCubit<UserInfoState> {
  AuthCubit() : super(UserInfoState.loading());

  init(BuildContext context) async {
    final res = await cmoApi.getUser(context: context);
    if (res != null) {
      // * success
    } else {
      // * error
    }
  }

  @override
  UserInfoState? fromJson(Map<String, dynamic> json) {
    // return UserInfoState
  }

  @override
  Map<String, dynamic>? toJson(UserInfoState state) {
    return state.join(
      (p0) {
        return null;
      },
      (p0) {
        return null;
      },
      (p0) {
        return null;
      },
    );
  }
}
