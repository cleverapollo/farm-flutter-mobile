// ignore_for_file: depend_on_referenced_packages, inference_failure_on_function_invocation

import 'dart:io';

import 'package:isar/isar.dart';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/model.dart';

class CmoDatabaseMasterService {
  factory CmoDatabaseMasterService() {
    return _inst;
  }

  CmoDatabaseMasterService._internal();
  static final CmoDatabaseMasterService _inst =
      CmoDatabaseMasterService._internal();

  String get _databaseName => 'cmo_company';

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

  Future<int> cachePlantation(Plantation item) async {
    final db = await _db();
    return db.plantations.put(item);
  }

  Future<Plantation?> getPlantationById(int? id) async {
    if (id == null) return null;
    final db = await _db();
    return db.plantations.filter().plantationIdEqualTo(id).findFirst();
  }

  Future<List<Plantation>> getPlantations() async {
    final db = await _db();
    return db.plantations.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<Plantation>> getPlantationsByCompanyId(int companyId) async {
    final db = await _db();
    return db.plantations
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(companyId)
        .sortByPlantationName()
        .findAll();
  }

  Future<int> cacheUnit(Unit item) async {
    final db = await _db();
    return db.units.put(item);
  }

  Future<List<Unit>> getUnits() async {
    final db = await _db();
    return db.units.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheContractor(Contractor item) async {
    final db = await _db();
    return db.contractors.put(item);
  }

  Future<Contractor?> getContractorById(int? id) async {
    if (id == null) return null;
    final db = await _db();
    return db.contractors.filter().companyIdEqualTo(id).findFirst();
  }

  Future<List<Contractor>> getContractors() async {
    final db = await _db();
    return db.contractors.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<Contractor>> getContractorsByCompanyId(int companyId) async {
    final db = await _db();
    return db.contractors
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(companyId)
        .sortByContractorName()
        .findAll();
  }

  Future<int> cacheProvince(Province item) async {
    final db = await _db();
    return db.provinces.put(item);
  }

  Future<List<Province>> getProvinces() async {
    final db = await _db();
    return db.provinces.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheMunicipality(Municipality item) async {
    final db = await _db();
    return db.municipalitys.put(item);
  }

  Future<List<Municipality>> getMunicipalitys() async {
    final db = await _db();

    return db.municipalitys.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheImpactCaused(ImpactCaused item) async {
    final db = await _db();
    return db.impactCauseds.put(item);
  }

  Future<List<ImpactCaused>> getImpactCauseds() async {
    final db = await _db();

    return db.impactCauseds.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheImpactOn(ImpactOn item) async {
    final db = await _db();
    return db.impactOns.put(item);
  }

  Future<List<ImpactOn>> getImpactOns() async {
    final db = await _db();

    return db.impactOns.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheJobCategory(JobCategory item) async {
    final db = await _db();
    return db.jobCategorys.put(item);
  }

  Future<JobCategory?> getJobCategoryById(int? id) async {
    if (id == null) return null;
    final db = await _db();
    return db.jobCategorys.filter().jobCategoryIdEqualTo(id).findFirst();
  }

  Future<List<JobCategory>> getJobCategories() async {
    final db = await _db();

    return db.jobCategorys.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<JobCategory>> getJobCategoriesByCompanyId(int id) async {
    final db = await _db();
    final ids = await getJobCategoryIdsByCompanyId(id);

    final x = db.jobCategorys
        .filter()
        .isActiveEqualTo(true)
        .anyOf(
          ids,
          (q, int jobCategoryId) => q.jobCategoryIdEqualTo(jobCategoryId),
        )
        .sortByJobCategoryName()
        .findAll();
    return x;
  }

  Future<int> cacheJobDescription(JobDescription item) async {
    final db = await _db();
    return db.jobDescriptions.put(item);
  }

  Future<JobDescription?> getJobDescriptionById(int? id) async {
    if (id == null) return null;
    final db = await _db();
    return db.jobDescriptions.filter().jobDescriptionIdEqualTo(id).findFirst();
  }

  Future<List<JobDescription>> getJobDescriptions() async {
    final db = await _db();

    return db.jobDescriptions
        .filter()
        .isActiveEqualTo(true)
        .sortByJobDescriptionName()
        .findAll();
  }

  Future<int> cacheJobElement(JobElement item) async {
    final db = await _db();
    return db.jobElements.put(item);
  }

  Future<List<JobElement>> getJobElements() async {
    final db = await _db();

    return db.jobElements.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheMmm(Mmm item) async {
    final db = await _db();
    return db.mmms.put(item);
  }

  Future<List<Mmm>> getMmms() async {
    final db = await _db();

    return db.mmms.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cachePdca(Pdca item) async {
    final db = await _db();
    return db.pdcas.put(item);
  }

  Future<List<Pdca>> getPdcas() async {
    final db = await _db();

    return db.pdcas.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheSeverity(Severity item) async {
    final db = await _db();
    return db.severitys.put(item);
  }

  Future<List<Severity>> getSeveritys() async {
    final db = await _db();

    return db.severitys.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheSpeqs(Speqs item) async {
    final db = await _db();
    return db.speqs.put(item);
  }

  Future<List<Speqs>> getSpeqss() async {
    final db = await _db();
    return db.speqs.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheCompliance(Compliance item) async {
    final db = await _db();
    return db.compliances.put(item);
  }

  Future<List<Compliance>> getCompliances() async {
    final db = await _db();

    return db.compliances.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheTeam(Team item) async {
    final db = await _db();
    return db.teams.put(item);
  }

  Future<Team?> getTeamById(int? id) async {
    if (id == null) return null;
    final db = await _db();
    return db.teams.filter().teamIdEqualTo(id).findFirst();
  }

  Future<List<Team>> getTeams() async {
    final db = await _db();

    return db.teams.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<Team>> getTeamsByCompanyId(int companyId) async {
    final db = await _db();
    return db.teams
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(companyId)
        .sortByTeamName()
        .findAll();
  }

  Future<List<Team>> getTeamsByCompanyIdAndContractorId(
    int companyId,
    int? contractorId,
  ) async {
    if (contractorId == null) return <Team>[];
    final db = await _db();
    return db.teams
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(companyId)
        .contractorIdEqualTo(contractorId)
        .sortByTeamName()
        .findAll();
  }

  Future<int> cacheRejectReason(RejectReason item) async {
    final db = await _db();
    return db.rejectReasons.put(item);
  }

  Future<List<RejectReason>> getRejectReasons() async {
    final db = await _db();

    return db.rejectReasons.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheTrainingProvider(
    TrainingProvider item,
  ) async {
    final db = await _db();
    return db.trainingProviders.put(item);
  }

  Future<List<TrainingProvider>> getTrainingProviders() async {
    final db = await _db();

    return db.trainingProviders.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheCourse(Course item) async {
    final db = await _db();
    return db.courses.put(item);
  }

  Future<List<Course>> getCourses() async {
    final db = await _db();

    return db.courses.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheSchedule(Schedule item) async {
    final db = await _db();
    return db.schedules.put(item);
  }

  Future<List<Schedule>> getSchedules() async {
    final db = await _db();

    return db.schedules.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheScheduleActivity(
    ScheduleActivity item,
  ) async {
    final db = await _db();
    return db.scheduleActivitys.put(item);
  }

  Future<List<ScheduleActivity>> getScheduleActivitys() async {
    final db = await _db();

    return db.scheduleActivitys.filter().isActiveEqualTo(true).findAll();
  }

  Future<int> cacheWorker(Worker item) async {
    final db = await _db();
    return db.workers.put(item);
  }

  Future<Worker?> getWorkerById(String? id) async {
    if (id == null) return null;
    final db = await _db();
    return db.workers.filter().workerIdEqualTo(id).findFirst();
  }

  Future<List<Worker>> getWorkers() async {
    final db = await _db();
    return db.workers.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<Worker>> getWorkersByCompanyId(int companyId) async {
    final db = await _db();
    return db.workers
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(companyId)
        .sortBySurname()
        .findAll();
  }

  Future<List<Worker>> getWorkersByCompanyIdAndContractorId(
    int companyId,
    int? contractorId,
  ) async {
    if (contractorId == null) return <Worker>[];
    final db = await _db();
    return db.workers
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(companyId)
        .contractorIdEqualTo(contractorId)
        .sortBySurname()
        .findAll();
  }

  Future<List<Worker>> getWorkersLocal() async {
    final db = await _db();
    return db.workers
        .filter()
        .isActiveEqualTo(true)
        .isLocalEqualTo(true)
        .findAll();
  }

  Future<int> cacheCompanyQuestion(
    CompanyQuestion item,
  ) async {
    final db = await _db();
    return db.companyQuestions.put(item);
  }

  Future<List<CompanyQuestion>> getCompanyQuestions() async {
    final db = await _db();

    return db.companyQuestions.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<int>> getJobCategoryIdsByCompanyId(int id) async {
    final db = await _db();
    final ids = await db.companyQuestions
        .filter()
        .isActiveEqualTo(true)
        .companyIdEqualTo(id)
        .jobCategoryIdProperty()
        .findAll();

    return listRemoveNull(ids);
  }

  Future<FileSystemEntity?> deleteAll() async {
    final db = await _db();
    await db.writeTxn(() async {
      await db.clear();
    });
    return null;
  }
}
