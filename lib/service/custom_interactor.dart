import 'dart:io';

import 'package:cmo/enum/enum.dart';
import 'package:cmo/env/env.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/service.dart';
import 'package:cmo/utils/constants.dart';
import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {

  const CustomInterceptor(this.userRoleEnum);

  final UserRoleEnum userRoleEnum;

  Future<String?> _getAccessToken() async {
    String? token;
    switch (userRoleEnum) {
      case UserRoleEnum.behave:
        token = await secureStorage.read(key: SecureStorageConstant.BEHAVE_ACCESS_TOKEN);
        break;
      case UserRoleEnum.regionalManager:
      case UserRoleEnum.farmerMember:
        token = await secureStorage.read(key: SecureStorageConstant.PERFORM_ACCESS_TOKEN);
        break;
    }

    return token;
  }

  String get authApiUrl {
    switch (userRoleEnum) {
      case UserRoleEnum.behave:
        return Env.behaveDnnAuthUrl;
      case UserRoleEnum.regionalManager:
      case UserRoleEnum.farmerMember:
        return Env.performDnnAuthUrl;
    }
  }

  Future<void> _saveAccessToken(
    String? accessToken,
    String? renewalToken,
  ) async {
    switch (userRoleEnum) {
      case UserRoleEnum.behave:
        await secureStorage.write(
          key: SecureStorageConstant.BEHAVE_ACCESS_TOKEN,
          value: accessToken,
        );
        await secureStorage.write(
          key: SecureStorageConstant.BEHAVE_RENEWAL_TOKEN,
          value: renewalToken,
        );
        break;
      case UserRoleEnum.regionalManager:
      case UserRoleEnum.farmerMember:
        await secureStorage.write(
          key: SecureStorageConstant.PERFORM_ACCESS_TOKEN,
          value: accessToken,
        );
        await secureStorage.write(
          key: SecureStorageConstant.PERFORM_RENEWAL_TOKEN,
          value: renewalToken,
        );
        break;
    }
  }

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final accessToken = await _getAccessToken();

    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');

      final token = accessToken ?? '';
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
    }

    return super.onRequest(options, handler);
  }

  // * 3) When an error occurs
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // * When a 401 error occurs, try to reissue a token, and when the token is reissued, request a new token again
    final username = await secureStorage.read(key: 'user_name');
    final password = await secureStorage.read(key: 'user_password');

    // * Throw an error if there is no username at all.
    if (username == null || username.isEmpty) {
      return handler.reject(err); // * return the error
    }

    // * Throw an error if there is no password at all.
    if (password == null || password.isEmpty) {
      return handler.reject(err); // * return the error
    }

    if (err.response?.statusCode == 401) {
      final dio = Dio();
      try {
        final body = {
          'u': username,
          'p': password,
        };
        final responseReLogin = await dio.post<JsonData>(
          '${authApiUrl}login',
          data: body,
        );
        final data = responseReLogin.data;
        final user = data == null ? null : UserAuth.fromJson(data);

        final accessToken = user?.accessToken;
        if (accessToken == null || accessToken.isEmpty) {
          return handler.reject(err);
        }

        await _saveAccessToken(accessToken, user?.renewalToken);

        final options = err.requestOptions;
        options.headers.addAll({
          HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        });

        // * Resend request and get response
        final response = await dio.fetch<dynamic>(options);

        // * Return that the request was successful with a response
        return handler.resolve(response);
      } on DioError catch (e) {
        return handler.reject(e);
      }
    }

    return handler.reject(err);
  }
}
