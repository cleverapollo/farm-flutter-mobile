// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cmo/model/model.dart';
import 'package:isar/isar.dart';

class CmoDatabaseService {
  CmoDatabaseService();

  Isar? _database;

  Future<Isar> initializeDatabase() async {
    final isar = await Isar.open([
      CompanySchema,
      AssessmentSchema,
      AuditSchema,
      StakeHolderSchema,
    ]);
    _database = isar;
    return isar;
  }

  Future<Isar> get db => _db();
  Future<Isar> _db() async {
    final db = _database ?? await initializeDatabase();
    return db;
  }

  Future<int> cacheCompany(Company item) async {
    final db = await _db();
    return db.companys.put(item);
  }

  Future<Company?> getCachedCompany({required int id}) async {
    final db = await _db();
    return db.companys.get(id);
  }

  Future<List<Company>> getAllCachedCompanys() async {
    final db = await _db();
    return db.companys.where().findAll();
  }

  Future<int> cacheAssessment(Assessment item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.assessments.put(item);
    });
  }

  Future<bool> removeAssessment(int assessmentId) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.assessments.delete(assessmentId);
    });
  }

  Future<Assessment?> getCachedAssessment({required int id}) async {
    final db = await _db();
    return db.assessments.get(id);
  }

  Future<List<Assessment>> getAllCachedAssessments() async {
    final db = await _db();
    return db.assessments.where().findAll();
  }

  Future<List<Assessment>> getAllAssessmentByCompanyIdAndUserId(
      int companyId, int userId) async {
    final db = await _db();
    return db.assessments
        .filter()
        .companyIdEqualTo(companyId)
        .userIdEqualTo(userId)
        .isActiveEqualTo(true)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<AssessmentTotal> getAssessmentTotalsByCompanyIdAndUserId(
      int companyId, int userId) async {
    final total = await getAllAssessmentByCompanyIdAndUserId(companyId, userId);
    final completed =
        await getAllAssessmentsCompletedByCompanyIdAndUserId(companyId, userId);
    final synced =
        await getAllAssessmentsSyncedByCompanyIdAndUserId(companyId, userId);

    return AssessmentTotal(
      total.length - completed.length,
      completed.length - synced.length,
    );
  }

  Future<List<Assessment>> getAllAssessmentsStarted() async {
    final db = await _db();
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(1)
        .completedEqualTo(null).or()
        .completedEqualTo(false)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<Assessment>> getAllAssessmentUnSyncedByCompanyIdAndUserId(
      int companyId, int userId) async {
    final db = await _db();
    return [
      ...await getAllAssessmentsCompletedByCompanyIdAndUserId(
          companyId, userId),
      ...await getAllAssessmentsSyncedByCompanyIdAndUserId(companyId, userId)
    ];
  }

  Future<List<Assessment>> getAllAssessmentsCompleted() async {
    final db = await _db();
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .completedEqualTo(true)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<Assessment>> getAllAssessmentsCompletedByCompanyIdAndUserId(
      int companyId, int userId) async {
    final db = await _db();
    final result = db.assessments
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(2)
        .companyIdEqualTo(companyId)
        .userIdEqualTo(userId)
        .sortByCreateDTDesc()
        .findAll();

    return result;
  }

  Future<List<Assessment>> getAllAssessmentsSynced() async {
    final db = await _db();
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(3)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<Assessment>> getAllAssessmentsSyncedByCompanyIdAndUserId(
      int companyId, int userId) async {
    final db = await _db();
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(companyId)
        .userIdEqualTo(userId)
        .statusEqualTo(3)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<FileSystemEntity?> deleteAll() async {
    final db = await _db();
    await db.writeTxn(() async {
      await db.clear();
    });
    return null;
  }

  Future<List<Audit>> getAllAuditsIncomplete() async {
    final db = await _db();
    return db.audits
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(1)
        .completedEqualTo(null).or()
        .completedEqualTo(false)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<Audit>> getAllAuditsCompleted() async {
    final db = await _db();
    return db.audits
        .filter()
        .isActiveEqualTo(true)
        .completedEqualTo(true)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<Audit>> getAllAuditsSynced() async {
    final db = await _db();
    return db.audits
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(3)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<int> cacheAudit(Audit item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.audits.put(item);
    });
  }

  Future<bool> removeAudit(int auditId) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.audits.delete(auditId);
    });
  }
}

class AssessmentTotal {
  AssessmentTotal(this.totalInProgress, this.totalUnSynced);

  final int totalInProgress;
  final int totalUnSynced;
}
