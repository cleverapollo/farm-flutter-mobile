import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/base_sync_cubit.dart';
import 'package:cmo/state/sync/base_sync_state.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';

part 'farmer_sync_onboarding_state.dart';

class FarmerSyncOnboardingCubit
    extends BaseSyncCubit<FarmerSyncOnboardingState> {
  FarmerSyncOnboardingCubit({required this.userDeviceCubit})
      : super(FarmerSyncOnboardingState()) {
    init();
  }

  final UserDeviceCubit userDeviceCubit;

  int get userDeviceId => userDeviceCubit.data!.userDeviceId!;

  int get farmerGroupSchemeId => state.farm!.groupSchemeId!;

  String get farmId => state.farm!.farmId;

  String get topicMasterDataSync => 'Cmo.MasterDataDeviceSync.';
  String get topicTrickleFeedFarmerMasterDataByFarmId => 'Cmo.MasterData.';
  String get topicTrickleFeedFgsMasterDataByGroupSchemeId =>
      'Cmo.MasterData.FGS.';

  Future<void> init() async {
    final farm = await configService.getActiveFarm();
    emit(state.copyWith(farm: farm));
  }

  Future<void> syncOnboarding({required VoidCallback onCompleted}) async {
    try {
      emit(
        state.copyWith(
          syncMessage: 'Syncing All Master Data...',
          isLoading: true,
        ),
      );

      logger.d('--Farmer Sync Data start');
      logger.d('--createSubscriptions');
      await createSubscriptions();
      logger.d('--createSubscriptions done');
      logger.d('--createFarmerSystemEvent');
      await cmoPerformApiService.createFarmerSystemEvent(
        farmId: farmId,
        userDeviceId: userDeviceId,
      );
      logger.d('--createFarmerSystemEvent done');
      await Future.delayed(const Duration(seconds: 30), () {});
      logger.d('--syncFarmerMasterData');
      await subscribeToSyncAllFarmerMasterData();
      logger.d('--syncFarmerMasterData done');
      emit(
        state.copyWith(
          syncMessage: 'Sync complete',
          isLoaded: true,
          isLoading: false,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 500), () {});
      await configService.setFarmerSynced(isSynced: true);
      onCompleted.call();
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          syncMessage: 'Sync error',
          isLoaded: false,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> createSubscriptions() async {
    final getSyncGroupSchemeAllMasterDataTopic =
        '$topicMasterDataSync*.$userDeviceId';
    final getFarmerTrickleFeedMasterDataTopicByFarmId =
        '$topicTrickleFeedFarmerMasterDataByFarmId*.$farmId';
    final getTrickleFeedMasterDataTopic =
        '$topicTrickleFeedFarmerMasterDataByFarmId*.Global';
    final getTrickleFeedMasterDataTopicByGroupSchemeId =
        '$topicTrickleFeedFgsMasterDataByGroupSchemeId*.$farmerGroupSchemeId';

    final futures = [
      getSyncGroupSchemeAllMasterDataTopic,
      getFarmerTrickleFeedMasterDataTopicByFarmId,
      getTrickleFeedMasterDataTopic,
      getTrickleFeedMasterDataTopicByGroupSchemeId,
    ]
        .map(
          (e) => cmoPerformApiService.createSubscription(
            topic: e,
            currentClientId: userDeviceId,
          ),
        )
        .toList();
    await Future.wait(futures);
  }

  Future<void> subscribeToSyncAllFarmerMasterData() async {
    var sync = true;
    while (sync) {
      MasterDataMessage? resPull;

      resPull = await cmoPerformApiService.pullMessage(
        topicMasterDataSync: topicMasterDataSync,
        currentClientId: userDeviceId,
      );

      final messages = resPull?.message;
      if (messages == null || messages.isEmpty) {
        sync = false;
        break;
      }

      final dbCompany = await cmoDatabaseMasterService.db;
      await dbCompany.writeTxn(() async {
        for (var i = 0; i < messages.length; i++) {
          final item = messages[i];

          final topic = item.header?.originalTopic;

          if (topic == '${topicMasterDataSync}Workers.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Workers...'));
            await insertWorker(item);
          } else if (topic ==
              '${topicMasterDataSync}SanctionRegister.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Disciplinary Register...'));
            await insertDisciplinaryRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}AnnFarmProd.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Annual Farm Production...'));
            await insertAnnualFarmProduction(item);
          } else if (topic == '${topicMasterDataSync}Camp.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Camps...'));
            await insertCamp(item);
          } else if (topic ==
              '${topicMasterDataSync}JobDescription.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Job Description...'));
            await insertJobDescription(item);
          } else if (topic == '${topicMasterDataSync}Country.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Country...'));
            await insertCountry(item);
          } else if (topic == '${topicMasterDataSync}Gender.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Gender...'));
            await insertGender(item);
          } else if (topic ==
              '${topicMasterDataSync}ScheduleActivity.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Schedule Activity...'));
            await insertScheduleActivity(item);
          } else if (topic ==
              '${topicMasterDataSync}GroupScheme.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Group Scheme...'));
            await insertGroupScheme(item);
          } else if (topic == '${topicMasterDataSync}SU.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Social Upliftment...'));
            await insertSocialUpliftment(item);
          } else if (topic == '${topicMasterDataSync}SS.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Special Site...'));
            await insertSpecialSite(item);
          } else if (topic == '${topicMasterDataSync}CUR.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Customary Use Right...'));
            await insertCustomaryUseRight(item);
          } else if (topic == '${topicMasterDataSync}SHT.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Stakeholder Type...'));
            await insertStakeholderType(item);
          } else if (topic == '${topicMasterDataSync}SH.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Stakeholder...'));
            await insertStakeholder(item);
          } else if (topic == '${topicMasterDataSync}FS.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Farm Stakeholder...'));
            await insertFarmStakeholder(item);
          } else if (topic == '${topicMasterDataSync}GSS.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing GroupScheme Stakeholder...'));
            await insertGroupSchemeStakeholder(item);
          } else if (topic == '${topicMasterDataSync}FSCUR.$userDeviceId') {
            emit(state.copyWith(
                syncMessage:
                    'Syncing Farm Stakeholder Customary Use Right...'));
            await insertFarmStakeholderCustomaryUseRight(item);
          } else if (topic == '${topicMasterDataSync}FSSU.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Farm Stakeholder Social Upliftment...'));
            await insertFarmStakeholderSocialUpliftment(item);
          } else if (topic == '${topicMasterDataSync}FSSS.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Farm Stakeholder Special Site...'));
            await insertFarmStakeholderSpecialSite(item);
          } else if (topic ==
              '${topicMasterDataSync}AnnFrmBudTransCat.$userDeviceId') {
            emit(state.copyWith(
                syncMessage:
                    'Syncing Annual Farm Annual Farm Budget Transaction Categories...'));
            await insertAnnualFarmBudgetTransactionCategory(item);
          } else if (topic == '${topicMasterDataSync}AnnFrmBud.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Annual Farm Budgets...'));
            await insertAnnualFarmBudget(item);
          } else if (topic ==
              '${topicMasterDataSync}AnnFrmBudTrans.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Annual Farm Budget Transactions...'));
            await insertAnnualFarmTransactionBudget(item);
          } else if (topic == '${topicMasterDataSync}Schedule.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Schedule...'));
            await insertSchedule(item);
          } else if (topic ==
              '${topicMasterDataSync}AaiRegister.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Accident and Incident Registers...'));
            await insertAccidentAndIncidentRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}BcaRegister.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Biological Control Agent Registers...'));
            await insertBiologicalControlAgentRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}ChemicalRegister.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Chemical Registers...'));
            await insertChemicalRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}AsiRegister.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Asi Registers...'));
            await insertAsiRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}FireRegister.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Fire Registers...'));
            await insertFireRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}CndRegister.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Complaints and Disputes Registers...'));
            await insertComplaintsAndDisputesRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}GrievanceRegister.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Grievance Registers...'));
            await insertGrievanceRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}PndRegister.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Pests and Diseases Registers...'));
            await insertPestsAndDiseasesRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}RteSpeciesRegister.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Rte Species Registers...'));
            await insertRteSpeciesRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}TrainingRegister.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Training Register...'));
            await insertTrainingRegister(item);
          } else if (topic ==
              '${topicMasterDataSync}AnimalType.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Species Type...'));
            await insertAnimalType(item);
          } else if (topic ==
              '${topicMasterDataSync}SpeciesRange.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Species Range...'));
            await insertSpeciesRange(item);
          } else if (topic ==
              '${topicMasterDataSync}MonitoringRequirement.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Monitoring Requirement...'));
            await insertMonitoringRequirement(item);
          } else if (topic ==
              '${topicMasterDataSync}TrainingType.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Training Type...'));
            await insertTrainingType(item);
          } else if (topic ==
              '${topicMasterDataSync}PestsAndDiseaseType.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Pests and Disease Type...'));
            await insertPestsAndDiseaseType(item);
          } else if (topic ==
              '${topicMasterDataSync}GrievanceIssue.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Grievance Issue...'));
            await insertGrievanceIssue(item);
          } else if (topic ==
              '${topicMasterDataSync}PropertyDamaged.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Property Damaged...'));
            await insertPropertyDamaged(item);
          } else if (topic == '${topicMasterDataSync}BCAType.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Biological Control Agent Type...'));
            await insertBiologicalControlAgentType(item);
          } else if (topic == '${topicMasterDataSync}IssueType.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Disciplinaries Issues...'));
            await insertIssueType(item);
          } else if (topic ==
              '${topicMasterDataSync}ChemicalType.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Chemical Type...'));
            await insertChemicalType(item);
          } else if (topic == '${topicMasterDataSync}AsiType.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Asi Type...'));
            await insertAsiType(item);
          } else if (topic == '${topicMasterDataSync}FireCause.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Fire Cause...'));
            await insertFireCause(item);
          } else if (topic ==
              '${topicMasterDataSync}NatureOfInjury.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Nature of Injury...'));
            await insertNatureOfInjury(item);
          } else if (topic == '${topicMasterDataSync}CAM.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Chemical Application Method...'));
            await insertChemicalApplicationMethod(item);
          } else if (topic ==
              '${topicMasterDataSync}TreatmentMethod.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Treatment Method...'));
            await insertTreatmentMethod(item);
          } else if (topic ==
              '${topicMasterDataSync}AsiRegisterPhoto.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Asi Register Photos...'));
            await insertAsiRegisterPhoto(item);
          } else if (topic ==
              '${topicMasterDataSync}AaiRegPropertyDamaged.$userDeviceId') {
            emit(state.copyWith(
                syncMessage:
                    'Syncing Accident and Incident Property Damaged...'));
            await insertAccidentAndIncidentPropertyDamaged(item);
          } else if (topic ==
              '${topicMasterDataSync}PndRegisterTreatmentMethod.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Pest and Disease Treatment Method...'));
            await insertPestsAndDiseasesRegisterTreatmentMethod(item);
          } else if (topic ==
              '${topicMasterDataSync}PndTypeTreatmentMethod.$userDeviceId') {
            emit(state.copyWith(
                syncMessage:
                    'Syncing Pests and Disease Type Treatment Method...'));
            await insertPestsAndDiseaseTypeTreatmentMethod(item);
          } else if (topic ==
              '${topicMasterDataSync}RteSpeciesRegisterPhoto.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Rte Species Register Photos...'));
            await insertRteSpeciesRegisterPhoto(item);
          }
        }
      });
      await cmoPerformApiService.commitMessageList(
        currentClientId: userDeviceId,
        messages: messages,
        topicMasterDataSync: topicMasterDataSync,
      );
    }
  }

  Future<int?> insertWorker(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final worker = FarmerWorker.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmerWorker(worker);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPestsAndDiseasesRegisterTreatmentMethod(
      Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = PestsAndDiseasesRegisterTreatmentMethod.fromJson(bodyJson);
      return cmoDatabaseMasterService
          .cachePetsAndDiseaseRegisterTreatmentMethod(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertDisciplinaryRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = SanctionRegister.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSanctionRegister(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAnnualFarmProduction(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AnnualFarmProduction.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAnnualProduction(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertCamp(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = Camp.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCamp(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertJobDescription(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = JobDescription.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheJobDescription(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertCountry(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = Country.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCountry(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGender(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = Gender.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheGender(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertScheduleActivity(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = ScheduleActivity.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheScheduleActivity(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGroupScheme(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = GroupScheme.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheGroupScheme(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertSocialUpliftment(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = SocialUpliftment.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSocialUpliftment(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertSpecialSite(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = SpecialSite.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSpecialSite(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertCustomaryUseRight(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = CustomaryUseRight.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCustomaryUseRight(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertStakeholderType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = StakeHolderType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheStakeHolderType(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = StakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheStakeHolder(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = FarmerStakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmStakeHolder(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGroupSchemeStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = GroupSchemeStakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheGroupSchemeStakeHolder(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmStakeholderCustomaryUseRight(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = CustomaryUseRight.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCustomaryUseRight(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmStakeholderSocialUpliftment(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = SocialUpliftment.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSocialUpliftment(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmStakeholderSpecialSite(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = FarmerStakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmStakeHolder(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAnnualFarmBudgetTransactionCategory(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AnnualBudgetTransactionCategory.fromJson(bodyJson);
      return cmoDatabaseMasterService
          .cacheAnnualFarmBudgetTransactionCategory(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAnnualFarmBudget(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AnnualBudget.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAnnualBudgets(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAnnualFarmTransactionBudget(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AnnualBudgetTransaction.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAnnualBudgetTransactions(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertSchedule(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = Schedule.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSchedule(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAccidentAndIncidentRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AccidentAndIncident.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAccidentAndIncident(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertBiologicalControlAgentRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = BiologicalControlAgent.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheBiologicalControlAgents(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertChemicalRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = Chemical.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheChemical(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAsiRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = Asi.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAsi(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFireRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = FireRegister.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFireRegister(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertComplaintsAndDisputesRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = PetsAndDiseaseRegister.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePetsAndDisease(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGrievanceRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = GrievanceRegister.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheGrievanceRegister(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPestsAndDiseasesRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = PetsAndDiseaseRegister.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePetsAndDisease(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertRteSpeciesRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = FarmerWorker.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmerWorker(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertTrainingRegister(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = TrainingRegister.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheTraining(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAnimalType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AnimalType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAnimalType(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertSpeciesRange(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = SpeciesRange.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSpeciesRange(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertMonitoringRequirement(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = MonitoringRequirement.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheMonitoringRequirement(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertTrainingType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = TrainingType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheTrainingType(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPestsAndDiseaseType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = PestsAndDiseaseType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePestsAndDiseaseType(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGrievanceIssue(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = GrievanceIssue.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheGrievanceIssue(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPropertyDamaged(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = PropertyDamaged.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePropertyDamaged(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertBiologicalControlAgentType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = BiologicalControlAgentType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheBiologicalControlAgentTypes(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertIssueType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = IssueType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheIssueType(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertChemicalType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = ChemicalType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheChemicalTypes(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAsiType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AsiType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAsiTypes(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFireCause(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = FireCause.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFireCause(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertNatureOfInjury(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = NatureOfInjury.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheNatureOfInjury(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertChemicalApplicationMethod(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = ChemicalApplicationMethod.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheChemicalApplicationMethods(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertTreatmentMethod(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = TreatmentMethod.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheTreatmentMethod(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAsiRegisterPhoto(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AsiPhoto.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAsiPhoto(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAccidentAndIncidentPropertyDamaged(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = AccidentAndIncidentPropertyDamaged.fromJson(bodyJson);
      return cmoDatabaseMasterService
          .cacheAccidentAndIncidentPropertyDamaged(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPestsAndDiseasesTreatmentMethod(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = PestsAndDiseaseTypeTreatmentMethod.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePetsAndDiseaseTreatmentMethod(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPestsAndDiseaseTypeTreatmentMethod(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = PestsAndDiseaseTypeTreatmentMethod.fromJson(bodyJson);
      return cmoDatabaseMasterService
          .cachePetsAndDiseaseTypeTreatmentMethod(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertRteSpeciesRegisterPhoto(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = RteSpeciesPhotoModel.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheRteSpeciesPhotos(rs);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }
}
