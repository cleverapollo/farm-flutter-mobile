import 'package:cmo/di.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState.unauthorized());

  Future<void> logIn(LogInAuthEvent event) async {
    final result = await _login(event.username, event.password);

    if (result == null) {
      emit(AuthState.unauthorized());
      event.onResponse(null);
      return;
    }

    await _saveUsernameAndPassword(event.username, event.password);

    emit(AuthState.authorized());
    event.onResponse(result);
  }

  Future<void> logOut() async {
    final result = await _clearSecureStorage();

    if (result) {
      emit(AuthState.unauthorized());
    }
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

    emit(AuthState.authorized());
    onSuccess?.call();

    final login = await _login(username, password);

    if (login != null) {
      await _refreshToken();
      emit(AuthState.authorized());
      onSuccess?.call();
    } else {
      emit(AuthState.unauthorized());
      onFailure?.call();
      return;
    }
  }

  Future<UserRoleConfig?> _login(
    String username,
    String password,
  ) async {
    final result = await cmoApiService.loginUseCase(username, password);

    if (result?.performUserAuth != null && result?.behaveUserAuth != null) {
      await _savePerformAccessRevewalToken(
        result!.performUserAuth!.accessToken!,
        result.performUserAuth!.renewalToken!,
      );

      await _saveBehaveAccessRevewalToken(
        result.behaveUserAuth!.accessToken!,
        result.behaveUserAuth!.renewalToken!,
      );

      return UserRoleConfig.bothRole;
    }

    if (result?.behaveUserAuth != null) {
      await _saveBehaveAccessRevewalToken(
        result!.behaveUserAuth!.accessToken!,
        result.behaveUserAuth!.renewalToken!,
      );

      return UserRoleConfig.behaveRole;
    }

    if (result?.performUserAuth != null) {
      await _saveBehaveAccessRevewalToken(
        result!.performUserAuth!.accessToken!,
        result.performUserAuth!.renewalToken!,
      );

      return UserRoleConfig.performRole;
    }

    return null;
  }

  Future<void> _refreshToken() async {
    final userRole = await configService.getActiveUserRole();
    final renewalToken = await _readRenewalToken();

    if (renewalToken == null) {
      return;
    }

    final login = await cmoApiService.refreshToken(renewalToken);
    if (login != null &&
        login.accessToken != null &&
        login.renewalToken != null) {
      if (userRole.isBehave) {
        await _saveBehaveAccessRevewalToken(
            login.accessToken!, login.renewalToken!);
      } else {
        await _savePerformAccessRevewalToken(
            login.accessToken!, login.renewalToken!);
      }
    }
  }

  Future<String?> _readRenewalToken() async {
    final userRole = await configService.getActiveUserRole();

    if (userRole.isBehave) {
      return secureStorage.read(
          key: UserRoleConfig.behaveRole.getRenewalTokenKey);
    } else {
      return secureStorage.read(
          key: UserRoleConfig.performRole.getRenewalTokenKey);
    }
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

  Future<void> _saveBehaveAccessRevewalToken(
      String accessToken, String renewalToken) async {
    await secureStorage.write(
        key: UserRoleConfig.behaveRole.getAccessTokenKey, value: accessToken);
    await secureStorage.write(
        key: UserRoleConfig.behaveRole.getRenewalTokenKey, value: renewalToken);
  }

  Future<void> _savePerformAccessRevewalToken(
      String accessToken, String renewalToken) async {
    await secureStorage.write(
        key: UserRoleConfig.performRole.getAccessTokenKey, value: accessToken);
    await secureStorage.write(
        key: UserRoleConfig.performRole.getRenewalTokenKey,
        value: renewalToken);
  }

  Future<void> saveUserCurrentRole(String userRole) async {
    await secureStorage.write(key: 'user_role', value: userRole);
  }

  Future<String?> getUserCurrentRole() async {
    return secureStorage.read(key: 'user_role');
  }

  Future<bool> _clearSecureStorageAfterSelectRole(
      UserRoleConfig userRoleUnselected) async {
    var isDone = false;

    final futures = <Future<dynamic>>[];

    futures
      ..add(secureStorage.write(
          key: userRoleUnselected.getAccessTokenKey, value: null))
      ..add(secureStorage.write(
          key: userRoleUnselected.getRenewalTokenKey, value: null));

    await Future.wait(futures).then((value) => isDone = true);

    return isDone;
  }

  Future<bool> _clearSecureStorage() async {
    var isDone = false;

    final futures = <Future<dynamic>>[];

    futures
      ..add(secureStorage.write(
          key: UserRoleConfig.behaveRole.getRenewalTokenKey, value: null))
      ..add(secureStorage.write(
          key: UserRoleConfig.behaveRole.getAccessTokenKey, value: null))
      ..add(secureStorage.write(
          key: UserRoleConfig.performRole.getRenewalTokenKey, value: null))
      ..add(secureStorage.write(
          key: UserRoleConfig.performRole.getAccessTokenKey, value: null))
      ..add(secureStorage.write(key: 'user_name', value: null))
      ..add(secureStorage.write(key: 'user_password', value: null))
      ..add(secureStorage.write(key: 'user_role', value: null));

    await Future.wait(futures).then((value) => isDone = true);

    return isDone;
  }

  Future<void> checkFirstLaunch() async {
    final isFirstLaunch = await configService.isFirstLaunch();
    if (isFirstLaunch) {
      await _clearSecureStorage();
      await configService.setFirstLaunch(isFirstLaunch: false);
    }
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
