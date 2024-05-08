import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';

mixin CRUDLocalDatabaseMixin {
  Future<int?> insertActionType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final actionType = ActionType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheActionType(
        actionType,
        isDirect: true,
      );
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertActionLog(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final actionLog = ActionLog.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheActionLog(
        actionLog.copyWith(
          isMasterDataSynced: true,
        ),
        isDirect: true,
      );
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertActionLogPhoto(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final photo = ActionLogPhoto.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheActionLogPhoto(
        photo.copyWith(
          isMasterdataSynced: true,
          photo: photo.photo.base64SyncServerToString,
        ),
        isDirect: true,
      );
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }
}