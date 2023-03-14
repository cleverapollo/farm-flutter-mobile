import 'package:cmo/di.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/user_auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState.unauthorized());

  Future<void> logIn(LogInAuthEvent event) async {
    final login = await _login(event.username, event.password);

    if (login == null) {
      emit(AuthState.unauthorized());
      event.onFailure();
      return;
    }

    debugPrint('[AuthCubit] LogInAuthEvent: $login');

    if (login.accessToken != null && login.renewalToken != null) {
      await _saveUsernameAndPassword(event.username, event.password);
      await _saveAccessRevewalToken(login.accessToken!, login.renewalToken!);
      emit(AuthState.authorized());

      event.onSuccess();
    } else {
      emit(AuthState.unauthorized());
      event.onFailure();
    }
  }

  Future<void> logOut() async {
    await _clearSecureStorage();
    emit(AuthState.unauthorized());
  }

  Future<void> logInWithSavedCredentials({
    Function()? onSuccess,
    Function()? onFailure,
  }) async {
    final username = await _readUsername();
    final password = await _readPassword();

    if (username == null || password == null) {
      emit(AuthState.unauthorized());
      onFailure?.call();
      return;
    }

    final login = await _login(username, password);

    if (login == null) {
      emit(AuthState.unauthorized());
      onFailure?.call();
      return;
    }

    if (login.accessToken != null && login.renewalToken != null) {
      await _saveAccessRevewalToken(login.accessToken!, login.renewalToken!);
    }

    emit(AuthState.authorized());
    onSuccess?.call();
  }

  Future<UserAuth?> _login(
    String username,
    String password,
  ) async {
    return await cmoApiService.login(
      username,
      password,
    );
  }

  _saveUsernameAndPassword(String username, String password) async {
    await secureStorage.write(
      key: 'user_name',
      value: username,
    );

    await secureStorage.write(
      key: 'user_password',
      value: password,
    );
  }

  Future<String?> _readUsername() async {
    return await secureStorage.read(
      key: 'user_name',
    );
  }

  Future<String?> _readPassword() async {
    return await secureStorage.read(
      key: 'user_password',
    );
  }

  _clearSecureStorage() async {
    await secureStorage.write(
      key: 'accessToken',
      value: null,
    );

    await secureStorage.write(
      key: 'renewalToken',
      value: null,
    );

    await secureStorage.write(
      key: 'user_name',
      value: null,
    );

    await secureStorage.write(
      key: 'user_password',
      value: null,
    );
  }

  _saveAccessRevewalToken(String accessToken, String renewalToken) async {
    await secureStorage.write(
      key: 'accessToken',
      value: accessToken,
    );
    await secureStorage.write(
      key: 'renewalToken',
      value: renewalToken,
    );
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    final authorized = json['authorized'] as bool;

    if (authorized == true) {
      return AuthState.authorized();
    } else {
      return AuthState.unauthorized();
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.join<Map<String, dynamic>?>(
      (state) {
        return {
          'authorized': true,
        };
      },
      (p0) {
        return {
          'authorized': false,
        };
      },
    );
  }
}
