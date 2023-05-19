// ignore_for_file: depend_on_referenced_packages, inference_failure_on_function_invocation

import 'dart:io';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/data/audit_question_comment.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:isar/isar.dart';

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
        QuestionAnswerSchema,
        QuestionCommentSchema,
        AssessmentSchema,
        QuestionPhotoSchema,
        AuditSchema,
        AuditQuestionPhotoSchema,
        AuditQuestionCommentSchema,
        AuditQuestionSchema,
        AuditQuestionAnswerSchema,
        StakeHolderSchema,
        AnnualProductionSchema,
        AnnualProductionBudgetSchema,
        FarmerStakeHolderSchema,
        FarmerStakeHolderComplaintSchema,
        BiologicalControlAgentSchema,
        EmployeeGrievanceSchema,
        FireManagementSchema,
        RteSpeciesPhotoModelSchema,
        RteSpeciesSchema,
        StakeHolderTypeSchema,
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

  Future<List<JobElement>> getJobElementsByJobCategoryId(
    int? jobCategoryId,
  ) async {
    final db = await _db();

    try {
      final questions = await db.companyQuestions
          .filter()
          .jobCategoryIdEqualTo(jobCategoryId)
          .jobCategoryIdIsNotNull()
          .isActiveEqualTo(true)
          .findAll();

      final jobElements = <JobElement>[];

      for (final question in questions) {
        if (question.speqsId != null) {
          final result = await db.jobElements
              .filter()
              .jobElementIdEqualTo(question.jobElementId!)
              .isActiveEqualTo(true)
              .findAll();
          for (final jobElement in result) {
            if (!jobElements.contains(jobElement)) {
              jobElements.add(jobElement);
            }
          }
        }
      }

      return jobElements;
    } catch (error) {
      handleError(error);
    }

    return <JobElement>[];
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

  Future<List<Pdca>> getPdcasByJobCategoryId(int? jobCategoryId) async {
    final db = await _db();

    try {
      final questions = await db.companyQuestions
          .filter()
          .jobCategoryIdEqualTo(jobCategoryId)
          .jobCategoryIdIsNotNull()
          .isActiveEqualTo(true)
          .findAll();

      final pdcas = <Pdca>[];

      for (final question in questions) {
        if (question.speqsId != null) {
          final result = await db.pdcas
              .filter()
              .pdcaIdEqualTo(question.pdcaId!)
              .isActiveEqualTo(true)
              .findAll();
          for (final pdca in result) {
            if (!pdcas.contains(pdca)) {
              pdcas.add(pdca);
            }
          }
        }
      }

      return pdcas;
    } catch (error) {
      handleError(error);
    }

    return <Pdca>[];
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

  Future<List<Speqs>> getSpeqssByJobCategoryId(int? jobCategoryId) async {
    final db = await _db();

    try {
      final questions = await db.companyQuestions
          .filter()
          .jobCategoryIdEqualTo(jobCategoryId)
          .jobCategoryIdIsNotNull()
          .isActiveEqualTo(true)
          .findAll();

      final speqs = <Speqs>[];

      for (final question in questions) {
        if (question.speqsId != null) {
          final result = await db.speqs
              .filter()
              .speqsIdEqualTo(question.speqsId!)
              .isActiveEqualTo(true)
              .findAll();
          for (final speq in result) {
            if (!speqs.contains(speq)) {
              speqs.add(speq);
            }
          }
        }
      }

      return speqs;
    } catch (error) {
      handleError(error);
    }

    return <Speqs>[];
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

  Future<int> cacheStakeHolder(StakeHolder item) async {
    final db = await _db();
    return db.stakeHolders.put(item);
  }

  Future<int> cacheAnnualProduction(AnnualProduction item) async {
    final db = await _db();
    return db.annualProductions.put(item);
  }

  Future<int> cacheFarmerStakeHolder(FarmerStakeHolder item) async {
    final db = await _db();
    return db.farmerStakeHolders.put(item);
  }

  Future<int> cacheFarmerStakeHolderComplaint(FarmerStakeHolderComplaint item) async {
    final db = await _db();
    return db.farmerStakeHolderComplaints.put(item);
  }

  Future<int> cacheBiologicalControlAgents(BiologicalControlAgent item) async {
    final db = await _db();
    return db.biologicalControlAgents.put(item);
  }

  Future<int> cacheAnnualProductionBudget(AnnualProductionBudget item) async {
    final db = await _db();
    return db.annualProductionBudgets.put(item);
  }

  Future<int> cacheEmployeeGrievance(EmployeeGrievance item) async {
    final db = await _db();
    return db.employeeGrievances.put(item);
  }

  Future<int> cacheFireManagement(FireManagement item) async {
    final db = await _db();
    return db.fireManagements.put(item);
  }

  Future<int> cacheRteSpecies(RteSpecies item) async {
    final db = await _db();
    return db.rteSpecies.put(item);
  }

  Future<int> cacheRteSpeciesPhotoModel(RteSpeciesPhotoModel item) async {
    final db = await _db();
    return db.rteSpeciesPhotoModels.put(item);
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

  Future<List<StakeHolder>> getStakeHolders() async {
    final db = await _db();
    return db.stakeHolders.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<StakeHolderType>> getStakeHolderTypes() async {
    final db = await _db();
    return db.stakeHolderTypes.filter().isActiveEqualTo(true).findAll();
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

  Future<int> cacheQuestionAnswer(QuestionAnswer item) async {
    final db = await _db();
    return db.writeTxn(() => db.questionAnswers.put(item));
  }

  Future<QuestionAnswer?> getCachedQuestionAnswer({required int id}) async {
    final db = await _db();
    return db.questionAnswers.get(id);
  }

  Future<List<QuestionAnswer>> getAllCachedQuestionAnswers() async {
    final db = await _db();
    return db.questionAnswers.where().findAll();
  }

  Future<List<CompanyQuestion>>
      getQuestionsByCompanyIdAndJobCategoryIdAndAssessmentId(
    int? companyId,
    int? jobCategoryId,
    int? assessmentId,
  ) async {
    if (companyId == null) return <CompanyQuestion>[];

    final db = await _db();
    try {
      final result = await db.companyQuestions
          .filter()
          .companyIdEqualTo(companyId)
          .jobCategoryIdEqualTo(jobCategoryId)
          .isActiveEqualTo(true)
          .findAll();
      final questions = <CompanyQuestion>[];

      for (var question in result) {
        if (jobCategoryId != null) {
          final jobCategoryName = await db.jobCategorys
              .filter()
              .jobCategoryIdEqualTo(jobCategoryId)
              .jobCategoryNameProperty()
              .findFirst();
          question = question.copyWith(jobCategoryName: jobCategoryName);
        }

        if (question.jobElementId != null) {
          final jobElementName = await db.jobElements
              .filter()
              .jobElementIdEqualTo(question.jobElementId!)
              .jobElementNameProperty()
              .findFirst();
          question = question.copyWith(jobElementName: jobElementName);
        }

        if (question.speqsId != null) {
          final speqsName = await db.speqs
              .filter()
              .speqsIdEqualTo(question.speqsId!)
              .speqsNameProperty()
              .findFirst();
          question = question.copyWith(speqsName: speqsName);
        }

        if (question.pdcaId != null) {
          final pdcaName = await db.pdcas
              .filter()
              .pdcaIdEqualTo(question.pdcaId!)
              .pdcaNameProperty()
              .findFirst();
          question = question.copyWith(pdcaName: pdcaName);
        }

        if (assessmentId != null && question.id != null) {
          final qA = await db.questionAnswers
              .filter()
              .questionIdEqualTo(question.id)
              .assessmentIdEqualTo(assessmentId)
              .findFirst();
          question = question.copyWith(complianceId: qA?.complianceId);
          question =
              question.copyWith(isQuestionComplete: qA?.isQuestionComplete);
          if (qA?.complianceId != null) {
            final complianceName = await db.compliances
                .filter()
                .complianceIdEqualTo(qA!.complianceId!)
                .complianceNameProperty()
                .findFirst();
            question = question.copyWith(complianceName: complianceName);
          }
        }

        questions.add(question);
      }

      return questions;
    } catch (error, s) {
      handleError('$error $s');
    }

    return <CompanyQuestion>[];
  }

  Future<List<CompanyQuestion>> getQuestionByCompanyId(int companyId) async {
    final db = await _db();

    final questions =
        db.companyQuestions.filter().companyIdEqualTo(companyId).findAll();

    return questions;
  }

  Future<List<Compliance>> getCompliancesByCompanyIdJobCategoryId(
    int? companyId,
    int? jobCategoryId,
  ) async {
    try {
      final db = await _db();
      final compliances = db.compliances
          .filter()
          .companyIdIsNotNull()
          .companyIdEqualTo(companyId)
          .jobCategoryIdIsNotNull()
          .jobCategoryIdEqualTo(jobCategoryId)
          .isActiveEqualTo(true)
          .findAll();

      return compliances;
    } catch (error) {
      handleError(error);
    }

    return <Compliance>[];
  }

  Future<List<Compliance>> getCompliancesByCompanyId(
    int? companyId,
  ) async {
    try {
      final db = await _db();
      final compliances = db.compliances
          .filter()
          .companyIdIsNotNull()
          .companyIdEqualTo(companyId)
          .isActiveEqualTo(true)
          .findAll();

      return compliances;
    } catch (error) {
      handleError(error);
    }

    return <Compliance>[];
  }

  Future<List<QuestionAnswer>>
      getQuestionAnswersByCompanyIdAndJobCategoryIdAndAssessmentId(
    int? companyId,
    int? jobCatgoryId,
    int? assessmentId,
  ) async {
    if (companyId == null) return <QuestionAnswer>[];
    final db = await _db();
    try {
      final questionAnswers = <QuestionAnswer>[];
      final companyQuestions = await db.companyQuestions
          .filter()
          .companyIdEqualTo(companyId)
          .jobCategoryIdEqualTo(jobCatgoryId)
          .isActiveEqualTo(true)
          .findAll();

      for (final question in companyQuestions) {
        final qAs = await db.questionAnswers
            .filter()
            .assessmentIdEqualTo(assessmentId)
            .questionIdEqualTo(question.questionId)
            .findAll();
        QuestionAnswer? qA = qAs.isNotEmpty ? qAs.last : null;

        final questionAnswer = QuestionAnswer(
          assessmentId: assessmentId,
          questionId: question.questionId,
          // I think this must be 0 need to test if I change it
          // complianceId: question.complianceId ?? -1,
          complianceId: qA?.complianceId ?? 0,
          isQuestionComplete: qA?.isQuestionComplete,
          questionAnswerId: qA?.questionAnswerId,
          rejectReasonId: qA?.rejectReasonId,
          rejectComment: qA?.rejectComment,
        );

        questionAnswers.add(questionAnswer);
      }

      return questionAnswers;
    } catch (error) {
      handleError(error);
    }

    return <QuestionAnswer>[];
  }

  Future<void> removeQuestionAnswer(QuestionAnswer answer) async {
    final db = await _db();
    try {
      return db.writeTxn(() => db.questionAnswers.delete(answer.id));
    } catch (error) {
      handleError(error);
    }
  }

  Future<int> cacheQuestionComment(
    QuestionComment item,
  ) async {
    final db = await _db();
    return db.writeTxn(() => db.questionComments.put(item));
  }

  Future<List<QuestionComment>> getQuestionComments(
    int assessmentId,
    int questionId,
  ) async {
    final db = await _db();
    try {
      final questionComments = await db.questionComments
          .filter()
          .assessmentIdEqualTo(assessmentId)
          .questionIdEqualTo(questionId)
          .findAll();

      return questionComments;
    } catch (error) {
      handleError(error);
    }
    return <QuestionComment>[];
  }

  Future<int> cacheAuditQuestionPhoto(
      AuditQuestionPhoto item,
      ) async {
    final db = await _db();
    return db.writeTxn(() => db.auditQuestionPhotos.put(item));
  }

  Future<int> cacheAuditQuestion(
      AuditQuestion item,
      ) async {
    final db = await _db();
    return db.writeTxn(() => db.auditQuestions.put(item));
  }

  Future<int> cacheQuestionPhoto(
    QuestionPhoto item,
  ) async {
    final db = await _db();
    return db.writeTxn(() => db.questionPhotos.put(item));
  }

  Future<QuestionPhoto?> getQuestionPhotoByPhotoPath(String? photoPath) async {
    if (photoPath == null) return null;
    final db = await _db();
    return db.questionPhotos.filter().photoPathEqualTo(photoPath).findFirst();
  }

  Future<AuditQuestionPhoto?> getAuditQuestionPhotoByPhotoPath(String? photoPath) async {
    if (photoPath == null) return null;
    final db = await _db();
    return db.auditQuestionPhotos.filter().photoPathEqualTo(photoPath).findFirst();
  }

  Future<int> cacheAuditQuestionComment(
      AuditQuestionComment item,
      ) async {
    final db = await _db();
    return db.writeTxn(() => db.auditQuestionComments.put(item));
  }

  Future<AuditQuestionComment?> getAuditQuestionCommentByComment(String? comment) async {
    if (comment == null) return null;
    final db = await _db();
    return db.auditQuestionComments.filter().commentEqualTo(comment).findFirst();
  }

  Future<int> cacheAuditQuestionAnswer(AuditQuestionAnswer item) async {
    final db = await _db();
    return db.writeTxn(() => db.auditQuestionAnswers.put(item));
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

  Future<List<AuditQuestion>> getListAuditQuestion({
    int? auditTemplateId,
    int? auditId,
  }) async {
    if (auditId == null || auditTemplateId == null) return <AuditQuestion>[];
    final db = await _db();
    try {
      final auditQuestions = await db.auditQuestions
          .filter()
          .auditIdEqualTo(auditId)
          .auditTemplateIdEqualTo(auditTemplateId)
          .isActiveEqualTo(true)
          .findAll();

      return auditQuestions;
    } catch (error) {
      handleError(error);
    }

    return <AuditQuestion>[];
  }

  Future<List<AuditQuestionPhoto>> getAuditQuestionPhotos({
    int? auditId,
    int? questionId,
  }) async {
    try {
      final db = await _db();
      if (auditId == null) return <AuditQuestionPhoto>[];

      var query = db.auditQuestionPhotos
          .filter()
          .auditIdIsNotNull()
          .auditIdEqualTo(auditId)
          .photoPathIsNotNull()
          .photoPathIsNotEmpty();
      if (questionId != null) {
        query = query.questionIdEqualTo(questionId).questionIdIsNotNull();
      }

      return query.findAll();
    } catch (error) {
      handleError(error);
    }

    return <AuditQuestionPhoto>[];
  }

  Future<List<AuditQuestionComment>> getAuditQuestionComments({
    int? auditId,
    int? questionId,
  }) async {
    try {
      final db = await _db();
      if (auditId == null) return <AuditQuestionComment>[];
      var query = db.auditQuestionComments
          .filter()
          .auditIdIsNotNull()
          .auditIdEqualTo(auditId)
          .commentIsNotNull()
          .commentIsNotEmpty();
      if (questionId != null) {
        query = query.questionIdEqualTo(questionId).questionIdIsNotNull();
      }

      return query.findAll();
    } catch (error) {
      handleError(error);
    }

    return <AuditQuestionComment>[];
  }

  Future<void> removeAuditQuestionAnswer(AuditQuestionAnswer answer) async {
    final db = await _db();
    try {
      return db.writeTxn(() => db.auditQuestionAnswers.delete(answer.id));
    } catch (error) {
      handleError(error);
    }
  }

  Future<List<AuditQuestionAnswer>> getAuditQuestionAnswersWithAuditId(
      int? auditId,
      ) async {
    if (auditId == null) return <AuditQuestionAnswer>[];
    final db = await _db();
    try {
      final questionAnswers = await db.auditQuestionAnswers
          .filter()
          .auditIdEqualTo(auditId)
          .isActiveEqualTo(true)
          .findAll();

      return questionAnswers;
    } catch (error) {
      handleError(error);
    }

    return <AuditQuestionAnswer>[];
  }

  Future<void> removeQuestionPhoto(QuestionPhoto photo) async {
    final db = await _db();
    try {
      final path = photo.photoPath;
      final photoFind = await getQuestionPhotoByPhotoPath(path);
      if (photoFind == null) return;
      return db.writeTxn(() => db.questionPhotos.delete(photoFind.id));
    } catch (error) {
      handleError(error);
    }
  }

  Future<List<QuestionPhoto>> getQuestionPhotos() async {
    final db = await _db();

    return db.questionPhotos
        .filter()
        .photoPathIsNotNull()
        .photoPathIsNotEmpty()
        .findAll();
  }

  Future<List<QuestionPhoto>> getQuestionPhotosByAssessmentId(
      int? assessmentId) async {
    final db = await _db();

    return db.questionPhotos
        .filter()
        .assessmentIdIsNotNull()
        .assessmentIdEqualTo(assessmentId)
        .photoPathIsNotNull()
        .photoPathIsNotEmpty()
        .findAll();
  }

  Future<List<QuestionComment>> getQuestionCommentsByAssessmentId(
    int? assessmentId,
  ) async {
    final db = await _db();

    return db.questionComments
        .filter()
        .assessmentIdIsNotNull()
        .assessmentIdEqualTo(assessmentId)
        .findAll();
  }

  Future<QuestionComment?> getQuestionCommentByComment(String? comment) async {
    if (comment == null) return null;
    final db = await _db();
    return db.questionComments.filter().commentEqualTo(comment).findFirst();
  }

  Future<void> removeQuestionComment(QuestionComment comment) async {
    final db = await _db();
    try {
      final commentData = comment.comment;
      final find = await getQuestionCommentByComment(commentData);
      if (find == null) return;
      return db.writeTxn(() => db.questionPhotos.delete(find.id));
    } catch (error) {
      handleError(error);
    }
  }

  Future<FileSystemEntity?> deleteAll() async {
    final db = await _db();
    await db.writeTxn(() async {
      await db.clear();
    });
    return null;
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
