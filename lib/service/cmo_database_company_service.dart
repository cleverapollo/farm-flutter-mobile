// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:cmo/model/model.dart';
import 'package:isar/isar.dart';

/// [CmoDatabaseCompanyService] is for storing master data
class CmoDatabaseCompanyService {
  factory CmoDatabaseCompanyService({required int? companyId}) {
    _inst.companyId = companyId;
    return _inst;
  }

  CmoDatabaseCompanyService._internal();
  static final CmoDatabaseCompanyService _inst =
      CmoDatabaseCompanyService._internal();

  late int? companyId;
  String get _databaseName => 'cmo_company_$companyId';

  Isar? _database;

  Future<Isar> initializeDatabase() async {
    final isar = await Isar.open(
      [
        PlantationSchema,
        UnitSchema,
        ContractorSchema,
        ProvinceSchema,
        MunicipalitySchema,
        ImpactCausedSchema,
        ImpactOnSchema,
        JobCategorySchema,
        JobDescriptionSchema,
        JobElementSchema,
        MmmSchema,
        PdcaSchema,
        SeveritySchema,
        SpeqsSchema,
        ComplianceSchema,
        TeamSchema,
        RejectReasonSchema,
        TrainingProviderSchema,
        CourseSchema,
        ScheduleSchema,
        ScheduleActivitySchema,
        WorkerSchema,
        CompanyQuestionSchema,
      ],
      name: _databaseName,
    );
    _database = isar;
    return isar;
  }

  Future<Isar> _db() async {
    final db = _database ?? await initializeDatabase();
    return db;
  }

  Future<Isar> get db => _db();

  //#region Cached plantations
  Future<int> cachePlantation(Plantation item) async {
    final db = await _db();
    return db.plantations.put(item);
  }

  // Future<Plantation?> getCachedPlantation({required int id}) async {
  //   final value = await _getItem(_cachePlantationKey, id);
  //   if (value == null) return null;
  //   final plantation = Plantation.fromJson(value);
  //   return plantation;
  // }

  Future<List<Plantation>> getPlantations() async {
    final db = await _db();
    return db.plantations.where().findAll();
  }

  // Future<int> deletePlantations() async {
  //   return _deleteAll(_cachePlantationKey);
  // }
  //#endregion

  //#region Cached Units
  Future<int> cacheUnit(Unit item) async {
    final db = await _db();
    return db.units.put(item);
  }

  // Future<Unit?> getCachedUnit({required int id}) async {
  //   final value = await _getItem(_cacheUnitKey, id);
  //   if (value == null) return null;
  //   final unit = Unit.fromJson(value);
  //   return unit;
  // }

  Future<List<Unit>> getUnits() async {
    final db = await _db();
    return db.units.where().findAll();
  }

  // Future<int> deleteUnits() async {
  //   return _deleteAll(_cacheUnitKey);
  // }
  //#endregion

  //#region Cached Contractors
  Future<int> cacheContractor(Contractor item) async {
    final db = await _db();
    return db.contractors.put(item);
  }

  // Future<Contractor?> getCachedContractor({required int id}) async {
  //   final value = await _getItem(_cacheContractorKey, id);
  //   if (value == null) return null;
  //   final contractor = Contractor.fromJson(value);
  //   return contractor;
  // }

  Future<List<Contractor>> getContractors() async {
    final db = await _db();
    return db.contractors.where().findAll();
  }

  // Future<int> deleteContractors() async {
  //   return _deleteAll(_cacheContractorKey);
  // }
  //#endregion

  //#region Cached Provinces
  Future<int> cacheProvince(Province item) async {
    final db = await _db();
    return db.provinces.put(item);
  }

  // Future<Province?> getCachedProvince({required int id}) async {
  //   final value = await _getItem(_cacheProvinceKey, id);
  //   if (value == null) return null;
  //   final province = Province.fromJson(value);
  //   return province;
  // }

  Future<List<Province>> getProvinces() async {
    final db = await _db();
    return db.provinces.where().findAll();
  }

  // Future<int> deleteProvinces() async {
  //   return _deleteAll(_cacheProvinceKey);
  // }
  //#endregion

  //#region Cached Municipalitys
  Future<int> cacheMunicipality(Municipality item) async {
    final db = await _db();
    return db.municipalitys.put(item);
  }

  // Future<Municipality?> getCachedMunicipality({required int id}) async {
  //   final value = await _getItem(_cacheMunicipalityKey, id);
  //   if (value == null) return null;
  //   final municipality = Municipality.fromJson(value);
  //   return municipality;
  // }

  Future<List<Municipality>> getMunicipalitys() async {
    final db = await _db();

    return db.municipalitys.where().findAll();
  }

  // Future<int> deleteMunicipalitys() async {
  //   return _deleteAll(_cacheMunicipalityKey);
  // }
  //#endregion

  //#region Cached ImpactCauseds
  Future<int> cacheImpactCaused(ImpactCaused item) async {
    final db = await _db();
    return db.impactCauseds.put(item);
  }

  // Future<ImpactCaused?> getCachedImpactCaused({required int id}) async {
  //   final value = await _getItem(_cacheImpactCausedKey, id);
  //   if (value == null) return null;
  //   final impactCaused = ImpactCaused.fromJson(value);
  //   return impactCaused;
  // }

  Future<List<ImpactCaused>> getImpactCauseds() async {
    final db = await _db();

    return db.impactCauseds.where().findAll();
  }

  // Future<int> deleteImpactCauseds() async {
  //   return _deleteAll(_cacheImpactCausedKey);
  // }
  //#endregion

  //#region Cached ImpactOns
  Future<int> cacheImpactOn(ImpactOn item) async {
    final db = await _db();
    return db.impactOns.put(item);
  }

  // Future<ImpactOn?> getCachedImpactOn({required int id}) async {
  //   final value = await _getItem(_cacheImpactOnKey, id);
  //   if (value == null) return null;
  //   final impactOn = ImpactOn.fromJson(value);
  //   return impactOn;
  // }

  Future<List<ImpactOn>> getImpactOns() async {
    final db = await _db();

    return db.impactOns.where().findAll();
  }

  // Future<int> deleteImpactOns() async {
  //   return _deleteAll(_cacheImpactOnKey);
  // }
  //#endregion

  //#region Cached JobCategorys
  Future<int> cacheJobCategory(JobCategory item) async {
    final db = await _db();
    return db.jobCategorys.put(item);
  }

  // Future<JobCategory?> getCachedJobCategory({required int id}) async {
  //   final value = await _getItem(_cacheJobCategoryKey, id);
  //   if (value == null) return null;
  //   final jobCategory = JobCategory.fromJson(value);
  //   return jobCategory;
  // }

  Future<List<JobCategory>> getJobCategorys() async {
    final db = await _db();

    return db.jobCategorys.where().findAll();
  }

  // Future<int> deleteJobCategorys() async {
  //   return _deleteAll(_cacheJobCategoryKey);
  // }
  //#endregion

  //#region Cached JobDescriptions
  Future<int> cacheJobDescription(JobDescription item) async {
    final db = await _db();
    return db.jobDescriptions.put(item);
  }

  // Future<JobDescription?> getCachedJobDescription({required int id}) async {
  //   final value = await _getItem(_cacheJobDescriptionKey, id);
  //   if (value == null) return null;
  //   final jobDescription = JobDescription.fromJson(value);
  //   return jobDescription;
  // }

  Future<List<JobDescription>> getJobDescriptions() async {
    final db = await _db();

    return db.jobDescriptions.where().findAll();
  }

  // Future<int> deleteJobDescriptions() async {
  //   return _deleteAll(_cacheJobDescriptionKey);
  // }
  //#endregion

  //#region Cached JobElements
  Future<int> cacheJobElement(JobElement item) async {
    final db = await _db();
    return db.jobElements.put(item);
  }

  // Future<JobElement?> getCachedJobElement({required int id}) async {
  //   final value = await _getItem(_cacheJobElementKey, id);
  //   if (value == null) return null;
  //   final jobElement = JobElement.fromJson(value);
  //   return jobElement;
  // }

  Future<List<JobElement>> getJobElements() async {
    final db = await _db();

    return db.jobElements.where().findAll();
  }

  // Future<int> deleteJobElements() async {
  //   return _deleteAll(_cacheJobElementKey);
  // }
  //#endregion

  //#region Cached Mmms
  Future<int> cacheMmm(Mmm item) async {
    final db = await _db();
    return db.mmms.put(item);
  }

  // Future<Mmm?> getCachedMmm({required int id}) async {
  //   final value = await _getItem(_cacheMmmKey, id);
  //   if (value == null) return null;
  //   final mmm = Mmm.fromJson(value);
  //   return mmm;
  // }

  Future<List<Mmm>> getMmms() async {
    final db = await _db();

    return db.mmms.where().findAll();
  }

  // Future<int> deleteMmms() async {
  //   return _deleteAll(_cacheMmmKey);
  // }
  //#endregion

  //#region Cached Pdcas
  Future<int> cachePdca(Pdca item) async {
    final db = await _db();
    return db.pdcas.put(item);
  }

  // Future<Pdca?> getCachedPdca({required int id}) async {
  //   final value = await _getItem(_cachePdcaKey, id);
  //   if (value == null) return null;
  //   final pdca = Pdca.fromJson(value);
  //   return pdca;
  // }

  Future<List<Pdca>> getPdcas() async {
    final db = await _db();

    return db.pdcas.where().findAll();
  }

  // Future<int> deletePdcas() async {
  //   return _deleteAll(_cachePdcaKey);
  // }
  //#endregion

  //#region Cached Severitys
  Future<int> cacheSeverity(Severity item) async {
    final db = await _db();
    return db.severitys.put(item);
  }

  // Future<Severity?> getCachedSeverity({required int id}) async {
  //   final value = await _getItem(_cacheSeverityKey, id);
  //   if (value == null) return null;
  //   final severity = Severity.fromJson(value);
  //   return severity;
  // }

  Future<List<Severity>> getSeveritys() async {
    final db = await _db();

    return db.severitys.where().findAll();
  }

  // Future<int> deleteSeveritys() async {
  //   return _deleteAll(_cacheSeverityKey);
  // }
  //#endregion

  //#region Cached Speqss
  Future<int> cacheSpeqs(Speqs item) async {
    final db = await _db();
    return db.speqs.put(item);
  }

  // Future<Speqs?> getCachedSpeqs({required int id}) async {
  //   final value = await _getItem(_cacheSpeqsKey, id);
  //   if (value == null) return null;
  //   final speqs = Speqs.fromJson(value);
  //   return speqs;
  // }

  Future<List<Speqs>> getSpeqss() async {
    final db = await _db();
    return db.speqs.where().findAll();
  }

  // Future<int> deleteSpeqss() async {
  //   return _deleteAll(_cacheSpeqsKey);
  // }
  //#endregion

  //#region Cached Compliances
  Future<int> cacheCompliance(Compliance item) async {
    final db = await _db();
    return db.compliances.put(item);
  }

  // Future<Compliance?> getCachedCompliance({required int id}) async {
  //   final value = await _getItem(_cacheComplianceKey, id);
  //   if (value == null) return null;
  //   final compliance = Compliance.fromJson(value);
  //   return compliance;
  // }

  Future<List<Compliance>> getCompliances() async {
    final db = await _db();

    return db.compliances.where().findAll();
  }

  // Future<int> deleteCompliances() async {
  //   return _deleteAll(_cacheComplianceKey);
  // }
  //#endregion

  //#region Cached Teams
  Future<int> cacheTeam(Team item) async {
    final db = await _db();
    return db.teams.put(item);
  }

  // Future<Team?> getCachedTeam({required int id}) async {
  //   final value = await _getItem(_cacheTeamKey, id);
  //   if (value == null) return null;
  //   final team = Team.fromJson(value);
  //   return team;
  // }

  Future<List<Team>> getTeams() async {
    final db = await _db();

    return db.teams.where().findAll();
  }

  // Future<int> deleteTeams() async {
  //   return _deleteAll(_cacheTeamKey);
  // }
  //#endregion

  //#region Cached RejectReasons
  Future<int> cacheRejectReason(RejectReason item) async {
    final db = await _db();
    return db.rejectReasons.put(item);
  }

  // Future<RejectReason?> getCachedRejectReason({required int id}) async {
  //   final value = await _getItem(_cacheRejectReasonKey, id);
  //   if (value == null) return null;
  //   final rejectReason = RejectReason.fromJson(value);
  //   return rejectReason;
  // }

  Future<List<RejectReason>> getRejectReasons() async {
    final db = await _db();

    return db.rejectReasons.where().findAll();
  }

  // Future<int> deleteRejectReasons() async {
  //   return _deleteAll(_cacheRejectReasonKey);
  // }
  //#endregion

  //#region Cached TrainingProviders
  Future<int> cacheTrainingProvider(
    TrainingProvider item,
  ) async {
    final db = await _db();
    return db.trainingProviders.put(item);
  }

  // Future<TrainingProvider?> getCachedTrainingProvider({required int id}) async {
  //   final value = await _getItem(_cacheTrainingProviderKey, id);
  //   if (value == null) return null;
  //   final trainingProvider = TrainingProvider.fromJson(value);
  //   return trainingProvider;
  // }

  Future<List<TrainingProvider>> getTrainingProviders() async {
    final db = await _db();

    return db.trainingProviders.where().findAll();
  }

  // Future<int> deleteTrainingProviders() async {
  //   return _deleteAll(_cacheTrainingProviderKey);
  // }
  //#endregion

  //#region Cached Courses
  Future<int> cacheCourse(Course item) async {
    final db = await _db();
    return db.courses.put(item);
  }

  // Future<Course?> getCachedCourse({required int id}) async {
  //   final value = await _getItem(_cacheCourseKey, id);
  //   if (value == null) return null;
  //   final course = Course.fromJson(value);
  //   return course;
  // }

  Future<List<Course>> getCourses() async {
    final db = await _db();

    return db.courses.where().findAll();
  }

  // Future<int> deleteCourses() async {
  //   return _deleteAll(_cacheCourseKey);
  // }
  //#endregion

  //#region Cached Schedules
  Future<int> cacheSchedule(Schedule item) async {
    final db = await _db();
    return db.schedules.put(item);
  }

  // Future<Schedule?> getCachedSchedule({required String id}) async {
  //   final value = await _getItemDbString(_cacheScheduleKey, id);
  //   if (value == null) return null;
  //   final schedule = Schedule.fromJson(value);
  //   return schedule;
  // }

  Future<List<Schedule>> getSchedules() async {
    final db = await _db();

    return db.schedules.where().findAll();
  }

  // Future<int> deleteSchedules() async {
  //   return _deleteAllDbString(_cacheScheduleKey);
  // }
  //#endregion

  //#region Cached ScheduleActivitys
  Future<int> cacheScheduleActivity(
    ScheduleActivity item,
  ) async {
    final db = await _db();
    return db.scheduleActivitys.put(item);
  }

  // Future<ScheduleActivity?> getCachedScheduleActivity({required int id}) async {
  //   final value = await _getItem(_cacheScheduleActivityKey, id);
  //   if (value == null) return null;
  //   final scheduleActivity = ScheduleActivity.fromJson(value);
  //   return scheduleActivity;
  // }

  Future<List<ScheduleActivity>> getScheduleActivitys() async {
    final db = await _db();

    return db.scheduleActivitys.where().findAll();
  }

  // Future<int> deleteScheduleActivitys() async {
  //   return _deleteAll(_cacheScheduleActivityKey);
  // }
  //#endregion

  //#region Cached Workers
  Future<int> cacheWorker(Worker item) async {
    final db = await _db();
    return db.workers.put(item);
  }

  // Future<Worker?> getCachedWorker({required String id}) async {
  //   final value = await _getItemDbString(_cacheWorkerKey, id);
  //   if (value == null) return null;
  //   final worker = Worker.fromJson(value);
  //   return worker;
  // }

  Future<List<Worker>> getWorkers() async {
    final db = await _db();

    return db.workers.where().findAll();
  }

  // Future<int> deleteWorkers() async {
  //   return _deleteAllDbString(_cacheWorkerKey);
  // }
  //#endregion

  //#region Cached CompanyQuestions
  Future<int> cacheCompanyQuestion(
    CompanyQuestion item,
  ) async {
    final db = await _db();
    return db.companyQuestions.put(item);
  }

  // Future<CompanyQuestion?> getCachedCompanyQuestion({required int id}) async {
  //   final value = await _getItem(_cacheCompanyQuestionKey, id);
  //   if (value == null) return null;
  //   final companyQuestion = CompanyQuestion.fromJson(value);
  //   return companyQuestion;
  // }

  Future<List<CompanyQuestion>> getCompanyQuestions() async {
    final db = await _db();

    return db.companyQuestions.where().findAll();
  }

  Future<FileSystemEntity?> deleteAll() async {
    final db = await _db();
    await db.writeTxn(() async {
      await db.clear();
    });
    _database = null;
    return null;
  }
}
