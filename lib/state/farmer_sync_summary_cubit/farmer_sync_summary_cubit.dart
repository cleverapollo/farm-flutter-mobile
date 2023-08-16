import 'dart:async';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/stakeholder/farm_stake_holder.dart';
import 'package:cmo/model/worker_job_description/worker_job_description.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_upload_summary_mixin.dart';
import 'package:cmo/state/user_device_cubit/user_device_cubit.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FarmerSyncSummaryCubit extends Cubit<FarmerSyncSummaryState>
    with FarmUploadSummaryMixin {
  FarmerSyncSummaryCubit({required this.userDeviceCubit})
      : super(const FarmerSyncSummaryState());
  final UserDeviceCubit userDeviceCubit;

  @override
  FarmerSyncSummaryState get mState => state;

  @override
  void Function(FarmerSyncSummaryState state)? get mEmit => emit;

  String get topicMasterDataSync => 'Cmo.MasterDataDeviceSync.';
  String get topicTrickleFeedFarmerMasterDataByFarmId => 'Cmo.MasterData.';
  String get topicTrickleFeedFgsMasterDataByGroupSchemeId =>
      'Cmo.MasterData.FGS.';

  int get userId => state.userId!;
  int get userDeviceId => state.userDeviceId!;
  int get groupSchemeId => state.groupSchemeId!;
  String get farmId => state.farmId!;

  String get getSyncGroupSchemeAllMasterDataTopic =>
      '$topicMasterDataSync*.$userDeviceId';
  String get getFarmerTrickleFeedMasterDataTopicByFarmId =>
      '$topicTrickleFeedFarmerMasterDataByFarmId*.$farmId';
  String get getTrickleFeedMasterDataTopic =>
      '$topicTrickleFeedFarmerMasterDataByFarmId*.Global';
  String get getTrickleFeedMasterDataTopicByGroupSchemeId =>
      '$topicTrickleFeedFgsMasterDataByGroupSchemeId*.$groupSchemeId';

  Future<bool> initDataConfig() async {
    try {
      if (state.userId != null &&
          state.farmId != null &&
          state.userDeviceId != null &&
          state.groupSchemeId != null) return true;

      await userDeviceCubit.createPerformUserDevice();

      final user = await configService.getActiveUser();
      final activeFarm = await configService.getActiveFarm();
      final activeUserId = user?.userId;
      final activeUserDeviceId = userDeviceCubit.data?.userDeviceId;
      final activeFarmId = activeFarm?.farmId;
      final activeGroupSchemeId = activeFarm?.groupSchemeId;
      final activeRmuId = activeFarm?.regionalManagerUnitId;
      final activeFarmName = activeFarm?.farmName;

      if (activeUserId == null ||
          activeFarmId == null ||
          activeUserDeviceId == null ||
          activeGroupSchemeId == null ||
          activeRmuId == null) return false;

      emit(
        state.copyWith(
          userId: activeUserId,
          farmId: activeFarmId,
          groupSchemeId: activeGroupSchemeId,
          userDeviceId: activeUserDeviceId,
          rmuId: activeRmuId,
          farmName: activeFarmName,
        ),
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  void onSyncStatus(String message) {
    emit(state.copyWith(syncMessage: message));
  }

  Future<void> onSync({bool isOnboardingSync = false}) async {
    try {
      emit(state.copyWith(isSyncing: true, syncMessage: 'Syncing...'));
      final canSync = await initDataConfig();

      if (!canSync) {
        showSnackError(msg: 'Sync failed. Please try again');
        return emit(state.copyWith(isSyncing: true, syncMessage: 'Sync'));
      }

      if (!isOnboardingSync) {
        await onUploadingFarmData();
      }

      final systemEventId = await cmoPerformApiService.createFarmerSystemEvent(
        farmId: farmId,
        userDeviceId: userDeviceId,
      );

      logger.d('Create System Event Success --- $systemEventId');
      emit(state.copyWith(syncMessage: 'Syncing...'));

      await Future.delayed(const Duration(seconds: 5), () {});

      await createSubscriptions();

      await summaryFarmerSync();

      final futures = <Future<dynamic>>[];

      futures
        ..add(subscribeToCompartmentsByFarmId())
        ..add(subscribeToTrickleFeedMasterDataTopic())
        ..add(subscribeToTrickleFeedMasterDataTopicByFarmId())
        ..add(subscribeToTrickleFeedMasterDataTopicByGroupSchemeId());

      await Future.wait(futures).then((_) {
        emit(state.copyWith(
            syncMessage: 'Sync', isSyncing: false, isDoneSyncing: true));
        initDataSync();
        showSnackSuccess(msg: 'Sync Success');
      });
    } catch (e) {
      if (kDebugMode) {
        throw FlutterError(e.toString());
      }
      showSnackError(msg: 'Sync failed. Please try again');
      emit(state.copyWith(
          isSyncing: false,
          syncMessage: 'Sync',
          isLoading: false,
          isDoneSyncing: true));
    }
  }

  Future<void> initDataSync() async {
    emit(state.copyWith(isLoading: true));
    final canSync = await initDataConfig();

    if (!canSync) {
      showSnackError(msg: 'Something was wrong, please try again');
      return emit(state.copyWith(isLoading: false));
    }

    final databaseMasterService = cmoDatabaseMasterService;
    final futures = <Future<dynamic>>[];

    var data = const FarmerSyncSummaryModel();

    await databaseMasterService.db.then((_) async {
      futures
        ..add(
          databaseMasterService.getJobDescriptions().then(
              (value) => data = data.copyWith(jobDescription: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedSanctionRegisterByFarmId(farmId)
              .then((value) =>
                  data = data.copyWith(disciplinariesUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getSanctionRegisterByFarmId(farmId).then(
              (value) =>
                  data = data.copyWith(disciplinariesTotal: value.length)),
        )
        ..add(
          databaseMasterService.getIssueTypeByGroupSchemeId(groupSchemeId).then(
              (value) =>
                  data = data.copyWith(disciplinariesIssues: value.length)),
        )
        ..add(
          databaseMasterService
              .getAnimalTypeByGroupSchemeId(groupSchemeId)
              .then(
                  (value) => data = data.copyWith(speciesTypes: value.length)),
        )
        ..add(
          databaseMasterService
              .getPestsAndDiseaseTypeByGroupSchemeId(groupSchemeId)
              .then((value) =>
                  data = data.copyWith(petsAndDiseaseType: value.length)),
        )
        ..add(
          databaseMasterService.getRejectReasons().then(
              (value) => data = data.copyWith(rejectReasons: value.length)),
        )
        ..add(
          databaseMasterService.getScheduleActivities().then(
              (value) => data = data.copyWith(scheduleActivity: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedWorkerCountByFarmId(farmId).then(
              (value) => data = data.copyWith(workersUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getWorkerCountByFarmId(farmId).then(
              (value) => data = data.copyWith(workersTotal: value.length)),
        )
        ..add(
          databaseMasterService.getStakeHolderTypes().then(
              (value) => data = data.copyWith(stakeholderTypes: value.length)),
        )
        ..add(
          databaseMasterService.getUpcomingScheduleCountByUserId(userId).then(
              (value) => data = data.copyWith(upcomingEvent: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedScheduleCountByUserId(userId).then(
              (value) => data = data.copyWith(schedulerUnsynced: value.length)),
        )
        ..add(
          databaseMasterService
              .getAsiRegister()
              .then((value) => data = data.copyWith(asiTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedAsiRegister(farmId)
              .then((value) => data = data.copyWith(asiUnsynced: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedAccidentAndIncidentRegisterByFarmId(farmId)
              .then((value) => data =
                  data.copyWith(accidentAndIncidentUnsynced: value.length)),
        )
        ..add(
          databaseMasterService
              .getCountAccidentAndIncidentPropertyDamaged()
              .then((value) => data = data.copyWith(
                  accidentAndIncidentPropertyDamagedTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedAccidentAndIncidentPropertyDamaged()
              .then((value) => data = data.copyWith(
                  accidentAndIncidentPropertyDamagedUnsynced: value.length)),
        )
        ..add(
          databaseMasterService
              .getCountAccidentAndIncidentRegisterByFarmId(farmId)
              .then((value) =>
                  data = data.copyWith(accidentAndIncidentTotal: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedAsiPhoto().then(
              (value) => data = data.copyWith(asiPhotosUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getAsiPhoto().then(
              (value) => data = data.copyWith(asiPhotosTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedBiologicalControlAgentRegisterByFarmId(farmId)
              .then((value) => data =
                  data.copyWith(biologicalControlAgentsUnsynced: value.length)),
        )
        ..add(
          databaseMasterService
              .getBiologicalControlAgentTypeByGroupSchemeId(groupSchemeId)
              .then((value) => data =
                  data.copyWith(biologicalControlAgentTypes: value.length)),
        )
        ..add(
          databaseMasterService.getBiologicalControlAgentByFarmId(farmId).then(
              (value) => data =
                  data.copyWith(biologicalControlAgentsTotal: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedChemicalByFarmId(farmId).then(
              (value) => data = data.copyWith(chemicalsUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getChemicalByFarmId(farmId).then(
              (value) => data = data.copyWith(chemicalsTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getComplaintsAndDisputesRegisterByFarmId(farmId)
              .then((value) => data =
                  data.copyWith(stakeholderComplaintsTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedComplaintsAndDisputesRegisterByFarmId(farmId)
              .then((value) => data =
                  data.copyWith(stakeholderComplaintsTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedGrievanceRegisterByFarmId(farmId)
              .then((value) => data =
                  data.copyWith(employeeGrievancesUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getGrievanceRegisterByFarmId(farmId).then(
              (value) =>
                  data = data.copyWith(employeeGrievancesTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getFireRegisterByFarmId(farmId)
              .then((value) => data = data.copyWith(fireTotal: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedFireRegisterByFarmId(farmId).then(
              (value) => data = data.copyWith(fireUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getPetsAndDiseaseRegisterByFarmId(farmId).then(
              (value) =>
                  data = data.copyWith(petsAndDiseaseTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedPetsAndDiseaseRegisterByFarmId(farmId)
              .then((value) =>
                  data = data.copyWith(petsAndDiseaseUnsyced: value.length)),
        )
        ..add(
          databaseMasterService.getRteSpeciesByFarmId(farmId).then((value) =>
              data = data.copyWith(rteSpeciesRegistersTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedPestsAndDiseasesRegisterTreatmentMethod()
              .then((value) => data = data.copyWith(
                  petsAndDiseaseTreatmentMethodsUnsyced: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedComplaintsAndDisputesRegisterByFarmId(farmId)
              .then((value) => data =
                  data.copyWith(stakeholderComplaintsUnsynced: value.length)),
        )
        ..add(
          databaseMasterService
              .getPestsAndDiseasesRegisterTreatmentMethod()
              .then((value) => data = data.copyWith(
                  petsAndDiseaseTreatmentMethodsTotal: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedRteSpeciesByFarmId(farmId).then(
              (value) => data =
                  data.copyWith(rteSpeciesRegistersUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedRteSpeciesPhotoByFarmId(farmId).then(
              (value) => data = data.copyWith(
                  rteSpeciesRegistersPhotosUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getRteSpeciesPhotoByFarmId(farmId).then(
              (value) => data =
                  data.copyWith(rteSpeciesRegistersPhotosTotal: value.length)),
        )
        ..add(
          databaseMasterService.getTrainingByFarmId(farmId).then(
              (value) => data = data.copyWith(trainingTotal: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedTrainingByFarmId(farmId).then(
              (value) => data = data.copyWith(trainingUnsynced: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedAnnualProductionByFarmId(farmId)
              .then((value) =>
                  data = data.copyWith(annualProductionUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getAnnualFarmProductionByFarmId(farmId).then(
              (value) =>
                  data = data.copyWith(annualProductionTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedAnnualProductionBudgetByFarmId(farmId)
              .then((value) => data =
                  data.copyWith(annualBudgetsProductionUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getAnnualBudgetsByFarmId(farmId).then((value) =>
              data = data.copyWith(annualBudgetsProductionTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedAnnualBudgetTransactionByFarmId(farmId)
              .then((value) => data = data.copyWith(
                  annualBudgetTransactionsUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getAnnualBudgetTransactionByFarmId(farmId).then(
              (value) => data =
                  data.copyWith(annualBudgetTransactionsTotal: value.length)),
        )
        ..add(
          databaseMasterService
              .getUnsyncedFarmCampByFarmId(farmId)
              .then((value) {
            return data = data.copyWith(campsUnsynced: value.length);
          }),
        )
        ..add(
          databaseMasterService
              .getCamp()
              .then((value) => data = data.copyWith(campsTotal: value.length)),
        )
        ..add(
          databaseMasterService.getAnnualBudgetTransactionCategory().then(
              (value) => data = data.copyWith(
                  annualFarmBudgetTransactionCategory: value.length)),
        )
        ..add(
          databaseMasterService.getAnnualBudgetTransactionCategory().then(
              (value) => data = data.copyWith(
                  annualFarmBudgetTransactionCategory: value.length)),
        )
        ..add(
          databaseMasterService
              .getAsiTypeByGroupSchemeId(groupSchemeId)
              .then((value) => data = data.copyWith(asiType: value.length)),
        )
        ..add(
          databaseMasterService
              .getChemicalApplicationMethodByGroupSchemeId(groupSchemeId)
              .then((value) => data =
                  data.copyWith(chemicalApplicationMethods: value.length)),
        )
        ..add(
          databaseMasterService.getChemicalTypeByFarmId(farmId).then(
              (value) => data = data.copyWith(chemicalTypes: value.length)),
        )
        ..add(
          databaseMasterService
              .getCountry()
              .then((value) => data = data.copyWith(countries: value.length)),
        )
        ..add(
          databaseMasterService
              .getFireCauseByGroupSchemeId(groupSchemeId)
              .then((value) => data = data.copyWith(fireCause: value.length)),
        )
        ..add(
          databaseMasterService
              .getGender()
              .then((value) => data = data.copyWith(gender: value.length)),
        )
        ..add(
          databaseMasterService
              .getGrievanceIssueByGroupSchemeId(groupSchemeId)
              .then((value) =>
                  data = data.copyWith(grievanceIssue: value.length)),
        )
        ..add(
          databaseMasterService
              .getGroupScheme()
              .then((value) => data = data.copyWith(groupScheme: value.length)),
        )
        ..add(
          databaseMasterService
              .getMonitoringRequirementByGroupSchemeId(groupSchemeId)
              .then((value) =>
                  data = data.copyWith(monitoringRequirement: value.length)),
        )
        ..add(
          databaseMasterService
              .getNatureOfInjuryByGroupSchemeId(groupSchemeId)
              .then((value) =>
                  data = data.copyWith(natureOfInjury: value.length)),
        )
        ..add(
          databaseMasterService.getPestsAndDiseaseTypeTreatmentMethod().then(
              (value) => data = data.copyWith(
                  petsAndDiseaseTypeTreatmentMethod: value.length)),
        )
        ..add(
          databaseMasterService
              .getPropertyDamagedByGroupSchemeId(groupSchemeId)
              .then((value) =>
                  data = data.copyWith(propertyDamaged: value.length)),
        )
        ..add(
          databaseMasterService
              .getSpeciesRangeByGroupSchemeId(groupSchemeId)
              .then(
                  (value) => data = data.copyWith(speciesRange: value.length)),
        )
        ..add(
          databaseMasterService
              .getTrainingTypeByGroupSchemeId(groupSchemeId)
              .then(
                  (value) => data = data.copyWith(trainingType: value.length)),
        )
        ..add(
          databaseMasterService
              .getTreatmentMethodByGroupSchemeId(groupSchemeId)
              .then((value) =>
                  data = data.copyWith(treatmentMethod: value.length)),
        )
        ..add(
          databaseMasterService.getUnsyncedStakeholder().then((value) =>
              data = data.copyWith(stakeholderUnsynced: value.length)),
        )
        ..add(
          databaseMasterService.getCustomaryUseRight().then((value) =>
              data = data.copyWith(customaryUseRights: value.length)),
        )
        ..add(
          databaseMasterService.getFarmStakeHolderByFarmId(farmId).then(
              (value) => data = data.copyWith(farmStakeHolders: value.length)),
        )
        ..add(
          databaseMasterService
              .getGroupSchemeStakeholderByGroupSchemeId(groupSchemeId)
              .then((value) =>
                  data = data.copyWith(groupSchemeStakeholders: value.length)),
        )
        ..add(
          databaseMasterService.getSocialUpliftment().then(
              (value) => data = data.copyWith(socialUpliftments: value.length)),
        )
        ..add(
          databaseMasterService.getSpecialSite().then(
              (value) => data = data.copyWith(specialSites: value.length)),
        );
    });

    await Future.wait(futures)
        .then((_) => emit(state.copyWith(data: data, isLoading: false)));
  }

  Future<void> subscribeToCompartmentsByFarmId() async {
    onSyncStatus('Sync Compartments...');
    final result =
        await cmoPerformApiService.getCompartmentsByFarmId(state.farmId ?? '');

    for (final item in result!) {
      debugPrint(item.managementUnitId?.toIdIsarFromUuid.toString());
    }

    await insertCompartments(result);
  }

  Future<void> subscribeToTrickleFeedMasterDataTopic() async {
    var isSync = true;

    try {
      while (isSync) {
        onSyncStatus('Sync Feed Master Data Topic...');

        MasterDataMessage? resPull;

        resPull = await cmoPerformApiService.pullFarmerGlobalMessage(
          topicMasterDataSync: topicTrickleFeedFarmerMasterDataByFarmId,
          currentClientId: 'global',
        );

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          isSync = false;
          break;
        }
        final dbCompany = await cmoDatabaseMasterService.db;
        await dbCompany.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];

            try {
              final topic = item.header?.originalTopic;
              if (topic == 'Cmo.MasterData.Gender.Global') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Genders...'));
                await insertGender(item);
              }

              if (topic == 'Cmo.MasterData.ScheduleActivity.Global') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated JobDescriptions...'));
                await insertScheduleActivity(item);
              }

              if (topic == 'Cmo.MasterData.JobDescription.Global') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated JobDescriptions...'));
                await insertJobDescription(item);
              }

              if (topic == 'Cmo.MasterData.Country.Global') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Countries...'));
                await insertCountry(item);
              }

              if (topic == 'Cmo.MasterData.SHT.Global') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Stakeholder Types...'));
                await insertStakeholderType(item);
              }

              if (topic == 'Cmo.MasterData.SS.Global') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Special Sites...'));
                await insertSpecialSite(item);
              }

              if (topic == 'Cmo.MasterData.SU.Global') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Social Upliftment...'));
                await insertSocialUpliftment(item);
              }

              if (topic == 'Cmo.MasterData.CUR.Global') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Customary Use Right...'));
                await insertCustomaryUseRight(item);
              }

              if (topic == 'Cmo.MasterData.AnnFrmBudTransCat.Global') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Annual Farm Budget Transaction Category...'));
                await insertAnnualFarmBudgetTransactionCategory(item);
              }
            } finally {
              isSync = false;
            }
          }
        });
      }
    } catch (e) {
      isSync = false;
    }
  }

  Future<void> subscribeToTrickleFeedMasterDataTopicByGroupSchemeId() async {
    var isSync = true;
    try {
      while (isSync) {
        onSyncStatus('Sync Feed Master Data Topic By GroupSchemeId...');
        MasterDataMessage? resPull;

        resPull = await cmoPerformApiService.pullMessage(
          topicMasterDataSync: topicTrickleFeedFgsMasterDataByGroupSchemeId,
          currentClientId: groupSchemeId,
        );

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          isSync = false;
          break;
        }

        final dbCompany = await cmoDatabaseMasterService.db;
        await dbCompany.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];

            try {
              final topic = item.header?.originalTopic;
              if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}GSS.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated GroupScheme Stakeholder...'));
                await insertGroupSchemeStakeholder(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}SH.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Stakeholder...'));
                await insertStakeholder(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}AnimalType.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Species Types...'));
                await insertAnimalType(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}SpeciesRange.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Species Range...'));
                await insertSpeciesRange(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}MonitoringRequirement.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Monitoring Requirements...'));
                await insertMonitoringRequirement(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}TrainingType.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Training Types...'));
                await insertTrainingType(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}PestsAndDiseaseType.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Pests and Disease Types...'));
                await insertPestsAndDiseaseType(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}GrievanceIssue.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Grievance Issues...'));
                await insertGrievanceIssue(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}PropertyDamaged.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Species Types...'));
                await insertPropertyDamaged(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}BCAType.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Biological Control Agent Types...'));
                await insertBiologicalControlAgentType(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}AsiType.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Asi Types...'));
                await insertAsiType(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}FireCause.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Fire Causes...'));
                await insertFireCause(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}NatureOfInjury.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Nature of Injuries...'));
                await insertNatureOfInjury(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}CAM.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Chemical Application Methods...'));
                await insertChemicalApplicationMethod(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}TreatmentMethod.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Treatment Methods...'));
                await insertTreatmentMethod(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}IssueType.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Disciplinaries Issues...'));
                await insertIssueType(item);
              } else if (topic ==
                  '${topicTrickleFeedFgsMasterDataByGroupSchemeId}PndTypeTreatmentMethod.$groupSchemeId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing Pests and Disease Type Treatment Method...'));
                await insertPestsAndDiseaseTypeTreatmentMethod(item);
              } else {}
            } finally {
              isSync = false;
            }
          }
        });
      }
    } catch (e) {
      isSync = false;
    }
  }

  Future<void> subscribeToTrickleFeedMasterDataTopicByFarmId() async {
    var isSync = true;
    try {
      while (isSync) {
        onSyncStatus('Sync Feed Master Data Topic By FarmId');

        MasterDataMessage? resPull;

        resPull = await cmoPerformApiService.pullMessage(
          topicMasterDataSync: topicTrickleFeedFarmerMasterDataByFarmId,
          currentClientId: int.parse(farmId),
        );

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          isSync = false;
          break;
        }
        final dbCompany = await cmoDatabaseMasterService.db;
        await dbCompany.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];

            try {
              final topic = item.header?.originalTopic;

              if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}Worker.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Worker...'));
                await insertWorker(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}SanctionRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Sanction Registers...'));
                await insertDisciplinaryRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}AnnFarmProd.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Annual Farm Production...'));
                await insertAnnualFarmProduction(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}Camp.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Camp...'));
                await insertCamp(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}FS.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Farm stakeholder...'));
                await insertFarmStakeholder(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}FSCUR.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Farm Stakeholder Customary Use Right...'));
                await insertFarmStakeholderCustomaryUseRight(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}FSSU.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Farm Stakeholder Social Upliftment...'));
                await insertFarmStakeholderSocialUpliftment(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}FSSS.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated Farm Stakeholder Special Site...'));
                await insertFarmStakeholderSpecialSite(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}SH.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated stakeholder...'));
                await insertStakeholder(item);
              } else if (topic ==
                  'is.topicTrickleFeedFarmerMasterDataByFarmIdAnnFrmBud.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated annual farm budgets...'));
                await insertAnnualFarmBudget(item);
              } else if (topic ==
                  'is.topicTrickleFeedFarmerMasterDataByFarmIdAnnFrmBudTrans.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing new and updated annual farm budget transactions...'));
                await insertAnnualFarmTransactionBudget(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}Schedule.$farmId') {
                emit(state.copyWith(syncMessage: 'Syncing Schedule...'));
                await insertSchedule(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}AaiRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Accident and Incident Registers...'));
                await insertAccidentAndIncidentRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}BcaRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing Biological Control Agent Registers...'));
                await insertBiologicalControlAgentRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}ChemicalRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Chemical Registers...'));
                await insertChemicalRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}AsiRegister.$farmId') {
                emit(state.copyWith(syncMessage: 'Syncing Asi Registers...'));
                await insertAsiRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}FireRegister.$farmId') {
                emit(state.copyWith(syncMessage: 'Syncing Fire Registers...'));
                await insertFireRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}CndRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing Complaints and Disputes Registers...'));
                await insertComplaintsAndDisputesRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}GrievanceRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Grievance Registers...'));
                await insertGrievanceRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}PndRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Pests and Diseases Registers...'));
                await insertPestsAndDiseasesRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}RteSpeciesRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Rte Species Registers...'));
                await insertRteSpeciesRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}TrainingRegister.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Training Register...'));
                await insertTrainingRegister(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}AsiRegisterPhoto.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Asi Register Photos...'));
                await insertAsiRegisterPhoto(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}AaiRegPropertyDamaged.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing Accident and Incident Property Damaged...'));
                await insertAccidentAndIncidentPropertyDamaged(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}PndRegisterTreatmentMethod.$farmId') {
                emit(state.copyWith(
                    syncMessage:
                        'Syncing Pests and Disease Register Treatment Method...'));
                await insertPestsAndDiseasesRegisterTreatmentMethod(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}RteSpeciesRegisterPhoto.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Rte Species Register Photos...'));
                await insertRteSpeciesRegisterPhoto(item);
              } else if (topic ==
                  '${topicTrickleFeedFarmerMasterDataByFarmId}ChemicalType.$farmId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing new and updated Chemical Types...'));
                await insertChemicalType(item);
              } else {}
            } finally {
              isSync = false;
            }
          }
        });
      }
    } catch (e) {
      isSync = false;
    }
  }

  Future<void> summaryFarmerSync() async {
    var isSync = true;

    try {
      while (isSync) {
        onSyncStatus('Sync All Master Data...');

        MasterDataMessage? resPull;

        resPull = await cmoPerformApiService.pullMessage(
          topicMasterDataSync: topicMasterDataSync,
          currentClientId: userDeviceId,
        );

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          isSync = false;
          break;
        }

        final dbCompany = await cmoDatabaseMasterService.db;
        await dbCompany.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];

            try {
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
              } else if (topic ==
                  '${topicMasterDataSync}Country.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Country...'));
                await insertCountry(item);
              } else if (topic ==
                  '${topicMasterDataSync}Gender.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Gender...'));
                await insertGender(item);
              } else if (topic ==
                  '${topicMasterDataSync}ScheduleActivity.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Schedule Activity...'));
                await insertScheduleActivity(item);
              } else if (topic ==
                  '${topicMasterDataSync}GroupScheme.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Group Scheme...'));
                await insertGroupScheme(item);
              } else if (topic == '${topicMasterDataSync}SU.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Social Upliftment...'));
                await insertSocialUpliftment(item);
              } else if (topic == '${topicMasterDataSync}SS.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Special Site...'));
                await insertSpecialSite(item);
              } else if (topic == '${topicMasterDataSync}CUR.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Customary Use Right...'));
                await insertCustomaryUseRight(item);
              } else if (topic == '${topicMasterDataSync}SHT.$userDeviceId') {
                emit(
                    state.copyWith(syncMessage: 'Syncing Stakeholder Type...'));
                await insertStakeholderType(item);
              } else if (topic == '${topicMasterDataSync}SH.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Stakeholder...'));
                await insertStakeholder(item);
              } else if (topic == '${topicMasterDataSync}FS.$userDeviceId') {
                emit(
                    state.copyWith(syncMessage: 'Syncing Farm Stakeholder...'));
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
                    syncMessage:
                        'Syncing Farm Stakeholder Social Upliftment...'));
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
              } else if (topic ==
                  '${topicMasterDataSync}AnnFrmBud.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Annual Farm Budgets...'));
                await insertAnnualFarmBudget(item);
              } else if (topic ==
                  '${topicMasterDataSync}AnnFrmBudTrans.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Annual Farm Budget Transactions...'));
                await insertAnnualFarmTransactionBudget(item);
              } else if (topic ==
                  '${topicMasterDataSync}Schedule.$userDeviceId') {
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
                    syncMessage:
                        'Syncing Biological Control Agent Registers...'));
                await insertBiologicalControlAgentRegister(item);
              } else if (topic ==
                  '${topicMasterDataSync}ChemicalRegister.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Chemical Registers...'));
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
                    syncMessage:
                        'Syncing Complaints and Disputes Registers...'));
                await insertComplaintsAndDisputesRegister(item);
              } else if (topic ==
                  '${topicMasterDataSync}GrievanceRegister.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Grievance Registers...'));
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
                emit(state.copyWith(
                    syncMessage: 'Syncing Training Register...'));
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
                emit(
                    state.copyWith(syncMessage: 'Syncing Property Damaged...'));
                await insertPropertyDamaged(item);
              } else if (topic ==
                  '${topicMasterDataSync}BCAType.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Biological Control Agent Type...'));
                await insertBiologicalControlAgentType(item);
              } else if (topic ==
                  '${topicMasterDataSync}IssueType.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Disciplinaries Issues...'));
                await insertIssueType(item);
              } else if (topic ==
                  '${topicMasterDataSync}ChemicalType.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Chemical Type...'));
                await insertChemicalType(item);
              } else if (topic ==
                  '${topicMasterDataSync}AsiType.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Asi Type...'));
                await insertAsiType(item);
              } else if (topic ==
                  '${topicMasterDataSync}FireCause.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Fire Cause...'));
                await insertFireCause(item);
              } else if (topic ==
                  '${topicMasterDataSync}NatureOfInjury.$userDeviceId') {
                emit(
                    state.copyWith(syncMessage: 'Syncing Nature of Injury...'));
                await insertNatureOfInjury(item);
              } else if (topic == '${topicMasterDataSync}CAM.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Chemical Application Method...'));
                await insertChemicalApplicationMethod(item);
              } else if (topic ==
                  '${topicMasterDataSync}TreatmentMethod.$userDeviceId') {
                emit(
                    state.copyWith(syncMessage: 'Syncing Treatment Method...'));
                await insertTreatmentMethod(item);
              } else if (topic ==
                  '${topicMasterDataSync}AsiRegisterPhoto.$userDeviceId') {
                emit(state.copyWith(
                    syncMessage: 'Syncing Asi Register Photos...'));
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
                    syncMessage:
                        'Syncing Pest and Disease Treatment Method...'));
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
            } finally {
              isSync = false;
            }
          }
        });
      }
    } catch (e) {}
  }

  Future<void> insertCompartments(List<Compartment>? data) async {
    final futures = <Future<void>>[];

    if (data == null || data.isEmpty) return;

    for (final item in data) {
      futures.add(cmoDatabaseMasterService.cacheCompartment(
          item.copyWith(
              localCompartmentId: item.managementUnitId.toIdIsarFromUuid,
              isActive: true,
              isMasterdataSynced: true),
          isDirect: true));
    }

    await Future.wait(futures);
  }

  Future<int?> insertWorker(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;

      if (bodyJson['JobDescriptions'] != null) {
        final futures = <Future<void>>[];

        final workerJobDescriptionJsons =
            bodyJson['JobDescriptions'] as List<dynamic>;

        for (final workerJobDescriptionJson in workerJobDescriptionJsons) {
          final workerJobDescription = WorkerJobDescription.fromJson(
              workerJobDescriptionJson as Map<String, dynamic>);

          futures.add(cmoDatabaseMasterService
              .cacheWorkerJobDescriptionFromFarm(workerJobDescription));
        }

        await Future.wait(futures);
      }

      final worker = FarmerWorker.fromJson(bodyJson);
      return cmoDatabaseMasterService
          .cacheFarmerWorker(worker.copyWith(isActive: true, isLocal: 0));
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
          .cachePetsAndDiseaseRegisterTreatmentMethod(
              rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheSanctionRegister(
          rs.copyWith(isActive: true, isLocal: false, isSynced: true));
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
      return cmoDatabaseMasterService
          .cacheAnnualProduction(rs.copyWith(isLocal: false, isActive: true));
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
      return cmoDatabaseMasterService
          .cacheCampFromFarm(rs.copyWith(isActive: true, isLocal: false));
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
      return cmoDatabaseMasterService
          .cacheJobDescription(rs.copyWith(isActive: true));
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
      return cmoDatabaseMasterService.cacheCountry(rs.copyWith(isActive: true));
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
      return cmoDatabaseMasterService.cacheGender(rs.copyWith(isActive: true));
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
      return cmoDatabaseMasterService
          .cacheScheduleActivity(rs.copyWith(isActive: true));
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
      return cmoDatabaseMasterService
          .cacheGroupScheme(rs.copyWith(isActive: true));
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
      return cmoDatabaseMasterService.cacheSocialUpliftment(
          rs.copyWith(isActive: true, isMasterDataSynced: 1));
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
      return cmoDatabaseMasterService
          .cacheSpecialSite(rs.copyWith(isActive: true, isMasterDataSynced: 1));
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
      return cmoDatabaseMasterService.cacheCustomaryUseRight(
          rs.copyWith(isActive: true, isMasterDataSynced: 1));
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
      return cmoDatabaseMasterService.cacheStakeHolderType(
          rs.copyWith(isActive: 1, isMasterDataSynced: 1));
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
      return cmoDatabaseMasterService
          .cacheStakeHolder(rs.copyWith(isActive: 1, isMasterDataSynced: 1));
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertFarmStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = FarmStakeHolder.fromJson(bodyJson);
      return cmoDatabaseMasterService
          .cacheFarmStakeHolderFromFarm(rs.copyWith(isMasterDataSynced: 1));
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertGroupSchemeStakeholder(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rs = GroupSchemeStakeholder.fromJson(bodyJson);
      return cmoDatabaseMasterService
          .cacheGroupSchemeStakeholder(rs.copyWith(isMasterDataSynced: 1));
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
      return cmoDatabaseMasterService.cacheCustomaryUseRight(
          rs.copyWith(isMasterDataSynced: 1, isActive: true));
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
      return cmoDatabaseMasterService.cacheSocialUpliftment(
          rs.copyWith(isActive: true, isMasterDataSynced: 1));
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
      return cmoDatabaseMasterService.cacheFarmStakeHolder(rs.copyWith(
          isActive: true, isLocal: false, isMasterDataSynced: true));
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
      return cmoDatabaseMasterService.cacheAnnualFarmBudgetTransactionCategory(
          rs.copyWith(isActive: true));
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
      return cmoDatabaseMasterService
          .cacheAnnualBudgets(rs.copyWith(isActive: true, isLocal: 0));
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
      return cmoDatabaseMasterService.cacheAnnualBudgetTransactions(
          rs.copyWith(isActive: true, isLocal: 0));
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
      return cmoDatabaseMasterService
          .cacheSchedule(rs.copyWith(isActive: true));
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
      return cmoDatabaseMasterService.cacheAccidentAndIncident(
          rs.copyWith(isActive: true, isMasterDataSynced: true));
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
      return cmoDatabaseMasterService.cacheBiologicalControlAgents(
          rs.copyWith(isMasterDataSynced: true, isActive: true));
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
      return cmoDatabaseMasterService
          .cacheChemical(rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService
          .cacheAsi(rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheFireRegister(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cachePetsAndDisease(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheGrievanceRegister(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cachePetsAndDisease(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService
          .cacheFarmerWorker(rs.copyWith(isActive: true, isLocal: 0));
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
      return cmoDatabaseMasterService
          .cacheTraining(rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheAnimalType(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheSpeciesRange(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheMonitoringRequirement(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheTrainingType(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cachePestsAndDiseaseType(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheGrievanceIssue(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cachePropertyDamaged(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheBiologicalControlAgentTypes(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheIssueType(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheChemicalTypes(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService
          .cacheAsiTypes(rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheFireCause(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheNatureOfInjury(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheChemicalApplicationMethods(
          rs.copyWith(isMasterdataSynced: true, isActive: true));
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
      return cmoDatabaseMasterService.cacheTreatmentMethod(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService
          .cacheAsiPhoto(rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheAccidentAndIncidentPropertyDamaged(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cachePetsAndDiseaseTreatmentMethod(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cachePetsAndDiseaseTypeTreatmentMethod(
          rs.copyWith(isActive: true, isMasterdataSynced: true));
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
      return cmoDatabaseMasterService.cacheRteSpeciesPhotos(rs.copyWith(
          isActive: true, isMasterdataSynced: true, isLocal: false));
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<void> createSubscriptions() async {
    final futures = [
      getSyncGroupSchemeAllMasterDataTopic,
      getFarmerTrickleFeedMasterDataTopicByFarmId,
      getTrickleFeedMasterDataTopic,
      getTrickleFeedMasterDataTopicByGroupSchemeId,
    ]
        .map((e) => cmoPerformApiService.createSubscription(
            topic: e, currentClientId: userDeviceId))
        .toList();
    await Future.wait(futures)
        .then((value) => debugPrint('TUNT createSubscriptions - $value'));
  }
}
