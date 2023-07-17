import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/complaints_and_disputes_register/complaints_and_disputes_register.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_customary_use_right_payload/farm_stakeholder_customary_use_right_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_social_upliftment_payload/farm_stakeholder_social_upliftment_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_special_site_payload/farm_stakeholder_special_site_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/job_description_payload/job_description_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_accident_and_incident_register_payload/main_accident_and_incident_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_farm_stakeholder_payload/main_farm_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_pests_and_diseases_register_payload/main_pests_and_diseases_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/properties_payload/properties_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/worker_payload/worker_payload.dart';
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

  final enableUpdateStatus = true;

  String get masterTopic => 'Cmo.MasterData.';

  String topicByFarmIdAndUserDeviceId(String field) =>
      '$masterTopic$field.$mFarmId.$mUserDeviceId';

  Message globalMessage = const Message(properties: [
    Properties(key: 'DbSchemaVersion', value: '12'),
  ]);

  Future<void> onUploadingFarmData() async {
    await _publishWorker();
    await _publishAnnFarmProduction();
    await _publishCamp();
    await _publishCustomaryUseRight();
    await _publishSocialUpliftments();
    await _publishSpecialSites();
    await _publishFarmStakeholders();
    await _publishAnnualFarmBudgets();
    await _publishAnnualFarmBudgetTransactions();
    await _publishSanctionRegisters();
    await _publishChemicalRegister();
    await _publishTrainingRegisters();
    await _publishAsiRegisters();
    await _publishFireRegisters();
    await _publishGrievanceRegisters();
    await _publishRteSpeciesRegisters();
    await _publishPestsAndDiseasesRegisters();
    await _publishComplaintsAndDisputesRegisters();
    await _publishAccidentAndIncidentRegisters();
    await _publishBiologicalControlAgentRegisters();
  }

  Future<void> _publishWorker() async {
    try {
      onStatus('Sync Worker...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final workers = await cmoDatabaseMasterService
          .getUnsyncedWorkersWithJobDescriptionsByFarmId(mFarmId);

      final workerPayLoads = <FarmWorkerPayload>[];

      for (final worker in workers) {
        var workerPayLoad = const FarmWorkerPayload();

        final futuresWorker = <Future<JobDescription?>>[];

        for (final jobDescriptionId in worker.jobDescription ?? <int>[]) {
          futuresWorker.add(
              cmoDatabaseMasterService.getJobDescriptionById(jobDescriptionId));
        }

        final jobDescriptions = await Future.wait(futuresWorker);

        final jobDescriptionPayLoads = <JobDescriptionPayLoad>[];

        for (final jobDescription in jobDescriptions) {
          if (jobDescription != null) {
            jobDescriptionPayLoads.add(jobDescription.toPayLoad());
          }
        }

        workerPayLoad = worker
            .toPayLoad()
            .copyWith(JobDescriptions: jobDescriptionPayLoads);

        workerPayLoads.add(workerPayLoad);

        if (enableUpdateStatus) {
          futures.add(cmoDatabaseMasterService
              .cacheWorkerFromFarm(worker.copyWith(isLocal: 0)));
        }
      }

      final workersPayLoad = workers.map((e) => e.toPayLoad()).toList();

      for (final item in workersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
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

      if (enableUpdateStatus) {
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

      for (final item in campsPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
        for (final item in camps) {
          futures.add(cmoDatabaseMasterService
              .cacheCamp(item.copyWith(isLocal: false)));
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

      if (enableUpdateStatus) {
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

      if (enableUpdateStatus) {
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

      if (enableUpdateStatus) {
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

      final farmStakeholdersPayLoad = <MainFarmStakeholderPayLoad>[];

      final allFarmsSH = await cmoDatabaseMasterService.getFarmStakeholder();
      final unSyncedStakeholders =
          await cmoDatabaseMasterService.getUnsyncedStakeholder();
      final unsyncedFSSU = await cmoDatabaseMasterService
          .getUnsycnedFarmStakeholderSocialUpliftments();
      final unsyncedFSSS = await cmoDatabaseMasterService
          .getUnsycnedFarmStakeholderSpecialSites();
      final unsyncedFSCUR = await cmoDatabaseMasterService
          .getUnsycnedFarmStakeholderCustomaryUseRights();

      for (final unsyncedStakeholderItem in unSyncedStakeholders) {
        const data = MainFarmStakeholderPayLoad();

        final farmStakeholders = allFarmsSH.map((e) {
          if (e.stakeholderId == unsyncedStakeholderItem.stakeHolderId) {
            return e.toPayLoad();
          }
        }).toList();

        final farmStakeholderCustomaryUseRights = unsyncedFSCUR.map((e) {
          if (e.farmStakeholderId ==
              farmStakeholders.first?.FarmStakeholderId) {
            return e.toPayLoad();
          }
        }).toList();

        final farmStakeholderCustomaryUseRightsPayLoad =
            <FarmStakeholderCustomaryUseRightPayLoad>[];

        for (final farmStakeholderCURItem
            in farmStakeholderCustomaryUseRights) {
          if (farmStakeholderCURItem != null) {
            farmStakeholderCustomaryUseRightsPayLoad
                .add(farmStakeholderCURItem);
          }
        }

        final farmStakeholderSocialUpliftments = unsyncedFSSU.map((e) {
          if (e.farmStakeholderId ==
              farmStakeholders.first?.FarmStakeholderId) {
            return e.toPayLoad();
          }
        }).toList();

        final farmStakeholderSocialUpliftmentsPayLoad =
            <FarmStakeholderSocialUpliftmentPayLoad>[];

        for (final farmStakeholderSUItem in farmStakeholderSocialUpliftments) {
          if (farmStakeholderSUItem != null) {
            farmStakeholderSocialUpliftmentsPayLoad.add(farmStakeholderSUItem);
          }
        }

        final farmStakeholderSpecialSites = unsyncedFSSS.map((e) {
          if (e.farmStakeholderId ==
              farmStakeholders.first?.FarmStakeholderId) {
            return e.toPayLoad();
          }
        }).toList();

        final farmStakeholderSpecialSitesPayLoad =
            <FarmStakeholderSpecialSitePayLoad>[];

        for (final farmStakeholderSSItem in farmStakeholderSpecialSites) {
          if (farmStakeholderSSItem != null) {
            farmStakeholderSpecialSitesPayLoad.add(farmStakeholderSSItem);
          }
        }

        farmStakeholdersPayLoad.add(data.copyWith(
          Stakeholder: unsyncedStakeholderItem.toPayLoad(),
          FarmStakeholder: farmStakeholders.firstOrNull,
          FarmStakeholderCustomaryUseRights:
              farmStakeholderCustomaryUseRightsPayLoad,
          FarmStakeholderSocialUpliftments:
              farmStakeholderSocialUpliftmentsPayLoad,
          FarmStakeholderSpecialSites: farmStakeholderSpecialSitesPayLoad,
        ));

        if (enableUpdateStatus) {
          futures.add(cmoDatabaseMasterService.cacheStakeHolderFromFarm(
              unsyncedStakeholderItem.copyWith(isMasterDataSynced: 1)));

          for (final item in unsyncedFSCUR) {
            futures.add(
                cmoDatabaseMasterService.cacheFarmStakeholderCustomaryUseRights(
                    item.copyWith(isMasterDataSynced: 1)));
          }

          for (final item in unsyncedFSSS) {
            futures.add(
                cmoDatabaseMasterService.cacheFarmStakeholderSpecialSites(
                    item.copyWith(isMasterDataSynced: 1)));
          }

          for (final item in unsyncedFSSU) {
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

      if (enableUpdateStatus) {
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

      if (enableUpdateStatus) {
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

      final sanctionRegistersPayLoad =
          sanctionRegisters.map((e) => e.toPayLoad()).toList();

      for (final item in sanctionRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
        for (final item in sanctionRegisters) {
          futures.add(cmoDatabaseMasterService
              .cacheSanctionRegisterFromFarm(item.copyWith(isSynced: true)));
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

      for (final item in chemicalRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
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

      final trainingRegistersPayLoad =
          trainingRegisters.map((e) => e.toPayLoad()).toList();

      for (final item in trainingRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
        for (final item in trainingRegisters) {
          futures.add(cmoDatabaseMasterService.cacheTrainingRegisterFromFarm(
              item.copyWith(isMasterdataSynced: true)));
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

      final asiRegisters =
          await cmoDatabaseMasterService.getUnsyncedAsiRegisters(mFarmId);

      final asiRegistersPayLoad =
          asiRegisters.map((e) => e.toPayLoad()).toList();

      for (final item in asiRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
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

      final fireRegisters =
          await cmoDatabaseMasterService.getUnsyncedFireRegisters(mFarmId);

      final fireRegistersPayLoad =
          fireRegisters.map((e) => e.toPayLoad()).toList();

      for (final item in fireRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
        for (final item in fireRegisters) {
          futures.add(cmoDatabaseMasterService.cacheFireRegisterFromFarm(
              item.copyWith(isMasterdataSynced: true)));
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

      if (enableUpdateStatus) {
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

      final rteSpeciesRegisters =
          await cmoDatabaseMasterService.getUnsyncedRteSpeciesByFarmId(mFarmId);

      final rteSpeciesRegistersPayLoad =
          rteSpeciesRegisters.map((e) => e.toPayLoad()).toList();

      for (final item in rteSpeciesRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
        for (final item in rteSpeciesRegisters) {
          futures.add(cmoDatabaseMasterService.cacheRteSpeciesFromFarm(
              item.copyWith(isMasterDataSynced: true)));
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
          Register: item.toPayLoad(),
          TreatmentMethod: registerTreatmentMethodPayLoad,
        );

        pestsAndDiseasesRegistersPayLoad.add(payLoadItem);

        if (enableUpdateStatus) {
          futures.add(cmoDatabaseMasterService.cachePetsAndDiseaseFromFarm(
              item.copyWith(isMasterdataSynced: true)));

          for (final item in registerTreatmentMethod) {
            futures.add(cmoDatabaseMasterService
                .cachePetsAndDiseaseRegisterTreatmentMethodFromFarm(
                    item.copyWith(isMasterdataSynced: true)));
          }
        }
      }

      for (final item in pestsAndDiseasesRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('PestsAndDiseasesRegister'),
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

      if (enableUpdateStatus) {
        for (final item in complaintsAndDisputesRegisters) {
          futures.add(
              cmoDatabaseMasterService.cacheComplaintsAndDisputesRegister(
                  item.copyWith(isMasterdataSynced: true)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('ComplaintsAndDisputesRegister'),
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

      for (final item in biologicalControlAgentRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      if (enableUpdateStatus) {
        for (final item in biologicalControlAgentRegisters) {
          futures.add(
              cmoDatabaseMasterService.cacheBiologicalControlAgentsFromFarm(
                  item.copyWith(isMasterDataSynced: true)));
        }
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('BiologicalControlAgentRegister'),
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

      final accidentAndIncidentRegistersRegistersPayLoad =
          <MainAccidentAndIncidentRegisterPayLoad>[];

      final accidentAndIncidentRegisters = await cmoDatabaseMasterService
          .getUnsyncedAccidentAndIncidentRegistersByFarmId(mFarmId);

      for (final item in accidentAndIncidentRegisters) {
        var itemPayLoad = const MainAccidentAndIncidentRegisterPayLoad();

        final accidentAndIncidentPropertyDamaged = await cmoDatabaseMasterService
            .getAllAccidentAndIncidentRegisterPropertyDamagedByAccidentAndIncidentRegisterNo(
                item.accidentAndIncidentRegisterNo ?? '');

        var accidentAndIncidentPropertyDamagedPayLoad =
            accidentAndIncidentPropertyDamaged
                .map((e) => e.toPayLoad())
                .toList();

        accidentAndIncidentPropertyDamagedPayLoad =
            accidentAndIncidentPropertyDamagedPayLoad.map((e) {
          if (e.AccidentAndIncidentRegisterId == null) {
            return e.copyWith(
                AccidentAndIncidentRegisterId:
                    '00000000-0000-0000-0000-000000000000');
          }
          return e;
        }).toList();

        itemPayLoad = itemPayLoad.copyWith(
          Register: item.toPayLoad(),
          PropertyDamaged: accidentAndIncidentPropertyDamagedPayLoad,
        );

        if (enableUpdateStatus) {
          futures.add(cmoDatabaseMasterService.cacheAccidentAndIncidentFromFarm(
              item.copyWith(isMasterDataSynced: true)));

          for (final item in accidentAndIncidentPropertyDamaged) {
            futures.add(cmoDatabaseMasterService
                .cacheAccidentAndIncidentPropertyDamagedFromFarm(
                    item.copyWith(isMasterdataSynced: true)));
          }
        }
      }

      for (final item in accidentAndIncidentRegistersRegistersPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
      }

      futures.add(cmoPerformApiService.public(
        currentClientId: mUserDeviceId.toString(),
        topic: topicByFarmIdAndUserDeviceId('AccidentAndIncidentRegister'),
        messages: messages,
      ));

      await Future.wait(futures);
    } catch (e) {
      logger.d(e);
    }
  }

  void onStatus(String message) {
    _emit(_state.copyWith(syncMessage: message));
  }
}
