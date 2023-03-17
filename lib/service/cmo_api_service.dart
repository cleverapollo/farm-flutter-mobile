import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/master_data_message.dart';
import 'package:cmo/model/user_auth.dart';
import 'package:cmo/model/user_device.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/utils/constants.dart';
import 'package:cmo/utils/json_converter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmoApiService {
  HttpClient client = HttpClient();

  void _showSnackBar(String msg) {
    final snackBar = SnackBar(content: Text(msg));
    snackbarKey.currentState?.clearSnackBars();
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void _showFlushBar(BuildContext context, String msg) {
    late Flushbar<bool?> flush;
    flush = Flushbar(
      message: msg,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      borderRadius: BorderRadius.circular(8),
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      animationDuration: const Duration(milliseconds: 250),
      mainButton: TextButton(
        onPressed: () {
          flush.dismiss(true);
        },
        child: const Text('OK'),
      ),
    );

    flush.show(context);
  }

  void _loginAgainWithSavedCredentials(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).logInWithSavedCredentials();
  }

  Future<String?> _getAccessToken(BuildContext context) async {
    final state = context.read<AuthCubit>().state;

    return state.join(
      (authorized) => secureStorage.read(key: 'accessToken'),
      (unauthorized) => null,
    );
  }

  Future<HttpClientRequest> _get(Uri url) {
    log('[GET]: $url');
    return client.getUrl(url);
  }

  Future<HttpClientRequest> _post(Uri url) {
    log('[POST]: $url');
    return client.postUrl(url);
  }

  // Future<HttpClientRequest> _put(Uri url) {
  //   log('[PUT]: $url');
  //   return client.putUrl(url);
  // }

  Future<HttpClientRequest> _delete(Uri url) {
    log('[DELETE]: $url');
    return client.deleteUrl(url);
  }

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

    final request = await _post(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/JwtAuth/API/mobile/login',
      ),
    );

    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));

    final response = await request.close();
    final stringData = await response.transform(utf8.decoder).join();

    if (response.statusCode != 200) {
      _showSnackBar(
        '${response.statusCode} - ${response.reasonPhrase}',
      );
      return null;
    }

    return UserAuth.fromJson(
      Json.tryDecode(stringData) as Map<String, dynamic>,
    );
  }

  // curl 'https://logistics.myeu.africa/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetUser' \
  // -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36' \
  // --compressed
  Future<UserInfo?> getUser({
    required BuildContext context,
  }) async {
    final accessToken = await _getAccessToken(context);
    if (accessToken == null) return null;

    final request = await _get(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetUser',
      ),
    );

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');

    final response = await request.close();

    if (response.statusCode == 200) {
      final stringData = await response.transform(utf8.decoder).join();
      return UserInfo.fromJson(
        Json.tryDecode(stringData) as Map<String, dynamic>,
      );
    } else if (response.statusCode == 401) {
      if (context.mounted) _loginAgainWithSavedCredentials(context);
      return null;
    } else {
      if (context.mounted) {
        _showFlushBar(
          context,
          'Unknow error: ${response.statusCode}',
        );
      }

      return null;
    }
  }

  // curl 'https://logistics.myeu.africa/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/CreateUserDevice' \
  // --data-raw '{"DeviceId":"0ba4a0a6-950f-4169-b7fc-3c8a7715c5a2","DeviceOS":"web","DeviceVersion":"10.15.7","UserDeviceId":6539,"AppName":"Behave","AppVersionNumber":"2.0.3"}' \
  // --compressed
  Future<UserDevice?> createUserDevice({
    required BuildContext context,
    required String? deviceId,
    required String? deviceOS,
    required String? deviceVersion,
    required String? appName,
    required String? appVersionNumber,
  }) async {
    final accessToken = await _getAccessToken(context);
    if (accessToken == null) return null;

    final body = {
      'DeviceId': deviceId,
      'DeviceOS': deviceOS,
      'DeviceVersion': deviceVersion,
      'AppName': appName,
      'AppVersionNumber': appVersionNumber,
    };

    final request = await _post(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/CreateUserDevice',
      ),
    );

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
    request.add(utf8.encode(json.encode(body)));

    final response = await request.close();

    if (response.statusCode == 200) {
      final stringData = await response.transform(utf8.decoder).join();
      return UserDevice.fromJson(
        Json.tryDecode(stringData) as Map<String, dynamic>,
      );
    } else if (response.statusCode == 401) {
      if (context.mounted) _loginAgainWithSavedCredentials(context);
      return null;
    } else {
      if (context.mounted) {
        _showFlushBar(
          context,
          'Unknow error: ${response.statusCode}',
        );
      }

      return null;
    }
  }

  Future<List<Company>?> getCompaniesByUserId({
    required BuildContext context,
    required int userId,
  }) async {
    final accessToken = await _getAccessToken(context);
    if (accessToken == null) return null;

    final uri = Uri.https(
      cmoUrl,
      '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetCompanyByUserId',
      {'userId': userId.toString()},
    );

    final request = await _get(uri);

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');

    final response = await request.close();

    if (response.statusCode == 200) {
      final stringData = await response.transform(utf8.decoder).join();
      final data = Json.tryDecode(stringData);
      if (data is List) {
        return data
            .map((e) => Company.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return <Company>[];
    } else if (response.statusCode == 401) {
      if (context.mounted) _loginAgainWithSavedCredentials(context);
      return null;
    } else {
      if (context.mounted) {
        _showFlushBar(
          context,
          'Unknow error: ${response.statusCode}',
        );
      }

      return null;
    }
  }

  Future<bool> createSystemEvent({
    required BuildContext context,
    required String systemEventName,
    required int primaryKey,
    required int userDeviceId,
  }) async {
    final accessToken = await _getAccessToken(context);
    if (accessToken == null) return false;

    final uri = Uri.https(
      cmoUrl,
      '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/CreateSystemEvent',
    );

    final body = {
      'SystemEventName': 'SyncAssessmentMasterData',
      'PrimaryKey': primaryKey,
      'UserDeviceId': userDeviceId
    };

    final request = await _post(uri);

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
    request.add(utf8.encode(json.encode(body)));

    final response = await request.close();

    if (response.statusCode == 200) {
      // final stringData = await response.transform(utf8.decoder).join();
      return true;
    } else if (response.statusCode == 401) {
      if (context.mounted) _loginAgainWithSavedCredentials(context);
      return false;
    } else {
      if (context.mounted) {
        _showFlushBar(
          context,
          'Unknow error: ${response.statusCode}',
        );
      }

      return false;
    }
  }

  Future<MasterDataMessage?> pullMessage({
    required BuildContext context,
    required String pubsubApiKey,
    required String topicMasterDataSync,
    required int currentClientId, // = UserDeviceId
    int pageSize = 200,
  }) async {
    final accessToken = await _getAccessToken(context);
    if (accessToken == null) return null;

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

    final request = await _get(uri);

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');

    final response = await request.close();

    if (response.statusCode == 200) {
      final stringData = await response.transform(utf8.decoder).join();
      return MasterDataMessage.fromJson(
        Json.tryDecode(stringData) as Map<String, dynamic>,
      );
    } else if (response.statusCode == 401) {
      if (context.mounted) _loginAgainWithSavedCredentials(context);
      return null;
    } else {
      if (context.mounted) {
        _showFlushBar(
          context,
          'Unknow error: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }

      return null;
    }
  }

  Future<bool?> deleteMessage({
    required BuildContext context,
    required String pubsubApiKey,
    required int currentClientId, // = UserDeviceId
    required List<Message> messages,
  }) async {
    final accessToken = await _getAccessToken(context);
    if (accessToken == null) return null;

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

    final request = await _delete(uri);

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');

    request.add(utf8.encode(json.encode(body)));

    final response = await request.close();

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      if (context.mounted) _loginAgainWithSavedCredentials(context);
      return null;
    } else {
      if (context.mounted) {
        _showFlushBar(
          context,
          'Unknow error: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }

      return null;
    }
  }
}
