// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cmo/model/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

/// [CmoDatabaseService] is for storing master data
class CmoDatabaseService {
  CmoDatabaseService({Database? database}) {
    if (database == null) {
      initializeDatabase();
    } else {
      _database = database;
    }
  }

  Database? _database;

  static const String _cachePlantationKey = 'cachePlantation';
  static const String _cacheUnitKey = 'cacheUnit';
  static const String _cacheContractorKey = 'cacheContractor';
  static const String _cacheProvinceKey = 'cacheProvince';
  static const String _cacheMunicipalityKey = 'cacheMunicipality';
  static const String _cacheImpactCausedKey = 'cacheImpactCaused';
  static const String _cacheImpactOnKey = 'cacheImpactOn';
  static const String _cacheJobCategoryKey = 'cacheJobCategory';
  static const String _cacheJobDescriptionKey = 'cacheJobDescription';
  static const String _cacheJobElementKey = 'cacheJobElement';
  static const String _cacheMmmKey = 'cacheMmm';
  static const String _cachePdcaKey = 'cachePdca';
  static const String _cacheSeverityKey = 'cacheSeverity';
  static const String _cacheSpeqsKey = 'cacheSpeqs';
  static const String _cacheComplianceKey = 'cacheCompliance';
  static const String _cacheTeamKey = 'cacheTeam';
  static const String _cacheRejectReasonKey = 'cacheRejectReason';
  static const String _cacheTrainingProviderKey = 'cacheTrainingProvider';
  static const String _cacheCourseKey = 'cacheCourse';
  static const String _cacheScheduleKey = 'cacheSchedule';
  static const String _cacheScheduleActivityKey = 'cacheScheduleActivity';
  static const String _cacheWorkerKey = 'cacheWorker';
  static const String _cacheCompanyQuestionKey = 'cacheQuestion';

  Future<Database> initializeDatabase() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final String dbPath = join(dir.path, 'cmo.db');
    final DatabaseFactory dbFactory = databaseFactoryIo;
    final Database db = await dbFactory.openDatabase(dbPath);
    _database = db;
    return db;
  }

  Future<Database> _db() async {
    final Database db = _database ?? await initializeDatabase();
    return db;
  }

  Future<StoreRef<int, Map<String, Object?>>> _store(String key) async {
    final StoreRef<int, Map<String, Object?>> store = intMapStoreFactory.store(key);
    return store;
  }

  Future<StoreRef<String, Map<String, Object?>>> _storeString(String key) async {
    final StoreRef<String, Map<String, Object?>> store = stringMapStoreFactory.store(key);
    return store;
  }

  Future<Map<String, Object?>> _cacheItem(String key, int id, Map<String, dynamic> json) async {
    final db = await _db();
    final store = await _store(key);
    return store.record(id).put(db, json);
  }

  Future<Map<String, Object?>> _cacheItemDbString(String key, String id, Map<String, dynamic> json) async {
    final db = await _db();
    final store = await _storeString(key);
    return store.record(id).put(db, json);
  }

  Future<Map<String, Object?>?> _getItem(String key, int id) async {
    final db = await _db();
    final store = await _store(key);
    final RecordSnapshot<int, Map<String, Object?>>? snapshot = await store.record(id).getSnapshot(db);
    return snapshot?.value;
  }

  Future<Map<String, Object?>?> _getItemDbString(String key, String id) async {
    final db = await _db();
    final store = await _storeString(key);
    final RecordSnapshot<String, Map<String, Object?>>? snapshot = await store.record(id).getSnapshot(db);
    return snapshot?.value;
  }

  Future<List<RecordSnapshot<int, Map<String, Object?>>>> _getAll(String key) async {
    final db = await _db();
    final store = await _store(key);
    final snapshot = await store.find(db);
    return snapshot;
  }

  Future<List<RecordSnapshot<String, Map<String, Object?>>>> _getAllDbString(String key) async {
    final db = await _db();
    final store = await _storeString(key);
    final snapshot = await store.find(db);
    return snapshot;
  }

  Future<int> _deleteAll(String key) async {
    final db = await _db();
    final store = await _store(key);
    return store.delete(db);
  }

  Future<int> _deleteAllDbString(String key) async {
    final db = await _db();
    final store = await _storeString(key);
    return store.delete(db);
  }

  //#region Cached plantations
  Future<Map<String, Object?>?> cachePlantation(Plantation item) async {
    final id = item.plantationId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cachePlantationKey, id, json);
  }

  Future<Plantation?> getCachedPlantation({required int id}) async {
    final value = await _getItem(_cachePlantationKey, id);
    if (value == null) return null;
    final Plantation plantation = Plantation.fromJson(value);
    return plantation;
  }

  Future<List<Plantation>> getAllCachedPlantations() async {
    final snapshot = await _getAll(_cachePlantationKey);
    final plantations = <Plantation>[];
    for (var item in snapshot) {
      final plantation = Plantation.fromJson(item.value);
      plantations.add(plantation);
    }
    return plantations;
  }

  Future<int> deleteAllCachedPlantations() async {
    return _deleteAll(_cachePlantationKey);
  }
  //#endregion

  //#region Cached Units
  Future<Map<String, Object?>?> cacheUnit(Unit item) async {
    final id = item.unitId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheUnitKey, id, json);
  }

  Future<Unit?> getCachedUnit({required int id}) async {
    final value = await _getItem(_cacheUnitKey, id);
    if (value == null) return null;
    final Unit unit = Unit.fromJson(value);
    return unit;
  }

  Future<List<Unit>> getAllCachedUnits() async {
    final snapshot = await _getAll(_cacheUnitKey);
    final units = <Unit>[];
    for (var item in snapshot) {
      final unit = Unit.fromJson(item.value);
      units.add(unit);
    }
    return units;
  }

  Future<int> deleteAllCachedUnits() async {
    return _deleteAll(_cacheUnitKey);
  }
  //#endregion

  //#region Cached Contractors
  Future<Map<String, Object?>?> cacheContractor(Contractor item) async {
    final id = item.contractorId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheContractorKey, id, json);
  }

  Future<Contractor?> getCachedContractor({required int id}) async {
    final value = await _getItem(_cacheContractorKey, id);
    if (value == null) return null;
    final Contractor contractor = Contractor.fromJson(value);
    return contractor;
  }

  Future<List<Contractor>> getAllCachedContractors() async {
    final snapshot = await _getAll(_cacheContractorKey);
    final contractors = <Contractor>[];
    for (var item in snapshot) {
      final contractor = Contractor.fromJson(item.value);
      contractors.add(contractor);
    }
    return contractors;
  }

  Future<int> deleteAllCachedContractors() async {
    return _deleteAll(_cacheContractorKey);
  }
  //#endregion

  //#region Cached Provinces
  Future<Map<String, Object?>?> cacheProvince(Province item) async {
    final id = item.provinceId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheProvinceKey, id, json);
  }

  Future<Province?> getCachedProvince({required int id}) async {
    final value = await _getItem(_cacheProvinceKey, id);
    if (value == null) return null;
    final Province province = Province.fromJson(value);
    return province;
  }

  Future<List<Province>> getAllCachedProvinces() async {
    final snapshot = await _getAll(_cacheProvinceKey);
    final provinces = <Province>[];
    for (var item in snapshot) {
      final province = Province.fromJson(item.value);
      provinces.add(province);
    }
    return provinces;
  }

  Future<int> deleteAllCachedProvinces() async {
    return _deleteAll(_cacheProvinceKey);
  }
  //#endregion

  //#region Cached Municipalitys
  Future<Map<String, Object?>?> cacheMunicipality(Municipality item) async {
    final id = item.municipalityId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheMunicipalityKey, id, json);
  }

  Future<Municipality?> getCachedMunicipality({required int id}) async {
    final value = await _getItem(_cacheMunicipalityKey, id);
    if (value == null) return null;
    final Municipality municipality = Municipality.fromJson(value);
    return municipality;
  }

  Future<List<Municipality>> getAllCachedMunicipalitys() async {
    final snapshot = await _getAll(_cacheMunicipalityKey);
    final municipalitys = <Municipality>[];
    for (var item in snapshot) {
      final municipality = Municipality.fromJson(item.value);
      municipalitys.add(municipality);
    }
    return municipalitys;
  }

  Future<int> deleteAllCachedMunicipalitys() async {
    return _deleteAll(_cacheMunicipalityKey);
  }
  //#endregion

  //#region Cached ImpactCauseds
  Future<Map<String, Object?>?> cacheImpactCaused(ImpactCaused item) async {
    final id = item.impactCausedId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheImpactCausedKey, id, json);
  }

  Future<ImpactCaused?> getCachedImpactCaused({required int id}) async {
    final value = await _getItem(_cacheImpactCausedKey, id);
    if (value == null) return null;
    final ImpactCaused impactCaused = ImpactCaused.fromJson(value);
    return impactCaused;
  }

  Future<List<ImpactCaused>> getAllCachedImpactCauseds() async {
    final snapshot = await _getAll(_cacheImpactCausedKey);
    final impactCauseds = <ImpactCaused>[];
    for (var item in snapshot) {
      final impactCaused = ImpactCaused.fromJson(item.value);
      impactCauseds.add(impactCaused);
    }
    return impactCauseds;
  }

  Future<int> deleteAllCachedImpactCauseds() async {
    return _deleteAll(_cacheImpactCausedKey);
  }
  //#endregion

  //#region Cached ImpactOns
  Future<Map<String, Object?>?> cacheImpactOn(ImpactOn item) async {
    final id = item.impactOnId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheImpactOnKey, id, json);
  }

  Future<ImpactOn?> getCachedImpactOn({required int id}) async {
    final value = await _getItem(_cacheImpactOnKey, id);
    if (value == null) return null;
    final ImpactOn impactOn = ImpactOn.fromJson(value);
    return impactOn;
  }

  Future<List<ImpactOn>> getAllCachedImpactOns() async {
    final snapshot = await _getAll(_cacheImpactOnKey);
    final impactOns = <ImpactOn>[];
    for (var item in snapshot) {
      final impactOn = ImpactOn.fromJson(item.value);
      impactOns.add(impactOn);
    }
    return impactOns;
  }

  Future<int> deleteAllCachedImpactOns() async {
    return _deleteAll(_cacheImpactOnKey);
  }
  //#endregion

  //#region Cached JobCategorys
  Future<Map<String, Object?>?> cacheJobCategory(JobCategory item) async {
    final id = item.jobCategoryId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheJobCategoryKey, id, json);
  }

  Future<JobCategory?> getCachedJobCategory({required int id}) async {
    final value = await _getItem(_cacheJobCategoryKey, id);
    if (value == null) return null;
    final JobCategory jobCategory = JobCategory.fromJson(value);
    return jobCategory;
  }

  Future<List<JobCategory>> getAllCachedJobCategorys() async {
    final snapshot = await _getAll(_cacheJobCategoryKey);
    final jobCategorys = <JobCategory>[];
    for (var item in snapshot) {
      final jobCategory = JobCategory.fromJson(item.value);
      jobCategorys.add(jobCategory);
    }
    return jobCategorys;
  }

  Future<int> deleteAllCachedJobCategorys() async {
    return _deleteAll(_cacheJobCategoryKey);
  }
  //#endregion

  //#region Cached JobDescriptions
  Future<Map<String, Object?>?> cacheJobDescription(JobDescription item) async {
    final id = item.jobDescriptionId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheJobDescriptionKey, id, json);
  }

  Future<JobDescription?> getCachedJobDescription({required int id}) async {
    final value = await _getItem(_cacheJobDescriptionKey, id);
    if (value == null) return null;
    final JobDescription jobDescription = JobDescription.fromJson(value);
    return jobDescription;
  }

  Future<List<JobDescription>> getAllCachedJobDescriptions() async {
    final snapshot = await _getAll(_cacheJobDescriptionKey);
    final jobDescriptions = <JobDescription>[];
    for (var item in snapshot) {
      final jobDescription = JobDescription.fromJson(item.value);
      jobDescriptions.add(jobDescription);
    }
    return jobDescriptions;
  }

  Future<int> deleteAllCachedJobDescriptions() async {
    return _deleteAll(_cacheJobDescriptionKey);
  }
  //#endregion

  //#region Cached JobElements
  Future<Map<String, Object?>?> cacheJobElement(JobElement item) async {
    final id = item.jobElementId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheJobElementKey, id, json);
  }

  Future<JobElement?> getCachedJobElement({required int id}) async {
    final value = await _getItem(_cacheJobElementKey, id);
    if (value == null) return null;
    final JobElement jobElement = JobElement.fromJson(value);
    return jobElement;
  }

  Future<List<JobElement>> getAllCachedJobElements() async {
    final snapshot = await _getAll(_cacheJobElementKey);
    final jobElements = <JobElement>[];
    for (var item in snapshot) {
      final jobElement = JobElement.fromJson(item.value);
      jobElements.add(jobElement);
    }
    return jobElements;
  }

  Future<int> deleteAllCachedJobElements() async {
    return _deleteAll(_cacheJobElementKey);
  }
  //#endregion

  //#region Cached Mmms
  Future<Map<String, Object?>?> cacheMmm(Mmm item) async {
    final id = item.mmmId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheMmmKey, id, json);
  }

  Future<Mmm?> getCachedMmm({required int id}) async {
    final value = await _getItem(_cacheMmmKey, id);
    if (value == null) return null;
    final Mmm mmm = Mmm.fromJson(value);
    return mmm;
  }

  Future<List<Mmm>> getAllCachedMmms() async {
    final snapshot = await _getAll(_cacheMmmKey);
    final mmms = <Mmm>[];
    for (var item in snapshot) {
      final mmm = Mmm.fromJson(item.value);
      mmms.add(mmm);
    }
    return mmms;
  }

  Future<int> deleteAllCachedMmms() async {
    return _deleteAll(_cacheMmmKey);
  }
  //#endregion

  //#region Cached Pdcas
  Future<Map<String, Object?>?> cachePdca(Pdca item) async {
    final id = item.pdcaId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cachePdcaKey, id, json);
  }

  Future<Pdca?> getCachedPdca({required int id}) async {
    final value = await _getItem(_cachePdcaKey, id);
    if (value == null) return null;
    final Pdca pdca = Pdca.fromJson(value);
    return pdca;
  }

  Future<List<Pdca>> getAllCachedPdcas() async {
    final snapshot = await _getAll(_cachePdcaKey);
    final pdcas = <Pdca>[];
    for (var item in snapshot) {
      final pdca = Pdca.fromJson(item.value);
      pdcas.add(pdca);
    }
    return pdcas;
  }

  Future<int> deleteAllCachedPdcas() async {
    return _deleteAll(_cachePdcaKey);
  }
  //#endregion

  //#region Cached Severitys
  Future<Map<String, Object?>?> cacheSeverity(Severity item) async {
    final id = item.severityId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheSeverityKey, id, json);
  }

  Future<Severity?> getCachedSeverity({required int id}) async {
    final value = await _getItem(_cacheSeverityKey, id);
    if (value == null) return null;
    final Severity severity = Severity.fromJson(value);
    return severity;
  }

  Future<List<Severity>> getAllCachedSeveritys() async {
    final snapshot = await _getAll(_cacheSeverityKey);
    final severitys = <Severity>[];
    for (var item in snapshot) {
      final severity = Severity.fromJson(item.value);
      severitys.add(severity);
    }
    return severitys;
  }

  Future<int> deleteAllCachedSeveritys() async {
    return _deleteAll(_cacheSeverityKey);
  }
  //#endregion

  //#region Cached Speqss
  Future<Map<String, Object?>?> cacheSpeqs(Speqs item) async {
    final id = item.speqsId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheSpeqsKey, id, json);
  }

  Future<Speqs?> getCachedSpeqs({required int id}) async {
    final value = await _getItem(_cacheSpeqsKey, id);
    if (value == null) return null;
    final Speqs speqs = Speqs.fromJson(value);
    return speqs;
  }

  Future<List<Speqs>> getAllCachedSpeqss() async {
    final snapshot = await _getAll(_cacheSpeqsKey);
    final speqss = <Speqs>[];
    for (var item in snapshot) {
      final speqs = Speqs.fromJson(item.value);
      speqss.add(speqs);
    }
    return speqss;
  }

  Future<int> deleteAllCachedSpeqss() async {
    return _deleteAll(_cacheSpeqsKey);
  }
  //#endregion

  //#region Cached Compliances
  Future<Map<String, Object?>?> cacheCompliance(Compliance item) async {
    final id = item.complianceId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheComplianceKey, id, json);
  }

  Future<Compliance?> getCachedCompliance({required int id}) async {
    final value = await _getItem(_cacheComplianceKey, id);
    if (value == null) return null;
    final Compliance compliance = Compliance.fromJson(value);
    return compliance;
  }

  Future<List<Compliance>> getAllCachedCompliances() async {
    final snapshot = await _getAll(_cacheComplianceKey);
    final compliances = <Compliance>[];
    for (var item in snapshot) {
      final compliance = Compliance.fromJson(item.value);
      compliances.add(compliance);
    }
    return compliances;
  }

  Future<int> deleteAllCachedCompliances() async {
    return _deleteAll(_cacheComplianceKey);
  }
  //#endregion

  //#region Cached Teams
  Future<Map<String, Object?>?> cacheTeam(Team item) async {
    final id = item.teamId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheTeamKey, id, json);
  }

  Future<Team?> getCachedTeam({required int id}) async {
    final value = await _getItem(_cacheTeamKey, id);
    if (value == null) return null;
    final Team team = Team.fromJson(value);
    return team;
  }

  Future<List<Team>> getAllCachedTeams() async {
    final snapshot = await _getAll(_cacheTeamKey);
    final teams = <Team>[];
    for (var item in snapshot) {
      final team = Team.fromJson(item.value);
      teams.add(team);
    }
    return teams;
  }

  Future<int> deleteAllCachedTeams() async {
    return _deleteAll(_cacheTeamKey);
  }
  //#endregion

  //#region Cached RejectReasons
  Future<Map<String, Object?>?> cacheRejectReason(RejectReason item) async {
    final id = item.rejectReasonId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheRejectReasonKey, id, json);
  }

  Future<RejectReason?> getCachedRejectReason({required int id}) async {
    final value = await _getItem(_cacheRejectReasonKey, id);
    if (value == null) return null;
    final RejectReason rejectReason = RejectReason.fromJson(value);
    return rejectReason;
  }

  Future<List<RejectReason>> getAllCachedRejectReasons() async {
    final snapshot = await _getAll(_cacheRejectReasonKey);
    final rejectReasons = <RejectReason>[];
    for (var item in snapshot) {
      final rejectReason = RejectReason.fromJson(item.value);
      rejectReasons.add(rejectReason);
    }
    return rejectReasons;
  }

  Future<int> deleteAllCachedRejectReasons() async {
    return _deleteAll(_cacheRejectReasonKey);
  }
  //#endregion

  //#region Cached TrainingProviders
  Future<Map<String, Object?>?> cacheTrainingProvider(TrainingProvider item) async {
    final id = item.trainingProviderId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheTrainingProviderKey, id, json);
  }

  Future<TrainingProvider?> getCachedTrainingProvider({required int id}) async {
    final value = await _getItem(_cacheTrainingProviderKey, id);
    if (value == null) return null;
    final TrainingProvider trainingProvider = TrainingProvider.fromJson(value);
    return trainingProvider;
  }

  Future<List<TrainingProvider>> getAllCachedTrainingProviders() async {
    final snapshot = await _getAll(_cacheTrainingProviderKey);
    final trainingProviders = <TrainingProvider>[];
    for (var item in snapshot) {
      final trainingProvider = TrainingProvider.fromJson(item.value);
      trainingProviders.add(trainingProvider);
    }
    return trainingProviders;
  }

  Future<int> deleteAllCachedTrainingProviders() async {
    return _deleteAll(_cacheTrainingProviderKey);
  }
  //#endregion

  //#region Cached Courses
  Future<Map<String, Object?>?> cacheCourse(Course item) async {
    final id = item.courseId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheCourseKey, id, json);
  }

  Future<Course?> getCachedCourse({required int id}) async {
    final value = await _getItem(_cacheCourseKey, id);
    if (value == null) return null;
    final Course course = Course.fromJson(value);
    return course;
  }

  Future<List<Course>> getAllCachedCourses() async {
    final snapshot = await _getAll(_cacheCourseKey);
    final courses = <Course>[];
    for (var item in snapshot) {
      final course = Course.fromJson(item.value);
      courses.add(course);
    }
    return courses;
  }

  Future<int> deleteAllCachedCourses() async {
    return _deleteAll(_cacheCourseKey);
  }
  //#endregion

  //#region Cached Schedules
  Future<Map<String, Object?>?> cacheSchedule(Schedule item) async {
    final id = item.scheduleId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItemDbString(_cacheScheduleKey, id, json);
  }

  Future<Schedule?> getCachedSchedule({required String id}) async {
    final value = await _getItemDbString(_cacheScheduleKey, id);
    if (value == null) return null;
    final Schedule schedule = Schedule.fromJson(value);
    return schedule;
  }

  Future<List<Schedule>> getAllCachedSchedules() async {
    final snapshot = await _getAllDbString(_cacheScheduleKey);
    final schedules = <Schedule>[];
    for (var item in snapshot) {
      final schedule = Schedule.fromJson(item.value);
      schedules.add(schedule);
    }
    return schedules;
  }

  Future<int> deleteAllCachedSchedules() async {
    return _deleteAllDbString(_cacheScheduleKey);
  }
  //#endregion

  //#region Cached ScheduleActivitys
  Future<Map<String, Object?>?> cacheScheduleActivity(ScheduleActivity item) async {
    final id = item.scheduleActivityId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheScheduleActivityKey, id, json);
  }

  Future<ScheduleActivity?> getCachedScheduleActivity({required int id}) async {
    final value = await _getItem(_cacheScheduleActivityKey, id);
    if (value == null) return null;
    final ScheduleActivity scheduleActivity = ScheduleActivity.fromJson(value);
    return scheduleActivity;
  }

  Future<List<ScheduleActivity>> getAllCachedScheduleActivitys() async {
    final snapshot = await _getAll(_cacheScheduleActivityKey);
    final scheduleActivitys = <ScheduleActivity>[];
    for (var item in snapshot) {
      final scheduleActivity = ScheduleActivity.fromJson(item.value);
      scheduleActivitys.add(scheduleActivity);
    }
    return scheduleActivitys;
  }

  Future<int> deleteAllCachedScheduleActivitys() async {
    return _deleteAll(_cacheScheduleActivityKey);
  }
  //#endregion

  //#region Cached Workers
  Future<Map<String, Object?>?> cacheWorker(Worker item) async {
    final id = item.workerId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItemDbString(_cacheWorkerKey, id, json);
  }

  Future<Worker?> getCachedWorker({required String id}) async {
    final value = await _getItemDbString(_cacheWorkerKey, id);
    if (value == null) return null;
    final Worker worker = Worker.fromJson(value);
    return worker;
  }

  Future<List<Worker>> getAllCachedWorkers() async {
    final snapshot = await _getAllDbString(_cacheWorkerKey);
    final workers = <Worker>[];
    for (var item in snapshot) {
      final worker = Worker.fromJson(item.value);
      workers.add(worker);
    }
    return workers;
  }

  Future<int> deleteAllCachedWorkers() async {
    return _deleteAllDbString(_cacheWorkerKey);
  }
  //#endregion

  //#region Cached CompanyQuestions
  Future<Map<String, Object?>?> cacheCompanyQuestion(CompanyQuestion item) async {
    final id = item.companyQuestionId;
    if (id == null) return null;
    final json = item.toJson();
    return _cacheItem(_cacheCompanyQuestionKey, id, json);
  }

  Future<CompanyQuestion?> getCachedCompanyQuestion({required int id}) async {
    final value = await _getItem(_cacheCompanyQuestionKey, id);
    if (value == null) return null;
    final CompanyQuestion companyQuestion = CompanyQuestion.fromJson(value);
    return companyQuestion;
  }

  Future<List<CompanyQuestion>> getAllCachedCompanyQuestions() async {
    final snapshot = await _getAll(_cacheCompanyQuestionKey);
    final companyQuestions = <CompanyQuestion>[];
    for (var item in snapshot) {
      final companyQuestion = CompanyQuestion.fromJson(item.value);
      companyQuestions.add(companyQuestion);
    }
    return companyQuestions;
  }

  Future<int> deleteAllCachedCompanyQuestions() async {
    return _deleteAll(_cacheCompanyQuestionKey);
  }
  //#endregion

  Future<FileSystemEntity> deleteAll() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final String dbPath = join(dir.path, 'cmo.db');
    return File(dbPath).delete();
  }
}
