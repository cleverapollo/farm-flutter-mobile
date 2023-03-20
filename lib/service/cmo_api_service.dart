import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cmo/main.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/master_data_message.dart';
import 'package:cmo/model/user_auth.dart';
import 'package:cmo/model/user_device.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/ui/snack/success.dart';
import 'package:cmo/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

typedef JsonData = Map<String, dynamic>;
typedef JsonListData = List<dynamic>;

class CmoApiService {
  Dio client = Dio(
    BaseOptions(
      validateStatus: (status) => status != null && status < 500,
    ),
  )
    ..interceptors.add(CustomInterceptor())
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        logPrint: (o) => log('$o'),
      ),
    );

  // curl 'https://logistics.myeu.africa/cmo/DesktopModules/JwtAuth/API/mobile/login' \
  // --data-raw '{"u":"anthonyp@apstory.co.za","p":"test1234"}' \
  // --compressed
  Future<UserAuth?> login(
    String username,
    String password,
  ) async {
    final body = {
      'u': username,
      'p': password,
    };

    final response = await client.postUri<JsonData>(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/JwtAuth/API/mobile/login',
      ),
      data: body,
    );

    if (response.statusCode != 200) {
      showSnackError(msg: '${response.statusCode} - ${response.data}');
      return null;
    }

    final data = response.data;
    return data == null ? null : UserAuth.fromJson(data);
  }

  // curl 'https://logistics.myeu.africa/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetUser' \
  // -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36' \
  // --compressed
  Future<UserInfo?> getUser() async {
    final response = await client.getUri<JsonData>(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetUser',
      ),
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : UserInfo.fromJson(data);
  }

  // curl 'https://logistics.myeu.africa/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/CreateUserDevice' \
  // --data-raw '{"DeviceId":"0ba4a0a6-950f-4169-b7fc-3c8a7715c5a2","DeviceOS":"web","DeviceVersion":"10.15.7","UserDeviceId":6539,"AppName":"Behave","AppVersionNumber":"2.0.3"}' \
  // --compressed
  Future<UserDevice?> createUserDevice({
    required String? deviceId,
    required String? deviceOS,
    required String? deviceVersion,
    required String? appName,
    required String? appVersionNumber,
  }) async {
    final body = {
      'DeviceId': deviceId,
      'DeviceOS': deviceOS,
      'DeviceVersion': deviceVersion,
      'AppName': appName,
      'AppVersionNumber': appVersionNumber,
    };

    final response = await client.postUri<JsonData>(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/CreateUserDevice',
      ),
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : UserDevice.fromJson(data);
  }

  Future<List<Company>?> getCompaniesByUserId({
    required int userId,
  }) async {
    final uri = Uri.https(
      cmoUrl,
      '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetCompanyByUserId',
      {'userId': userId.toString()},
    );

    final response = await client.getUri<JsonListData>(
      uri,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data?.map((e) => Company.fromJson(e as JsonData)).toList();
  }

  Future<bool> createSystemEvent({
    required String systemEventName,
    required int primaryKey,
    required int userDeviceId,
  }) async {
    final uri = Uri.https(
      cmoUrl,
      '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/CreateSystemEvent',
    );

    final body = {
      'SystemEventName': 'SyncAssessmentMasterData',
      'PrimaryKey': primaryKey,
      'UserDeviceId': userDeviceId
    };

    final response = await client.postUri<dynamic>(
      uri,
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }

  Future<MasterDataMessage?> pullMessage({
    required String pubsubApiKey,
    required String topicMasterDataSync,
    required int currentClientId, // = UserDeviceId
    int pageSize = 200,
  }) async {
    final uri = Uri.https(
      cmoUrl,
      '/pubsubapi/api/v1/message',
      {
        'key': pubsubApiKey,
        'client': '$currentClientId',
        'topic': '$topicMasterDataSync*.$currentClientId',
        'pageSize': '$pageSize',
      },
    );

    final response = await client.getUri<JsonData>(
      uri,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : MasterDataMessage.fromJson(data);
  }

  Future<bool?> deleteMessage({
    required String pubsubApiKey,
    required int currentClientId, // = UserDeviceId
    required List<Message> messages,
  }) async {
    final uri = Uri.https(
      cmoUrl,
      '/pubsubapi/api/v1/message',
      {
        'key': pubsubApiKey,
        'client': '$currentClientId',
        'topic': 'Cmo.MasterDataDeviceSync.*.$currentClientId',
      },
    );
    final body = messages.map((e) => e.toJson()).toList();

    final response = await client.deleteUri<dynamic>(
      uri,
      data: body,
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }
}

class CustomInterceptor extends Interceptor {
  Future<String?> _getAccessToken() async {
    final token = await secureStorage.read(key: 'accessToken');
    return token;
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
        final responseReLogin = await dio.postUri<JsonData>(
          Uri.https(
            cmoUrl,
            '/cmo/DesktopModules/JwtAuth/API/mobile/login',
          ),
          data: body,
        );
        final data = responseReLogin.data;
        final user = data == null ? null : UserAuth.fromJson(data);

        final accessToken = user?.accessToken;
        if (accessToken == null || accessToken.isEmpty) {
          return handler.reject(err);
        }

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
