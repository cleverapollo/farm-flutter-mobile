import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:cmo/main.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/user_auth.dart';
import 'package:cmo/model/user_device.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/state/auth_cubit/auth_cubit.dart';
import 'package:cmo/utils/constants.dart';
import 'package:cmo/utils/json_converter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final cmoApi = CmoApi();

class CmoApi {
  var client = HttpClient();

  void _showSnackBar(String msg) {
    SnackBar snackBar = SnackBar(content: Text(msg));
    snackbarKey.currentState?.clearSnackBars();
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  _showFlushBar(BuildContext context, String msg) {
    late Flushbar flush;
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
        child: const Text("OK"),
      ),
    );

    flush.show(context);
  }

  _loginAgainWithSavedCredentials(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).logInWithSavedCredentials();
  }

  Future<String?> _getAccessToken(BuildContext context) async {
    final state = context.read<AuthCubit>().state;

    return state.join(
      (authorized) => secureStorage.read(key: 'accessToken'),
      (unauthorized) => null,
    );
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

    HttpClientRequest request = await client.postUrl(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/JwtAuth/API/mobile/login',
      ),
    );

    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));

    HttpClientResponse response = await request.close();
    final stringData = await response.transform(utf8.decoder).join();

    if (response.statusCode != 200) {
      _showSnackBar(
        '${response.statusCode} - ${response.reasonPhrase}',
      );
      return null;
    }

    return UserAuth.fromJson(Json.tryDecode(stringData));
  }

  // curl 'https://logistics.myeu.africa/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetUser' \
  // -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36' \
  // --compressed
  Future<UserInfo?> getUser({
    required BuildContext context,
  }) async {
    final accessToken = await _getAccessToken(context);
    if (accessToken == null) return null;

    HttpClientRequest request = await client.getUrl(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/GetUser',
      ),
    );

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      final stringData = await response.transform(utf8.decoder).join();
      return UserInfo.fromJson(Json.tryDecode(stringData));
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

    HttpClientRequest request = await client.postUrl(
      Uri.https(
        cmoUrl,
        '/cmo/DesktopModules/Cmo.UI.Dnn.Api/API/Mobile/CreateUserDevice',
      ),
    );

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
    request.add(utf8.encode(json.encode(body)));

    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      final stringData = await response.transform(utf8.decoder).join();
      return UserDevice.fromJson(Json.tryDecode(stringData));
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
      {"userId": userId.toString()},
    );

    HttpClientRequest request = await client.getUrl(uri);

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');

    HttpClientResponse response = await request.close();

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
      "SystemEventName": "SyncAssessmentMasterData",
      "PrimaryKey": primaryKey,
      "UserDeviceId": userDeviceId
    };

    HttpClientRequest request = await client.postUrl(uri);

    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(HttpHeaders.acceptHeader, 'application/json');
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
    request.add(utf8.encode(json.encode(body)));

    HttpClientResponse response = await request.close();

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
}
