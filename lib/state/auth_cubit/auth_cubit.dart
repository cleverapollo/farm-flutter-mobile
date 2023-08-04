import 'package:cmo/di.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> logIn(LogInAuthEvent event) async {
    final result = await _login(event.username, event.password);

    if (result == null) {
      return;
    }
  }

  Future<void> logOut() async {
    await _clearSecureStorage();
    emit(const AuthState());
  }

  Future<void> logInWithSavedCredentials({
    void Function()? onSuccess,
    void Function()? onFailure,
  }) async {
    final username = await _readUsername();
    final password = await _readPassword();

    if (username == null || password == null) {
      emit(const AuthState());
      onFailure?.call();
      return;
    }

    final login = await _login(username, password);

    if (login != null) {
      await _refreshToken();
      onSuccess?.call();
    } else {
      emit(const AuthState());
      onFailure?.call();
      return;
    }
  }

  Future<bool?> _login(
    String username,
    String password,
  ) async {
    final UserAuth? behaveLoginResponse = null; // await cmoBehaveApiService.behaveLogin(username, password);
    final performLoginResponse = await cmoPerformApiService.performLogin(username, password);

    if (performLoginResponse == null && behaveLoginResponse == null) {
      showSnackError(msg: 'Login failed, please try again');
      return null;
    } else {
      await _saveBehaveToken(
        behaveLoginResponse?.accessToken,
        behaveLoginResponse?.renewalToken,
      );

      await _savePerformToken(
        performLoginResponse?.accessToken,
        performLoginResponse?.renewalToken,
      );

      await _saveUsernameAndPassword(
        username,
        password,
      );

      await configService.setIsAuthorized(isAuthorized: true);
      emit(
        state.copyWith(
          haveBehaveRole: behaveLoginResponse != null,
          havePerformRole: performLoginResponse != null,
          performUserAuth: performLoginResponse,
          behaveUserAuth: behaveLoginResponse,
        ),
      );

      return true;
    }
  }

  Future<void> _refreshToken() async {
    final userRole = await configService.getActiveUserRole();
    final renewalToken = await _readRenewalToken();

    if (renewalToken == null) {
      return;
    }

    final login = await cmoPerformApiService.refreshToken(renewalToken);
    if (login != null &&
        login.accessToken != null &&
        login.renewalToken != null) {
      if (userRole.isBehave) {
        await _saveBehaveToken(
            login.accessToken!, login.renewalToken!);
      } else {
        await _savePerformToken(
            login.accessToken!, login.renewalToken!);
      }
    }
  }

  Future<String?> _readRenewalToken() async {
    final userRole = await configService.getActiveUserRole();

    if (userRole.isBehave) {
      return secureStorage.read(
        key: UserRoleConfig.behaveRole.getRenewalTokenKey,
      );
    } else {
      return secureStorage.read(
        key: UserRoleConfig.performRole.getRenewalTokenKey,
      );
    }
  }

  Future<String?> _readUsername() async {
    return secureStorage.read(key: SecureStorageConstant.USER_NAME);
  }

  Future<String?> _readPassword() async {
    return secureStorage.read(key: SecureStorageConstant.USER_PASSWORD);
  }

  Future<void> _saveUsernameAndPassword(
    String username,
    String password,
  ) async {
    await secureStorage.write(key: SecureStorageConstant.USER_NAME, value: username,);
    await secureStorage.write(key: SecureStorageConstant.USER_PASSWORD, value: password,);
  }

  Future<void> _saveBehaveToken(
    String? accessToken,
    String? renewalToken,
  ) async {
    await secureStorage.write(
      key: UserRoleConfig.behaveRole.getAccessTokenKey,
      value: accessToken,
    );
    await secureStorage.write(
      key: UserRoleConfig.behaveRole.getRenewalTokenKey,
      value: renewalToken,
    );
  }

  Future<void> _savePerformToken(
    String? accessToken,
    String? renewalToken,
  ) async {
    await secureStorage.write(
      key: UserRoleConfig.performRole.getAccessTokenKey,
      value: accessToken,
    );
    await secureStorage.write(
      key: UserRoleConfig.performRole.getRenewalTokenKey,
      value: renewalToken,
    );
  }

  Future<void> _clearSecureStorage() async {
    await secureStorage.write(
      key: SecureStorageConstant.BEHAVE_RENEWAL_TOKEN,
      value: null,
    );

    await secureStorage.write(
      key: SecureStorageConstant.BEHAVE_ACCESS_TOKEN,
      value: null,
    );

    await secureStorage.write(
      key: SecureStorageConstant.PERFORM_RENEWAL_TOKEN,
      value: null,
    );

    await secureStorage.write(
      key: SecureStorageConstant.PERFORM_ACCESS_TOKEN,
      value: null,
    );

    await secureStorage.write(
      key: SecureStorageConstant.USER_NAME,
      value: null,
    );

    await secureStorage.write(
      key: SecureStorageConstant.USER_PASSWORD,
      value: null,
    );
  }

  Future<void> checkFirstLaunch() async {
    final isFirstLaunch = await configService.isFirstLaunch();
    if (isFirstLaunch) {
      await _clearSecureStorage();
      // if (isDone) {
        await configService.setFirstLaunch(isFirstLaunch: false);
      // }
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return null;
  }
}
