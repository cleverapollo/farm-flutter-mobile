import 'dart:async';
import 'dart:developer';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/env/env.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/compartment/area_type.dart';
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
    if (userRole == null) return null;
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
        '${Env.performDnnAuthUrl}Login',
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
      '${Env.performDnnAuthUrl}extendtoken',
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
      '${Env.apiGroupSchemeUrl}GetUser',
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
        '${Env.apstoryMqApiUrl}message',
        queryParameters: {
          'key': Env.performApstoryMqKey,
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
      '${Env.apiGroupSchemeUrl}CreateUserDevice',
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
      '${Env.apiGroupSchemeUrl}GetCompanyByUserId',
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
      '${Env.apiGroupSchemeUrl}GetFarms',
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
      '${Env.apiGroupSchemeUrl}GetGroupschemes',
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
      '${Env.apiGroupSchemeUrl}GetRegionalManagerUnits',
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

  Future<bool> createSubscription(
      {required String topic, required int currentClientId}) async {
    try {
      await client.get<dynamic>('${Env.apstoryMqApiUrl}message',
          queryParameters: {
            'key': Env.performApstoryMqKey,
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

  Future<bool> createSystemEvent({
    required String systemEventName,
    required String primaryKey,
    required int userDeviceId,
  }) async {
    final body = {
      'SystemEventName': systemEventName,
      'PrimaryKey': primaryKey,
      'UserDeviceId': userDeviceId
    };

    final response = await client.post<dynamic>(
      '${Env.apiGroupSchemeUrl}CreateSystemEvent',
      data: body,
      options: Options(headers: {'accessToken': 'true'}),
    );

    final systemEventId = response.data['SystemEventId'] as int?;
    final isReady = await isDataReadyFromServer(systemEventId);

    if (!isReady) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return false;
    }

    return true;
  }

  /// System Event will be deleted from server after handling all data
  /// The data will be ready to get through pub-sub API after System Event was deleted.
  Future<bool> isDataReadyFromServer(int? systemEventId) async {
    if (systemEventId == null) return false;
    var isExisted = true;
    while(isExisted) {
      await Future.delayed(const Duration(seconds: 3));
      isExisted = await checkSystemEventExist(systemEventId);
    }

    return !isExisted;
  }

  Future<bool> checkSystemEventExist(int? systemEventId) async {
    if (systemEventId == null) return false;
    final response = await client.get<dynamic>(
      '${Env.apiGroupSchemeUrl}SystemEventExists',
      queryParameters: {'systemEventId': systemEventId},
      options: Options(headers: {'accessToken': 'true'}),
    );

    return response.data as bool;
  }

  Future<MasterDataMessage?> pullFarmerGlobalMessage({
    required String topicMasterDataSync,
    required String currentClientId,
    int pageSize = 200,
  }) async {
    final response = await client.get<JsonData>(
      '${Env.apstoryMqApiUrl}message',
      queryParameters: {
        'key': Env.performApstoryMqKey,
        'client': currentClientId,
        'topic': '$topicMasterDataSync*.$currentClientId',
        'pageSize': '$pageSize',
      },
      // options: Options(headers: {'accessToken': 'true'}),
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
      '${Env.apstoryMqApiUrl}message',
      queryParameters: {
        'key': Env.performApstoryMqKey,
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
      '${Env.apstoryMqApiUrl}message',
      queryParameters: {
        'key': Env.performApstoryMqKey,
        'client': '$currentClientId',
        'topic': '$topicMasterDataSync*.$currentClientId',
        'pageSize': '$pageSize',
      },
      //    options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data == null ? null : MasterDataMessage.fromJson(data);
  }

  Future<MasterDataMessage?> pullFarmMessage({
    required String topicMasterDataSync,
    required String? topic,
    required String? clientId,
    int pageSize = 200,
  }) async {
    final response = await client.get<JsonData>(
      '${Env.apstoryMqApiUrl}message',
      queryParameters: {
        'key': Env.performApstoryMqKey,
        'client': clientId,
        'topic': '$topicMasterDataSync*.$topic',
        'pageSize': '$pageSize',
      },
      //    options: Options(headers: {'accessToken': 'true'}),
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
    required String currentClientId,
    required List<Message> messages,
  }) async {
    final body = messages.map((e) => e.toJson()).toList();

    final response = await client.delete<dynamic>(
      '${Env.apstoryMqApiUrl}message',
      data: body,
      queryParameters: {
        'key': Env.performApstoryMqKey,
        'client': currentClientId,
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
      '${Env.apstoryMqApiUrl}message',
      queryParameters: {
        'key': Env.performApstoryMqKey,
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

  Future<List<JobDescription>?> getListJobDescriptions({
    int? jobDescriptionId,
    int? groupSchemeId,
  }) async {
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetGroupSchemeJobDescriptions?',
      queryParameters: {
        "JobDescriptionId": jobDescriptionId,
        "GroupSchemeId": groupSchemeId,
      },

      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data
        ?.map((e) => JobDescription.fromJson(e as JsonData))
        .toList();
  }

  Future<List<GroupSchemeMasterSpecies>?> getListGroupSchemeMasterSpecies() async {
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetAllGsMasterSpecies?',
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data
        ?.map((e) => GroupSchemeMasterSpecies.fromJson(e as JsonData))
        .toList();
  }

  Future<List<ProductGroupTemplate>?> fetchProductGroupTemplates() async {
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetProductGroupTemplateByIds?',
      queryParameters: {
        "groupSchemeId": "undefined",
        "areaTypeId": "undefined",
        "sortDirection": "ASC",
        "isActive": '',
      },
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
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetRMAsiType',
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
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetFarmersAsiType',
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
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetSpeciesGroupTemplateByIds?',
      queryParameters: {
        "groupSchemeId": "undefined",
        "areaTypeId": "undefined",
        "sortDirection": "ASC",
        "isActive": '',
      },
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
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetAreaTypeByUserIdAndRole?',
      queryParameters: {
        "userId": "0",
        "isRegionalManager": "false",
      },
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
        '${Env.apiGroupSchemeUrl}GetManagementUnitByRMId?',
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
        '${Env.apiGroupSchemeUrl}GetManagementUnitByFarmerId?',
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
        '${Env.apiGroupSchemeUrl}GetAsiRegisterByRMUser',
        queryParameters: {
          'isActive': true,
        },
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
        '${Env.apiGroupSchemeUrl}GetAsiRegisterPhotosByAsiRegisterId?asiRegisterId=${asiRegisterId}',
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
      final response = await client.post<JsonData?>(
        '${Env.apiGroupSchemeUrl}InsUpdManagementUnit',
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
        '${Env.apiGroupSchemeUrl}CreateOrUpdateAsiRegister',
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
        '${Env.apiGroupSchemeUrl}CreateOrUpdateAsiRegisterPhoto',
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

  Future<List<Farm>?> getFarmSearch({String? filterString}) async {
    try {
      final response = await client.post<JsonData>(
        '${Env.apiGroupSchemeUrl}SearchFarms',
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

  Future<Farm?> getFarmById({
    String? farmId,
  }) async {
    try {
      final response = await client.get<JsonData>(
        '${Env.apiGroupSchemeUrl}GetFarmById?farmId=$farmId',
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data == null ? null : Farm.fromJson(data);
    } catch (e) {
      logger.d('getFarmSearch $e');
      return null;
    }
  }

  Future<List<Farm>?> getRMFarmSearch({String? filterString}) async {
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetRMFarmSearch?filterString=$filterString',
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data?.map((e) => Farm.fromJson(e as JsonData)).toList();
  }

  Future<CheckForUpdate?> checkUpdate() async {
    try {
      final response = await client.get<JsonData?>(
        '${Env.apiGroupSchemeUrl}GetLatestAppVersion?',
        queryParameters: {'appName': 'empower',},
        options: Options(headers: {'accessToken': 'false'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data == null ? null : CheckForUpdate.fromJson(data);
    } catch (e) {
      logger.d('Cannot insertUpdatedCompartment $e');
      return null;
    }
  }

  Future<IllegalActivityRegister?> insertUpdatedIllegalActivity(
    IllegalActivityRegister illegalActivityRegister,
  ) async {
    try {
      final response = await client.post<JsonData?>(
        '${Env.apiGroupSchemeUrl}InsertOrUpdateIllegalActivity',
        data: illegalActivityRegister.toJson(),
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data == null ? null : IllegalActivityRegister.fromJson(data);
    } catch (e) {
      logger.d('Cannot insertUpdatedIllegalActivity $e');
      return null;
    }
  }

  Future<List<IllegalActivityRegister>?> getListIllegalActivities() async {
    final response = await client.get<JsonListData>(
      '${Env.apiGroupSchemeUrl}GetIllegalActivities?',
      options: Options(headers: {'accessToken': 'true'}),
    );

    if (response.statusCode != 200) {
      showSnackError(msg: 'Unknow error: ${response.statusCode}');
      return null;
    }

    final data = response.data;
    return data
        ?.map((e) => IllegalActivityRegister.fromJson(e as JsonData))
        .toList();
  }

  Future<Response<dynamic>> downloadCheckNetworkSpeedFile() async {
    final response = await client.get<dynamic>(
      'https://cmologistics.azurewebsites.net/groupscheme/DesktopModules/Cmo.UI.Dnn.Api.GS/API/MobileV2/GetFile',
    );

    return response;
  }

  Future<List<GroupSchemeContentLibrary>?> getGroupSchemeContentLibraries() async {
    try {
      final response = await client.get<JsonListData>(
        '${Env.apiGroupSchemeUrl}GetGroupSchemeContentLibraries',
        options: Options(headers: {'accessToken': 'true'}),
      );

      if (response.statusCode != 200) {
        showSnackError(msg: 'Unknow error: ${response.statusCode}');
        return null;
      }

      final data = response.data;
      return data?.map((e) => GroupSchemeContentLibrary.fromJson(e as JsonData)).toList();
    } catch (e) {
      logger.d('Cannot getGroupSchemeContentLibraries $e');
    }

    return null;
  }
}
