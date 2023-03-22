// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:isar/isar.dart';

import 'package:cmo/model/assessment.dart';
import 'package:cmo/model/model.dart';

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
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(1)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<Assessment>> getAllAssessmentsCompleted() async {
    final db = await _db();
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(2)
        .sortByCreateDTDesc()
        .findAll();
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

  Future<FileSystemEntity?> deleteAll() async {
    final db = await _db();
    await db.writeTxn(() async {
      await db.clear();
    });
    return null;
  }
}
