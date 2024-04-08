import 'dart:convert';
import 'dart:developer';

import 'package:cmo/di.dart';
import 'package:cmo/env/env.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/audit/audit_payload.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/resource_manager_unit.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_group_scheme_stakeholder_payload/main_group_scheme_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/properties_payload/properties_payload.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/state/sync/base_sync_cubit.dart';
import 'package:cmo/state/sync/base_sync_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';

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

    await getSummaryInformation();
  }

  Future<void> getSummaryInformation() async {
    final totalCompletedAudit = await cmoDatabaseMasterService.getAuditsCountByCompletedStatus();
    final totalCompletedFarms = await cmoDatabaseMasterService.getSyncedFarmsCount(rmuId);
    final totalSyncedStakeholder = await cmoDatabaseMasterService.getSyncedStakeholderCount();
    final auditTemplates = (await cmoDatabaseMasterService.getAuditTemplatesByRMU(rmuId)).length;
    final compliances = (await cmoDatabaseMasterService.getCompliancesByRmuId(rmuId: rmuId))?.length;
    final criterias = (await cmoDatabaseMasterService.getCriterias()).length;
    final farmMemberObjectives = (await cmoDatabaseMasterService.getAllFarmMemberObjectiveByGroupSchemeId(groupSchemeId)).length;
    final farmObjectivesOptions = (await cmoDatabaseMasterService.getFarmObjectiveOptionByGroupSchemeId(groupSchemeId)).length;
    final farmPropertyOwnershipTypes = (await cmoDatabaseMasterService.getFarmPropertyOwnershipType()).length;
    final groupScheme = (await cmoDatabaseMasterService.getGroupSchemeStakeholderByGroupSchemeId(groupSchemeId)).length;
    final impactCaused = (await cmoDatabaseMasterService.getImpactCauseds()).length;
    final impactOn = (await cmoDatabaseMasterService.getImpactOns()).length;
    final indicators = (await cmoDatabaseMasterService.getIndicators()).length;
    final principle = (await cmoDatabaseMasterService.getPrinciples()).length;
    final question = (await cmoDatabaseMasterService.getFarmQuestionsByRmuId(rmuId: rmuId))?.length;
    final resourceManagementUnits = (await cmoDatabaseMasterService.getRegionalManagerUnits()).length;
    final rejectReasons = (await cmoDatabaseMasterService.getRejectReasons()).length;
    final riskProfileQuestions = (await cmoDatabaseMasterService.getRiskProfileQuestionByGroupSchemeId(groupSchemeId)).length;
    final severity = (await cmoDatabaseMasterService.getSeverities()).length;
    final stakeholderTypes = (await cmoDatabaseMasterService.getStakeHolderTypes()).length;

    emit(
      state.copyWith(
        rmSyncSummaryInformation: RmSyncSummaryInformation(
          totalAudits: totalCompletedAudit,
          totalFarms: totalCompletedFarms,
          totalStakeholders: totalSyncedStakeholder,
          auditTemplates: auditTemplates,
          compliances: compliances,
          criteria: criterias,
          farmMemberObjectives: farmMemberObjectives,
          farmObjectivesOptions: farmObjectivesOptions,
          farmPropertyOwnershipTypes: farmPropertyOwnershipTypes,
          groupScheme: groupScheme,
          impactCaused: impactCaused,
          impactOn: impactOn,
          indicators: indicators,
          principle: principle,
          question: question,
          resourceManagementUnits: resourceManagementUnits,
          rejectReasons: rejectReasons,
          riskProfileQuestions: riskProfileQuestions,
          severity: severity,
          stakeholderTypes: stakeholderTypes,
        ),
      ),
    );
  }

  Future<void> syncOnboarding() async {
    try {
      emit(
        state.copyWith(
            syncMessage: '${LocaleKeys.syncing_all_master_data.tr()}...', isLoading: true),
      );

      logger.d('--RM Sync Onboarding Data start');

      logger.d('--createSubscriptions start');
      await createSubscriptions();
      logger.d('--createSubscriptions done');

      logger.d('--createRMSystemEvent start');
      await cmoPerformApiService.createSystemEvent(
        systemEventName: 'SyncGSRegionalManagerMasterData',
        primaryKey: rmuId.toString(),
        userDeviceId: userDeviceId,
      );
      logger.d('--createRMSystemEvent done');

      logger.d('--insertByCallingAPI start');
      await insertByCallingAPI();
      logger.d('--insertByCallingAPI done');

      logger.d('--syncRegionalManagerMasterData start');
      var hasData = await syncRegionalManagerMasterData();
      logger.d('--syncRegionalManagerMasterData done');

      if (hasData) {
        logger.d('--syncRegionalManagerUnitMasterData start');
        hasData = await syncRegionalManagerUnitMasterData();
        logger.d('--syncRegionalManagerUnitMasterData done');
      }

      emit(
        state.copyWith(
          syncMessage: 'Sync complete',
          isLoaded: true,
          isLoading: false,
        ),
      );

      logger.d('--RM Sync Onboarding Data done');
      await Future.delayed(const Duration(milliseconds: 500), () {});
      await configService.setRMSynced(isSynced: hasData);
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
            syncMessage: 'Sync error', isLoaded: false, isLoading: false),
      );
      await configService.setRMSynced(isSynced: false);
    }
  }

  Future<void> syncSummary() async {
    try {
      logger.d('--RM Sync Summary start--');
      emit(
        state.copyWith(
          rmSyncSummaryInformation: RmSyncSummaryInformation(),
          syncMessage: 'RM Summary Syncing...',
          errorMessageItems: const <String>[],
          isLoading: true,
          isSyncing: true,
          isSynced: false,
          isSyncError: false,
          isLoaded: false,
        ),
      );


      await publishFarm();
      await publishGroupSchemeStakeholders();

      // Keep delay time for waiting server generate data
      emit(
        state.copyWith(
          syncMessage: 'Waiting for server to generate data...',
        ),
      );
      await Future.delayed(const Duration(seconds: 15), () async {});
      await subscribeToRegionalManagerTrickleFeedMasterDataTopic();
      await subscribeToRegionalManagerTrickleFeedTopicByGroupSchemeId();
      await subscribeToRegionalManagerUnitTrickleFeedTopicByRegionalManagerUnitId();
      await publishCompartments();
      emit(
        state.copyWith(
          syncMessage: 'Waiting for compartment upload successfully...',
        ),
      );
      await Future.delayed(const Duration(seconds: 5), () async {
        await publishASIs();
        await publishAudits();
      });

      if (state.errorMessageItems.isNotBlank) {
        emit(
          state.copyWith(
            isSyncError: true,
            isLoaded: true,
            isLoading: false,
            isSynced: true,
            isSyncing: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isSyncError: false,
            isLoaded: true,
            isLoading: false,
            isSynced: true,
            isSyncing: false,
            errorMessageItems: const <String>[],
          ),
        );
      }

      await Future.delayed(const Duration(seconds: 2), () async {
        await getSummaryInformation();
      });
    } catch (e) {
      logger.e(e);
      String? errorMessage;
      if (e is SyncError) {
        errorMessage = e.errorMessage;
      } else {
        errorMessage = e.toString();
      }

      handleErrorMessage(
        errorMessage: errorMessage,
        snackErrorMessage: 'Error: $errorMessage',
      );
      emit(
        state.copyWith(
          isSyncError: true,
          isLoaded: true,
          isLoading: false,
          isSynced: true,
          isSyncing: false,
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


  void handleErrorMessage({
    required String snackErrorMessage,
    String? errorMessage,
  }) {
    logger.e(snackErrorMessage);
    showSnackError(msg: snackErrorMessage);
    final errorMessages = List<String>.from(state.errorMessageItems);
    errorMessages.add(errorMessage ?? '');
    emit(
      state.copyWith(
        errorMessageItems: errorMessages,
      ),
    );
  }

  Future<void> publishFarm() async {
    emit(
      state.copyWith(
        syncMessage: 'Uploading Farms...',
      ),
    );

    final publishFarmTopic = 'Cmo.MasterData.RM.Farm.$groupSchemeId.$userDeviceId';
    logger.d('Get unsynced farms by rmuIds: $rmuId');
    final farms = await cmoDatabaseMasterService.getUnsyncedCompletedFarmsByRmuId(rmuId);
    if (farms.isNotBlank) {
      logger.d('Unsynced farms count: ${farms!.length}');
      for (final farm in farms) {
        final objectiveAnswers = await cmoDatabaseMasterService
            .getFarmMemberObjectiveAnswerByFarmIdAndIsMasterDataSynced(
          farm.farmId,
        );
        final riskProfileAnswers = await cmoDatabaseMasterService
            .getFarmMemberRiskProfileAnswerByFarmIdAndIsMasterDataSynced(
          farm.farmId,
        );
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

        log(
          jsonEncode(
            farm
                .copyWith(
                  objectiveAnswers: objectiveAnswers,
                  riskProfileAnswers: riskProfileAnswers,
                  signatureImage: '',
                )
                .toJson(),
          ),
        );

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
            final farms = await cmoPerformApiService.getFarmSearch(
              filterString: farm.farmName,
            );
            final isExist = farms.firstWhereOrNull((element) => element.farmId == farm.farmId);
            if (isExist != null) {
              isSyncedSuccess = true;
            }
          }

          stopwatch.stop();
          if (isSyncedSuccess) {
            await cmoDatabaseMasterService.cacheFarm(
              farm.copyWith(
                isMasterDataSynced: true,
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
            handleErrorMessage(
              snackErrorMessage: 'Published Farm ${farm.farmName} and cannot insert it into database.',
              errorMessage: 'Farm ${farm.farmName}',
            );
          }
        } else {
          handleErrorMessage(
            snackErrorMessage: 'Publish Farm ${farm.farmName} error when sent to server.',
            errorMessage: 'Farm ${farm.farmName}',
          );
        }
      }
    } else {
      logger.d('No farm to sync');
      emit(
        state.copyWith(
          syncMessage: 'There are no farm to upload',
        ),
      );
    }
  }

  Future<void> publishAudits() async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing Audits, Comments and Photos...',
      ),
    );

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

        auditQuestionAnswers =
            auditQuestionAnswers.copyWith(questionAnswer: questionAnswers);

        for (final answer in questionAnswers) {
          final questionComments =
              await cmoDatabaseMasterService.getQuestionComments(
            audit.assessmentId!,
            answer.questionId!,
          );

          auditQuestionAnswers = auditQuestionAnswers.copyWith(
              questionComment:
                  auditQuestionAnswers.questionComment + questionComments);

          final questionPhotos = await cmoDatabaseMasterService
              .getQuestionPhotosByAssessmentIdAndQuestionId(
            assessmentId: audit.assessmentId,
            questionId: answer.questionId,
          );

          auditQuestionAnswers = auditQuestionAnswers.copyWith(
            questionPhoto: auditQuestionAnswers.questionPhoto +
                questionPhotos.map((e) => e.toPayLoadWithBase64()).toList(),
          );
        }

        auditPayload = auditPayload.copyWith(
            assessmentQuestionAnswers: auditQuestionAnswers);
        logger.d('Assign assessment/audit Payload to message $auditPayload');

        final message = Message(
          properties: getMessageProperties(),
          body: jsonEncode(
            auditPayload.toJson(),
          ),
        );

        logger.d('Publish message to topic $publishAuditsTopic');

        final isPublicAudit = await cmoPerformApiService.public(
          currentClientId: userDeviceId.toString(),
          topic: publishAuditsTopic,
          messages: [message],
        );

        if (isPublicAudit) {
          await cmoDatabaseMasterService.cacheAudit(
            audit.copyWith(
              synced: true,
            ),
          );

          logger.d('Successfully published assessments/audits: ${audit.id}');
        } else {
          handleErrorMessage(
            snackErrorMessage: 'Failed to publish assessments/audits: ${audit.id}',
            errorMessage: 'Audit ${audit.id}',
          );
        }
      }
    } else {
      logger.d('No assessments/audits to sync');
      emit(
        state.copyWith(
          syncMessage: 'There are no assessments/audits to upload',
        ),
      );
    }
  }

  Future<void> publishGroupSchemeStakeholders() async {
    emit(
      state.copyWith(
        syncMessage: 'Uploading Group Scheme Stakeholders...',
      ),
    );

      final publishGroupSchemeStakeholdersTopic = 'Cmo.MasterData.RM.GSS.$groupSchemeId.$userDeviceId';
      logger.d('Get unsynced group scheme stakeholders');
      final groupSchemas = await cmoDatabaseMasterService.getGroupSchemeStakeholderByGroupSchemeId(groupSchemeId);
      final unsyncedStakeholders = await cmoDatabaseMasterService.getUnsyncedStakeholder();
      final groupSchemeStakeholderPayloads = <MainGroupSchemeStakeholderPayLoad>[];

      for (final stakeholder in unsyncedStakeholders) {
        var mainGroupSchemeStakeholderPayLoad = const MainGroupSchemeStakeholderPayLoad();
        mainGroupSchemeStakeholderPayLoad = mainGroupSchemeStakeholderPayLoad.copyWith(stakeholder: stakeholder);
        final groupSchema = groupSchemas.firstWhereOrNull(
          (element) => element.stakeholderId == mainGroupSchemeStakeholderPayLoad.stakeholder?.stakeholderId,
        );

        if (groupSchema != null) {
          mainGroupSchemeStakeholderPayLoad = mainGroupSchemeStakeholderPayLoad.copyWith(
            groupSchemeStakeholder: groupSchema,
          );
        }

        groupSchemeStakeholderPayloads.add(mainGroupSchemeStakeholderPayLoad);
      }


      if (groupSchemeStakeholderPayloads.isNotBlank) {
        logger.d('Unsynced group scheme stakeholders count: ${groupSchemeStakeholderPayloads.length}');

        for (final groupSchemeStakeholderPayload in groupSchemeStakeholderPayloads) {
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
              await cmoDatabaseMasterService.cacheStakeholder(
                groupSchemeStakeholderPayload.stakeholder!.copyWith(
                  isMasterDataSynced: true,
                ),
              );

              logger.d('Try update group scheme stakeholder status to synced');

              if (groupSchemeStakeholderPayload.groupSchemeStakeholder != null) {
                await cmoDatabaseMasterService.cacheGroupSchemeStakeholder(
                  groupSchemeStakeholderPayload.groupSchemeStakeholder!.copyWith(
                    isMasterDataSynced: true,
                  ),
                );
              }

              logger.d('Successfully published groupSchemeStakeholderId: ${groupSchemeStakeholderPayload.groupSchemeStakeholder?.groupSchemeStakeholderId}');
            });
          } else {
            handleErrorMessage(
              snackErrorMessage: 'Failed to publish groupSchemeStakeholderId: ${groupSchemeStakeholderPayload.groupSchemeStakeholder?.groupSchemeStakeholderId}',
              errorMessage: 'Group Scheme Stakeholder ${groupSchemeStakeholderPayload.stakeholder?.stakeholderName}',
            );
          }
        }
      } else {
        logger.d('No group scheme stakeholders to sync');
        emit(
          state.copyWith(
            syncMessage: 'No group scheme stakeholders to sync',
          ),
        );
      }
  }

  Future<void> publishCompartments() async {
    emit(
      state.copyWith(
        syncMessage: 'Uploading Compartments...',
      ),
    );

    logger.d('Get unsynced compartment');
    final compartments = await cmoDatabaseMasterService.getAllUnsynedCompartmentsByGroupSchemeId(groupSchemeId: groupSchemeId);
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
              areaTypeName: compartment.areaTypeName,
              espacementWidth: compartment.espacementWidth,
              espacementLength: compartment.espacementLength,
            ),
            isDirect: true,
          );

          logger.d('Successfully published compartment: ${syncedCompartment.managementUnitId}');
        } else {
          handleErrorMessage(
            snackErrorMessage: 'Failed to publish compartment: ${compartment.unitNumber}',
            errorMessage: 'Compartment ${compartment.unitNumber}',
          );
        }
      }
    } else {
      logger.d('No Compartments to sync');
      emit(
        state.copyWith(
          syncMessage: 'No Compartments to sync',
        ),
      );
    }
  }

  Future<void> publishASIs() async {
    emit(
      state.copyWith(
        syncMessage: 'Uploading ASI...',
      ),
    );

    logger.d('Get unsynced ASI');
    final listASI = await cmoDatabaseMasterService.getRMAsiRegister();
    final compartments = await cmoDatabaseMasterService.getAllCompartments();

    if (listASI.isNotBlank) {
      logger.d('Unsynced ASI count: ${listASI.length}');
      for (final asi in listASI) {
        final managementUnitId = compartments
            .firstWhereOrNull((element) =>
                element.localCompartmentId == asi.localCompartmentId)
            ?.managementUnitId;

        final syncedAsi = await cmoPerformApiService.insertUpdatedASI(
          asi.copyWith(
            managementUnitId: asi.managementUnitId ?? managementUnitId,
          ),
        );

        if (syncedAsi != null) {
          await cmoDatabaseMasterService.cacheAsi(
            syncedAsi.copyWith(
              localCompartmentId: asi.localCompartmentId,
              compartmentName: asi.compartmentName,
              managementUnitId: asi.managementUnitId ?? managementUnitId,
              asiTypeName: asi.asiTypeName,
              isMasterdataSynced: true,
            ),
          );

          final listAsiPhotos = await cmoDatabaseMasterService.getUnsyncAsiPhotoByAsiRegisterNo(asi.asiRegisterNo);
          await publishListAsiPhotos(
            asi: syncedAsi,
            listAsiPhotos: listAsiPhotos,
          );

          logger.d('Successfully published ASI: ${syncedAsi.asiRegisterId}');
        } else {
          handleErrorMessage(
            snackErrorMessage: 'Failed to publish ASI: ${asi.asiRegisterNo}',
            errorMessage: 'ASI ${asi.asiRegisterNo}',
          );
        }
      }
    } else {
      logger.d('No ASI to sync');
      emit(
        state.copyWith(
          syncMessage: 'No ASI to sync',
        ),
      );
    }
  }

  Future<void> publishListAsiPhotos({
    required Asi asi,
    List<AsiPhoto>? listAsiPhotos,
  }) async {
    emit(
      state.copyWith(
        syncMessage: 'Uploading ASI Photos...',
      ),
    );

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
            asiPhoto.copyWith(
              asiRegisterPhotoId: syncedAsiPhoto.asiRegisterPhotoId,
              asiRegisterPhotoNo: syncedAsiPhoto.asiRegisterPhotoNo,
              isMasterdataSynced: true,
            ),
          );

          logger.d('Successfully published ASI: ${syncedAsiPhoto.asiRegisterPhotoId}');
        } else {
          handleErrorMessage(
            snackErrorMessage: 'Failed to publish ASI: ${asiPhoto.asiRegisterLocalId}',
            errorMessage: 'ASI photo ${asiPhoto.asiRegisterLocalId}',
          );
        }
      }
    } else {
      logger.d('No ASI photos to sync');
      emit(
        state.copyWith(
          syncMessage: 'No ASI photos to sync',
        ),
      );
    }
  }

  Future<int?> insertStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final stakeHolder = StakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheStakeholder(
        stakeHolder.copyWith(
          isMasterDataSynced: true,
        ),
      );
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
      return cmoDatabaseMasterService.cacheGroupSchemeStakeholder(
        stakeholder.copyWith(
          isMasterDataSynced: true,
        ),
      );
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
          isMasterDataSynced: true,
          signatureImage: farm.signatureImage.base64SyncServerToString,
        ),

        isDirect: true,
      );
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<void> insertCompartmentsByRMUId() async {
    emit(state.copyWith(syncMessage: '${LocaleKeys.syncing_compartments.tr()}...'));
    final compartments = await cmoPerformApiService.getCompartmentsByRMUId();
    final areaTypes = await cmoDatabaseMasterService.getAreaTypesByGroupSchemeId(groupSchemeId);
    final productGroupTemplates = await cmoDatabaseMasterService.getProductGroupTemplates(groupSchemeId);
    final speciesGroupTemplates = await cmoDatabaseMasterService.getSpeciesGroupTemplates(groupSchemeId);
    var now = DateTime.now().millisecondsSinceEpoch;
    if (compartments.isNotBlank) {
      for (final compartment in compartments!) {
        final productGroupTemplate = productGroupTemplates.firstWhereOrNull((element) => element.productGroupTemplateId == compartment.productGroupTemplateId);
        final speciesGroupTemplate = speciesGroupTemplates.firstWhereOrNull((element) => element.speciesGroupTemplateId == compartment.speciesGroupTemplateId);
        final areaType = areaTypes.firstWhereOrNull((element) => element.areaTypeId == compartment.areaTypeId);
        await cmoDatabaseMasterService.cacheCompartment(
          compartment.copyWith(
            localCompartmentId: now++,
            productGroupTemplateName: productGroupTemplate?.productGroupTemplateName,
            speciesGroupTemplateName: speciesGroupTemplate?.speciesGroupTemplateName,
            areaTypeName: areaType?.areaTypeName,
            isMasterdataSynced: true,
          ),
        );
      }
    }
  }

  Future<void> insertAreaTypes() async {
    emit(state.copyWith(syncMessage: '${LocaleKeys.syncing_area_type.tr()}...'));
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
    emit(state.copyWith(syncMessage: '${LocaleKeys.syncing_asi_type.tr()}...'));
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
      for (final asi in listAsi!) {
        final compartment = listCompartments.firstWhereOrNull((element) => element.managementUnitId == asi.managementUnitId);
        final asiType = asiTypes.firstWhereOrNull((element) => element.asiTypeId == asi.asiTypeId);
        await cmoDatabaseMasterService.cacheAsi(
          asi.copyWith(
            compartmentName: compartment?.unitNumber,
            localCompartmentId: compartment?.localCompartmentId,
            asiTypeName: asiType?.asiTypeName,
            isMasterdataSynced: true,
          ),
          isDirect: true,
        );

        final listAsiPhotos = await cmoPerformApiService.getRMAsiRegisterPhotosByAsiRegisterId(asi.asiRegisterId);
        await insertRMAsiPhotos(listAsiPhotos);
      }
    }
  }

  Future<void> insertRMAsiPhotos(List<AsiPhoto>? listAsiPhoto) async {
    if (listAsiPhoto.isNotBlank) {
      for (final asiPhoto in listAsiPhoto!) {
        await cmoDatabaseMasterService.cacheAsiPhoto(
          asiPhoto.copyWith(
            photo: asiPhoto.photo.base64SyncServerToString,
            isMasterdataSynced: true,
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

  Future<bool> syncRegionalManagerMasterData() async {
    emit(state.copyWith(syncMessage: 'Syncing Resource Manager Master Data...'));
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
          currentClientId: userDeviceId.toString(),
          messages: messages,
          topicMasterDataSync: topicRegionalManagerMasterDataSync,
        );
      }
    }

    return hasData;
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
          emit(state.copyWith(syncMessage: '${LocaleKeys.syncing_stakeholder_types.tr()}...'));
          await insertStakeholderType(item);
        } else if (topic ==
            '${topicRegionalManagerMasterDataSync}PropOwnerType.$userDeviceId') {
          emit(state.copyWith(
              syncMessage: 'Syncing Property Ownership Type...'));
          await insertFarmPropertyOwnershipType(item);
        } else if (topic ==
        //     '${topicRegionalManagerMasterDataSync}ScheduleActivity.$userDeviceId') {
        //   emit(state.copyWith(syncMessage: 'Syncing Schedule Activity...'));
        //   await insertScheduleActivity(item);
        // } else if (topic ==
        //     '${topicRegionalManagerMasterDataSync}Schedule.$userDeviceId') {
        //   emit(state.copyWith(syncMessage: 'Syncing Schedule...'));
        //   await insertSchedule(item);
        // } else if (topic ==
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
          emit(state.copyWith(syncMessage: '${LocaleKeys.syncing_indicator.tr()}...'));
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
          emit(state.copyWith(syncMessage: '${LocaleKeys.syncing_severity.tr()}...'));
          await insertSeverity(item);
        } else if (topic ==
            '${topicRegionalManagerMasterDataSync}RMU.$userDeviceId') {
          emit(state.copyWith(
              syncMessage: 'Syncing Resource Manager Unit...'));
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

  Future<bool> syncRegionalManagerUnitMasterData() async {
    emit(state.copyWith(syncMessage: 'Syncing Resource Manager Unit Master Data...'));
    var sync = true;
    var hasData = false;
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
      } else {
        hasData = true;
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
              emit(state.copyWith(syncMessage: '${LocaleKeys.syncing_questions.tr()}...'));
              await insertQuestion(item);
            } else if (topic ==
                '${topicRegionalManagerUnitMasterDataSync}Farm.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Farms...'));
              await insertFarm(item);
            }
          }
        });

        await cmoPerformApiService.commitMessageList(
          currentClientId: userDeviceId.toString(),
          messages: messages,
          topicMasterDataSync: topicRegionalManagerUnitMasterDataSync,
        );
      }
    }

    return hasData;
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
          currentClientId: userDeviceId.toString(),
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
          currentClientId: userDeviceId.toString(),
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
          currentClientId: userDeviceId.toString(),
          messages: messages,
          topicMasterDataSync: trickleFeedTopicByRegionalManagerUnitId,
        );
      }
    } catch (error) {
      logger.e('Failed to sync trickle feed RMU master data');
    }
  }
}
