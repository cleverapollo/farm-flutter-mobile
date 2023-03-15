// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/cmo_database_company_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_sqflite/sembast_sqflite.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

export 'package:sembast/sembast.dart';

/// [CmoDatabaseService] is for storing master data
class CmoDatabaseService {
  CmoDatabaseService({
    Database? database,
  }) {
    if (database == null) {
      initializeDatabase();
    } else {
      _database = database;
    }
  }

  Database? _database;
  static const String _cacheCompanyKey = 'cacheCompanyKey';

  Future<Database> initializeDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, appInfoService.databaseName);
    final dbFactory = getDatabaseFactorySqflite(sqflite.databaseFactory);
    dbFactory.sqfliteImportPageSize = appInfoService.sqfliteImportPageSize;
    final db = await dbFactory.openDatabase(dbPath);
    _database = db;
    return db;
  }

  Future<Database> _db() async {
    final db = _database ?? await initializeDatabase();
    return db;
  }

  Future<StoreRef<int, Map<String, Object?>>> _store(String key) async {
    final store = intMapStoreFactory.store(key);
    return store;
  }

  Future<Map<String, Object?>> _cacheItem(
    String key,
    int id,
    Map<String, dynamic> json,
  ) async {
    final db = await _db();
    final store = await _store(key);
    return store.record(id).put(db, json);
  }

  Future<List<RecordSnapshot<int, Map<String, Object?>>>> _getAll(
    String key,
  ) async {
    final db = await _db();
    final store = await _store(key);
    final snapshot = await store.find(db);
    return snapshot;
  }

  Future<Map<String, Object?>?> cacheCompany(Company item) async {
    final id = item.companyId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheCompanyKey, id, json);
  }

  Future<List<Company>> getAllCachedCompanys() async {
    final snapshot = await _getAll(_cacheCompanyKey);
    final companys = <Company>[];
    for (final item in snapshot) {
      final company = Company.fromJson(item.value);
      companys.add(company);
    }
    return companys;
  }

  Future<FileSystemEntity> deleteAll() async {
    final companies = await getAllCachedCompanys();
    for (final item in companies) {
      await cmoDatabaseCompanyService(companyId: item.companyId).deleteAll();
    }
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, appInfoService.databaseName);
    return File(dbPath).delete();
  }
}
