import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/sync/base_sync_cubit.dart';
import 'package:cmo/state/sync/base_sync_state.dart';
import 'package:cmo/utils/utils.dart';

part 'rm_sync_state.dart';

class RMSyncCubit extends BaseSyncCubit<RMSyncState> {
  RMSyncCubit() : super(RMSyncState()) {
    // TODO(DONG): test force init here
    sync();
  }

  final String topicRegionalManagerMasterDataSync =
      'Cmo.MasterDataDeviceSync.RM.';
  final String topicRegionalManagerUnitMasterDataSync =
      'Cmo.MasterDataDeviceSync.RMU.';

  // late UserDevice userDevice;

  // which group scheme of the RM is, also use for validating that the master data is synced or not
  // late GroupScheme groupScheme;

  // which rm unit is, used to display at sync screen
  // late RegionalManagerUnit rmUnit;

  // use the below for test data:
  int userId = 0;
  int userDeviceId = 0;
  final groupSchemeId = 1; // Luffy' pirate crew
  final rmuId = 6; // Jaundre's Unit

  Future<void> init() async {
    // TODO(DONG): init user device, group scheme, rm unit (implemented at Entity module by Nguyen Ngyen)
  }

  Future<void> sync() async {
    try {
      emit(
        state.copyWith(
          syncMessage: 'Syncing All Master Data...',
        ),
      );

      // TODO(DONG): force to create user device for test only
      logger.d('--createUserDevice');
      final res = await cmoApiService.createUserDevice(
        appName: 'GroupScheme',
        appVersionNumber: appInfoService.version,
        deviceId: deviceInfoService.deviceId ?? '',
        deviceOS: deviceInfoService.os,
        deviceVersion: deviceInfoService.version,
      );
      logger.d('--createUserDevice done: ${res!.userDeviceId}');
      userDeviceId = res.userDeviceId!;
      userId = res.userId!;
      // end

      logger.d('--RM Sync Data start');
      logger.d('--createSubscriptions');
      await createSubscriptions();
      logger.d('--createSubscriptions done');
      // TODO(DONG): Check if selected rmu has already been synced before do create below
      logger.d('--createRMSystemEvent');
      await cmoApiService.createRMSystemEvent(
          rmuId: rmuId, userDeviceId: userDeviceId);
      logger.d('--createRMSystemEvent done');
      await Future.delayed(const Duration(seconds: 3), () {});
      logger.d('--syncRegionalManagerMasterData');
      await syncRegionalManagerMasterData();
      logger.d('--syncRegionalManagerMasterData done');

      logger.d('--syncRegionalManagerUnitMasterData');
      await syncRegionalManagerUnitMasterData();
      logger.d('--syncRegionalManagerUnitMasterData done');

      emit(
        state.copyWith(
          syncMessage: 'Sync complete',
        ),
      );

      // TODO(DONG): update status for RM data synced to maybe GroupScheme (implemented at Entity module by Nguyen Nguyen)
      // Navigate to dashboard
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          syncMessage: 'Sync error',
        ),
      );
    }
  }

  Future<int?> insertStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final stakeHolder = RMStakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheRMStakeHolder(stakeHolder);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGroupSchemeStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final stakeHolder = GroupSchemeStakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheGroupSchemeStakeHolder(stakeHolder);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertStakeholderType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final type = StakeHolderType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheStakeHolderType(type);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmPropertyOwnershipType(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final type = FarmPropertyOwnershipType.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmPropertyOwnershipType(type);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertScheduleActivity(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final activity = ScheduleActivity.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheScheduleActivity(activity);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertSchedule(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final schedule = RMSchedule.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheRMSchedule(schedule);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertAuditTemplate(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final template = AuditTemplate.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheAuditTemplate(template);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertRejectReason(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final reason = RejectReason.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheRejectReason(reason);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertCriteria(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final criteria = Criteria.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCriteria(criteria);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPrinciple(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final principle = Principle.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePrinciple(principle);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertIndicator(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final indicator = Indicator.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheIndicator(indicator);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertImpactOn(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final impact = ImpactOn.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheImpactOn(impact);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertImpactCaused(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final impact = ImpactCaused.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheImpactCaused(impact);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertSeverity(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final severity = Severity.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSeverity(severity);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertRegionalManagerUnit(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final unit = RegionalManagerUnit.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheRegionalManagerUnit(unit);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertRiskProfileQuestion(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final question = RiskProfileQuestion.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheRiskProfileQuestion(question);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmMemberObjective(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final objective = FarmMemberObjective.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmMemberObjective(objective);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmObjectiveOption(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final option = FarmObjectiveOption.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmObjectiveOption(option);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertCompliance(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final compliance = Compliance.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCompliance(compliance);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertQuestion(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final question = FarmQuestion.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarmQuestion(question);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarm(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final farm = Farm.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheFarm(farm);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<void> createSubscriptions() async {
    final groupSchemeAllMasterDataTopic =
        '$topicRegionalManagerMasterDataSync*.$userDeviceId';
    final regionalManagerTrickleFeedMasterDataTopic =
        'Cmo.MasterData.RM.*.$groupSchemeId';
    const trickleFeedMasterDataTopic = 'Cmo.MasterData.*.Global';
    final userTrickleFeedMasterDataTopicByUserId =
        'Cmo.MasterData.User.*.$userId';
    final regionalManagerUnitAllMasterDataTopic =
        '$topicRegionalManagerUnitMasterDataSync*.$userDeviceId';
    final userTrickleFeedMasterDataTopicByRmuId = 'Cmo.MasterData.RMU.*.$rmuId';
    final futures = [
      groupSchemeAllMasterDataTopic,
      regionalManagerTrickleFeedMasterDataTopic,
      trickleFeedMasterDataTopic,
      userTrickleFeedMasterDataTopicByUserId,
      regionalManagerUnitAllMasterDataTopic,
      userTrickleFeedMasterDataTopicByRmuId
    ]
        .map((e) => cmoApiService.createSubscription(
            topic: e,
            pubsubApiKey: appInfoService.pubsubApiKey,
            currentClientId: userDeviceId))
        .toList();
    await Future.wait(futures);
  }

  Future<void> syncRegionalManagerMasterData() async {
    var sync = true;
    while (sync) {
      MasterDataMessage? resPull;

      resPull = await cmoApiService.pullMessage(
        topicMasterDataSync: topicRegionalManagerMasterDataSync,
        pubsubApiKey: appInfoService.pubsubApiKey,
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

          if (topic ==
              '${topicRegionalManagerMasterDataSync}SH.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Stakeholders...'));
            await insertStakeholder(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}GSS.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Group Scheme Stakeholders...'));
            await insertGroupSchemeStakeholder(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}SHT.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Stakeholder Types...'));
            await insertStakeholderType(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}PropOwnerType.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Property Ownership Type...'));
            await insertFarmPropertyOwnershipType(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}ScheduleActivity.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Schedule Activity...'));
            await insertScheduleActivity(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}Schedule.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Schedule...'));
            await insertSchedule(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}AuditTemplate.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Audit Template...'));
            await insertAuditTemplate(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}RejectReason.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Reject Reason...'));
            await insertRejectReason(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}Criteria.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Criteria...'));
            await insertCriteria(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}Principle.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Principle...'));
            await insertPrinciple(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}Indicator.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Indicator...'));
            await insertIndicator(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}ImpactOn.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Impact On...'));
            await insertImpactOn(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}ImpactCaused.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Impact Caused...'));
            await insertImpactCaused(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}Severity.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Severity...'));
            await insertSeverity(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}RMU.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Regional Manager Unit...'));
            await insertRegionalManagerUnit(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}RiskProQuestion.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Risk Profile Question...'));
            await insertRiskProfileQuestion(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}FrmMemObj.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Farm Member Objective...'));
            await insertFarmMemberObjective(item);
          } else if (topic ==
              '${topicRegionalManagerMasterDataSync}FrmObjOpt.$userDeviceId') {
            emit(state.copyWith(
                syncMessage: 'Syncing Farm Objective Option...'));
            await insertFarmObjectiveOption(item);
          }
        }
      });
      await cmoApiService.commitMessageList(
        pubsubApiKey: appInfoService.pubsubApiKey,
        currentClientId: userDeviceId,
        messages: messages,
        topicMasterDataSync: topicRegionalManagerMasterDataSync,
      );
    }
  }

  Future<void> syncRegionalManagerUnitMasterData() async {
    var sync = true;
    while (sync) {
      MasterDataMessage? resPull;

      resPull = await cmoApiService.pullMessage(
        topicMasterDataSync: topicRegionalManagerUnitMasterDataSync,
        pubsubApiKey: appInfoService.pubsubApiKey,
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

          if (topic ==
              '${topicRegionalManagerUnitMasterDataSync}Compliance.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Compliances...'));
            await insertCompliance(item);
          } else if (topic ==
              '${topicRegionalManagerUnitMasterDataSync}Question.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Questions...'));
            await insertQuestion(item);
          } else if (topic ==
              '${topicRegionalManagerUnitMasterDataSync}Farm.$userDeviceId') {
            emit(state.copyWith(syncMessage: 'Syncing Farms...'));
            await insertFarm(item);
          }
        }
      });

      await cmoApiService.commitMessageList(
        pubsubApiKey: appInfoService.pubsubApiKey,
        currentClientId: userDeviceId,
        messages: messages,
        topicMasterDataSync: topicRegionalManagerUnitMasterDataSync,
      );
    }
  }
}
