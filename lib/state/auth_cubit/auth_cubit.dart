import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'package:cmo/di.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/user_auth.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState.unauthorized());

  Future<void> logIn(LogInAuthEvent event) async {
    final login = await _login(event.username, event.password);

    if (login != null &&
        login.accessToken != null &&
        login.renewalToken != null) {
      await _saveUsernameAndPassword(event.username, event.password);
      await _saveAccessRevewalToken(login.accessToken!, login.renewalToken!);
      await _refreshToken();
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
    void Function()? onSuccess,
    void Function()? onFailure,
  }) async {
    final username = await _readUsername();
    final password = await _readPassword();

    if (username == null || password == null) {
      emit(AuthState.unauthorized());
      onFailure?.call();
      return;
    }

    final login = await _login(username, password);

    if (login != null &&
        login.accessToken != null &&
        login.renewalToken != null) {
      await _saveAccessRevewalToken(login.accessToken!, login.renewalToken!);
      await _refreshToken();
      emit(AuthState.authorized());
      onSuccess?.call();
    } else {
      emit(AuthState.unauthorized());
      onFailure?.call();
      return;
    }
  }

  Future<UserAuth?> _login(
    String username,
    String password,
  ) async {
    return cmoApiService.login(username, password);
  }

  Future<void> _refreshToken() async {
    final renewalToken = await _readRenewalToken();
    if (renewalToken == null) {
      return;
    }

    final login = await cmoApiService.refreshToken(renewalToken);
    if (login != null &&
        login.accessToken != null &&
        login.renewalToken != null) {
      await _saveAccessRevewalToken(login.accessToken!, login.renewalToken!);
    }
  }

  Future<String?> _readRenewalToken() async {
    return secureStorage.read(key: 'renewalToken');
  }

  Future<String?> _readUsername() async {
    return secureStorage.read(key: 'user_name');
  }

  Future<String?> _readPassword() async {
    return secureStorage.read(key: 'user_password');
  }

  Future<void> _saveUsernameAndPassword(
    String username,
    String password,
  ) async {
    await secureStorage.write(key: 'user_name', value: username);
    await secureStorage.write(key: 'user_password', value: password);
  }

  Future<void> _saveAccessRevewalToken(
    String accessToken,
    String renewalToken,
  ) async {
    await secureStorage.write(key: 'accessToken', value: accessToken);
    await secureStorage.write(key: 'renewalToken', value: renewalToken);
  }

  Future<void> _clearSecureStorage() async {
    await secureStorage.write(key: 'accessToken', value: null);
    await secureStorage.write(key: 'renewalToken', value: null);
    await secureStorage.write(key: 'user_name', value: null);
    await secureStorage.write(key: 'user_password', value: null);
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
