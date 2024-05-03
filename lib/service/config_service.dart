import 'dart:convert';

import 'package:cmo/enum/user_role_enum.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/model/setting_config/setting_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  Future<void> logout() async {
    await updateLatestLocalDatabaseStatus();
    await setRMSynced(isSynced: false);
    await setIsAuthorized(isAuthorized: false);
    await clearPerformConfig();
    await clearUserConfig();
    await setSettingConfig();
  }

  Future<bool> isFirstLaunch() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool('FirstLaunch') ?? true;
  }

  Future<bool> setFirstLaunch({required bool isFirstLaunch}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool('FirstLaunch', isFirstLaunch);
  }

  Future<bool> isAuthorized() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool('isAuthorized') ?? false;
  }

  Future<bool> setIsAuthorized({required bool isAuthorized}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool('isAuthorized', isAuthorized);
  }

  Future<bool> isRMSynced() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool('RegionalManagerMasterDataSynced') ?? false;
  }

  Future<bool> setRMSynced({required bool isSynced}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool('RegionalManagerMasterDataSynced', isSynced);
  }

  Future<bool> isFarmerSynced() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool('FarmerMasterDataSynced') ?? false;
  }

  Future<bool> setFarmerSynced({required bool isSynced}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setBool('FarmerMasterDataSynced', isSynced);
  }

  Future<bool> setActiveRegionalManager(
      {required ResourceManagerUnit unit}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveRegionalManager', jsonEncode(unit.toJson()));
  }

  Future<ResourceManagerUnit?> getActiveRegionalManager() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('ActiveRegionalManager');
    if (rawJson == null || rawJson.isEmpty) return null;
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
    if (rawJson == null || rawJson.isEmpty) return null;
    return GroupScheme.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);
  }

  Future<bool> setActiveCompany({required Company company}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveCompany', jsonEncode(company.toJson()));
  }

  Future<Company?> getActiveCompany() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('ActiveCompany');
    if (rawJson == null) return null;
    return Company.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);
  }

  Future<bool> setActiveUser({required UserInfo userInfo}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveUser', jsonEncode(userInfo.toJson()));
  }

  Future<UserInfo?> getActiveUser() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('ActiveUser');
    if (rawJson == null || rawJson.isEmpty) return null;
    return UserInfo.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);
  }

  Future<bool> setActiveUserRole({required UserRoleEnum userRole}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setInt('ActiveUserRole', userRole.value);
  }

  Future<UserRoleEnum?> getActiveUserRole() async {
    final sp = await SharedPreferences.getInstance();
    final selectedValue = sp.getInt('ActiveUserRole');

    if (selectedValue == 3) {
      return null;
    }
    for (final element in UserRoleEnum.values) {
      if (element.value == selectedValue) return element;
    }
    return null;
  }

  Future<bool> setActiveFarm({required Farm farm}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveFarm', jsonEncode(farm.toJson()));
  }

  Future<Farm?> getActiveFarm() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('ActiveFarm');
    if (rawJson == null || rawJson.isEmpty) return null;
    return Farm.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);
  }

  Future<void> clearUserConfig() async {
    await clearActiveUserInfo();
    await clearActiveUserRole();
  }

  Future<bool> clearActiveUserInfo() async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveUser', '');
  }

  Future<bool> clearActiveUserRole() async {
    final sp = await SharedPreferences.getInstance();
    return sp.setInt('ActiveUserRole', 3);
  }

  Future<void> clearPerformConfig() async {
    await clearActiveGroupScheme();
    await clearActiveRegionalManager();
    await clearActiveFarm();
  }

  Future<bool> clearActiveGroupScheme() async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveGroupScheme', '');
  }

  Future<bool> clearActiveFarm() async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveFarm', '');
  }

  Future<bool> clearActiveRegionalManager() async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('ActiveRegionalManager', '');
  }

  Future<bool> setLocalDatabaseStatus({required LocalDatabaseStatus? localDatabaseStatus}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString('LocalDatabaseStatus', jsonEncode(localDatabaseStatus?.toJson()));
  }

  Future<LocalDatabaseStatus?> getLocalDatabaseStatus() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('LocalDatabaseStatus');
    if (rawJson == null || rawJson.isEmpty) return null;
    return LocalDatabaseStatus.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);
  }

  Future<void> updateLatestLocalDatabaseStatus() async {
    final currentUsername = await getActiveUser();
    final currentGS = await getActiveGroupScheme();
    final currentRMU = await getActiveRegionalManager();

    await setLocalDatabaseStatus(
      localDatabaseStatus: LocalDatabaseStatus(
        latestUserName: currentUsername?.userName,
        latestGroupSchemeName: currentGS?.groupSchemeName,
        latestGroupSchemeId: currentGS?.groupSchemeId,
        latestRegionalManagerUnitId: currentRMU?.regionalManagerUnitId,
        latestRegionalManagerUnitName: currentRMU?.regionalManagerUnitName,
      ),
    );
  }

  Future<bool> setSettingConfig({SettingConfig? settingConfig}) async {
    final sp = await SharedPreferences.getInstance();
    return sp.setString(
      'SettingConfig',
      settingConfig == null
          ? ''
          : jsonEncode(settingConfig.toJson()),
    );
  }

  Future<SettingConfig> getSettingConfig() async {
    final sp = await SharedPreferences.getInstance();
    final rawJson = sp.getString('SettingConfig');
    if (rawJson == null || rawJson.isEmpty) return const SettingConfig();
    return SettingConfig.fromJson(jsonDecode(rawJson) as Map<String, dynamic>);
  }
}
