import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/biological_control_agent_register_payload/biological_control_agent_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/camp_payload/camp_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/chemical_register_payload/chemical_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_payload/farm_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_asi_register_payload/main_asi_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_pests_and_diseases_register_payload/main_pests_and_diseases_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/properties_payload/properties_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/utils/logger.dart';

mixin FarmUploadSummaryMixin {
  void Function(FarmerSyncSummaryState)? get mEmit => null;
  void Function(FarmerSyncSummaryState) get _emit => mEmit!;

  FarmerSyncSummaryState get mState => const FarmerSyncSummaryState();
  FarmerSyncSummaryState get _state => mState;

  String get mFarmId => _state.farmId!;
  int get mUserId => _state.userId!;
  int get mUserDeviceId => _state.userDeviceId!;
  int get mGroupSchemeId => _state.groupSchemeId!;
  int get mRmuId => _state.rmuId!;

  final _enableUpdateStatus = true;
  final _enableTestMode = false;

  String get masterTopic => 'Cmo.MasterData.';

  String topicByFarmIdAndUserDeviceId(String field) =>
      '$masterTopic$field.$mFarmId.$mUserDeviceId';

  Message globalMessage = const Message(properties: [
    Properties(key: 'DbSchemaVersion', value: '12'),
  ]);

  Future<void> onUploadingFarmData() async {
    await _publishWorker(); //done
    await _publishAnnFarmProduction(); //done
    await _publishCamp(); //done
    await _publishCustomaryUseRight(); //done
    await _publishSocialUpliftments(); //done
    await _publishSpecialSites(); //done
    await _publishFarmStakeholders(); // done
    await _publishAnnualFarmBudgets(); // done
    await _publishAnnualFarmBudgetTransactions(); // done
    await _publishSanctionRegisters(); // done
    await _publishChemicalRegister(); // done
    await _publishTrainingRegisters(); // done
    await _publishAsiRegisters(); // done
    await _publishFireRegisters(); // done
    await _publishGrievanceRegisters(); // done
    await _publishRteSpeciesRegisters(); //done
    await _publishPestsAndDiseasesRegisters(); //  done
    await _publishComplaintsAndDisputesRegisters(); // done
    await _publishAccidentAndIncidentRegisters(); // done
    await _publishBiologicalControlAgentRegisters(); // done
    await _publishCompartment();
    await _publishIllegalActivities();
    await _publishActionLogs();
  }

  Future<void> _publishCompartment() async {
    onStatus('Sync Compartments...');

    try {
      logger.d('Get unsynced compartment');
      final compartments =
          await cmoDatabaseMasterService.getUnsyncedCompartmentsFarm();
      if (compartments.isNotBlank) {
        logger.d('Unsynced compartments count: ${compartments.length}');
        for (final compartment in compartments) {
          final syncedCompartment =
              await cmoPerformApiService.insertUpdatedCompartment(compartment);
          if (syncedCompartment != null) {
            await cmoDatabaseMasterService.cacheCompartment(
              syncedCompartment.copyWith(
                isMasterdataSynced: true,
                localCompartmentId: compartment.localCompartmentId,
                updateDT: DateTime.now(),
                productGroupTemplateName: compartment.productGroupTemplateName,
                speciesGroupTemplateName: compartment.speciesGroupTemplateName,
                espacementWidth: compartment.espacementWidth,
                espacementLength: compartment.espacementLength,
              ),
              isDirect: true,
            );
          }
        }
      } else {
        logger.d('No Compartments to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> _publishIllegalActivities() async {
    onStatus('Sync Illegal Activities...');
    try {
      logger.d('Get unsynced Illegal Activities');
      final activities = await cmoDatabaseMasterService
          .getAllUnsyncedIllegalActivityRegisters();
      if (activities.isNotBlank) {
        logger.d('Unsynced Illegal Activities count: ${activities.length}');
        for (final activity in activities) {
          final syncedActivity = await cmoPerformApiService.insertUpdatedIllegalActivity(activity);
          if (syncedActivity != null) {
            await cmoDatabaseMasterService.cacheIllegalActivityRegister(
              syncedActivity.copyWith(
                isMasterdataSynced: true,
              ),
              isDirect: true,
            );
          }
        }
      } else {
        logger.d('No Illegal Activities to sync');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> _publishActionLogs() async {
    onStatus('Uploading Action Logs...');
    try {

      final actionLogs = await cmoDatabaseMasterService.getUnsyncedActionLogs();
      logger.d('Unsynced Action Logs count: ${actionLogs.length}');
      if (actionLogs.isNotBlank) {
        for (final actionLog in actionLogs) {
          final photos = await cmoDatabaseMasterService.getUnsyncedActionLogPhotosByActionLogId(actionLog.actionLogId);

          final syncedActionLog =
              await cmoPerformApiService.insertUpdatedActionLog(
            actionLog.copyWith(
              photos: photos
                  .map((e) =>
                      e.copyWith(photo: e.photo.stringToBase64SyncServer))
                  .toList(),
            ),
          );

          if (syncedActionLog != null) {
            await cmoDatabaseMasterService.cacheActionLog(
              actionLog.copyWith(
                isMasterDataSynced: true,
              ),
            );

            for (final photo in photos) {
              await cmoDatabaseMasterService.cacheActionLogPhoto(photo.copyWith(isMasterdataSynced: true));
            }
            logger.d('Successfully published Action Log: ${syncedActionLog.actionName}');
          } else {
            logger.d('Failed to publish Action Log: ${actionLog.actionName}');
          }
        }
      } else {
        logger.d('No Action Log to sync...');
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> _publishWorker() async {
    try {
      onStatus('Sync Worker...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final workers = await cmoDatabaseMasterService
          .getUnsyncedWorkersWithJobDescriptionsByFarmId(mFarmId);

      for (final worker in workers) {
        final workerJobDescriptions = await cmoDatabaseMasterService
            .getWorkerJobDescriptionByWorkerId(worker.workerId ?? '');

        messages.add(
          globalMessage.copyWith(
            body: jsonEncode(
              worker.copyWith(jobDescriptions: workerJobDescriptions),
            ),
          ),
        );

        if (_enableUpdateStatus) {
          futures.add(
            cmoDatabaseMasterService.cacheFarmerWorker(
              worker.copyWith(isLocal: false),
              isDirect: false,
            ),
          );
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('Worker'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishAnnFarmProduction() async {
    try {
      onStatus('Sync Annual Farm Production...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final annFarmProductions = await cmoDatabaseMasterService
          .getUnsyncedAnnualFarmProductionByFarmId(mFarmId);

      final annFarmProductionsPayLoad =
          annFarmProductions.map((e) => e.toPayLoad()).toList();

      for (final item in annFarmProductionsPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in annFarmProductions) {
          futures.add(cmoDatabaseMasterService
              .cacheAnnualProductionFromFarm(item.copyWith(isLocal: false)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('AnnFarmProduction'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishCamp() async {
    try {
      onStatus('Sync Camp...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final camps =
          await cmoDatabaseMasterService.getUnsyncedFarmCampByFarmId(mFarmId);

      final campsPayLoad = camps.map((e) => e.toPayLoad()).toList();

      final campsTest = [
        CampPayLoad(
          CampId: '1689499406642',
          CampName: 'test camp 1 by TUNT',
          FarmId: mFarmId,
          IsActive: true,
          IsLocal: 1,
          CampOrder: 3,
          ProtectedArea: 12.0,
          CattlePostHousing: 222.0,
          Corridors: 33.0,
          RoadAndFireBreaks: 11.0,
          PoachingAlleviationZone: 11.0,
          ConvertedToGrassland: 0,
          RangeLand: 0,
          InfestationCategory1: 1,
          InfestationCategory2: 1,
          InfestationCategory3: 0,
          InfestationCategory4: 0,
          InfestationCategory5: 0,
          CumulativeBiomass: 0.0,
          PlannedYearOfHarvest: 2023,
          ActualYearOfHarvest: 2023,
          TonsOfCharcoalProduced: 0,
          TotalArea: 289.0,
        )
      ];

      if (_enableTestMode) {
        for (final item in campsTest) {
          messages.add(globalMessage.copyWith(body: jsonEncode(item)));
        }
      } else {
        for (final item in campsPayLoad) {
          messages.add(globalMessage.copyWith(body: jsonEncode(item)));
        }
      }

      if (_enableUpdateStatus) {
        for (final item in camps) {
          futures.add(cmoDatabaseMasterService
              .cacheCampFromFarmSync(item.copyWith(isLocal: false)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('Camp'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishCustomaryUseRight() async {
    try {
      onStatus('Sync Customary Use Right...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final customaryUseRights =
          await cmoDatabaseMasterService.getUnsyncedCustomaryUseRights();

      final customaryUseRightsPayLoad =
          customaryUseRights.map((e) => e.toPayLoad()).toList();

      for (final item in customaryUseRightsPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in customaryUseRights) {
          futures.add(cmoDatabaseMasterService.cacheCustomaryUseRightFromFarm(
              item.copyWith(isMasterDataSynced: 1)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('CUR'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishSocialUpliftments() async {
    try {
      onStatus('Sync Social Upliftments...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final socialUpliftments =
          await cmoDatabaseMasterService.getUnsyncedSocialUpliftments();

      final socialUpliftmentsPayLoad =
          socialUpliftments.map((e) => e.toPayLoad()).toList();

      for (final item in socialUpliftmentsPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in socialUpliftments) {
          futures.add(cmoDatabaseMasterService.cacheSocialUpliftmentFromFarm(
              item.copyWith(isMasterDataSynced: 1)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('SU'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishSpecialSites() async {
    try {
      onStatus('Sync Special Sites...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final specialSites =
          await cmoDatabaseMasterService.getUnsyncedSpecialSite();

      final specialSitesPayLoad =
          specialSites.map((e) => e.toPayLoad()).toList();

      for (final item in specialSitesPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in specialSites) {
          futures.add(cmoDatabaseMasterService
              .cacheSpecialSiteFromFarm(item.copyWith(isMasterDataSynced: 1)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('SS'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishFarmStakeholders() async {
    try {
      onStatus('Sync Farm Stakeholders...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final farmStakeholdersPayLoad = <FarmStakeholderPayLoad>[];

      final allFarmStakeholders = await cmoDatabaseMasterService.getFarmStakeholder();
      final unSyncedStakeholders = await cmoDatabaseMasterService.getUnsyncedStakeholder();
      final unSyncedFSSU = await cmoDatabaseMasterService
          .getUnsycnedFarmStakeholderSocialUpliftments();
      final unSyncedFSSS = await cmoDatabaseMasterService
          .getUnsycnedFarmStakeholderSpecialSites();
      final unSyncedFSCUR = await cmoDatabaseMasterService
          .getUnsycnedFarmStakeholderCustomaryUseRights();

      for (final unSyncedStakeholderItem in unSyncedStakeholders) {
        final farmStakeholder = allFarmStakeholders.firstWhereOrNull((element) => element.stakeHolderId == unSyncedStakeholderItem.stakeholderId);

        final farmStakeholderCustomaryUseRights = <FarmStakeholderCustomaryUseRight>[];

        for (final item in unSyncedFSCUR) {
          if (item.farmStakeholderId == farmStakeholder?.farmStakeHolderId) {
            farmStakeholderCustomaryUseRights.add(item);
          }
        }

        final farmStakeholderSocialUpliftments = <FarmStakeholderSocialUpliftment>[];

        for (final item in unSyncedFSSU) {
          if (item.farmStakeholderId == farmStakeholder?.farmStakeHolderId) {
            farmStakeholderSocialUpliftments.add(item);
          }
        }

        final farmStakeholderSpecialSites = <FarmStakeholderSpecialSite>[];

        for (final item in unSyncedFSSS) {
          if (item.farmStakeholderId == farmStakeholder?.farmStakeHolderId) {
            farmStakeholderSpecialSites.add(item);
          }
        }

        farmStakeholdersPayLoad.add(
          FarmStakeholderPayLoad(
            stakeholder: unSyncedStakeholderItem,
            farmStakeholder: farmStakeholder,
            farmStakeholderCustomaryUseRights: farmStakeholderCustomaryUseRights,
            farmStakeholderSocialUpliftments: farmStakeholderSocialUpliftments,
            farmStakeholderSpecialSites: farmStakeholderSpecialSites,
          ),
        );

        if (_enableUpdateStatus) {
          futures.add(cmoDatabaseMasterService.cacheStakeHolderFromFarm(
              unSyncedStakeholderItem.copyWith(isMasterDataSynced: true,)));

          for (final item in unSyncedFSCUR) {
            futures.add(
                cmoDatabaseMasterService.cacheFarmStakeholderCustomaryUseRights(
                    item.copyWith(isMasterDataSynced: 1)));
          }

          for (final item in unSyncedFSSS) {
            futures.add(
                cmoDatabaseMasterService.cacheFarmStakeholderSpecialSites(
                    item.copyWith(isMasterDataSynced: 1)));
          }

          for (final item in unSyncedFSSU) {
            futures.add(
                cmoDatabaseMasterService.cacheFarmStakeholderSocialUpliftments(
                    item.copyWith(isMasterDataSynced: 1)));
          }
        }
      }

      for (final item in farmStakeholdersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('FS'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishAnnualFarmBudgets() async {
    try {
      onStatus('Sync Annual Farm Budgets...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final annualFarmBudgets = await cmoDatabaseMasterService
          .getUnsyncedAnnualBudgetByFarmId(mFarmId);

      final annualFarmBudgetsPayLoad =
          annualFarmBudgets.map((e) => e.toPayLoad()).toList();

      for (final item in annualFarmBudgetsPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in annualFarmBudgets) {
          futures.add(cmoDatabaseMasterService
              .cacheAnnualBudgetsFromFarm(item.copyWith(isLocal: 0)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('AnnFrmBud'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishAnnualFarmBudgetTransactions() async {
    try {
      onStatus('Sync Annual Farm Budget Transactions...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final annualFarmBudgetTransactions =
          await cmoDatabaseMasterService.getUnsyncedAnnualBudgetTransaction();

      final annualFarmBudgetTransactionsPayLoad =
          annualFarmBudgetTransactions.map((e) => e.toPayLoad()).toList();

      for (final item in annualFarmBudgetTransactionsPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in annualFarmBudgetTransactions) {
          futures.add(
              cmoDatabaseMasterService.cacheAnnualBudgetTransactionsFromFarm(
                  item.copyWith(isLocal: 0)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('AnnFrmBudTrans'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishSanctionRegisters() async {
    try {
      onStatus('Sync Sanction Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final sanctionRegisters = await cmoDatabaseMasterService
          .getUnsyncedSanctionRegistersByFarmId(mFarmId);

      for (final item in sanctionRegisters) {
        messages.add(
          globalMessage.copyWith(
            body: jsonEncode(
              item.copyWith(
                signatureImage: item.signatureImage.stringToBase64SyncServer,
              ),
            ),
          ),
        );
      }

      if (_enableUpdateStatus) {
        for (final item in sanctionRegisters) {
          futures.add(cmoDatabaseMasterService.cacheSanctionRegisterFromFarm(
              item.copyWith(isSynced: true, isLocal: false)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('SanctionRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishChemicalRegister() async {
    try {
      onStatus('Sync Chemical Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final chemicalRegisters = await cmoDatabaseMasterService
          .getUnsyncedChemicalRegisters(int.parse(mFarmId));

      final chemicalRegistersPayLoad =
          chemicalRegisters.map((e) => e.toPayLoad()).toList();

      final chemicalTest = [
        ChemicalRegisterPayLoad(
          ChemicalRegisterNo: '1689499467089377',
          FarmId: mFarmId,
          CampId: '1689499406642',
          Date: DateTime.now(),
          OpeningStock: 12.0,
          Issued: 22.0,
          Balance: 11.0,
          Mixture: '11',
          UsagePerHa: 2.0,
          Comment: 'this is chemical 1 test by tu',
          IsActive: true,
          IsMasterdataSynced: false,
        ),
      ];

      if (_enableTestMode) {
        for (final item in chemicalTest) {
          messages.add(globalMessage.copyWith(body: jsonEncode(item)));
        }
      } else {
        for (final item in chemicalRegistersPayLoad) {
          messages.add(globalMessage.copyWith(body: jsonEncode(item)));
        }
      }

      if (_enableUpdateStatus) {
        for (final item in chemicalRegisters) {
          futures.add(cmoDatabaseMasterService.cacheChemicalRegisterFromFarm(
              item.copyWith(isMasterdataSynced: true)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('ChemicalRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishTrainingRegisters() async {
    try {
      onStatus('Sync Training Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];
      final trainingRegisters =
          await cmoDatabaseMasterService.getUnsyncedTrainingRegisters(mFarmId);
      for (final item in trainingRegisters) {
        final traineeRegisters = await cmoDatabaseMasterService.getTraineeRegistersByTrainingRegisterNo(item.trainingRegisterNo);
        await cmoDatabaseMasterService.removeAllTraineeRegistersByTrainingRegisterNo(
          item.trainingRegisterNo,
        );

        var trainingRegisterNo = item.trainingRegisterNo.isBlank
            ? DateTime.now().microsecondsSinceEpoch
            : int.parse(item.trainingRegisterNo!);
        for (final trainee in traineeRegisters) {
          final updatedTrainee = trainee.copyWith(
            trainingRegisterId: null,
            trainingRegisterNo: trainingRegisterNo.toString(),
          );

          messages.add(
            globalMessage.copyWith(
              body: jsonEncode(
                item.copyWith(
                  trainingRegisterId: null,
                  trainingRegisterNo: trainingRegisterNo.toString(),
                  traineeRegisters: [updatedTrainee],
                  signatureImage: item.signatureImage.stringToBase64SyncServer,
                ),
              ),
            ),
          );

          await cmoDatabaseMasterService.cacheTraineeRegister(updatedTrainee);
          trainingRegisterNo++;
        }
      }

      if (_enableUpdateStatus) {
        for (final item in trainingRegisters) {
          futures.add(
            cmoDatabaseMasterService.cacheTraining(
              item.copyWith(isMasterdataSynced: true),
              isDirect: false,
            ),
          );
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('TrainingRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishAsiRegisters() async {
    try {
      onStatus('Sync Asi Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final mainAsiRegisterPayLoad = <MainAsiRegisterPayLoad>[];

      final asiRegisters =
          await cmoDatabaseMasterService.getUnsyncedAsiRegisters(mFarmId);

      for (final item in asiRegisters) {
        final asiPhotos = await cmoDatabaseMasterService
            .getUnsyncAsiPhotoByAsiRegisterNo(item.asiRegisterNo);

        final asiPhotosPayLoad = asiPhotos.map((e) {
          if (e.asiRegisterId == null) {
            return e.copyWith(
              asiRegisterId: '00000000-0000-0000-0000-000000000000',
              photo: e.photo.stringToBase64SyncServer,
            );
          }
          return e;
        }).toList();

        mainAsiRegisterPayLoad.add(MainAsiRegisterPayLoad(
          asi: item,
          photos: asiPhotosPayLoad,
        ));

        for (final photo in asiPhotos) {
          futures.add(
            cmoDatabaseMasterService.cacheAsiPhoto(
              photo.copyWith(
                isMasterdataSynced: true,
              ),
            ),
          );
        }
      }

      for (final item in mainAsiRegisterPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in asiRegisters) {
          futures.add(cmoDatabaseMasterService
              .cacheAsi(item.copyWith(isMasterdataSynced: true)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('AsiRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishFireRegisters() async {
    try {
      onStatus('Sync Fire Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final fireRegisters = await cmoDatabaseMasterService.getUnsyncedFireRegisters(mFarmId);

      for (final fireRegister in fireRegisters) {
        final photos = await cmoDatabaseMasterService.getUnsyncedAllFireRegisterPhotosByFireRegisterNo(
          fireRegister.fireRegisterNo,
        );

        messages.add(
          globalMessage.copyWith(
            body: jsonEncode(
              fireRegister.copyWith(
                photos: photos
                    .map(
                      (e) => e.copyWith(
                        photo: e.photo.stringToBase64SyncServer,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );

        futures.add(
          cmoDatabaseMasterService.cacheFireRegister(
            fireRegister.copyWith(isMasterdataSynced: true),
            isDirect: false,
          ),
        );

        for (final photo in photos) {
          futures.add(
            cmoDatabaseMasterService.cacheFirePhotoModel(
              photo.copyWith(isMasterdataSynced: true),
            ),
          );
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('FireRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishGrievanceRegisters() async {
    try {
      onStatus('Sync Grievance Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final grievanceRegisters =
          await cmoDatabaseMasterService.getUnsyncedGrievanceRegisters(mFarmId);

      final grievanceRegistersPayLoad =
          grievanceRegisters.map((e) => e.toPayLoad()).toList();

      for (final item in grievanceRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in grievanceRegisters) {
          futures.add(cmoDatabaseMasterService.cacheGrievanceRegisterFromFarm(
              item.copyWith(isMasterdataSynced: true)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('GrievanceRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishRteSpeciesRegisters() async {
    try {
      onStatus('Sync RTE Species Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final rteSpeciesRegisters = await cmoDatabaseMasterService.getUnsyncedRteSpeciesByFarmId(mFarmId);

      for (final item in rteSpeciesRegisters) {
        final rteSpeciesPhotos = await cmoDatabaseMasterService
            .getUnsyncedRteSpeciesRegisterPhotoByRteSpeciesRegisterNo(
          item.rteSpeciesRegisterNo,
        );

        for (final photo in rteSpeciesPhotos) {
          futures.add(
            cmoDatabaseMasterService.cacheRteSpeciesPhotoModel(
              photo.copyWith(isMasterdataSynced: true),
            ),
          );
        }

        messages.add(
          globalMessage.copyWith(
            body: jsonEncode(
              RteSpeciesRegisterPayload(
                register: item,
                photos: rteSpeciesPhotos
                    .map(
                      (item) => item.copyWith(
                        rteSpeciesRegisterId: item.rteSpeciesRegisterId ??
                            '00000000-0000-0000-0000-000000000000',
                        photo: item.photo?.stringToBase64SyncServer,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      }

      if (_enableUpdateStatus) {
        for (final item in rteSpeciesRegisters) {
          futures.add(
            cmoDatabaseMasterService.cacheRteSpecies(
              item.copyWith(isMasterDataSynced: true),
              isDirect: false,
            ),
          );
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('RteSpeciesRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishPestsAndDiseasesRegisters() async {
    try {
      onStatus('Sync Pests And Diseases Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final pestsAndDiseasesRegisters = await cmoDatabaseMasterService
          .getUnsyncedPetsAndDiseaseRegisterByFarmId(mFarmId);

      final pestsAndDiseasesRegistersPayLoad =
          <MainPestsAndDiseasesRegisterPayLoad>[];

      for (final item in pestsAndDiseasesRegisters) {
        var payLoadItem = const MainPestsAndDiseasesRegisterPayLoad();

        final registerTreatmentMethod = await cmoDatabaseMasterService
            .getUnsyncedPestsAndDiseasesRegisterTreatmentMethodByPestsAndDiseasesRegisterNo(
                item.pestsAndDiseasesRegisterNo.toString());

        var registerTreatmentMethodPayLoad =
            registerTreatmentMethod.map((e) => e.toPayLoad()).toList();

        registerTreatmentMethodPayLoad =
            registerTreatmentMethodPayLoad.map((e) {
          if (e.PestsAndDiseasesRegisterId == null) {
            return e.copyWith(
                PestsAndDiseasesRegisterId:
                    '00000000-0000-0000-0000-000000000000');
          }
          return e;
        }).toList();

        payLoadItem = payLoadItem.copyWith(
          petsAndDiseaseRegister: item,
          TreatmentMethod: registerTreatmentMethodPayLoad,
        );

        pestsAndDiseasesRegistersPayLoad.add(payLoadItem);

        if (_enableUpdateStatus) {
          futures.add(cmoDatabaseMasterService.cachePetsAndDisease(
              item.copyWith(isMasterdataSynced: true)));

          for (final item in registerTreatmentMethod) {
            futures.add(cmoDatabaseMasterService
                .cachePestsAndDiseasesRegisterTreatmentMethod(
                    item.copyWith(isMasterdataSynced: true)));
          }
        }
      }

      for (final item in pestsAndDiseasesRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('PndRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishComplaintsAndDisputesRegisters() async {
    try {
      onStatus('Sync Complaints And Disputes Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final complaintsAndDisputesRegisters = await cmoDatabaseMasterService
          .getUnsyncedComplaintsAndDisputesRegisterByFarmId(mFarmId);

      final complaintsAndDisputesRegistersPayLoad =
          complaintsAndDisputesRegisters.map((e) => e.toPayLoad()).toList();

      for (final item in complaintsAndDisputesRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (_enableUpdateStatus) {
        for (final item in complaintsAndDisputesRegisters) {
          futures.add(
              cmoDatabaseMasterService.cacheComplaintsAndDisputesRegister(
                  item.copyWith(isMasterdataSynced: true)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('CndRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishBiologicalControlAgentRegisters() async {
    try {
      onStatus('Sync Biological Control Agent Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final biologicalControlAgentRegisters = await cmoDatabaseMasterService
          .getUnsyncedBiologicalControlAgentRegisterByFarmId(mFarmId);

      final biologicalControlAgentRegistersPayLoad =
          biologicalControlAgentRegisters.map((e) => e.toPayLoad()).toList();

      final biologicalTest = [
        BiologicalControlAgentRegisterPayLoad(
          BiologicalControlAgentRegisterNo:
              DateTime.now().microsecondsSinceEpoch.toString(),
          FarmId: mFarmId,
          BiologicalControlAgentTypeId: 1,
          BiologicalControlAgentName: 'Hocus Pocus',
          BiologicalControlAgentRegisterId: null,
          IssueDescription: null,
          DateReleased: DateTime.now(),
          StakeholderId: null,
          MonitoringRequirementId: 1,
          Comment: null,
          CarRaisedDate: DateTime.now().toIso8601String(),
          CarClosedDate: DateTime.now().toIso8601String(),
          IsActive: true,
          IsMasterdataSynced: false,
          StakeholderName: null,
          BiologicalControlAgentTypeName: null,
          BiologicalControlAgentTypeScientificName: null,
          BiologicalControlAgentTypeCountryName: 'South Africa',
          ReasonForBioAgent: 'Eats the pest',
          MonitoringRequirementName: null,
        )
      ];

      if (_enableTestMode) {
        for (final item in biologicalTest) {
          messages.add(globalMessage.copyWith(body: jsonEncode(item)));
        }
      } else {
        for (final item in biologicalControlAgentRegistersPayLoad) {
          messages.add(globalMessage.copyWith(body: jsonEncode(item)));
        }
      }

      if (_enableUpdateStatus) {
        for (final item in biologicalControlAgentRegisters) {
          futures.add(
              cmoDatabaseMasterService.cacheBiologicalControlAgentsFromFarm(
                  item.copyWith(isMasterDataSynced: true)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('BcaRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _publishAccidentAndIncidentRegisters() async {
    try {
      onStatus('Sync Accident And Incident Registers...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final accidentAndIncidentRegisters = await cmoDatabaseMasterService
          .getUnsyncedAccidentAndIncidentRegistersByFarmId(
        mFarmId,
      );

      for (final item in accidentAndIncidentRegisters) {
        var itemPayLoad = const AccidentAndIncidentPayload();

        final accidentAndIncidentPropertyDamaged = await cmoDatabaseMasterService
            .getAllAccidentAndIncidentRegisterPropertyDamagedByAccidentAndIncidentRegisterNo(
          item.accidentAndIncidentRegisterNo ?? '',
        );

        final aaiPhotos = await cmoDatabaseMasterService
            .getUnsyncedAllAAIRegisterPhotoByAAIRegisterNo(
          item.accidentAndIncidentRegisterNo,
        );

        itemPayLoad = itemPayLoad.copyWith(
          register: item,
          propertyDamaged: accidentAndIncidentPropertyDamaged
              .map(
                (element) => element.copyWith(
                  accidentAndIncidentRegisterId:
                      item.accidentAndIncidentRegisterId ??
                          '00000000-0000-0000-0000-000000000000',
                ),
              )
              .toList(),
          photos: aaiPhotos
              .map(
                (item) => item.copyWith(
                  accidentAndIncidentRegisterId:
                      item.accidentAndIncidentRegisterId ??
                          '00000000-0000-0000-0000-000000000000',
                  photo: item.photo?.stringToBase64SyncServer,
                ),
              )
              .toList(),
        );

        messages.add(globalMessage.copyWith(body: jsonEncode(itemPayLoad)));

        if (_enableUpdateStatus) {
          futures.add(
            cmoDatabaseMasterService.cacheAccidentAndIncident(
              item.copyWith(isMasterDataSynced: true),
              isDirect: false,
            ),
          );

          for (final item in accidentAndIncidentPropertyDamaged) {
            futures.add(
              cmoDatabaseMasterService.cacheAccidentAndIncidentPropertyDamaged(
                item.copyWith(isMasterdataSynced: true),
                isDirect: false,
              ),
            );
          }

          for (final photo in aaiPhotos) {
            futures.add(
              cmoDatabaseMasterService.cacheAAIPhotoModel(
                photo.copyWith(isMasterdataSynced: true),
              ),
            );
          }
        }
      }

      futures.add(
        cmoPerformApiService.public(
          currentClientId: mUserDeviceId.toString(),
          topic: topicByFarmIdAndUserDeviceId('AaiRegister'),
          messages: messages,
        ),
      );

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  void onStatus(String message) {
    _emit(_state.copyWith(syncMessage: message));
  }
}
