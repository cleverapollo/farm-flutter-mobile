import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/env/env.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/hirac.dart';
import 'package:cmo/model/hirac_template.dart';
import 'package:cmo/model/hirac_type.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/model/user_role_config/user_role_config.dart';
import 'package:cmo/service/service.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/utils.dart';

class CmoPerformApiService {
  final String _apiAuthUrl = Env.performDnnAuthUrl;

  final String _apiUrl = Env.performDnnApiUrl;

  final String _mqApiUrl = Env.apstoryMqApiUrl;

  final String _pubsubApiKey = Env.performApstoryMqKey;

  Dio client = Dio(
    BaseOptions(
      validateStatus: (status) =>
          status != null && status < 500 && status != 401,
    ),
  )
    ..interceptors.add(const CustomInterceptor(UserRoleEnum.regionalManager))
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

  Future<UserAuth?> performLogin(
    String username,
    String password,
  ) async {
    try {
      final body = {
        'u': username,
        'p': password,
      };

      final response = await client.post<JsonData>(
        '${_apiAuthUrl}login',
        data: body,
      );

      if (response.statusCode != 200) {
        showSnackError(msg: '${response.statusCode} - ${response.data}');
        return null;
      }

      final data = response.data;
      return data == null ? null : UserAuth.fromJson(data);
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
    final response = await client.post<JsonData>(
      '${_apiAuthUrl}extendtoken',
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: '${response.statusCode} - ${response.data}');
      return null;
    }

    final data = response.data;
    return data == null ? null : UserAuth.fromJson(data);
  }

  Future<UserInfo?> getPerformUser() async {
    Response<Map<String, dynamic>>? response;

    response = await client.get<JsonData>(
      '${_apiUrl}GetUser',
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : UserInfo.fromJson(data);
  }

  Future<bool> public({
    required String currentClientId,
    required String topic,
    required List<Message>? messages,
  }) async {
    try {
      final token = await secureStorage.read(
          key: UserRoleConfig.performRole.getAccessTokenKey);
      final result = await client.post<dynamic>(
        '${_mqApiUrl}message',
        queryParameters: {
          'key': _pubsubApiKey,
          'client': currentClientId,
          'topic': topic,
        },
        data: messages,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if (result.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
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
      '${_apiUrl}CreateUserDevice',
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
      '${_apiUrl}GetCompanyByUserId',
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
      '${_apiUrl}GetFarms',
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
      '${_apiUrl}GetGroupschemes',
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
      '${_apiUrl}GetRegionalManagerUnits',
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

    final response = await client.post<dynamic>(
      '${_apiUrl}CreateSystemEvent',
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }

  Future<bool> createSubscription(
      {required String topic, required int currentClientId}) async {
    try {
      await client.get<dynamic>('${_mqApiUrl}message',
          queryParameters: {
            'key': _pubsubApiKey,
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
      '${_apiUrl}CreateSystemEvent',
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
        '${_apiUrl}SystemEventExists',
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
      '${_apiUrl}CreateSystemEvent',
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    await checkFarmSystemEventExist(
        systemEventId: response.data['SystemEventId'] as int);

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }

    return true;
  }

  Future<bool> checkFarmSystemEventExist({required int systemEventId}) async {
    try {
      final result = await client.get<dynamic>(
        '${_apiUrl}SystemEventExists',
        queryParameters: {'systemEventId': systemEventId},
        options: Options(headers: {'accessToken': 'true'}),
      );
      if (result.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<MasterDataMessage?> pullFarmerGlobalMessage({
    required String topicMasterDataSync,
    required String currentClientId,
    int pageSize = 200,
  }) async {
    final accessToken = await _readAccessToken();
    final response = await client.get<JsonData>(
      '${_mqApiUrl}message',
      queryParameters: {
        'key': _pubsubApiKey,
        'client': currentClientId,
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

  Future<MasterDataMessage?> pullAssessmentMessage({
    required String topicAssessment,
    required int currentClientId,
    int pageSize = 200,
  }) async {
    final response = await client.get<JsonData>(
      '${_mqApiUrl}message',
      queryParameters: {
        'key': _pubsubApiKey,
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
    required String topicMasterDataSync,
    required int currentClientId,
    int pageSize = 200,
  }) async {
    final response = await client.get<JsonData>(
      '${_mqApiUrl}message',
      queryParameters: {
        'key': _pubsubApiKey,
        'client': '$currentClientId',
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

  Future<bool?> commitMessageList({
    required String topicMasterDataSync,
    required int currentClientId,
    required List<Message> messages,
  }) async {
    final body = messages.map((e) => e.toJson()).toList();

    final response = await client.delete<dynamic>(
      '${_mqApiUrl}message',
      data: body,
      queryParameters: {
        'key': _pubsubApiKey,
        'client': '$currentClientId',
        'topic': '$topicMasterDataSync*.$currentClientId'
      },
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }
    return true;
  }

  Future<bool?> deleteMessage({
    required int currentClientId,
    required List<Message> messages,
  }) async {
    final body = messages.map((e) => e.toJson()).toList();

    final response = await client.delete<dynamic>(
      '${_mqApiUrl}message',
      queryParameters: {
        'key': _pubsubApiKey,
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
      '/groupscheme/DesktopModules/Cmo.UI.Dnn.Api.FMP/API/ProductGroupTemplate/GetProductGroupTemplateByIds',
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

  Future<List<AsiType>?> fetchRMAsiType() async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      '/groupscheme/DesktopModules/Cmo.UI.Dnn.Api.GS/API/AsiType/GetRMAsiType',
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
    return data?.map((e) => AsiType.fromJson(e as JsonData)).toList();
  }

  Future<List<AsiType>?> fetchFarmerAsiType() async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      '/groupscheme/DesktopModules/Cmo.UI.Dnn.Api.GS/API/AsiType/GetFarmersAsiType',
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
    return data?.map((e) => AsiType.fromJson(e as JsonData)).toList();
  }

  Future<List<SpeciesGroupTemplate>?> fetchSpeciesGroupTemplates() async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      '/groupscheme/DesktopModules/Cmo.UI.Dnn.Api.FMP/API/SpeciesGroupTemplate/GetSpeciesGroupTemplateByIds',
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
      '/groupscheme/DesktopModules/Cmo.UI.Dnn.Api.FMP/API/AreaType/GetAreaTypeByUserIdAndRole',
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

  Future<List<Compartment>?> getCompartmentsByRMUId() async {
    try {
      final response = await client.get<JsonListData>(
        '${Env.performForestryUrl}ManagementUnit/GetManagementUnitByRMId?',
        queryParameters: {
          'dnnUserId': 0,
          'isActive': true,
        },
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data?.map((e) => Compartment.fromJson(e as JsonData)).toList();
    } catch (e) {
      logger.d('Cannot getCompartmentsByRMId $e');
    }

    return null;
  }

  Future<List<Compartment>?> getCompartmentsByFarmId(String farmId) async {
    try {
      final response = await client.get<List<dynamic>>(
        '${Env.performForestryUrl}ManagementUnit/GetManagementUnitByFarmerId?',
        queryParameters: {'dnnUserId': 0, 'isActive': true, 'farmId': farmId},
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknown error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data
          ?.map((e) => Compartment.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      logger.d('Cannot getCompartmentsByFarmId $e');
    }

    return null;
  }

  Future<List<Asi>?> getRMAsiRegisters() async {
    try {
      final response = await client.get<JsonListData>(
        '${Env.apiGroupSchemeUrl}AsiRegister/GetAsiRegisterByRMUser',
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data?.map((e) => Asi.fromJson(e as JsonData)).toList();
    } catch (e) {
      logger.d('Cannot getRMRegisters $e');
    }

    return null;
  }

  Future<List<AsiPhoto>?> getRMAsiRegisterPhotosByAsiRegisterId(
      String? asiRegisterId) async {
    try {
      final response = await client.get<JsonListData>(
        '${Env.apiGroupSchemeUrl}AsiRegisterPhoto/GetAsiRegisterPhotosByAsiRegisterId?asiRegisterId=${asiRegisterId}',
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data?.map((e) => AsiPhoto.fromJson(e as JsonData)).toList();
    } catch (e) {
      logger.d('Cannot getRMAsiRegisterPhotosByAsiRegisterId $e');
    }

    return null;
  }

  Future<Compartment?> insertUpdatedCompartment(
    Compartment compartment,
  ) async {
    try {
      final uri = Uri.https(
        Env.cmoApiUrl,
        '/groupscheme/DesktopModules/Cmo.UI.Dnn.Api.FMP/API/ManagementUnit/InsUpdManagementUnit',
      );

      final response = await client.postUri<JsonData?>(
        uri,
        data: compartment.toJson(),
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data == null ? null : Compartment.fromJson(data);
    } catch (e) {
      logger.d('Cannot insertUpdatedCompartment $e');
      return null;
    }
  }

  Future<Asi?> insertUpdatedASI(Asi asi) async {
    try {
      log(asi.toJson().toString());
      final response = await client.post<JsonData>(
        '${Env.apiGroupSchemeUrl}AsiRegister/CreateOrUpdateAsiRegister',
        data: asi.toJson(),
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data == null ? null : Asi.fromJson(data);
    } catch (e) {
      logger.d('Cannot insertUpdatedASI $e');
      return null;
    }
  }

  Future<AsiPhoto?> insertUpdatedAsiPhoto(AsiPhoto asiPhoto) async {
    try {
      log(asiPhoto.toJson().toString());
      final response = await client.post<JsonData>(
        '${Env.apiGroupSchemeUrl}AsiRegisterPhoto/CreateOrUpdateAsiRegisterPhoto',
        data: asiPhoto.toJson(),
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data == null ? null : AsiPhoto.fromJson(data);
    } catch (e) {
      logger.d('Cannot insertUpdatedAsiPhoto $e');
      return null;
    }
  }

  Future<List<GroupScheme>?> getGroupSchemeByGroupSchemeId(int id) async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      'groupscheme/DesktopModules/Cmo.UI.Dnn.Api.GS.Main/API/GroupSchemeMain/GetGroupSchemeById',
      {
        'GroupSchemeId': '$id',
        "isActive": "true",
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
    return data?.map((e) => GroupScheme.fromJson(e as JsonData)).toList();
  }

  Future<List<Hirac>?> getHiracSearch({String? filterString}) async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      'groupscheme/DesktopModules/Cmo.UI.Dnn.Api.GS/API/Hirac/GetHiracSearch',
      {
        'filterString': filterString ?? '',
        "isActive": "true",
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
    return data?.map((e) => Hirac.fromJson(e as JsonData)).toList();
  }

  Future<List<HiracType>?> getHiracTypeSearch({String? filterString}) async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      'groupscheme/DesktopModules/Cmo.UI.Dnn.Api.GS/API/Hirac/GetHiracTypeSearch',
      {
        'filterString': filterString ?? '',
        "isActive": "true",
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
    return data?.map((e) => HiracType.fromJson(e as JsonData)).toList();
  }

  Future<List<HiracTemplate>?> getHiracTemplateSearch(
      {String? filterString}) async {
    final uri = Uri.https(
      Env.cmoApiUrl,
      'groupscheme/DesktopModules/Cmo.UI.Dnn.Api.GS/API/Hirac/GetHiracTemplateSearch',
      {
        'filterString': filterString ?? '',
        "isActive": "true",
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
    return data?.map((e) => HiracTemplate.fromJson(e as JsonData)).toList();
  }

  Future<List<Farm>?> getFarmSearch({String? filterString}) async {
    try {
      final response = await client.post<JsonData>(
        '${Env.apiGroupSchemeUrl}Farm/SearchFarms?',
        data: {
          'FarmName': filterString,
          'IsRegionalManager': true,
          "Skip": 0,
          "Take": 10,
        },
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data!['Data'] as JsonListData?;
      return data?.map((e) => Farm.fromJson(e as JsonData)).toList();
    } catch (e) {
      logger.d('getFarmSearch $e');
      return null;
    }
  }

  Future<List<Farm>?> getRMFarmSearch({String? filterString}) async {
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}Farm/GetRMFarmSearch?filterString=$filterString',
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data?.map((e) => Farm.fromJson(e as JsonData)).toList();
  }
}
