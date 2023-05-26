// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cmo/di.dart';
import 'package:cmo/model/farm_property_ownner_ship_type/farm_property_owner_ship_type.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/user/user_role.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class CmoDatabaseService {
  CmoDatabaseService();

  // Isar? _database;

  // Future<Isar> initializeDatabase() async {
  //   final isar = await Isar.open([
  //     CompanySchema,
  //     AssessmentSchema,
  //     AuditSchema,
  //     StakeHolderSchema,
  //     AuditQuestionSchema,
  //     AuditQuestionPhotoSchema,
  //     AuditQuestionCommentSchema,
  //     AuditQuestionAnswerSchema,
  //   ]);
  //   _database = isar;
  //   return isar;
  // }

  Future<Isar> get db => _db();
  Future<Isar> _db() async {
    return cmoDatabaseMasterService.db;
    // final db = _database ?? await initializeDatabase();
    // return db;
  }

  Future<int> cacheUserRolePortal(
      {required int userId,
      required int portalId,
      required String portalName}) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.userRolePortals.put(UserRolePortal(
          userId: userId, portalId: portalId, portalName: portalName));
    });
  }

  Future<int> cacheUserRole(
      {required int userId, required String roleName}) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.userRoles.put(UserRole(userId: userId, roleName: roleName));
    });
  }

  Future<int> cacheUserDevice(UserDevice userDevice) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.userDevices.put(userDevice);
    });
  }

  Future<List<FarmPropertyOwnerShipType>>
      getAllFarmPropertyOwnerShipType() async {
    final db = await _db();
    return db.farmPropertyOwnerShipTypes.where().findAll();
  }

  Future<FileSystemEntity?> deleteAll() async {
    final db = await _db();
    await db.writeTxn(() async {
      await db.clear();
    });
    return null;
  }
}

class AssessmentTotal {
  AssessmentTotal(this.totalInProgress, this.totalUnSynced);

  final int totalInProgress;
  final int totalUnSynced;
}
