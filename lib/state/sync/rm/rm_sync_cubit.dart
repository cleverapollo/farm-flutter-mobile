import 'dart:convert';
import 'dart:developer';

import 'package:cmo/di.dart';
import 'package:cmo/env/env.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/audit/audit_payload.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/group_scheme_stakeholder_payload/group_scheme_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_group_scheme_stakeholder_payload/main_group_scheme_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/properties_payload/properties_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/stakeholder_payload/stakeholder_payload.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/base_sync_cubit.dart';
import 'package:cmo/state/sync/base_sync_state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';

part 'rm_sync_state.dart';

class RMSyncCubit extends BaseSyncCubit<RMSyncState> {
  RMSyncCubit({required this.userInfoCubit, required this.userDeviceCubit})
      : super(RMSyncState()) {
    init();
  }

  final UserInfoCubit userInfoCubit;
  final UserDeviceCubit userDeviceCubit;

  final String topicRegionalManagerMasterDataSync =
      'Cmo.MasterDataDeviceSync.RM.';
  final String topicRegionalManagerUnitMasterDataSync =
      'Cmo.MasterDataDeviceSync.RMU.';

  final String trickleFeedMasterDataTopic = 'Cmo.MasterData.RM.*.Global';

  int get userId => state.userInfo!.userId!;

  int get userDeviceId => userDeviceCubit.data!.userDeviceId!;

  int get groupSchemeId => state.groupScheme!.groupSchemeId!;

  int get rmuId => state.rmUnit!.regionalManagerUnitId!;

  Future<void> init() async {
    final groupScheme = await configService.getActiveGroupScheme();
    final rmUnit = await configService.getActiveRegionalManager();
    final userInfo = await configService.getActiveUser();
    emit(
      state.copyWith(
        groupScheme: groupScheme,
        rmUnit: rmUnit,
        userInfo: userInfo,
      ),
    );
  }

  Future<void> getSummaryInformation() async {

    final summaryInformation = RmSyncSummaryInformation();
    await cmoDatabaseMasterService.getAllAudits().then((audits) {
      summaryInformation.unsyncedAudit = audits
          .where(
            (element) => element.completed == true && element.synced == false,
          )
          .toList()
          .length;
      summaryInformation.inProgressAudit = audits
          .where(
            (element) => element.completed == false && element.synced == false,
          )
          .toList()
          .length;
    });

    await cmoDatabaseMasterService
        .getUnsyncedFarmsByRegionalManagerUnitId(rmuId)
        .then((value) => summaryInformation.unsyncedFarm = value?.length ?? 0);

    await cmoDatabaseMasterService
        .getFarmByRmuId(rmuId)
        .then((value) => summaryInformation.totalFarms = value?.length ?? 0);

    await cmoDatabaseMasterService
        .getAuditTemplatesByRMU(rmuId)
        .then((value) => summaryInformation.auditTemplates = value.length);

    await cmoDatabaseMasterService
        .getCompliancesByRmuId(rmuId: rmuId)
        .then((value) => summaryInformation.compliances = value?.length ?? 0);

    await cmoDatabaseMasterService
        .getCriterias()
        .then((value) => summaryInformation.compliances = value.length);

    await cmoDatabaseMasterService
        .getAllFarmMemberObjectiveByGroupSchemeId(groupSchemeId)
        .then(
            (value) => summaryInformation.farmMemberObjectives = value.length);

    await cmoDatabaseMasterService
        .getFarmObjectiveOptionByGroupSchemeId(groupSchemeId)
        .then(
            (value) => summaryInformation.farmObjectivesOptions = value.length);

    await cmoDatabaseMasterService.getFarmPropertyOwnershipType().then(
        (value) =>
            summaryInformation.farmPropertyOwnershipTypes = value.length);

    await cmoDatabaseMasterService
        .getGroupSchemeStakeholderByGroupSchemeId(groupSchemeId)
        .then((value) => summaryInformation.groupScheme = value.length);

    await cmoDatabaseMasterService
        .getImpactCauseds()
        .then((value) => summaryInformation.impactCaused = value.length);

    await cmoDatabaseMasterService
        .getImpactOns()
        .then((value) => summaryInformation.impactOn = value.length);

    await cmoDatabaseMasterService
        .getIndicators()
        .then((value) => summaryInformation.indicators = value.length);

    await cmoDatabaseMasterService
        .getPrinciples()
        .then((value) => summaryInformation.principle = value.length);

    await cmoDatabaseMasterService
        .getFarmQuestionsByRmuId(rmuId: rmuId)
        .then((value) => summaryInformation.question = value?.length ?? 0);

    await cmoDatabaseMasterService.getRegionalManagerUnits().then(
        (value) => summaryInformation.resourceManagementUnits = value.length);

    await cmoDatabaseMasterService
        .getRejectReasons()
        .then((value) => summaryInformation.rejectReasons = value.length);

    await cmoDatabaseMasterService
        .getRiskProfileQuestionByGroupSchemeId(groupSchemeId)
        .then(
            (value) => summaryInformation.riskProfileQuestions = value.length);

    await cmoDatabaseMasterService
        .getSeverities()
        .then((value) => summaryInformation.severity = value.length);

    await cmoDatabaseMasterService.getUnsycnedStakeholders().then(
        (value) => summaryInformation.unsyncedStakeholders = value.length);

    await cmoDatabaseMasterService
        .getStakeHolderTypes()
        .then((value) => summaryInformation.stakeholderTypes = value.length);

    emit(state.copyWith(rmSyncSummaryInformation: summaryInformation));
  }

  Future<void> sync(BuildContext context) async {
    try {
      emit(
        state.copyWith(
            syncMessage: 'Syncing All Master Data...', isLoading: true),
      );

      logger.d('--RM Sync Data start');
      await Future.delayed(const Duration(seconds: 5));
      logger.d('--createSubscriptions');
      await createSubscriptions();
      logger.d('--createSubscriptions done');
      logger.d('--createRMSystemEvent');
      await cmoPerformApiService.createRMSystemEvent(
        rmuId: rmuId,
        userDeviceId: userDeviceId,
      );
      logger.d('--createRMSystemEvent done');
      await Future.delayed(const Duration(seconds: 5), () {});
      logger.d('--syncRegionalManagerMasterData');
      await syncRegionalManagerMasterData();
      logger.d('--syncRegionalManagerMasterData done');

      logger.d('--syncRegionalManagerUnitMasterData');
      await syncRegionalManagerUnitMasterData();
      logger.d('--syncRegionalManagerUnitMasterData done');

      logger.d('--insertByCallingAPI start');
      await insertByCallingAPI();
      logger.d('--insertByCallingAPI done');

      emit(
        state.copyWith(
            syncMessage: 'Sync complete', isLoaded: true, isLoading: false),
      );
      await Future.delayed(const Duration(milliseconds: 500), () {});
      await configService.setRMSynced(isSynced: true);
      if (context.mounted) CmoDashboardBase.push(context);
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
            syncMessage: 'Sync error', isLoaded: false, isLoading: false),
      );
    }
  }

  Future<void> syncSummary({
    required VoidCallback onSuccess,
  }) async {
    try {
      logger.d('--RM Sync Summary start--');
      emit(
        state.copyWith(
          syncMessage: 'RM Summary Syncing...',
          isLoading: true,
        ),
      );
      await publishFarm();
      await publishGroupSchemeStakeholders();

      await Future.delayed(const Duration(seconds: 15), () async {
        await subscribeToRegionalManagerTrickleFeedMasterDataTopic();
        await subscribeToRegionalManagerTrickleFeedTopicByGroupSchemeId();
        await subscribeToRegionalManagerUnitTrickleFeedTopicByRegionalManagerUnitId();
        await publishCompartments();
        await Future.delayed(const Duration(seconds: 5), () async {
          await publishASIs();
          await publishAudits();
        });

        emit(
          state.copyWith(
            syncMessage: 'Sync complete',
            isLoaded: true,
            isLoading: false,
          ),
        );
        await Future.delayed(const Duration(seconds: 2), () async {
          await getSummaryInformation();
          onSuccess.call();
        });
      });
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          syncMessage: 'Sync Failed, please check your network connectivity. Contact support if the problem persists.',
          isLoaded: false,
          isLoading: false,
        ),
      );
    }
  }

  List<Properties> getMessageProperties() {
    return [
      Properties(
        key: 'DbSchemaVersion',
        value: Env.dbSchemaVersion,
      ),
    ];
  }

  Future<void> publishFarm() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing Farms...',
        isLoading: true,
      ),
    );

    try {
      final publishFarmTopic = 'Cmo.MasterData.RM.Farm.$groupSchemeId.$userDeviceId';
      logger.d('Get unsynced farms by rmuIds: $rmuId');
      final farms = await cmoDatabaseMasterService.getUnsyncedFarmsByRegionalManagerUnitId(rmuId);
      if (farms.isNotBlank) {
        logger.d('Unsynced farms count: ${farms!.length}');
        for (final farm in farms) {
          final objectiveAnswers = await cmoDatabaseMasterService.getFarmMemberObjectiveAnswerByFarmIdAndIsMasterDataSynced(farm.farmId);
          final riskProfileAnswers = await cmoDatabaseMasterService.getFarmMemberRiskProfileAnswerByFarmIdAndIsMasterDataSynced(farm.farmId);
          final message = Message(
            properties: getMessageProperties(),
            body: jsonEncode(
              farm
                  .copyWith(
                    objectiveAnswers: objectiveAnswers,
                    riskProfileAnswers: riskProfileAnswers,
                    signatureImage: farm.signatureImage.stringToBase64SyncServer,
                  )
                  .toJson(),
            ),
          );

          log(jsonEncode(
            farm
                .copyWith(
              objectiveAnswers: objectiveAnswers,
              riskProfileAnswers: riskProfileAnswers,
              signatureImage: '',
            )
                .toJson(),
          ));

          logger.d('Publish message to topic $publishFarmTopic');
          final isPublicFarm = await cmoPerformApiService.public(
            currentClientId: userDeviceId.toString(),
            topic: publishFarmTopic,
            messages: [message],
          );

          if (isPublicFarm) {
            var isSyncedSuccess = false;
            var stopwatch = Stopwatch()..start();
            while (!isSyncedSuccess && stopwatch.elapsedMilliseconds < 120000) {
              await Future.delayed(const Duration(milliseconds: 800));
              final farms = await cmoPerformApiService.getFarmSearch(filterString: farm.farmName);
              final isExist = farms.firstWhereOrNull((element) => element.farmId == farm.farmId);
              if (isExist != null) {
                isSyncedSuccess = true;
              }
            }

            stopwatch.stop();
            if (isSyncedSuccess) {
              await cmoDatabaseMasterService.cacheFarmAddMember(
                farm.copyWith(
                  isMasterDataSynced: 1,
                  canDelete: 0,
                ),
              );

              for (final objectiveAnswer in objectiveAnswers) {
                await cmoDatabaseMasterService.cacheFarmMemberObjectiveAnswer(
                  objectiveAnswer.copyWith(
                    isMasterDataSynced: true,
                  ),
                );
              }

              for (final riskProfileAnswer in riskProfileAnswers) {
                await cmoDatabaseMasterService.cacheFarmMemberRiskProfileAnswer(
                  riskProfileAnswer.copyWith(
                    isMasterDataSynced: true,
                  ),
                );
              }

              logger.d('Successfully published farmId: ${farm.farmId}');
            } else {
              showSnackError(msg: 'Publish Farm error: ${farm.farmName}');
              logger.e('Failed to publish farmId: ${farm.farmId}');
            }
          } else {
            showSnackError(msg: 'Publish Farm error: ${farm.farmName}');
            logger.e('Failed to publish farmId: ${farm.farmId}');
          }
        }
      } else {
        logger.d('No farm to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> publishAudits() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing Audits, Comments and Photos...',
        isLoading: true,
      ),
    );

    try {
      final publishAuditsTopic = 'Cmo.Assessment.RM.Complete.$groupSchemeId.$userDeviceId';
      logger.d('Get unsynced /audits by userId');
      var audits = await cmoDatabaseMasterService.getAllAudits();
      if (audits.isNotBlank) {
        audits = audits
            .where(
              (element) => element.completed == true && element.synced == false,
            )
            .toList();
        logger.d('Unsynced audit: ${audits.length}');

        for (var audit in audits) {
          var auditPayload = AuditPayload.fromAudit(audit).copyWith(
            userDeviceId: userDeviceId,
            userId: userId,
          );

          var auditQuestionAnswers = const AssessmentQuestionAnswers();

          final questionAnswers = await cmoDatabaseMasterService
              .getQuestionAnswersByRmuIdAndAuditTemplateIdAndAssessmentId(
            rmuId: rmuId,
            assessmentId: audit.assessmentId,
            auditTemplateId: audit.auditTemplateId,
          );

          auditQuestionAnswers = auditQuestionAnswers.copyWith(questionAnswer: questionAnswers);

          for (final answer in questionAnswers) {
            final questionComments = await cmoDatabaseMasterService.getQuestionComments(
              audit.assessmentId!,
              answer.questionId!,
            );

            auditQuestionAnswers = auditQuestionAnswers.copyWith(questionComment: auditQuestionAnswers.questionComment + questionComments);

            final questionPhotos = await cmoDatabaseMasterService.getQuestionPhotosByAssessmentIdAndQuestionId(
              assessmentId: audit.assessmentId,
              questionId: answer.questionId,
            );

            auditQuestionAnswers = auditQuestionAnswers.copyWith(
              questionPhoto: auditQuestionAnswers.questionPhoto +
                  questionPhotos.map((e) => e.toPayLoadWithBase64()).toList(),
            );
          }

          auditPayload = auditPayload.copyWith(assessmentQuestionAnswers: auditQuestionAnswers);
          logger.d('Assign assessment/audit Payload to message $auditPayload');

          final message = Message(
            properties: getMessageProperties(),
            body: jsonEncode(
              auditPayload.toJson(),
            ),
          );

          logger.d('Publish message to topic $publishAuditsTopic');

          final isPublicFarm = await cmoPerformApiService.public(
            currentClientId: userDeviceId.toString(),
            topic: publishAuditsTopic,
            messages: [message],
          );

          if (isPublicFarm) {
            await cmoDatabaseMasterService.cacheAudit(
              audit.copyWith(
                synced: true,
              ),
            );

            logger.d('Successfully published assessments/audits: ${audit.id}');
          } else {
            logger.e('Failed to publish assessments/audits: ${audit.id}');
          }
        }
      } else {
        logger.d('No assessments/audits to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> publishGroupSchemeStakeholders() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing Group Scheme Stakeholders...',
        isLoading: true,
      ),
    );

    try {
      final publishGroupSchemeStakeholdersTopic = 'Cmo.MasterData.RM.GSS.$groupSchemeId.$userDeviceId';
      logger.d('Get unsynced group scheme stakeholders');
      final groupSchemas = await cmoDatabaseMasterService.getGroupSchemeStakeholderByGroupSchemeId(groupSchemeId);
      final unsyncedStakeholders = await cmoDatabaseMasterService.getUnsycnedStakeholders();
      final groupSchemeStakeholderPayloads = <MainGroupSchemeStakeholderPayLoad>[];

      for (final stakeholder in unsyncedStakeholders) {
        var mainGroupSchemeStakeholderPayLoad = MainGroupSchemeStakeholderPayLoad();
        mainGroupSchemeStakeholderPayLoad = mainGroupSchemeStakeholderPayLoad.copyWith(Stakeholder: StakeholderPayLoad.fromStakeholder(stakeholder));
        final groupSchema = groupSchemas.firstWhereOrNull(
          (element) =>
              element.stakeholderId ==
              mainGroupSchemeStakeholderPayLoad.Stakeholder?.StakeholderId,
        );

        if (groupSchema != null) {
          mainGroupSchemeStakeholderPayLoad = mainGroupSchemeStakeholderPayLoad.copyWith(
            GroupSchemeStakeholder: GroupSchemeStakeholderPayLoad.fromGroupSchemeStakeholder(groupSchema),
          );
        }

        groupSchemeStakeholderPayloads.add(mainGroupSchemeStakeholderPayLoad);
      }


      if (groupSchemeStakeholderPayloads.isNotBlank) {
        logger.d('Unsynced group scheme stakeholders count: ${groupSchemeStakeholderPayloads.length}');

        for (var groupSchemeStakeholderPayload in groupSchemeStakeholderPayloads) {
          final message = Message(
            properties: getMessageProperties(),
            body: jsonEncode(groupSchemeStakeholderPayload.toJson()),
          );

          logger.d('Publish message to topic $publishGroupSchemeStakeholdersTopic');

          final isPublic = await cmoPerformApiService.public(
            currentClientId: userDeviceId.toString(),
            topic: publishGroupSchemeStakeholdersTopic,
            messages: [message],
          );

          if (isPublic) {
            await (await cmoDatabaseMasterService.db).writeTxn(() async {
              logger.d('Try update stakeholder status to synced');
              await cmoDatabaseMasterService.cacheStakeHolder(
                StakeHolder.fromStakeholderPayLoad(
                  groupSchemeStakeholderPayload.Stakeholder!.copyWith(
                    IsMasterDataSynced: 1,
                  ),
                ),
              );

              logger.d('Try update group scheme stakeholder status to synced');

              if (groupSchemeStakeholderPayload.GroupSchemeStakeholder != null) {
                await cmoDatabaseMasterService.cacheGroupSchemeStakeholder(
                  GroupSchemeStakeholder.fromGroupSchemeStakeholderPayLoad(
                    groupSchemeStakeholderPayload.GroupSchemeStakeholder!.copyWith(
                      IsMasterDataSynced: 1,
                    ),
                  ),
                );
              }

              logger.d('Successfully published groupSchemeStakeholderId: ${groupSchemeStakeholderPayload.GroupSchemeStakeholder?.GroupSchemeStakeholderId}');
            });
          } else {
            logger.e('Failed to publish groupSchemeStakeholderId: ${groupSchemeStakeholderPayload.GroupSchemeStakeholder?.GroupSchemeStakeholderId}');
          }
        }
      } else {
        logger.d('No group scheme stakeholders to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> publishCompartments() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing Compartments...',
        isLoading: true,
      ),
    );

    try {
      logger.d('Get unsynced compartment');
      final compartments = await cmoDatabaseMasterService.getCompartmentsByGroupSchemeId(groupSchemeId: groupSchemeId);
      if (compartments.isNotBlank) {
        logger.d('Unsynced compartments count: ${compartments.length}');
        for (final compartment in compartments) {
          final syncedCompartment = await cmoPerformApiService.insertUpdatedCompartment(compartment);
          if (syncedCompartment != null) {
            await cmoDatabaseMasterService.cacheCompartment(
              syncedCompartment.copyWith(
                isMasterdataSynced: true,
                localCompartmentId: compartment.localCompartmentId,
                productGroupTemplateName: compartment.productGroupTemplateName,
                speciesGroupTemplateName: compartment.speciesGroupTemplateName,
                espacementWidth: compartment.espacementWidth,
                espacementLength: compartment.espacementLength,
              ),
              isDirect: true,
            );

            logger.d('Successfully published compartment: ${syncedCompartment.managementUnitId}');
          } else {
            logger.e('Failed to publish compartment: ${compartment.managementUnitId}');
          }
        }
      } else {
        logger.d('No Compartments to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> publishASIs() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing ASI...',
        isLoading: true,
      ),
    );

    try {
      logger.d('Get unsynced ASI');
      final listASI = await cmoDatabaseMasterService.getRMAsiRegister();
      final compartments = await cmoDatabaseMasterService.getAllCompartments();

      if (listASI.isNotBlank) {
        logger.d('Unsynced ASI count: ${listASI.length}');
        for (final asi in listASI) {
          final managementUnitId = compartments
              .firstWhereOrNull((element) => element.localCompartmentId == asi.localCompartmentId)
              ?.managementUnitId;

          final syncedAsi = await cmoPerformApiService.insertUpdatedASI(
            asi.copyWith(
              managementUnitId: asi.managementUnitId ?? managementUnitId,
            ),
          );

          if (syncedAsi != null) {
            await cmoDatabaseMasterService.cacheAsi(
              syncedAsi.copyWith(
                localId: asi.localId,
                localCompartmentId: asi.localCompartmentId,
                compartmentName: asi.compartmentName,
                managementUnitId: asi.managementUnitId ?? managementUnitId,
                asiTypeName: asi.asiTypeName,
                isMasterdataSynced: true,
              ),

              isDirect: true,
            );

            final listAsiPhotos = await cmoDatabaseMasterService.getAllAsiPhotoByAsiRegisterLocalId(asi.localId);
            await publishListAsiPhotos(
              asi: syncedAsi.copyWith(localId: asi.localId),
              listAsiPhotos: listAsiPhotos,
            );

            logger.d('Successfully published ASI: ${syncedAsi.asiRegisterId}');
          } else {
            logger.e('Failed to publish ASI: ${syncedAsi?.asiRegisterId}');
          }
        }
      } else {
        logger.d('No ASI to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> publishListAsiPhotos({
    required Asi asi,
    List<AsiPhoto>? listAsiPhotos,
  }) async {
    try {
      logger.d('Get unsynced ASI Photos');
      if (listAsiPhotos.isNotBlank) {
        logger.d('Unsynced ASI Photos count: ${listAsiPhotos!.length}');
        for (final asiPhoto in listAsiPhotos) {
          final syncedAsiPhoto = await cmoPerformApiService.insertUpdatedAsiPhoto(
            asiPhoto.copyWith(
              photo: asiPhoto.photo.stringToBase64SyncServer,
              asiRegisterId: asi.asiRegisterId,
              asiRegisterNo: asi.asiRegisterNo,
            ),
          );

          if (syncedAsiPhoto != null) {
            await cmoDatabaseMasterService.cacheAsiPhoto(
              syncedAsiPhoto.copyWith(
                photo: syncedAsiPhoto.photo?.base64SyncServerToString,
                asiRegisterLocalId: asi.localId,
                isMasterdataSynced: true,
              ),
            );

            logger.d('Successfully published ASI: ${syncedAsiPhoto.asiRegisterPhotoId}');
          } else {
            logger.e('Failed to publish ASI: ${syncedAsiPhoto?.asiRegisterPhotoId}');
          }
        }
      } else {
        logger.d('No ASI Photos to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<int?> insertStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final stakeHolder = StakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheStakeHolder(stakeHolder);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGroupSchemeStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final stakeholder = GroupSchemeStakeholder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheGroupSchemeStakeholder(stakeholder);
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

      final objectiveAnswersJson = bodyJson['ObjectiveAnswers'] as List;
      final riskProfileAnswersJson = bodyJson['RiskProfileAnswers'] as List;

      final objectiveAnswers = objectiveAnswersJson
          .map(
            (e) => FarmMemberObjectiveAnswer.fromJson(
              (e as Map).map(
                (key, value) => MapEntry(key as String, value),
              ),
            ).copyWith(
              isMasterDataSynced: true,
            ),
          )
          .toList();
      final riskProfileAnswers = riskProfileAnswersJson
          .map(
            (e) => FarmMemberRiskProfileAnswer.fromJson(
              (e as Map).map(
                (key, value) => MapEntry(key as String, value),
              ),
            ).copyWith(
              isMasterDataSynced: true,
            ),
          )
          .toList();

      for (final objectiveAnswer in objectiveAnswers) {
        await cmoDatabaseMasterService.cacheFarmMemberObjectiveAnswer(
          objectiveAnswer,
          isDirect: true,
        );
      }

      for (final riskProfileAnswer in riskProfileAnswers) {
        await cmoDatabaseMasterService.cacheFarmMemberRiskProfileAnswer(
            riskProfileAnswer,
            isDirect: true,
        );
      }

      return cmoDatabaseMasterService.cacheFarm(
        farm.copyWith(
          isMasterDataSynced: 1,
          isLocal: 0,
          signatureImage: farm.signatureImage.base64SyncServerToString,
        ),
      );
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<void> insertCompartmentsByRMUId() async {
    emit(state.copyWith(syncMessage: 'Syncing Compartments...'));
    final compartments = await cmoPerformApiService.getCompartmentsByRMUId();
    final productGroupTemplates = await cmoDatabaseMasterService.getProductGroupTemplates(groupSchemeId);
    final speciesGroupTemplates = await cmoDatabaseMasterService.getSpeciesGroupTemplates(groupSchemeId);
    if (compartments.isNotBlank) {
      for (final compartment in compartments!) {
        final productGroupTemplate = productGroupTemplates.firstWhereOrNull((element) => element.productGroupTemplateId == compartment.productGroupTemplateId);
        final speciesGroupTemplate = speciesGroupTemplates.firstWhereOrNull((element) => element.speciesGroupTemplateId == compartment.speciesGroupTemplateId);
        await cmoDatabaseMasterService.cacheCompartment(
          compartment.copyWith(
            localCompartmentId: compartment.managementUnitId.toIdIsarFromUuid,
            productGroupTemplateName: productGroupTemplate?.productGroupTemplateName,
            speciesGroupTemplateName: speciesGroupTemplate?.speciesGroupTemplateName,
          ),
        );
      }
    }
  }

  Future<void> insertAreaTypes() async {
    emit(state.copyWith(syncMessage: 'Syncing Area Type...'));
    final areaTypes = await cmoPerformApiService.fetchAreaTypes();
    if (areaTypes.isNotBlank) {
      for (final areaType in areaTypes!) {
        await cmoDatabaseMasterService.cacheAreaTypes(areaType);
      }
    }
  }

  Future<void> insertProductGroupTemplates() async {
    emit(state.copyWith(syncMessage: 'Syncing Product Group Template...'));
    final productGroupTemplates = await cmoPerformApiService.fetchProductGroupTemplates();
    if (productGroupTemplates.isNotBlank) {
      for (final productGroupTemplate in productGroupTemplates!) {
        await cmoDatabaseMasterService.cacheProductGroupTemplates(productGroupTemplate);
      }
    }
  }

  Future<void> insertSpeciesGroupTemplates() async {
    emit(state.copyWith(syncMessage: 'Syncing Species Group Template...'));
    final speciesGroupTemplates = await cmoPerformApiService.fetchSpeciesGroupTemplates();
    if (speciesGroupTemplates.isNotBlank) {
      for (final speciesGroupTemplate in speciesGroupTemplates!) {
        await cmoDatabaseMasterService.cacheSpeciesGroupTemplates(speciesGroupTemplate);
      }
    }
  }

  Future<void> insertAsiTypes() async {
    emit(state.copyWith(syncMessage: 'Syncing ASI Types...'));
    final asiTypes = await cmoPerformApiService.fetchRMAsiType();
    if (asiTypes.isNotBlank) {
      for (final asiType in asiTypes!) {
        await cmoDatabaseMasterService.cacheAsiTypes(asiType);
      }
    }
  }

  Future<void> insertRMAsiRegisters() async {
    emit(state.copyWith(syncMessage: 'Syncing ASI Registers...'));
    final listAsi = await cmoPerformApiService.getRMAsiRegisters();
    final listCompartments = await cmoDatabaseMasterService.getAllCompartments();
    final asiTypes = await cmoDatabaseMasterService.getAsiTypes();

    if (listAsi.isNotBlank) {
      var now = DateTime.now().microsecondsSinceEpoch;
      for (final asi in listAsi!) {
        final localId = now++;
        final compartment = listCompartments.firstWhereOrNull((element) => element.managementUnitId == asi.managementUnitId);
        final asiType = asiTypes.firstWhereOrNull((element) => element.asiTypeId == asi.asiTypeId);
        await cmoDatabaseMasterService.cacheAsi(
          asi.copyWith(
            localId: localId,
            compartmentName: compartment?.unitNumber,
            localCompartmentId: compartment?.localCompartmentId,
            asiTypeName: asiType?.asiTypeName,
          ),
          isDirect: true,
        );

        // final listAsiPhotos = await cmoPerformApiService.getRMAsiRegisterPhotosByAsiRegisterId(asi.asiRegisterId);
        // await insertRMAsiPhotos(localId, listAsiPhotos);
      }
    }
  }

  Future<void> insertRMAsiPhotos(int? asiRegisterLocalId, List<AsiPhoto>? listAsiPhoto) async {
    if (listAsiPhoto.isNotBlank) {
      for (final asiPhoto in listAsiPhoto!) {
        await cmoDatabaseMasterService.cacheAsiPhoto(
          asiPhoto.copyWith(
            photo: asiPhoto.photo.base64SyncServerToString,
            asiRegisterLocalId: asiRegisterLocalId,
          ),
          isDirect: true,
        );
      }
    }
  }

  Future<void> insertByCallingAPI({bool isOnlyCompartment = false}) async {
    final dbCompany = await cmoDatabaseMasterService.db;
    await dbCompany.writeTxn(() async {
      if (!isOnlyCompartment) {
        logger.d('--getProductGroupTemplates start');
        await insertProductGroupTemplates();
        logger.d('--getProductGroupTemplates done');

        logger.d('--getSpeciesGroupTemplates start');
        await insertSpeciesGroupTemplates();
        logger.d('--getSpeciesGroupTemplates done');

        logger.d('--getAreaTypes start');
        await insertAreaTypes();
        logger.d('--getAreaTypes done');
      }

      logger.d('--insertCompartmentsByRMUId start');
      await insertCompartmentsByRMUId();
      logger.d('--getCompartmentsByRMUId done');

      logger.d('--insertAsiTypes start');
      await insertAsiTypes();
      logger.d('--insertAsiTypes done');

      logger.d('--insertRMAsiRegisters start');
      await insertRMAsiRegisters();
      logger.d('--insertRMAsiRegisters done');
    });
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
      userTrickleFeedMasterDataTopicByRmuId,
    ]
        .map((e) => subscribe(e),
        )
        .toList();
    await Future.wait(futures);
  }

  Future<void> subscribe(String topic) async {
    await cmoPerformApiService.createSubscription(
      topic: topic,
      currentClientId: userDeviceId,
    );
  }

  Future<void> syncRegionalManagerMasterData() async {
    var sync = true;
    var hasData = false;
    while (sync) {
      MasterDataMessage? resPull;

      resPull = await cmoPerformApiService.pullMessage(
        topicMasterDataSync: topicRegionalManagerMasterDataSync,
        currentClientId: userDeviceId,
      );

      final messages = resPull?.message;
      if (messages == null || messages.isEmpty) {
        sync = false;
        break;
      } else {
        hasData = true;
        await insertRegionalManagerMasterDataToLocal(messages);
        await cmoPerformApiService.commitMessageList(
          currentClientId: userDeviceId,
          messages: messages,
          topicMasterDataSync: topicRegionalManagerMasterDataSync,
        );
      }
    }

    final riskProfileQuestions = await cmoDatabaseMasterService.getRiskProfileQuestionByGroupSchemeId(groupSchemeId);
    final farmMemberObjective = await cmoDatabaseMasterService.getAllFarmMemberObjectiveByGroupSchemeId(groupSchemeId);

    if (hasData == false || riskProfileQuestions.isBlank || farmMemberObjective.isBlank) {
      await Future.delayed(const Duration(milliseconds: 800));
      await syncRegionalManagerMasterData();
    }
  }

  Future<void> insertRegionalManagerMasterDataToLocal(List<Message> messages) async {
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
  }

  Future<void> syncRegionalManagerUnitMasterData() async {
    var sync = true;
    while (sync) {
      MasterDataMessage? resPull;

      resPull = await cmoPerformApiService.pullMessage(
        topicMasterDataSync: topicRegionalManagerUnitMasterDataSync,
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

      await cmoPerformApiService.commitMessageList(
        currentClientId: userDeviceId,
        messages: messages,
        topicMasterDataSync: topicRegionalManagerUnitMasterDataSync,
      );
    }
  }

  Future<void> subscribeToRegionalManagerTrickleFeedMasterDataTopic() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing RM Updated Master Data...',
        isLoading: true,
      ),
    );

    try {
      var sync = true;
      while (sync) {
        MasterDataMessage? resPull;
        await subscribe(trickleFeedMasterDataTopic);
        logger.d('Subscribe to topic $trickleFeedMasterDataTopic');
        resPull = await cmoPerformApiService.pullMessage(
          topicMasterDataSync: trickleFeedMasterDataTopic,
          currentClientId: userDeviceId,
        );

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          sync = false;
          emit(state.copyWith(syncMessage: 'No messages on the queue...'));
          logger.d('No messages on the queue');
          break;
        }

        final dbCompany = await cmoDatabaseMasterService.db;
        await dbCompany.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];

            final topic = item.header?.originalTopic;

            if (topic == 'Cmo.MasterData.RM.PropOwnerType.Global') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Farm Property Ownership Type...'));
              await insertFarmPropertyOwnershipType(item);
            } else if (topic == 'Cmo.MasterData.RM.ScheduleActivity.Global') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Schedule Activities...'));
              await insertScheduleActivity(item);
            } else if (topic == 'Cmo.MasterData.RM.AuditTemplate.Global') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Audit Templates...'));
              await insertAuditTemplate(item);
            } else if (topic == 'Cmo.MasterData.RM.RejectReason.Global') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated RejectReason...'));
              await insertRejectReason(item);
            } else if (topic == 'Cmo.MasterData.RM.ImpactOn.Global') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated ImpactOn...'));
              await insertImpactOn(item);
            } else if (topic == 'Cmo.MasterData.RM.ImpactCaused.Global') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated ImpactCaused...'));
              await insertImpactCaused(item);
            } else if (topic == 'Cmo.MasterData.RM.Severity.Global') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Severity...'));
              await insertSeverity(item);
            }
          }
        });

        await cmoPerformApiService.commitMessageList(
          currentClientId: userDeviceId,
          messages: messages,
          topicMasterDataSync: trickleFeedMasterDataTopic,
        );
      }
    } catch (error) {
      logger.e('Failed to sync trickle feed master data');
    }
  }

  Future<void> subscribeToRegionalManagerTrickleFeedTopicByGroupSchemeId() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing Updated RM Master Data...',
        isLoading: true,
      ),
    );

    try {
      var sync = true;
      while (sync) {
        MasterDataMessage? resPull;
        final trickleFeedTopicByGroupSchemeId = 'Cmo.MasterData.RM.*.$groupSchemeId';

        await subscribe(trickleFeedTopicByGroupSchemeId);
        logger.d('Subscribe to topic $trickleFeedTopicByGroupSchemeId');

        resPull = await cmoPerformApiService.pullMessage(
          topicMasterDataSync: trickleFeedTopicByGroupSchemeId,
          currentClientId: userDeviceId,
        );

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          sync = false;
          emit(state.copyWith(syncMessage: 'No messages on the queue...'));
          logger.d('No messages on the queue');
          break;
        }

        final dbCompany = await cmoDatabaseMasterService.db;
        await dbCompany.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];

            final topic = item.header?.originalTopic;

            if (topic == 'Cmo.MasterData.RM.RiskProQuestion.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Risk Profile Questions...'));
              await insertRiskProfileQuestion(item);
            } else if (topic == 'Cmo.MasterData.RM.FrmMemObj.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Farm Member Objectives...'));
              await insertFarmMemberObjective(item);
            } else if (topic == 'Cmo.MasterData.RM.FrmObjOpt.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Farm Objective Options...'));
              await insertFarmObjectiveOption(item);
            } else if (topic == 'Cmo.MasterData.RM.SH.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Stakeholder...'));
              await insertStakeholder(item);
            } else if (topic == 'Cmo.MasterData.RM.GSS.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Groupscheme Stakeholder...'));
              await insertGroupSchemeStakeholder(item);
            } else if (topic == 'Cmo.MasterData.RM.Principle.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Principle...'));
              await insertPrinciple(item);
            } else if (topic == 'Cmo.MasterData.RM.Criteria.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Criteria...'));
              await insertCriteria(item);
            } else if (topic == 'Cmo.MasterData.RM.Indicator.$groupSchemeId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Indicator...'));
              await insertIndicator(item);
            } else {
              logger.e('Error - Could not process topic: ${item.header?.originalTopic}');
            }
          }
        });

        await cmoPerformApiService.commitMessageList(
          currentClientId: userDeviceId,
          messages: messages,
          topicMasterDataSync: trickleFeedTopicByGroupSchemeId,
        );
      }
    } catch (error) {
      logger.e('Failed to sync trickle feed master data');
    }
  }

  Future<void> subscribeToRegionalManagerUnitTrickleFeedTopicByRegionalManagerUnitId() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing updated RMU Master Data...',
        isLoading: true,
      ),
    );

    try {
      var sync = true;
      while (sync) {
        MasterDataMessage? resPull;
        final trickleFeedTopicByRegionalManagerUnitId = 'Cmo.MasterData.RMU.*.$rmuId';

        await subscribe(trickleFeedTopicByRegionalManagerUnitId);
        logger.d('Subscribe to topic $trickleFeedTopicByRegionalManagerUnitId');

        resPull = await cmoPerformApiService.pullMessage(
          topicMasterDataSync: trickleFeedTopicByRegionalManagerUnitId,
          currentClientId: userDeviceId,
        );

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          sync = false;
          emit(state.copyWith(syncMessage: 'No messages on the queue...'));
          logger.d('No messages on the queue');
          break;
        }

        final dbCompany = await cmoDatabaseMasterService.db;
        await dbCompany.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];

            final topic = item.header?.originalTopic;

            if (topic == 'Cmo.MasterData.RMU.Farm.$rmuId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Farm...'));
              await insertFarm(item);
            } else if (topic == 'Cmo.MasterData.RMU.Compliance.$rmuId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Compliance...'));
              await insertCompliance(item);
            } else if (topic == 'Cmo.MasterData.RMU.Question.$rmuId') {
              emit(state.copyWith(syncMessage: 'Syncing new and updated Question...'));
              await insertQuestion(item);
            } else {
              logger.e('Error - Could not process topic: ${item.header?.originalTopic}');
            }
          }
        });

        await cmoPerformApiService.commitMessageList(
          currentClientId: userDeviceId,
          messages: messages,
          topicMasterDataSync: trickleFeedTopicByRegionalManagerUnitId,
        );
      }
    } catch (error) {
      logger.e('Failed to sync trickle feed RMU master data');
    }
  }
}
