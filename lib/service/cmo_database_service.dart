// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cmo/model/assessment.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/cmo_database_company_service.dart';
import 'package:isar/isar.dart';

/// [CmoDatabaseService] is for storing app data
class CmoDatabaseService {
  CmoDatabaseService();

  Isar? _database;

  Future<Isar> initializeDatabase() async {
    final isar = await Isar.open([CompanySchema, AssessmentSchema]);
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
    return db.assessments.put(item);
  }

  Future<Assessment?> getCachedAssessment({required int id}) async {
    final db = await _db();
    return db.assessments.get(id);
  }

  Future<List<Assessment>> getAllCachedAssessments() async {
    final db = await _db();
    return db.assessments.where().findAll();
  }

  Future<List<Assessment>> getAllAssessmentsStarted() async {
    final db = await _db();
    return db.assessments.filter().statusEqualTo(1).findAll();
  }

  Future<List<Assessment>> getAllAssessmentsCompleted() async {
    final db = await _db();
    return db.assessments.filter().statusEqualTo(2).findAll();
  }

  Future<List<Assessment>> getAllAssessmentsSynced() async {
    final db = await _db();
    return db.assessments.filter().statusEqualTo(3).findAll();
  }

  Future<FileSystemEntity?> deleteAll() async {
    final db = await _db();
    final companies = await getAllCachedCompanys();
    for (final item in companies) {
      await CmoDatabaseCompanyService(companyId: item.companyId).deleteAll();
    }
    await db.writeTxn(() async {
      await db.clear();
    });
    _database = null;
    return null;
  }
}
