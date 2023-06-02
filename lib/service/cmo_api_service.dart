import 'dart:async';
import 'dart:io';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/env/env.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/compartment/product_group_template.dart';
import 'package:cmo/model/compartment/species_group_template.dart';
import 'package:cmo/model/farm.dart';
import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/master_data_message.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/model/user_auth.dart';
import 'package:cmo/model/user_device.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

typedef JsonData = Map<String, dynamic>;
typedef JsonListData = List<dynamic>;

class CmoApiService {
  String _behaveApiAuthUri(String path) => '${Env.behaveDnnAuthUrl}$path';

  String _performApiAuthUri(String path) => '${Env.performDnnAuthUrl}$path';

  String _authApiUri(String path) => '${Env.behaveDnnAuthUrl}$path';

  String _apiUri(String path) => '${Env.behaveDnnApiUrl}$path';

  String _behaveApiUri(String path) => '${Env.behaveDnnApiUrl}$path';

  String _performApiUri(String path) => '${Env.performDnnApiUrl}$path';

  String _mqApiUri(String path) => '${Env.apstoryMqApiUrl}$path';

  Future<String> getDnnApiUrlBasedOnUserRole() async {
    final userRole = await configService.getActiveUserRole();
    switch (userRole) {
      case UserRoleEnum.behave:
        return Env.behaveDnnApiUrl;
      case UserRoleEnum.resourceManager:
        return Env.performDnnApiUrl;
      case UserRoleEnum.farmerMember:
        return Env.performDnnApiUrl;
    }
  }

  Dio client = Dio(
    BaseOptions(
      validateStatus: (status) =>
          status != null && status < 500 && status != 401,
    ),
  )
    ..interceptors.add(CustomInterceptor())
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        logPrint: (o) => debugPrint('$o'),
      ),
    );

  Future<String?> _readAccessToken() async {
    final userRole = await configService.getActiveUserRole();

    if (userRole.isBehave) {
      return secureStorage.read(
          key: UserRoleConfig.behaveRole.getAccessTokenKey);
    } else {
      return secureStorage.read(
          key: UserRoleConfig.performRole.getAccessTokenKey);
    }
  }

  Future<UserRoleResponse?> loginUseCase(
    String username,
    String password,
  ) async {
    var response = const UserRoleResponse();

    var isBehaveException = false;
    var isPerformException = false;

    final futures = <Future<dynamic>>[
      _loginBehave(username, password).then((value) {
        if (value != null) {
          response = response.copyWith(
            behaveUserAuth: UserAuth.fromJson(value.data!),
          );
        } else {
          isBehaveException = true;
        }
      }),
      _loginPerform(username, password).then((value) {
        if (value != null) {
          response = response.copyWith(
            performUserAuth: UserAuth.fromJson(value.data!),
          );
        } else {
          isPerformException = true;
        }
      }),
    ];

    await Future.wait(futures);

    if (isBehaveException && isPerformException) {
      return null;
    }

    return response;
  }

  Future<Response<Map<String, dynamic>>?> _loginBehave(
      String username, String password) async {
    try {
      final body = {
        'u': username,
        'p': password,
      };

      final response = await client.post<JsonData>(
        _behaveApiAuthUri('login'),
        data: body,
      );

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response<Map<String, dynamic>>?> _loginPerform(
      String username, String password) async {
    try {
      final body = {
        'u': username,
        'p': password,
      };

      final response = await client.post<JsonData>(
        _performApiAuthUri('login'),
        data: body,
      );

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<UserAuth?> refreshToken(
    String renewalToken,
  ) async {
    final body = {
      'rToken': renewalToken,
    };
    final userRole = await configService.getActiveUserRole();
    final accessToken = await _readAccessToken();

    final response = await client.post<JsonData>(
      _authApiUri('extendtoken'),
      data: body,
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: '${response.statusCode} - ${response.data}');
      return null;
    }

    final data = response.data;
    return data == null ? null : UserAuth.fromJson(data);
  }

  Future<UserInfo?> getUser(UserRoleConfig userRole) async {
    Response<Map<String, dynamic>>? response;

    if (userRole.isBehave) {
      response = await client.get<JsonData>(
        _behaveApiUri('GetUser'),
        options: Options(headers: {'accessToken': 'true'}),
      );
    } else {
      response = await client.get<JsonData>(
        _performApiUri('GetUser'),
        options: Options(headers: {'accessToken': 'true'}),
      );
    }

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : UserInfo.fromJson(data);
  }

  Future<List<UserRolePortal>?> getUserRoles(
      {required int userId, required UserRoleConfig userRole}) async {
    Uri? uri;

    if (userRole.isBehave) {
      uri = Uri.https(
        Env.cmoApiUrl,
        'cmo/DesktopModules/Cmo.UI.Dnn.Api/API/User/GetUserPortals',
        {'dnnUserId': userId.toString()},
      );
    } else {
      uri = Uri.https(
        Env.cmoApiUrl,
        'cmo/gs/DesktopModules/Cmo.UI.Dnn.Api/API/User/GetUserPortals',
        {'dnnUserId': userId.toString()},
      );
    }
    final response = await client.getUri<JsonListData>(
      uri,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }
    final data = response.data;
    return data?.map((e) => UserRolePortal.fromJson(e as JsonData)).toList();
  }

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

    final response = await client.post<JsonData>(
      _apiUri('CreateUserDevice'),
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
    final response = await client.get<JsonListData>(
      _apiUri('GetCompanyByUserId'),
      queryParameters: {'userId': userId.toString()},
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data?.map((e) => Company.fromJson(e as JsonData)).toList();
  }

  Future<List<Farm>?> fetchFarms() async {
    final response = await client.get<JsonListData>(
      _performApiUri('GetFarms'),
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data?.map((e) => Farm.fromJson(e as JsonData)).toList();
  }

  Future<List<GroupScheme>?> fetchGroupSchemes() async {
    final response = await client.get<JsonListData>(
      _performApiUri('GetGroupschemes'),
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data?.map((e) => GroupScheme.fromJson(e as JsonData)).toList();
  }

  Future<List<ResourceManagerUnit>?> fetchResourceManagerUnits(
      int groupSchemeId) async {
    final response = await client.get<JsonListData>(
      _performApiUri('GetRegionalManagerUnits'),
      queryParameters: {'groupSchemeId': groupSchemeId.toString()},
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data
        ?.map((e) => ResourceManagerUnit.fromJson(e as JsonData))
        .toList();
  }

  Future<bool> createSystemEvent({
    required String systemEventName,
    required int primaryKey,
    required int userDeviceId,
  }) async {
    final body = {
      'SystemEventName': 'SyncAssessmentMasterData',
      'PrimaryKey': primaryKey,
      'UserDeviceId': userDeviceId
    };

    final baseUrl = await getDnnApiUrlBasedOnUserRole();
    final accessToken = await _readAccessToken();
    final response = await client.post<dynamic>(
      '${baseUrl}CreateSystemEvent',
      data: body,
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }

  Future<bool> createSubscription(
      {required String topic,
      required String pubsubApiKey,
      required int currentClientId}) async {
    try {
      await client.get<dynamic>(_mqApiUri('message'),
          queryParameters: {
            'key': pubsubApiKey,
            'client': '$currentClientId',
            'topic': topic,
            'pageSize': '1',
          },
          options: Options(headers: {'accessToken': 'true'}));
      return true;
    } catch (_) {
      return false;
    }
  }

  // TODO(DONG): refactor it
  /// clone from createSystemEvent()
  /// consider to refactor later for common function for creating system event
  Future<bool> createRMSystemEvent({
    required int rmuId,
    required int userDeviceId,
  }) async {
    final body = {
      'SystemEventName': 'SyncGSRegionalManagerMasterData',
      'PrimaryKey': '$rmuId',
      'UserDeviceId': userDeviceId
    };

    final response = await client.post<dynamic>(
      _performApiUri('CreateSystemEvent'),
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    await checkRMSystemEventExist(
        systemEventId: response.data['SystemEventId'] as int);

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }

  Future<void> checkRMSystemEventExist({required int systemEventId}) async {
    try {
      await client.get<dynamic>(
        _performApiUri('SystemEventExists'),
        queryParameters: {'systemEventId': systemEventId},
        options: Options(headers: {'accessToken': 'true'}),
      );
    } catch (_) {}
  }

  Future<bool> createFarmerSystemEvent({
    required String farmId,
    required int userDeviceId,
  }) async {
    final body = {
      'SystemEventName': 'SyncGSMasterData',
      'PrimaryKey': farmId,
      'UserDeviceId': userDeviceId
    };

    final response = await client.post<dynamic>(
      _apiUri('CreateSystemEvent'),
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }

  Future<MasterDataMessage?> pullFarmerGlobalMessage({
    required String pubsubApiKey,
    required String topicMasterDataSync,
    required String currentClientId,
    int pageSize = 200,
  }) async {
    final response = await client.get<JsonData>(
      _mqApiUri('message'),
      queryParameters: {
        'key': pubsubApiKey,
        'client': currentClientId,
        'topic': '$topicMasterDataSync*.$currentClientId',
        'pageSize': '$pageSize',
      },
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : MasterDataMessage.fromJson(data);
  }

  Future<MasterDataMessage?> pullAssessmentMessage({
    required String pubsubApiKey,
    required String topicAssessment,
    required int currentClientId,
    int pageSize = 200,
  }) async {
    final response = await client.get<JsonData>(
      _mqApiUri('message'),
      queryParameters: {
        'key': pubsubApiKey,
        'client': '$currentClientId',
        'topic': '$topicAssessment.$currentClientId',
        'pageSize': '$pageSize',
      },
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : MasterDataMessage.fromJson(data);
  }

  Future<MasterDataMessage?> pullMessage({
    required String pubsubApiKey,
    required String topicMasterDataSync,
    required int currentClientId,
    int pageSize = 200,
  }) async {
    final accessToken = await _readAccessToken();
    final response = await client.get<JsonData>(
      _mqApiUri('message'),
      queryParameters: {
        'key': pubsubApiKey,
        'client': '$currentClientId',
        'topic': '$topicMasterDataSync*.$currentClientId',
        'pageSize': '$pageSize',
      },
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : MasterDataMessage.fromJson(data);
  }

  Future<bool?> commitMessageList({
    required String pubsubApiKey,
    required String topicMasterDataSync,
    required int currentClientId,
    required List<Message> messages,
  }) async {
    final uri = Uri.https(
      _mqApiUri('message'),
      '',
      {
        'key': pubsubApiKey,
        'client': '$currentClientId',
        'topic': '$topicMasterDataSync*.$currentClientId'
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

  Future<bool?> deleteMessage({
    required String pubsubApiKey,
    required int currentClientId,
    required List<Message> messages,
  }) async {
    final body = messages.map((e) => e.toJson()).toList();

    final response = await client.delete<dynamic>(
      _mqApiUri('message'),
      queryParameters: {
        'key': pubsubApiKey,
        'client': '$currentClientId',
        'topic': 'Cmo.MasterDataDeviceSync.*.$currentClientId',
      },
      data: body,
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }

  Future<List<ProductGroupTemplate>?> fetchProductGroupTemplates() async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      '/cmo/gs/DesktopModules/Cmo.UI.Dnn.Api.FMP/API/ProductGroupTemplate/GetProductGroupTemplateByIds',
      {
        "groupSchemeId": "undefined",
        "areaTypeId": "undefined",
        "sortDirection": "ASC",
        "isActive": '',
      },
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
    return data
        ?.map((e) => ProductGroupTemplate.fromJson(e as JsonData))
        .toList();
  }

  Future<List<SpeciesGroupTemplate>?> fetchSpeciesGroupTemplates() async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      '/cmo/gs/DesktopModules/Cmo.UI.Dnn.Api.FMP/API/SpeciesGroupTemplate/GetSpeciesGroupTemplateByIds',
      {
        "groupSchemeId": "undefined",
        "areaTypeId": "undefined",
        "sortDirection": "ASC",
        "isActive": '',
      },
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
    return data
        ?.map((e) => SpeciesGroupTemplate.fromJson(e as JsonData))
        .toList();
  }

  Future<List<AreaType>?> fetchAreaTypes() async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      '/cmo/gs/DesktopModules/Cmo.UI.Dnn.Api.FMP/API/AreaType/GetAreaTypeByUserIdAndRole',
      {
        "userId": "0",
        "isRegionalManager": "false",
      },
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
    return data?.map((e) => AreaType.fromJson(e as JsonData)).toList();
  }
}

class CustomInterceptor extends Interceptor {
  Future<String?> _getAccessToken() async {
    final token = await secureStorage.read(key: 'accessToken');
    return token;
  }

  Future<void> _saveAccessToken(
    String? accessToken,
    String? renewalToken,
  ) async {
    await secureStorage.write(key: 'accessToken', value: accessToken);
    await secureStorage.write(key: 'renewalToken', value: renewalToken);
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
          _authApiUri('login'),
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

  /// Need to DNN_AUTH_URL check it here.
  String _authApiUri(String path) => '${Env.behaveDnnAuthUrl}$path';
}
