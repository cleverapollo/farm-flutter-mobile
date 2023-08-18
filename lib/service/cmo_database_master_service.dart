// ignore_for_file: depend_on_referenced_packages, inference_failure_on_function_invocation

import 'dart:io';
import 'dart:math';

import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/compartment/area_type.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/model/config/config.dart';
import 'package:cmo/model/disciplinaries/disciplonaries.dart';
import 'package:cmo/model/hirac.dart';
import 'package:cmo/model/hirac_template.dart';
import 'package:cmo/model/hirac_type.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/model/stakeholder/farm_stake_holder.dart';
import 'package:cmo/model/user/user_role.dart';
import 'package:cmo/model/user_role_portal.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/utils/utils.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

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
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        CompanySchema,
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
        StakeHolderSchema,
        AnnualFarmProductionSchema,
        FarmerWorkerSchema,
        FarmerStakeHolderComplaintSchema,
        BiologicalControlAgentSchema,
        EmployeeGrievanceSchema,
        FireManagementSchema,
        RteSpeciesPhotoModelSchema,
        RteSpeciesSchema,
        FarmQuestionSchema,
        CriteriaSchema,
        FarmMemberObjectiveSchema,
        FarmObjectiveOptionSchema,
        FarmPropertyOwnershipTypeSchema,
        IndicatorSchema,
        PrincipleSchema,
        RegionalManagerUnitSchema,
        RiskProfileQuestionSchema,
        RMScheduleSchema,
        GroupSchemeStakeholderSchema,
        StakeHolderTypeSchema,
        AuditTemplateSchema,
        FarmSchema,
        UserRolePortalSchema,
        UserRoleSchema,
        UserDeviceSchema,
        GroupSchemeSchema,
        ResourceManagerUnitSchema,
        CompartmentSchema,
        AsiSchema,
        AccidentAndIncidentSchema,
        AsiPhotoSchema,
        ChemicalSchema,
        ComplaintsAndDisputesRegisterSchema,
        GrievanceRegisterSchema,
        FireRegisterSchema,
        PetsAndDiseaseRegisterSchema,
        TrainingRegisterSchema,
        AnnualBudgetSchema,
        AnnualBudgetTransactionSchema,
        AnnualBudgetTransactionCategorySchema,
        AsiTypeSchema,
        ChemicalApplicationMethodSchema,
        ChemicalTypeSchema,
        CountrySchema,
        FireCauseSchema,
        GrievanceIssueSchema,
        MonitoringRequirementSchema,
        NatureOfInjurySchema,
        PestsAndDiseaseTypeTreatmentMethodSchema,
        PropertyDamagedSchema,
        SpeciesRangeSchema,
        TrainingTypeSchema,
        TreatmentMethodSchema,
        CustomaryUseRightSchema,
        SocialUpliftmentSchema,
        SpecialSiteSchema,
        AccidentAndIncidentPropertyDamagedSchema,
        BiologicalControlAgentTypeSchema,
        SanctionRegisterSchema,
        IssueTypeSchema,
        AnimalTypeSchema,
        PestsAndDiseaseTypeSchema,
        PestsAndDiseasesRegisterTreatmentMethodSchema,
        CampSchema,
        GenderSchema,
        FarmerStakeHolderSchema,
        DisciplinariesSchema,
        ConfigDataSchema,
        FarmMemberObjectiveAnswerSchema,
        FarmMemberRiskProfileAnswerSchema,
        FarmStakeholderSocialUpliftmentSchema,
        FarmStakeholderCustomaryUseRightSchema,
        FarmStakeholderSpecialSiteSchema,
        HiracSchema,
        HiracTemplateSchema,
        HiracTypeSchema,
        WorkerJobDescriptionSchema,
        FarmStakeHolderSchema,
        AreaTypeSchema,
        ProductGroupTemplateSchema,
        SpeciesGroupTemplateSchema
      ],
      name: _databaseName,
      directory: dir.path,
    );
    _database = isar;
    return isar;
  }

  Future<Isar> _db() async {
    final db = _database ?? await initializeDatabase();
    return db;
  }

  Future<Isar> get db => _db();

  Future<List<FarmerWorker>> getUnsyncedWorkersWithJobDescriptionsByFarmId(
      String farmId) async {
    final db = await _db();

    final farmWorkers = await db.farmerWorkers
        .filter()
        .farmIdEqualTo(farmId)
        .isLocalEqualTo(1)
        .findAll();

    return farmWorkers;
  }

  Future<List<WorkerJobDescription>> getWorkerJobDescriptionByWorkerId(
      String workerId) async {
    final db = await _db();

    return db.workerJobDescriptions
        .filter()
        .workerIdEqualTo(workerId)
        .findAll();
  }

  Future<int?> cacheWorkerJobDescription(WorkerJobDescription item) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.workerJobDescriptions.put(item);
    });
  }

  Future<int?> cacheWorkerJobDescriptionFromFarm(
      WorkerJobDescription item) async {
    final db = await _db();

    return db.workerJobDescriptions.put(item);
  }

  Future<int> getCountWorkerJobDescription() async {
    final db = await _db();

    final count = await db.workerJobDescriptions
        .filter()
        .workerJobDescriptionIdIsNotNull()
        .findAll();

    return count.length;
  }

  Future<void> deletedWorkerJobDescriptionByJobDescriptionId(String? id) async {
    final db = await _db();

    await db.writeTxn(() async {
      await db.workerJobDescriptions.filter().workerIdEqualTo(id).deleteAll();
    });
  }

  Future<List<JobDescription>> getJobDescriptionsByJobDescriptionId(
      int jobDescriptionId) async {
    final db = await _db();

    return db.jobDescriptions
        .filter()
        .jobDescriptionIdEqualTo(jobDescriptionId)
        .findAll();
  }

  Future<int?> cacheConfigData(ConfigData data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.configDatas.put(data);
    });
  }

  Future<List<FarmMemberObjective>> getAllFarmMemberObjectiveByGroupSchemeId(
    int? groupSchemeId,
  ) async {
    if (groupSchemeId == null) return <FarmMemberObjective>[];

    final db = await _db();

    return db.farmMemberObjectives
        .filter()
        .groupSchemeIdEqualTo(groupSchemeId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<FarmObjectiveOption>> getFarmObjectiveOptionByGroupSchemeId(
    int? groupSchemeId,
  ) async {
    if (groupSchemeId == null) return <FarmObjectiveOption>[];

    final db = await _db();

    return db.farmObjectiveOptions
        .filter()
        .groupSchemeIdEqualTo(groupSchemeId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<int?> cacheFarmMemberObjectiveAnswer(
    FarmMemberObjectiveAnswer item, {
    bool isDirect = false,
  }) async {
    final db = await _db();
    if (isDirect) {
      return db.farmMemberObjectiveAnswers.put(item);
    } else {
      return db.writeTxn(() async {
        return db.farmMemberObjectiveAnswers.put(item);
      });
    }
  }

  Future<int?> cacheFarmMemberRiskProfileAnswer(
    FarmMemberRiskProfileAnswer item, {
    bool isDirect = false,
  }) async {
    final db = await _db();
    if (isDirect) {
      return db.farmMemberRiskProfileAnswers.put(item);
    } else {
      return db.writeTxn(() async {
        return db.farmMemberRiskProfileAnswers.put(item);
      });
    }
  }

  Future<List<FarmMemberRiskProfileAnswer>>
      getFarmMemberRiskProfileAnswerByFarmId(String? farmId) async {
    if (farmId == null) return <FarmMemberRiskProfileAnswer>[];

    final db = await _db();
    return db.farmMemberRiskProfileAnswers
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<FarmMemberRiskProfileAnswer>>
      getFarmMemberRiskProfileAnswerByFarmIdAndIsMasterDataSynced(
    String farmId,
  ) async {
    final db = await _db();
    return db.farmMemberRiskProfileAnswers
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .isMasterDataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<FarmMemberObjectiveAnswer>> getFarmMemberObjectiveAnswerByFarmId(
    String? farmId,
  ) async {
    if (farmId == null) return <FarmMemberObjectiveAnswer>[];

    final db = await _db();
    return db.farmMemberObjectiveAnswers
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<FarmMemberObjectiveAnswer>>
      getFarmMemberObjectiveAnswerByFarmIdAndIsMasterDataSynced(
    String farmId,
  ) async {
    final db = await _db();
    return db.farmMemberObjectiveAnswers
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .isMasterDataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<Camp>> getCampByFarmId(int farmId) async {
    final db = await _db();
    return db.camps
        .filter()
        .farmIdEqualTo(farmId.toString())
        .isActiveEqualTo(true)
        .sortByCampOrder()
        .findAll();
  }

  Future<List<Camp>> getUnsyncedFarmCampByFarmId(String farmId) async {
    final db = await _db();
    return db.camps
        .filter()
        .farmIdEqualTo(farmId)
        .isLocalEqualTo(true)
        .sortByCampOrder()
        .findAll();
  }

  Future<List<CustomaryUseRight>> getUnsyncedCustomaryUseRights() async {
    final db = await _db();

    return db.customaryUseRights
        .filter()
        .isMasterDataSyncedEqualTo(0)
        .findAll();
  }

  Future<List<SocialUpliftment>> getUnsyncedSocialUpliftments() async {
    final db = await _db();

    return db.socialUpliftments.filter().isMasterDataSyncedEqualTo(0).findAll();
  }

  Future<List<SpecialSite>> getUnsyncedSpecialSite() async {
    final db = await _db();

    return db.specialSites.filter().isMasterDataSyncedEqualTo(0).findAll();
  }

  Future<List<FarmerStakeHolder>> getFarmStakeholder() async {
    final db = await _db();

    return db.farmerStakeHolders.filter().farmIdIsNotNull().findAll();
  }

  Future<int?> cacheFarmerStakeholder(FarmerStakeHolder item) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.farmerStakeHolders.put(item);
    });
  }

  Future<List<FarmStakeholderSocialUpliftment>>
      getUnsycnedFarmStakeholderSocialUpliftments() async {
    final db = await _db();

    return db.farmStakeholderSocialUpliftments
        .filter()
        .isMasterDataSyncedEqualTo(0)
        .findAll();
  }

  Future<int?> cacheFarmStakeholderSocialUpliftments(
      FarmStakeholderSocialUpliftment item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.farmStakeholderSocialUpliftments.put(item);
    });
  }

  Future<List<FarmStakeholderSpecialSite>>
      getUnsycnedFarmStakeholderSpecialSites() async {
    final db = await _db();

    return db.farmStakeholderSpecialSites
        .filter()
        .isMasterDataSyncedEqualTo(0)
        .findAll();
  }

  Future<int?> cacheFarmStakeholderSpecialSites(
      FarmStakeholderSpecialSite item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.farmStakeholderSpecialSites.put(item);
    });
  }

  Future<List<FarmStakeholderCustomaryUseRight>>
      getUnsycnedFarmStakeholderCustomaryUseRights() async {
    final db = await _db();
    return db.farmStakeholderCustomaryUseRights
        .filter()
        .isMasterDataSyncedEqualTo(0)
        .findAll();
  }

  Future<int?> cacheFarmStakeholderCustomaryUseRights(
      FarmStakeholderCustomaryUseRight item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.farmStakeholderCustomaryUseRights.put(item);
    });
  }

  Future<List<StakeHolder>> getUnsyncedStakeholder() async {
    final db = await _db();

    return db.stakeHolders.filter().isMasterDataSyncedEqualTo(0).findAll();
  }

  Future<List<AnnualBudget>> getUnsyncedAnnualBudgetByFarmId(
      String farmId) async {
    final db = await _db();

    return db.annualBudgets
        .filter()
        .farmIdEqualTo(farmId)
        .isLocalEqualTo(1)
        .findAll();
  }

  Future<List<AnnualBudgetTransaction>>
      getUnsyncedAnnualBudgetTransaction() async {
    final db = await _db();

    return db.annualBudgetTransactions.filter().isLocalEqualTo(1).findAll();
  }

  Future<List<SanctionRegister>> getUnsyncedSanctionRegistersByFarmId(
      String farmId) async {
    final db = await _db();

    return db.sanctionRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isSyncedEqualTo(false)
        .findAll();
  }

  Future<List<Chemical>> getUnsyncedChemicalRegisters(int farmId) async {
    final db = await _db();

    return db.chemicals
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<TrainingRegister>> getUnsyncedTrainingRegisters(
      String farmId) async {
    final db = await _db();

    return db.trainingRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<Asi>> getUnsyncedAsiRegisters(String farmId) async {
    final db = await _db();

    return db.asis
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<bool> removeAsiRegister(int id) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.asis.delete(id);
    });
  }

  Future<bool> removeAsiPhoto(int id) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.asiPhotos.delete(id);
    });
  }

  Future<List<AsiPhoto>> getAllAsiPhotoByAsiRegisterNo(
      String? asiRegisterNo) async {
    final db = await _db();

    return db.asiPhotos
        .filter()
        .isActiveEqualTo(true)
        .asiRegisterNoEqualTo(asiRegisterNo)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<FireRegister>> getUnsyncedFireRegisters(String farmId) async {
    final db = await _db();

    return db.fireRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<GrievanceRegister>> getUnsyncedGrievanceRegisters(
      String farmId) async {
    final db = await _db();

    return db.grievanceRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<PestsAndDiseasesRegisterTreatmentMethod>>
      getUnsyncedPestsAndDiseasesRegisterTreatmentMethodByPestsAndDiseasesRegisterNo(
          String pestsAndDiseasesRegisterNo) async {
    final db = await _db();

    return db.pestsAndDiseasesRegisterTreatmentMethods
        .filter()
        .pestsAndDiseasesRegisterNoEqualTo(pestsAndDiseasesRegisterNo)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<BiologicalControlAgent>>
      getUnsyncedBiologicalControlAgentRegisterByFarmId(String farmId) async {
    final db = await _db();

    return db.biologicalControlAgents
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterDataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<AccidentAndIncident>>
      getUnsyncedAccidentAndIncidentRegistersByFarmId(String farmId) async {
    final db = await _db();
    return db.accidentAndIncidents
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterDataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<AccidentAndIncidentPropertyDamaged>>
      getAllAccidentAndIncidentRegisterPropertyDamagedByAccidentAndIncidentRegisterNo(
          String accidentAndIncidentRegisterNo) async {
    final db = await _db();

    return db.accidentAndIncidentPropertyDamageds
        .filter()
        .accidentAndIncidentRegisterNoEqualTo(accidentAndIncidentRegisterNo)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<ConfigData?> getConfig(ConfigEnum config) async {
    final db = await _db();

    return db.configDatas.filter().configNameEqualTo(config.name).findFirst();
  }

  Future<int?> cacheAnnFarmPro(AnnualFarmProduction data) async {
    final db = await _db();

    return db.annualFarmProductions.put(data);
  }

  Future<int?> cacheGrievanceRegister(GrievanceRegister data) async {
    final db = await _db();

    return db.grievanceRegisters.put(data);
  }

  Future<int?> cacheGrievanceRegisterFromFarm(GrievanceRegister data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.grievanceRegisters.put(data);
    });
  }

  Future<int?> cacheCountry(Country data) async {
    final db = await _db();

    return await db.countrys.put(data);
  }

  Future<int?> cacheGender(Gender data) async {
    final db = await _db();

    return db.genders.put(data);
  }

  Future<int?> cacheScheduleActivities(ScheduleActivity data) async {
    final db = await _db();

    return db.scheduleActivitys.put(data);
  }

  Future<int?> cacheGroupScheme(GroupScheme data) async {
    final db = await _db();

    return db.groupSchemes.put(data);
  }

  Future<int?> cacheSocialUpliftment(SocialUpliftment data) async {
    final db = await _db();

    return db.socialUpliftments.put(data);
  }

  Future<int?> cacheSocialUpliftmentFromFarm(SocialUpliftment data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.socialUpliftments.put(data);
    });
  }

  Future<int?> cacheSpecialSite(SpecialSite data) async {
    final db = await _db();

    return db.specialSites.put(data);
  }

  Future<int?> cacheSpecialSiteFromFarm(SpecialSite data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.specialSites.put(data);
    });
  }

  Future<int?> cacheCustomaryUseRight(CustomaryUseRight data) async {
    final db = await _db();

    return db.customaryUseRights.put(data);
  }

  Future<int?> cacheCustomaryUseRightFromFarm(CustomaryUseRight data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.customaryUseRights.put(data);
    });
  }

  Future<List<FarmStakeholderCustomaryUseRight>>
      getFarmStakeholderCustomaryUseRights({required int stakeholderId}) async {
    final db = await _db();
    return db.farmStakeholderCustomaryUseRights
        .filter()
        .farmStakeholderIdEqualTo(stakeholderId.toString())
        .isActiveEqualTo(1)
        .findAll();
  }

  Future<List<FarmStakeholderSocialUpliftment>>
      getFarmStakeholderSocialUpliftments({required int stakeholderId}) async {
    final db = await _db();
    return db.farmStakeholderSocialUpliftments
        .filter()
        .farmStakeholderIdEqualTo(stakeholderId.toString())
        .isActiveEqualTo(1)
        .findAll();
  }

  Future<List<FarmStakeholderSpecialSite>> getFarmStakeholderSpecialSites(
      {required int stakeholderId}) async {
    final db = await _db();
    return db.farmStakeholderSpecialSites
        .filter()
        .farmStakeholderIdEqualTo(stakeholderId.toString())
        .isActiveEqualTo(1)
        .findAll();
  }

  Future<int?> cacheFarmStakeHolder(FarmerStakeHolder data) async {
    final db = await _db();

    return db.farmerStakeHolders.put(data);
  }

  Future<int?> cacheFarmStakeHolderFromFarm(FarmStakeHolder data) async {
    final db = await _db();

    return db.farmStakeHolders.put(data);
  }

  Future<List<FarmStakeHolder>> getFarmStakeHolderByFarmId(
      String farmId) async {
    final db = await _db();

    return db.farmStakeHolders.filter().farmIdEqualTo(farmId).findAll();
  }

  Future<int?> cacheGroupSchemeStakeholder(GroupSchemeStakeholder data) async {
    final db = await _db();

    return db.groupSchemeStakeholders.put(data);
  }

  Future<int?> cacheAccidentAndIncident(AccidentAndIncident data) async {
    final db = await _db();

    return db.accidentAndIncidents.put(data);
  }

  Future<int?> cacheAccidentAndIncidentFromFarm(
      AccidentAndIncident data) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.accidentAndIncidents.put(data);
    });
  }

  Future<List<AccidentAndIncident>> getAccidentAndIncidentRegistersByFarmId(
      String farmId) async {
    final db = await _db();
    return db.accidentAndIncidents
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<int> getCountAccidentAndIncidentRegistersByFarmId(
      String farmId) async {
    final db = await _db();
    return db.accidentAndIncidents
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .count();
  }

  Future<int?> cacheAccidentAndIncidentPropertyDamaged(
      AccidentAndIncidentPropertyDamaged data) async {
    final db = await _db();

    return db.accidentAndIncidentPropertyDamageds.put(data);
  }

  Future<int?> cacheAccidentAndIncidentPropertyDamagedFromFarm(
      AccidentAndIncidentPropertyDamaged data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.accidentAndIncidentPropertyDamageds.put(data);
    });
  }

  Future<int?> cacheAsi(
    Asi data, {
    bool isDirect = false,
  }) async {
    final db = await _db();
    if (isDirect) {
      return db.asis.put(data);
    } else {
      return db.writeTxn(() async {
        return db.asis.put(data);
      });
    }
  }

  Future<int?> cacheAsiPhoto(
    AsiPhoto data, {
    bool isDirect = false,
  }) async {
    final db = await _db();
    if (isDirect) {
      return db.asiPhotos.put(data);
    } else {
      return db.writeTxn(() async {
        return db.asiPhotos.put(data);
      });
    }
  }

  Future<int?> cacheChemical(Chemical data) async {
    final db = await _db();

    return db.chemicals.put(data);
  }

  Future<int?> cacheChemicalFromRM(Chemical data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.chemicals.put(data);
    });
  }

  Future<int?> cacheChemicalRegisterFromFarm(Chemical data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.chemicals.put(data);
    });
  }

  Future<int?> cacheDisciplinaries(Disciplinaries data) async {
    final db = await _db();

    return db.disciplinaries.put(data);
  }

  Future<int?> cacheStakeholderComplaints(
      FarmerStakeHolderComplaint data) async {
    final db = await _db();

    return db.farmerStakeHolderComplaints.put(data);
  }

  Future<int?> cacheEmployeeGrievances(EmployeeGrievance data) async {
    final db = await _db();

    return db.employeeGrievances.put(data);
  }

  Future<int?> cacheFireRegister(FireRegister data) async {
    final db = await _db();

    return db.fireRegisters.put(data);
  }

  Future<int?> cacheFireRegisterFromFarm(FireRegister data) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.fireRegisters.put(data);
    });
  }

  Future<List<FireRegister>> getFireRegistersByFarmId(
      {String? farmId, bool isOpen = true}) async {
    final db = await _db();
    if (isOpen) {
      return db.fireRegisters
          .filter()
          .farmIdEqualTo(farmId)
          .extinguishedIsNull()
          .findAll();
    } else {
      return db.fireRegisters
          .filter()
          .farmIdEqualTo(farmId)
          .extinguishedIsNotNull()
          .findAll();
    }
  }

  Future<int?> cachePetsAndDisease(PetsAndDiseaseRegister data) async {
    final db = await _db();

    return db.petsAndDiseaseRegisters.put(data);
  }

  Future<int?> cachePetsAndDiseaseFromFarm(PetsAndDiseaseRegister data) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.petsAndDiseaseRegisters.put(data);
    });
  }

  Future<int?> cachePetsAndDiseaseTreatmentMethod(
      PestsAndDiseaseTypeTreatmentMethod data) async {
    final db = await _db();

    return db.pestsAndDiseaseTypeTreatmentMethods.put(data);
  }

  Future<int?> cachePetsAndDiseaseRegisterTreatmentMethod(
      PestsAndDiseasesRegisterTreatmentMethod data) async {
    final db = await _db();

    return db.pestsAndDiseasesRegisterTreatmentMethods.put(data);
  }

  Future<int?> cachePetsAndDiseaseRegisterTreatmentMethodFromFarm(
      PestsAndDiseasesRegisterTreatmentMethod data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.pestsAndDiseasesRegisterTreatmentMethods.put(data);
    });
  }

  Future<int?> cacheRteSpeciesPhotos(RteSpeciesPhotoModel data) async {
    final db = await _db();

    return db.rteSpeciesPhotoModels.put(data);
  }

  Future<int?> cacheTraining(TrainingRegister data) async {
    final db = await _db();

    return db.trainingRegisters.put(data);
  }

  Future<int?> cacheTrainingRegisterFromFarm(TrainingRegister data) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.trainingRegisters.put(data);
    });
  }

  Future<int?> cacheAnimalType(AnimalType data) async {
    final db = await _db();

    return db.animalTypes.put(data);
  }

  Future<int?> cacheSanctionRegister(SanctionRegister data) async {
    final db = await _db();

    return db.sanctionRegisters.put(data);
  }

  Future<int?> cacheSanctionRegisterFromFarm(SanctionRegister data) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.sanctionRegisters.put(data);
    });
  }

  Future<int?> cacheAnnualBudgets(AnnualBudget data) async {
    final db = await _db();

    return db.annualBudgets.put(data);
  }

  Future<int?> cacheAnnualBudgetsFromFarm(AnnualBudget data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.annualBudgets.put(data);
    });
  }

  Future<int?> cacheAnnualBudgetTransactions(
      AnnualBudgetTransaction data) async {
    final db = await _db();

    return db.annualBudgetTransactions.put(data);
  }

  Future<int?> cacheAnnualBudgetTransactionsFromFarm(
      AnnualBudgetTransaction data) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.annualBudgetTransactions.put(data);
    });
  }

  Future<int?> cacheCampFromFarm(Camp data) async {
    final db = await _db();

    return db.camps.put(data);
  }

  Future<int?> cacheCampFromFarmSync(Camp data) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.camps.put(data);
    });
  }

  Future<int?> cacheCamp(Camp data) async {
    final db = await _db();
    if (data.campOrder == null) {
      final camps = await db.camps.where().findAll();
      var maxOrder = 0;
      if (camps.isNotEmpty) {
        maxOrder = camps.map((obj) => (obj.campOrder ?? 0)).reduce(max);
      }
      data = data.copyWith(campOrder: maxOrder + 1);
    }
    var totalBiomass = data.calculateTotalBiomass();
    var estimatedBiomassRemoved = await data.calculateEstimatedBiomassRemoved();
    data = data.copyWith(
      infestedWieghtedAverage: data.calculateInfestationWeightAverage(),
      totalBiomass: totalBiomass,
      totalArea: data.calculateTotalArea(),
      totalRangeInfestation: data.calculateTotalRangeInfestation(),
      estimatedBiomass: data.calculateEstimatedBiomass(),
      estimatedBiomassRemoved: estimatedBiomassRemoved,
      variance: totalBiomass != 0
          ? ((totalBiomass - estimatedBiomassRemoved) / totalBiomass) * 100
          : 0,
    );
    var result = await db.writeTxn(() async {
      return db.camps.put(data);
    });
    await _reCalculateFarmCamps(int.tryParse(data.farmId ?? '') ?? 0);
    return result;
  }

  Future _reCalculateFarmCamps(int farmId) async {
    final db = await _db();
    var camps = await getCampByFarmId(farmId);
    var currentYear = DateTime.now().year;
    var annualWoodBiomassRemoved =
        (await getAnnualFarmProductionByFarmId(farmId.toString()))
                .firstOrNull
                ?.annualWoodBiomassRemoved ??
            0.0;
    var cululativeBiomass = 0.0;
    for (var element in camps) {
      cululativeBiomass += element.calculateTotalBiomass();
      var amountOfYearsToAdd = annualWoodBiomassRemoved != 0
          ? (cululativeBiomass / annualWoodBiomassRemoved)
          : 0;
      if (amountOfYearsToAdd < 1) {
        element = element.copyWith(
          plannedYearOfHarvest: currentYear,
          cumulativeBiomass: cululativeBiomass,
        );
      } else {
        amountOfYearsToAdd = amountOfYearsToAdd - 1;
        element = element.copyWith(
          plannedYearOfHarvest: currentYear +
              (amountOfYearsToAdd != 0 ? amountOfYearsToAdd.ceil() : 0),
          cumulativeBiomass: cululativeBiomass,
        );
      }
      await db.writeTxn(() async {
        return db.camps.put(element);
      });
    }
  }

  Future<int?> cacheBiologicalControlAgentTypes(
      BiologicalControlAgentType data) async {
    final db = await _db();

    return db.biologicalControlAgentTypes.put(data);
  }

  Future<int?> cacheIssueType(IssueType data) async {
    final db = await _db();

    return db.issueTypes.put(data);
  }

  Future<int?> cacheAnnualFarmBudgetTransactionCategory(
      AnnualBudgetTransactionCategory data) async {
    final db = await _db();

    return db.annualBudgetTransactionCategorys.put(data);
  }

  Future<int?> cacheAsiTypes(AsiType data) async {
    final db = await _db();

    return db.asiTypes.put(data);
  }

  Future<int?> cacheChemicalApplicationMethods(
      ChemicalApplicationMethod data) async {
    final db = await _db();

    return db.chemicalApplicationMethods.put(data);
  }

  Future<int?> cacheChemicalTypes(ChemicalType data) async {
    final db = await _db();

    return db.chemicalTypes.put(data);
  }

  Future<int?> cacheFireCause(FireCause data) async {
    final db = await _db();

    return db.fireCauses.put(data);
  }

  Future<int?> cacheGrievanceIssue(GrievanceIssue data) async {
    final db = await _db();

    return db.grievanceIssues.put(data);
  }

  Future<int?> cachePestsAndDiseaseType(PestsAndDiseaseType data) async {
    final db = await _db();

    return db.pestsAndDiseaseTypes.put(data);
  }

  Future<int?> cachePestsAndDiseaseTreatmentMethod(
      PestsAndDiseasesRegisterTreatmentMethod item) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.pestsAndDiseasesRegisterTreatmentMethods.put(item);
    });
  }

  Future<int?>
      deletedPestsAndDiseaseTreatmentMethodByPestsAndDiseasesRegisterNo(
          String? id) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.pestsAndDiseasesRegisterTreatmentMethods
          .filter()
          .pestsAndDiseasesRegisterNoEqualTo(id)
          .deleteAll();
    });
  }

  Future<int?> cacheMonitoringRequirement(MonitoringRequirement data) async {
    final db = await _db();

    return db.monitoringRequirements.put(data);
  }

  Future<int?> cacheNatureOfInjury(NatureOfInjury data) async {
    final db = await _db();

    return db.natureOfInjurys.put(data);
  }

  Future<int?> cachePetsAndDiseaseType(NatureOfInjury data) async {
    final db = await _db();

    return db.natureOfInjurys.put(data);
  }

  Future<int?> cachePetsAndDiseaseTypeTreatmentMethod(
      PestsAndDiseaseTypeTreatmentMethod data) async {
    final db = await _db();

    return db.pestsAndDiseaseTypeTreatmentMethods.put(data);
  }

  Future<int?> cachePropertyDamaged(PropertyDamaged data) async {
    final db = await _db();

    return db.propertyDamageds.put(data);
  }

  Future<int?> cacheSpeciesRange(SpeciesRange data) async {
    final db = await _db();

    return db.speciesRanges.put(data);
  }

  Future<int?> cacheTrainingType(TrainingType data) async {
    final db = await _db();

    return db.trainingTypes.put(data);
  }

  Future<int?> cacheTreatmentMethod(TreatmentMethod data) async {
    final db = await _db();

    return db.treatmentMethods.put(data);
  }

  Future<List<SpecialSite>> getSpecialSite() async {
    final db = await _db();

    return db.specialSites.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<BiologicalControlAgentType>>
      getBiologicalControlAgentTypeByGroupSchemeId(int id) async {
    final db = await _db();

    return db.biologicalControlAgentTypes
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<SocialUpliftment>> getSocialUpliftment() async {
    final db = await _db();

    return db.socialUpliftments.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<GroupSchemeStakeholder>> getGroupSchemeStakeholderByGroupSchemeId(
      int id) async {
    final db = await _db();

    return db.groupSchemeStakeholders
        .filter()
        .groupSchemeIdEqualTo(id)
        .findAll();
  }

  Future<GroupSchemeStakeholder?> getGroupSchemeStakeholderByStakeholderId(
      String id) async {
    final db = await _db();

    return db.groupSchemeStakeholders
        .filter()
        .stakeholderIdEqualTo(id)
        .findFirst();
  }

  Future<List<StakeHolder>> getUnsycnedStakeholders() async {
    final db = await _db();

    return db.stakeHolders
        .filter()
        .isMasterDataSyncedEqualTo(0)
        .or()
        .isMasterDataSyncedIsNull()
        .findAll();
  }

  Future<List<FarmerStakeHolder>> getFarmerStakeHolderByFarmId(
      String farmId) async {
    final db = await _db();

    return db.farmerStakeHolders.filter().farmIdEqualTo(farmId).findAll();
  }

  Future<List<CustomaryUseRight>> getCustomaryUseRight() async {
    final db = await _db();

    return db.customaryUseRights.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<GroupSchemeStakeholder>>
      getUnsyncedGroupSchemeStakeholderByGroupSchemeId(int id) async {
    final db = await _db();

    return db.groupSchemeStakeholders
        .filter()
        .groupSchemeIdEqualTo(id)
        .isMasterDataSyncedGreaterThan(1)
        .isMasterDataSyncedLessThan(1)
        .findAll();
  }

  Future<List<TreatmentMethod>> getTreatmentMethodByGroupSchemeId(
      int id) async {
    final db = await _db();

    return db.treatmentMethods
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<TrainingType>> getTrainingTypeByGroupSchemeId(int id) async {
    final db = await _db();

    return db.trainingTypes
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<SpeciesRange>> getSpeciesRangeByGroupSchemeId(int id) async {
    final db = await _db();

    return db.speciesRanges
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<PropertyDamaged>> getPropertyDamagedByGroupSchemeId(
      int id) async {
    final db = await _db();

    return db.propertyDamageds
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<PestsAndDiseaseTypeTreatmentMethod>>
      getPestsAndDiseaseTypeTreatmentMethod() async {
    final db = await _db();

    return db.pestsAndDiseaseTypeTreatmentMethods
        .filter()
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<NatureOfInjury>> getNatureOfInjuryByGroupSchemeId(int id) async {
    final db = await _db();

    return db.natureOfInjurys
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<MonitoringRequirement>> getMonitoringRequirementByGroupSchemeId(
      int id) async {
    final db = await _db();

    return db.monitoringRequirements
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<GroupScheme>> getGroupScheme() async {
    final db = await _db();

    return db.groupSchemes.filter().isActiveEqualTo(true).findAll();
  }

  Future<GroupScheme?> getGroupSchemeById(int id) async {
    final db = await _db();
    return db.groupSchemes
        .filter()
        .isActiveEqualTo(true)
        .groupSchemeIdEqualTo(id)
        .findFirst();
  }

  Future<List<GrievanceIssue>> getGrievanceIssueByGroupSchemeId(
      int groupSchemeId) async {
    final db = await _db();

    return db.grievanceIssues
        .filter()
        .groupSchemeIdEqualTo(groupSchemeId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Gender>> getGender() async {
    final db = await _db();

    return db.genders.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<FireCause>> getFireCauseByGroupSchemeId(int groupSchemeId) async {
    final db = await _db();

    return db.fireCauses
        .filter()
        .groupSchemeIdEqualTo(groupSchemeId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<ChemicalType>> getCountry() async {
    final db = await _db();

    return db.chemicalTypes.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<ChemicalType>> getChemicalTypeByFarmId(String farmId) async {
    final db = await _db();

    return db.chemicalTypes
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<ChemicalApplicationMethod>>
      getChemicalApplicationMethodByGroupSchemeId(int groupSchemeId) async {
    final db = await _db();

    return db.chemicalApplicationMethods
        .filter()
        .groupSchemeIEqualTo(groupSchemeId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<AsiType>> getAsiTypeByGroupSchemeId(int groupSchemeId) async {
    final db = await _db();

    return db.asiTypes
        .filter()
        .groupSchemeIdEqualTo(groupSchemeId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<AsiType>> getAsiTypes() async {
    final db = await _db();

    return db.asiTypes.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<AnnualBudgetTransactionCategory>>
      getAnnualBudgetTransactionCategory() async {
    final db = await _db();

    return db.annualBudgetTransactionCategorys
        .filter()
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Camp>> getUnsyncedCampByFarmId(String farmId) async {
    final db = await _db();
    return db.camps
        .filter()
        .farmIdEqualTo(farmId)
        .isLocalEqualTo(true)
        .findAll();
  }

  Future<List<Camp>> getCamp() async {
    final db = await _db();

    return db.camps.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<AnnualBudgetTransaction>>
      getUnsyncedAnnualBudgetTransactionByFarmId(String farmId) async {
    final db = await _db();

    return db.annualBudgetTransactions.filter().isActiveEqualTo(true).findAll();
  }

  Future<bool> removeAnnualBudgetTransaction(int transactionId) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.annualBudgetTransactions.delete(transactionId);
    });
  }

  Future<List<AnnualBudgetTransaction>> getAnnualBudgetTransactionByBudgetId(
    String budgetId,
  ) async {
    final db = await _db();

    return db.annualBudgetTransactions
        .filter()
        .annualBudgetIdEqualTo(budgetId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<AnnualBudgetTransaction>> getAnnualBudgetTransactionByFarmId(
      String farmId) async {
    final db = await _db();

    return db.annualBudgetTransactions.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<AnnualBudget>> getUnsyncedAnnualProductionBudgetByFarmId(
      String farmId) async {
    final db = await _db();

    return db.annualBudgets
        .filter()
        .farmIdEqualTo(farmId)
        .isLocalEqualTo(1)
        .findAll();
  }

  Future<List<AnnualBudget>> getAnnualBudgetsByFarmId(
    String farmId,
  ) async {
    final db = await _db();

    return db.annualBudgets
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .sortByAnnualBudgetName()
        .findAll();
  }

  Future<bool> removeAnnualBudget(int annualBudgetId) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.annualBudgets.delete(annualBudgetId);
    });
  }

  Future<List<AnnualFarmProduction>> getUnsyncedAnnualProductionByFarmId(
      String farmId) async {
    final db = await _db();

    return db.annualFarmProductions
        .filter()
        .farmIdEqualTo(farmId)
        .isLocalEqualTo(true)
        .findAll();
  }

  Future<List<AnnualFarmProduction>> getAnnualFarmProductionByFarmId(
    String farmId,
  ) async {
    final db = await _db();

    return db.annualFarmProductions
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .sortByYearDesc()
        .thenByCreateDTDesc()
        .findAll();
  }

  Future<List<AnnualFarmProduction>> getUnsyncedAnnualFarmProductionByFarmId(
    String farmId,
  ) async {
    final db = await _db();

    return db.annualFarmProductions
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .isLocalEqualTo(true)
        .sortByYearDesc()
        .thenByCreateDTDesc()
        .findAll();
  }

  Future<AnnualFarmProduction?> getAnnualFarmProductionById(
    String id,
  ) async {
    final db = await _db();

    return db.annualFarmProductions
        .filter()
        .annualFarmProductionIdEqualTo(id)
        .isActiveEqualTo(true)
        .findFirst();
  }

  Future<List<AnnualFarmProduction>> getAnnualFarmProductionByFarmIdAndYear({
    String? farmId,
    int? year,
  }) async {
    final db = await _db();

    return db.annualFarmProductions
        .filter()
        .farmIdEqualTo(farmId)
        .yearEqualTo(year.toString())
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<TrainingRegister>> getUnsyncedTrainingByFarmId(
      String farmId) async {
    final db = await _db();
    return db.trainingRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<TrainingRegister>> getTrainingByFarmId(String farmId) async {
    final db = await _db();
    return db.trainingRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<int> getCountTrainingByFarmId(String farmId) async {
    final db = await _db();
    return db.trainingRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .count();
  }

  Future<List<RteSpeciesPhotoModel>> getUnsyncedRteSpeciesPhotoByFarmId(
      String farmId) async {
    final db = await _db();
    return db.rteSpeciesPhotoModels
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<RteSpeciesPhotoModel>> getRteSpeciesPhotoByFarmId(
      String farmId) async {
    final db = await _db();
    return db.rteSpeciesPhotoModels
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<RteSpecies>> getUnsyncedRteSpeciesByFarmId(String farmId) async {
    final db = await _db();
    return db.rteSpecies
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterDataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<RteSpeciesPhotoModel>>
      getAllRteSpeciesRegisterPhotoByRteSpeciesRegisterNo(
          String? rteRegisterPhoto) async {
    if (rteRegisterPhoto.isBlank) return <RteSpeciesPhotoModel>[];

    final db = await _db();

    return db.rteSpeciesPhotoModels
        .filter()
        .rteSpeciesNoEqualTo(rteRegisterPhoto)
        .findAll();
  }

  Future<List<RteSpecies>> getRteSpeciesByFarmId(String farmId) async {
    final db = await _db();
    return db.rteSpecies
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .sortByCommonNameDesc()
        .findAll();
  }

  Future<List<PetsAndDiseaseRegister>>
      getUnsyncedPestsAndDiseasesRegisterTreatmentMethod() async {
    final db = await _db();
    return db.petsAndDiseaseRegisters
        .filter()
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<PestsAndDiseasesRegisterTreatmentMethod>>
      getPestsAndDiseasesRegisterTreatmentMethodByPestsAndDiseasesRegisterNo(
          String? id) async {
    final db = await _db();
    return db.pestsAndDiseasesRegisterTreatmentMethods
        .filter()
        .pestsAndDiseasesRegisterNoEqualTo(id)
        .findAll();
  }

  Future<List<PestsAndDiseasesRegisterTreatmentMethod>>
      getPestsAndDiseasesRegisterTreatmentMethod() async {
    final db = await _db();
    return db.pestsAndDiseasesRegisterTreatmentMethods
        .filter()
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<PetsAndDiseaseRegister>>
      getUnsyncedPetsAndDiseaseRegisterByFarmId(String farmId) async {
    final db = await _db();
    return db.petsAndDiseaseRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<PetsAndDiseaseRegister>> getPetsAndDiseaseRegisterByFarmId(
      String farmId,
      {bool? isUnderControl}) async {
    final db = await _db();
    if (isUnderControl == null) {
      return db.petsAndDiseaseRegisters
          .filter()
          .farmIdEqualTo(farmId)
          .isActiveEqualTo(true)
          .findAll();
    }
    if (isUnderControl == true) {
      return db.petsAndDiseaseRegisters
          .filter()
          .farmIdEqualTo(farmId)
          .isActiveEqualTo(true)
          .underControlEqualTo(true)
          .findAll();
    }
    return db.petsAndDiseaseRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .underControlEqualTo(false)
        .findAll();
  }

  Future<List<FireRegister>> getUnsyncedFireRegisterByFarmId(
      String farmId) async {
    final db = await _db();

    return db.fireRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<FireRegister>> getFireRegisterByFarmId(String farmId) async {
    final db = await _db();

    return db.fireRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(false)
        .findAll();
  }

  Future<List<GrievanceRegister>> getUnsyncedGrievanceRegisterByFarmId(
      String farmId) async {
    final db = await _db();

    return db.grievanceRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<GrievanceRegister>> getGrievanceRegisterByFarmId(
      String farmId) async {
    final db = await _db();

    return db.grievanceRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<ComplaintsAndDisputesRegister>>
      getUnsyncedComplaintsAndDisputesRegisterByFarmId(String farmId) async {
    final db = await _db();
    return db.complaintsAndDisputesRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<int?> cacheComplaintsAndDisputesRegister(
      ComplaintsAndDisputesRegister item) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.complaintsAndDisputesRegisters.put(item);
    });
  }

  Future<List<ComplaintsAndDisputesRegister>>
      getComplaintsAndDisputesRegisterByFarmId(String farmId) async {
    final db = await _db();
    return db.complaintsAndDisputesRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<IssueType>> getIssueTypeByGroupSchemeId(int id) async {
    final db = await _db();

    return db.issueTypes
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<SanctionRegister>> getUnsyncedSanctionRegisterByFarmId(
      String farmId) async {
    final db = await _db();
    return db.sanctionRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isSyncedEqualTo(false)
        .findAll();
  }

  Future<List<SanctionRegister>> getSanctionRegisterByFarmId(String farmId,
      {bool? isOpen}) async {
    final db = await _db();
    if (isOpen == null) {
      return db.sanctionRegisters
          .filter()
          .farmIdEqualTo(farmId)
          .isActiveEqualTo(true)
          .findAll();
    }

    if (!isOpen) {
      return db.sanctionRegisters
          .filter()
          .farmIdEqualTo(farmId)
          .isActiveEqualTo(true)
          .dateReceivedIsNull()
          .findAll();
    } else {
      return db.sanctionRegisters
          .filter()
          .farmIdEqualTo(farmId)
          .isActiveEqualTo(true)
          .dateReceivedIsNotNull()
          .findAll();
    }
  }

  Future<List<Chemical>> getUnsyncedChemicalByFarmId(String farmId) async {
    final db = await _db();
    return db.chemicals
        .filter()
        .farmIdEqualTo(int.parse(farmId))
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<Chemical>> getChemicalByFarmId(String farmId,
      {bool? isOpen}) async {
    final db = await _db();
    if (isOpen == null) {
      return db.chemicals
          .filter()
          .farmIdEqualTo(int.parse(farmId))
          .isActiveEqualTo(true)
          .findAll();
    }
    if (isOpen == true) {
      return db.chemicals
          .filter()
          .farmIdEqualTo(int.parse(farmId))
          .dateIsNotNull()
          .isActiveEqualTo(true)
          .findAll();
    }
    return db.chemicals
        .filter()
        .farmIdEqualTo(int.parse(farmId))
        .dateIsNull()
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<BiologicalControlAgent>>
      getUnsyncedBiologicalControlAgentByFarmId(String farmId) async {
    final db = await _db();
    return db.biologicalControlAgents
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterDataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<BiologicalControlAgent>> getBiologicalControlAgentByFarmId(
      String farmId) async {
    final db = await _db();
    return db.biologicalControlAgents
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<int> getCountBiologicalControlAgentByFarmId(String farmId) async {
    final db = await _db();
    return db.biologicalControlAgents
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .count();
  }

  Future<List<AsiPhoto>> getUnsyncedAsiPhoto() async {
    final db = await _db();
    return db.asiPhotos
        .filter()
        .isMasterdataSyncedEqualTo(false)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<AsiPhoto>> getAsiPhoto() async {
    final db = await _db();
    return db.asiPhotos.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<AccidentAndIncident>>
      getUnsyncedAccidentAndIncidentRegisterByFarmId(String farmId) async {
    final db = await _db();

    return db.accidentAndIncidents
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterDataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<AccidentAndIncident>> getCountAccidentAndIncidentRegisterByFarmId(
      String farmId) async {
    final db = await _db();

    return db.accidentAndIncidents
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<AnimalType>> getAnimalTypeByGroupSchemeId(int id) async {
    final db = await _db();

    return db.animalTypes
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<PestsAndDiseaseType>> getPestsAndDiseaseTypeByGroupSchemeId(
      int id) async {
    final db = await _db();

    return db.pestsAndDiseaseTypes
        .filter()
        .groupSchemeIdEqualTo(id)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<AccidentAndIncidentPropertyDamaged>>
      getUnsyncedAccidentAndIncidentPropertyDamaged() async {
    final db = await _db();

    return db.accidentAndIncidentPropertyDamageds
        .filter()
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<AccidentAndIncidentPropertyDamaged>>
      getCountAccidentAndIncidentPropertyDamaged() async {
    final db = await _db();

    return db.accidentAndIncidentPropertyDamageds
        .filter()
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Schedule>> getUpcomingScheduleCountByUserId(int userId) async {
    final db = await _db();

    return db.schedules
        .filter()
        .userIdEqualTo(userId)
        .isActiveEqualTo(true)
        .endGreaterThan(DateTime.now().toString())
        .findAll();
  }

  Future<List<Asi>> getAsiRegister() async {
    final db = await _db();

    return db.asis.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<Asi>> getAsiRegisterByFarmId(String farmId,
      {bool? isOpen}) async {
    final db = await _db();
    if (isOpen == null) {
      return db.asis
          .filter()
          .farmIdEqualTo(farmId)
          .isActiveEqualTo(true)
          .findAll();
    }
    if (isOpen == true) {
      return db.asis
          .filter()
          .farmIdEqualTo(farmId)
          .isActiveEqualTo(true)
          .dateIsNotNull()
          .findAll();
    }

    return db.asis
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .dateIsNull()
        .findAll();
  }

  Future<int> getCountAsiRegisterByFarmId(String farmId) async {
    final db = await _db();
    return db.asis.filter().farmIdEqualTo(farmId).isActiveEqualTo(true).count();
  }

  Future<List<Asi>> getUnsyncedAsiRegister(String farmId) async {
    final db = await _db();

    return db.asis
        .filter()
        .farmIdEqualTo(farmId)
        .isMasterdataSyncedEqualTo(false)
        .findAll();
  }

  Future<List<Asi>> getRMAsiRegister() async {
    final db = await _db();

    return db.asis
        .filter()
        .isMasterdataSyncedEqualTo(false)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Schedule>> getUnsyncedScheduleCountByUserId(int userId) async {
    final db = await _db();

    return db.schedules
        .filter()
        .userIdEqualTo(userId)
        .isActiveEqualTo(true)
        .endGreaterThan(DateTime.now().toString())
        .findAll();
  }

  Future<List<ScheduleActivity>> getScheduleActivities() async {
    final db = await _db();

    return db.scheduleActivitys.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<FarmerWorker>> getUnsyncedWorkerCountByFarmId(
      String farmId) async {
    final db = await _db();
    return db.farmerWorkers
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .isLocalEqualTo(1)
        .findAll();
  }

  Future<List<FarmerWorker>> getWorkerCountByFarmId(String farmId) async {
    final db = await _db();
    return db.farmerWorkers
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Assessment>> getAllAssessments({
    required int userId,
    required int companyId,
  }) async {
    final db = await _db();
    return db.assessments
        .filter()
        .companyIdEqualTo(companyId)
        .userIdEqualTo(userId)
        .isActiveEqualTo(true)
        .sortByCreateDTDesc()
        .findAll();
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

  Future<List<Assessment>> getAssessmentsByUserId({
    required int userId,
  }) async {
    final db = await _db();
    return db.assessments
        .filter()
        .userIdEqualTo(userId)
        .isActiveEqualTo(true)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<Assessment>> getAllAssessmentsStarted() async {
    final db = await _db();
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .statusEqualTo(1)
        .completedEqualTo(null)
        .or()
        .completedEqualTo(false)
        .sortByCreateDTDesc()
        .findAll();
  }

  Future<List<PestsAndDiseaseType>> getAllPetsAndDiseaseTypeByGroupSchemeId(
      int groupSchemeId) async {
    final db = await _db();

    return db.pestsAndDiseaseTypes
        .filter()
        .groupSchemeIdEqualTo(groupSchemeId)
        .findAll();
  }

  Future<List<PestsAndDiseasesRegisterTreatmentMethod>>
      getAllPestsAndDiseasesRegisterTreatmentMethod() async {
    final db = await _db();

    return db.pestsAndDiseasesRegisterTreatmentMethods
        .filter()
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Assessment>>
      getAllAssessmentUnSyncedByCompanyIdAndUserId() async {
    return [
      ...await getAllAssessmentsCompleted(),
      ...await getAllAssessmentsSynced(),
    ];
  }

  Future<List<Assessment>> getAllAssessmentsCompleted() async {
    final db = await _db();
    return db.assessments
        .filter()
        .isActiveEqualTo(true)
        .completedEqualTo(true)
        .statusEqualTo(2)
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

  Future<Company?> getCachedCompany({required int id}) async {
    final db = await _db();
    return db.companys.get(id);
  }

  Future<List<Company>> getAllCachedCompanies() async {
    final db = await _db();
    return db.companys.where().findAll();
  }

  Future<int> cacheCompany(Company item) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.companys.put(item);
    });
  }

  Future<int> cacheResourceManagerUnit(ResourceManagerUnit item) async {
    final db = await _db();
    return db.resourceManagerUnits.put(item);
  }

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
        .isActiveIsNotNull()
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

  Future<int> cacheRegionalManagerUnit(RegionalManagerUnit item) async {
    final db = await _db();
    return db.regionalManagerUnits.put(item);
  }

  Future<List<RegionalManagerUnit>> getRegionalManagerUnits() async {
    final db = await _db();

    return db.regionalManagerUnits
        .filter()
        .isActiveEqualTo(1)
        .sortByRegionalManagerUnitName()
        .findAll();
  }

  Future<int> cacheRiskProfileQuestion(RiskProfileQuestion item) async {
    final db = await _db();
    return db.riskProfileQuestions.put(item);
  }

  Future<List<RiskProfileQuestion>> getRiskProfileQuestionByGroupSchemeId(
      int? groupSchemeId) async {
    final db = await _db();

    return db.riskProfileQuestions
        .filter()
        .groupSchemeIdEqualTo(groupSchemeId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<int> cacheFarmMemberObjective(FarmMemberObjective item) async {
    final db = await _db();
    return db.farmMemberObjectives.put(item);
  }

  Future<int> cacheFarmObjectiveOption(FarmObjectiveOption item) async {
    final db = await _db();
    return db.farmObjectiveOptions.put(item);
  }

  Future<List<Severity>> getSeverities() async {
    final db = await _db();

    return db.severitys
        .filter()
        .isActiveEqualTo(true)
        .sortBySeverityId()
        .findAll();
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

  Future<int> cacheFarmQuestion(FarmQuestion item,
      {bool isDirect = false}) async {
    final db = await _db();
    if (isDirect) {
      return db.writeTxn(() => db.farmQuestions.put(item));
    } else {
      return db.farmQuestions.put(item);
    }
  }

  Future<int> cacheFarm(Farm item) async {
    final db = await _db();
    return db.farms.put(item);
  }

  Future<int> cacheFarmAddMember(Farm item) async {
    final db = await _db();
    return db.writeTxn(() => db.farms.put(item));
  }

  Future<List<FarmQuestion>?> getFarmQuestions({
    int? rmuId,
    int? auditTemplateId,
  }) async {
    if (rmuId == null || auditTemplateId == null) return null;
    final db = await _db();
    return db.farmQuestions
        .filter()
        .regionalManagerUnitIdEqualTo(rmuId)
        .auditTemplateIdEqualTo(auditTemplateId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<FarmQuestion>?> getFarmQuestionsByRmuId({
    int? rmuId,
  }) async {
    if (rmuId == null) return null;
    final db = await _db();
    return db.farmQuestions
        .filter()
        .regionalManagerUnitIdEqualTo(rmuId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Farm>?> getFarmByRmuId(int? rmuId) async {
    if (rmuId == null) return null;
    final db = await _db();
    return db.farms
        .filter()
        .regionalManagerUnitIdEqualTo(rmuId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Farm>?> getUnsyncedFarmsByRegionalManagerUnitId(
      int? rmuId) async {
    if (rmuId == null) return null;
    final db = await _db();
    return db.farms
        .filter()
        .regionalManagerUnitIdEqualTo(rmuId)
        .isProspectMemberEqualTo(true)
        .isMasterDataSyncedEqualTo(0)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<Farm?> getFarmById(String id) async {
    final db = await _db();
    return db.farms
        .filter()
        .farmIdEqualTo(id)
        .isActiveEqualTo(true)
        .findFirst();
  }

  Future<List<Compliance>> getCompliances() async {
    final db = await _db();
    return db.compliances.filter().isActiveEqualTo(true).findAll();
  }

  Future<List<Compliance>?> getCompliancesByRmuId({int? rmuId}) async {
    if (rmuId == null) return null;
    final db = await _db();
    return db.compliances
        .filter()
        .regionalManagerUnitIdEqualTo(rmuId)
        .isActiveEqualTo(true)
        .findAll();
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

  Future<int?> updateWorkerSyncStatus(
      {required Worker worker, bool status = false}) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.workers.put(worker.copyWith(isLocal: status));
    });
  }

  Future<int> cacheFarmerWorker(FarmerWorker item) async {
    final db = await _db();
    return db.farmerWorkers.put(item);
  }

  Future<int> cacheWorkerFromFarm(FarmerWorker item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.farmerWorkers.put(item);
    });
  }

  Future<int> cacheStakeHolder(StakeHolder item) async {
    final db = await _db();
    return db.stakeHolders.put(item);
  }

  Future<int> cacheStakeHolderFromFarm(StakeHolder item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.stakeHolders.put(item);
    });
  }

  Future<int> cacheStakeHolderType(StakeHolderType item) async {
    final db = await _db();
    return db.stakeHolderTypes.put(item);
  }

  Future<int> cacheFarmPropertyOwnershipType(
      FarmPropertyOwnershipType item) async {
    final db = await _db();
    return db.farmPropertyOwnershipTypes.put(item);
  }

  Future<int> cacheRMSchedule(RMSchedule item) async {
    final db = await _db();
    return db.rMSchedules.put(item);
  }

  Future<int> cacheAuditTemplate(AuditTemplate item) async {
    final db = await _db();
    return db.auditTemplates.put(item);
  }

  Future<int> cacheCriteria(Criteria item) async {
    final db = await _db();
    return db.criterias.put(item);
  }

  Future<int> cachePrinciple(Principle item) async {
    final db = await _db();
    return db.principles.put(item);
  }

  Future<int> cacheIndicator(Indicator item) async {
    final db = await _db();
    return db.indicators.put(item);
  }

  Future<int> cacheAnnualProduction(AnnualFarmProduction item) async {
    final db = await _db();
    return db.annualFarmProductions.put(item);
  }

  Future<int> cacheAnnualProductionFromFarm(AnnualFarmProduction item) async {
    final db = await _db();

    return db.writeTxn(() async {
      return db.annualFarmProductions.put(item);
    });
  }

  Future<int> cacheBiologicalControlAgents(BiologicalControlAgent item) async {
    final db = await _db();
    return db.biologicalControlAgents.put(item);
  }

  Future<int> cacheBiologicalControlAgentsFromFarm(
      BiologicalControlAgent item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.biologicalControlAgents.put(item);
    });
  }

  Future<int> cacheAnnualProductionBudget(AnnualBudget item) async {
    final db = await _db();
    return db.annualBudgets.put(item);
  }

  Future<int> cacheEmployeeGrievance(GrievanceRegister item) async {
    final db = await _db();
    return db.grievanceRegisters.put(item);
  }

  Future<List<GrievanceRegister>> getEmployeeGrievancesByFarmId(
      String farmId) async {
    final db = await _db();
    return db.grievanceRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<int> getCountEmployeeGrievancesByFarmId(String farmId) async {
    final db = await _db();
    return db.grievanceRegisters
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .count();
  }

  Future<int> cacheFireManagement(FireManagement item) async {
    final db = await _db();
    return db.fireManagements.put(item);
  }

  Future<int> cacheRteSpecies(
    RteSpecies item, {
    bool isDirect = true,
  }) async {
    final db = await _db();
    if (isDirect) {
      return db.rteSpecies.put(item);
    } else {
      return db.writeTxn(() => db.rteSpecies.put(item));
    }
  }

  Future<int> cacheRteSpeciesFromFarm(RteSpecies item) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.rteSpecies.put(item);
    });
  }

  Future<int> cacheRteSpeciesPhotoModel(RteSpeciesPhotoModel item) async {
    final db = await _db();
    return db.writeTxn(() => db.rteSpeciesPhotoModels.put(item));
  }

  Future<bool> removeRteSpeciesPhotoModel(int id) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.rteSpeciesPhotoModels.delete(id);
    });
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
    return db.stakeHolders.filter().isActiveEqualTo(1).findAll();
  }

  Future<List<StakeHolder>> getStakeHoldersByStakeHolderId(String id) async {
    final db = await _db();
    return db.stakeHolders
        .filter()
        .stakeHolderIdEqualTo(id)
        .isActiveEqualTo(1)
        .findAll();
  }

  Future<bool> removeStakeHolder(int stakeHolderId) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.stakeHolders.delete(stakeHolderId);
    });
  }

  Future<List<StakeHolderType>> getStakeHolderTypes() async {
    final db = await _db();
    return db.stakeHolderTypes.filter().isActiveEqualTo(1).findAll();
  }

  Future<List<FarmerWorker>> getFarmerWorkersByFarmId(String farmId) async {
    final db = await _db();
    return db.farmerWorkers
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .sortByFirstName()
        .findAll();
  }

  Future<bool> removeFarmerWorker(int farmerWorkerId) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.farmerWorkers.delete(farmerWorkerId);
    });
  }

  Future<List<Farm>?> getFarmsByRMUnit(int resourceManagerUnit) async {
    final db = await _db();
    return db.farms
        .filter()
        .regionalManagerUnitIdEqualTo(resourceManagerUnit)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<List<Farm>?> getUnsyncedFarmCountByRegionalManagerUnitId(
      int resourceManagerUnit) async {
    final db = await _db();
    return db.farms
        .filter()
        .regionalManagerUnitIdEqualTo(resourceManagerUnit)
        .isProspectMemberEqualTo(true)
        .isMasterDataSyncedEqualTo(0)
        .isActiveEqualTo(true)
        .findAll();
  }

  // Future<List<RMStakeHolder>?> getActiveStakeholderWrappersCountByGroupSchemeId(
  //     int groupSchemeId) async {
  //   final db = await _db();
  //   final groupSchemeStakeHolders = await db.groupSchemeStakeHolders
  //       .filter()
  //       .groupSchemeIdEqualTo(groupSchemeId)
  //       .findAll();
  //   if (groupSchemeStakeHolders == null) {
  //     return null;
  //   }
  //   final stakeHolders = <RMStakeHolder>[];
  //   for (final item in groupSchemeStakeHolders) {
  //     final id = int.tryParse(item.stakeHolderId ?? '');
  //     if (id == null) {
  //       continue;
  //     }
  //     stakeHolders.addAll(await db.rMStakeHolders
  //         .filter()
  //         .stakeHolderIdEqualTo(id.toString())
  //         .findAll());
  //   }
  //   return stakeHolders;
  // }

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

  Future<List<FarmPropertyOwnershipType>> getFarmPropertyOwnershipType() async {
    final db = await _db();
    return db.farmPropertyOwnershipTypes
        .filter()
        .isActiveEqualTo(1)
        .sortByFarmPropertyOwnershipTypeName()
        .findAll();
  }

  Future<List<QuestionAnswer>>
      getQuestionAnswersByRmuIdAndAuditTemplateIdAndAssessmentId({
    int? rmuId,
    int? auditTemplateId,
    int? assessmentId,
  }) async {
    if (rmuId == null) return <QuestionAnswer>[];
    final db = await _db();
    try {
      final questionAnswers = <QuestionAnswer>[];
      final farmQuestions = await getFarmQuestions(
        rmuId: rmuId,
        auditTemplateId: auditTemplateId,
      );

      if (farmQuestions == null) return <QuestionAnswer>[];

      for (final question in farmQuestions) {
        final qAs = await db.questionAnswers
            .filter()
            .assessmentIdEqualTo(assessmentId)
            .questionIdEqualTo(question.questionId)
            .findAll();
        QuestionAnswer? qA = qAs.isNotEmpty ? qAs.last : null;

        final questionAnswer = QuestionAnswer(
          assessmentId: assessmentId,
          questionId: question.questionId,
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

  Future<int> getQuestionCommentsLatestIndex() async {
    final db = await _db();
    try {
      final questionComments =
          await db.questionComments.filter().commentIsNotNull().findAll();

      final result = questionComments.map((e) => e.commentId).toList();

      if (result.isEmpty) return 0;

      return result.reduce((curr, next) => curr > next ? curr : next);
    } catch (error) {
      handleError(error);
      return 0;
    }
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

  Future<List<Audit>> getAllAudits() async {
    final db = await _db();
    return db.audits.filter().isActiveEqualTo(true).sortByCreated().findAll();
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

  Future<List<Site>> getSitesByRmuId({
    int? rmuId,
  }) async {
    if (rmuId == null) return <Site>[];
    final db = await _db();
    try {
      final sites = await db.sites
          .filter()
          .isActiveEqualTo(true)
          .sortBySiteName()
          .findAll();

      return sites;
    } catch (error) {
      handleError(error);
    }

    return <Site>[];
  }

  Future<bool> removeCompartment(int id) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.compartments.delete(id);
    });
  }

  Future<Compartment?> getCompartmentsByUnitNumber({
    String? unitMember,
  }) async {
    if (unitMember == null) return null;
    final db = await _db();
    try {
      final compartment = await db.compartments
          .filter()
          .isActiveEqualTo(true)
          .unitNumberEqualTo(unitMember)
          .findFirst();

      return compartment;
    } catch (error) {
      handleError(error);
    }

    return null;
  }

  Future<List<Compartment>> getCompartmentsByGroupSchemeId({
    int? groupSchemeId,
  }) async {
    if (groupSchemeId == null) return <Compartment>[];
    final db = await _db();
    try {
      final compartments = await db.compartments
          .filter()
          .isActiveEqualTo(true)
          .groupSchemeIdEqualTo(groupSchemeId)
          .sortByUnitNumber()
          .findAll();

      return compartments;
    } catch (error) {
      handleError(error);
    }

    return <Compartment>[];
  }

  Future<List<Compartment>> getUnsyncedCompartmentsFarm() async {
    final db = await _db();
    try {
      final compartments = await db.compartments
          .filter()
          .isActiveEqualTo(true)
          .isMasterdataSyncedEqualTo(false)
          .findAll();

      return compartments;
    } catch (error) {
      handleError(error);
    }

    return <Compartment>[];
  }

  Future<List<Compartment>> getCompartmentsByGroupSchemeIdAndFarmId({
    int? groupSchemeId,
    String? farmId,
  }) async {
    if (groupSchemeId == null || farmId == null) return <Compartment>[];
    final db = await _db();
    try {
      final compartments = await db.compartments
          .filter()
          .isActiveEqualTo(true)
          .groupSchemeIdEqualTo(groupSchemeId)
          .farmIdEqualTo(farmId)
          .sortByUnitNumber()
          .findAll();

      return compartments;
    } catch (error) {
      handleError(error);
    }

    return <Compartment>[];
  }

  Future<List<AuditTemplate>> getAuditTemplatesByRMU(int? rmuId) async {
    final db = await _db();
    try {
      final questions = await db.farmQuestions
          .filter()
          .regionalManagerUnitIdEqualTo(rmuId)
          .findAll();
      List<AuditTemplate> templates = [];
      for (var question in questions) {
        if (templates.firstWhereOrNull(
                (element) => element.id == question.auditTemplateId) !=
            null) {
          continue;
        }
        templates.addAll(
          await db.auditTemplates
              .filter()
              .idEqualTo(question.auditTemplateId ?? 0)
              .isActiveEqualTo(true)
              .sortByAuditTemplateName()
              .findAll(),
        );
      }
      return templates;
    } catch (error) {
      handleError(error);
    }

    return <AuditTemplate>[];
  }

  Future<List<Principle>> getPrinciples() async {
    final db = await _db();
    try {
      final principles = await db.principles
          .filter()
          .isActiveEqualTo(true)
          .sortByPrincipleName()
          .findAll();

      return principles;
    } catch (error) {
      handleError(error);
    }

    return <Principle>[];
  }

  Future<List<Indicator>> getIndicators() async {
    final db = await _db();
    try {
      final indicators = await db.indicators
          .filter()
          .isActiveEqualTo(true)
          .sortByIndicatorName()
          .findAll();

      return indicators;
    } catch (error) {
      handleError(error);
    }

    return <Indicator>[];
  }

  Future<List<Criteria>> getCriterias() async {
    final db = await _db();
    try {
      final criterias = await db.criterias
          .filter()
          .isActiveEqualTo(true)
          .sortByCriteriaName()
          .findAll();

      return criterias;
    } catch (error) {
      handleError(error);
    }

    return <Criteria>[];
  }

  Future<List<RejectReason>> getRejectReasons() async {
    final db = await _db();
    try {
      final rejectReasons = await db.rejectReasons
          .filter()
          .isActiveEqualTo(true)
          .sortByRejectReasonName()
          .findAll();

      return rejectReasons;
    } catch (error) {
      handleError(error);
    }

    return <RejectReason>[];
  }

  Future<void> removeQuestionPhoto(QuestionPhoto photo) async {
    final db = await _db();
    try {
      final path = photo.photo;
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
        .photoIsNotNull()
        .photoIsNotEmpty()
        .findAll();
  }

  Future<List<QuestionPhoto>> getQuestionPhotosByAssessmentId(
      int? assessmentId) async {
    final db = await _db();

    return db.questionPhotos
        .filter()
        .assessmentIdIsNotNull()
        .assessmentIdEqualTo(assessmentId)
        .photoIsNotNull()
        .photoIsNotEmpty()
        .findAll();
  }

  Future<List<QuestionPhoto>> getQuestionPhotosByAssessmentIdAndQuestionId({
    int? assessmentId,
    int? questionId,
  }) async {
    final db = await _db();

    return db.questionPhotos
        .filter()
        .assessmentIdIsNotNull()
        .assessmentIdEqualTo(assessmentId)
        .questionIdIsNotNull()
        .questionIdEqualTo(questionId)
        .photoIsNotNull()
        .photoIsNotEmpty()
        .findAll();
  }

  Future<int> countQuestionPhotos() async {
    final db = await _db();

    final photos =
        await db.questionPhotos.filter().photoIdIsNotNull().findAll();

    return photos.length;
  }

  Future<QuestionComment?> getQuestionCommentByComment(String? comment) async {
    if (comment == null) return null;
    final db = await _db();
    return db.questionComments.filter().commentEqualTo(comment).findFirst();
  }

  Future removeQuestionComment(QuestionComment comment) async {
    final db = await _db();
    try {
      return db.writeTxn(() {
        return db.questionComments.delete(comment.commentId);
      });
    } catch (error) {
      handleError(error);
    }
  }

  Future<int> cacheUserDevice(UserDevice userDevice) async {
    final db = await _db();
    return db.writeTxn(() async {
      return db.userDevices.put(userDevice);
    });
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

  Future<int> cacheCompartment(Compartment item,
      {bool isDirect = false}) async {
    final db = await _db();
    if (isDirect) {
      return db.writeTxn(() => db.compartments.put(item));
    }

    return db.compartments.put(item);
  }

  Future<int> cacheAreaTypes(AreaType item) async {
    final db = await _db();
    return db.areaTypes.put(item);
  }

  Future<int> cacheProductGroupTemplates(ProductGroupTemplate item) async {
    final db = await _db();
    return db.productGroupTemplates.put(item);
  }

  Future<int> cacheSpeciesGroupTemplates(SpeciesGroupTemplate item) async {
    final db = await _db();
    return db.speciesGroupTemplates.put(item);
  }

  Future<List<AreaType>?> getAreaTypesByGroupSchemeId(int? groupSchemeId) async {
    if (groupSchemeId == null) return <AreaType>[];

    final db = await _db();
    return db.areaTypes
        .filter()
        .isActiveEqualTo(true)
        .sortByAreaTypeNameDesc()
        .findAll();
  }

  Future<List<ProductGroupTemplate>?> getProductGroupTemplates() async {
    final db = await _db();
    return db.productGroupTemplates
        .filter()
        .isActiveEqualTo(true)
        .sortByProductGroupTemplateNameDesc()
        .findAll();
  }

  Future<List<SpeciesGroupTemplate>?> getSpeciesGroupTemplates() async {
    final db = await _db();
    return db.speciesGroupTemplates
        .filter()
        .isActiveEqualTo(true)
        .sortBySpeciesGroupTemplateNameDesc()
        .findAll();
  }

  Future<List<Compartment>?> getCompartmentByFarmId(String farmId) async {
    final db = await _db();
    return db.compartments
        .filter()
        .farmIdEqualTo(farmId)
        .isActiveEqualTo(true)
        .findAll();
  }

  Future<Hirac?> getHiracById(int id) async {
    final db = await _db();
    return db.hiracs
        .filter()
        .isActiveEqualTo(true)
        .hiracIdEqualTo(id)
        .findFirst();
  }

  Future<HiracTemplate?> getHiracTemplateById(int id) async {
    final db = await _db();
    return db.hiracTemplates
        .filter()
        .isActiveEqualTo(true)
        .hiracTemplateIdEqualTo(id)
        .findFirst();
  }

  Future<HiracType?> getHiracTypeByid(int id) async {
    final db = await _db();
    return db.hiracTypes
        .filter()
        .isActiveEqualTo(true)
        .hiracTypeIdEqualTo(id)
        .findFirst();
  }
}
