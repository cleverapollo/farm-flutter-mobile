import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  Future<void> setActiveRegionalManager(
      {required int groupSchemeId,
      required int rmUnitId,
      required String rmName}) async {
    final sp = await SharedPreferences.getInstance();
    await Future.wait([
      sp.setInt('ActiveGroupSchemeId', groupSchemeId),
      sp.setInt('ActiveRegionalManagerUnitId', rmUnitId),
      sp.setString('ActiveRegionalManagerUnitName', rmName)
    ]);
  }

  Future<int?> getActiveGroupSchemeId() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt('ActiveGroupSchemeId');
  }

  Future<int?> getActiveRegionalManagerUnitId() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getInt('ActiveRegionalManagerUnitId');
  }

  Future<String?> getActiveRegionalManagerUnitName() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString('ActiveRegionalManagerUnitName');
  }
}
