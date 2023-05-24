import 'dart:convert';

import 'package:cmo/model/group_scheme.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  Future<void> logout() async {
    await setRMSynced(isSynced: false);
  }

  Future<bool> isRMSynced() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool('RegionalManagerMasterDataSynced') ?? false;
  }

  Future<bool> setRMSynced({required bool isSynced}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool('RegionalManagerMasterDataSynced', isSynced);
  }

  Future<bool> setActiveRegionalManager(
      {required ResourceManagerUnit unit}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveRegionalManager', jsonEncode(unit.toJson()));
  }

  Future<ResourceManagerUnit?> getActiveRegionalManager() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('ActiveRegionalManager');
    if (rawJson == null) return null;
    return ResourceManagerUnit.fromJson(
        jsonDecode(rawJson) as Map<String, dynamic>);
  }

  Future<bool> setActiveGroupScheme({required GroupScheme groupScheme}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveGroupScheme', jsonEncode(groupScheme.toJson()));
  }

  Future<GroupScheme?> getActiveGroupScheme() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('ActiveGroupScheme');
    if (rawJson == null) return null;
    return GroupScheme.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);
  }
}
