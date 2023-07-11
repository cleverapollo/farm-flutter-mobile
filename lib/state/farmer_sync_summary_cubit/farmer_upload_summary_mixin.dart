import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/annual_production/annual_farm_production.dart';
import 'package:cmo/model/camp.dart';
import 'package:cmo/model/customary_use_right/customary_use_right.dart';
import 'package:cmo/model/farmer_stake_holder/farmer_stake_holder.dart';
import 'package:cmo/model/labour_management/farmer_worker.dart';
import 'package:cmo/model/master_data_message.dart';
import 'package:cmo/model/social_upliftment/social_upliftment.dart';
import 'package:cmo/model/special_site/special_site.dart';
import 'package:cmo/model/stakeholder/farm_stakeholder_customary_use_right.dart';
import 'package:cmo/model/stakeholder/farm_stakeholder_social_upliftment.dart';
import 'package:cmo/model/stakeholder/farm_stakeholder_special_site.dart';
import 'package:cmo/model/stakeholder/stake_holder.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_social_upliftment_payload/farm_stakeholder_social_upliftment_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_special_site_payload/farm_stakeholder_special_site_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/main_farm_stakeholder_payload/main_farm_stakeholder_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farmer_sync_summary_state.dart';
import 'package:cmo/utils/logger.dart';

import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_customary_use_right_payload/farm_stakeholder_customary_use_right_payload.dart';

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

  String get masterTopic => 'Cmo.MasterData.';
  String topicByFarmIdAndUserDeviceId(String field) =>
      '$masterTopic$field.$mFarmId.$mUserDeviceId';
  String topicByGroupSchemeIdAndUserDeviceId(String field) =>
      '$masterTopic$field.$mGroupSchemeId.$mUserDeviceId';

  // Message globalMessage = Message(properties: [
  //   Properties('DbSchemaVersion', '12'),
  // ]);
  Message globalMessage = Message();

  Future<void> onUploadingFarmData() async {
    await _publishWorker();
    await _publishAnnFarmProduction();
    await _publishCamp();
    await _publishCustomaryUseRight();
    await _publishSocialUpliftments();
    await _publishSpecialSites();
    await _publishFarmStakeholders();
  }

  Future<void> _publishWorker() async {
    try {
      onStatus('Sync Worker...');
      final messages = <Message>[];
      final futures = <Future<void>>[];

      final workers = await cmoDatabaseMasterService
          .getUnsyncedWorkersWithJobDescriptionsByFarmId(mFarmId);

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

      final socialUpliftments =
          await cmoDatabaseMasterService.getUnsyncedSpecialSite();

      final socialUpliftmentsPayLoad =
          socialUpliftments.map((e) => e.toPayLoad()).toList();

      for (final item in socialUpliftmentsPayLoad) {
        messages.add(globalMessage.copyWith(body: jsonEncode(item)));
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

      for (final item in unSyncedStakeholders) {
        const data = MainFarmStakeholderPayLoad();

        final farmStakeholders = allFarmsSH.map((e) {
          if (e.stakeholderId == item.stakeHolderId) {
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
          Stakeholder: item.toPayLoad(),
          FarmStakeholder: farmStakeholders.firstOrNull,
          FarmStakeholderCustomaryUseRights:
              farmStakeholderCustomaryUseRightsPayLoad,
          FarmStakeholderSocialUpliftments:
              farmStakeholderSocialUpliftmentsPayLoad,
          FarmStakeholderSpecialSites: farmStakeholderSpecialSitesPayLoad,
        ));
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

  void onStatus(String message) {
    _emit(_state.copyWith(syncMessage: message));
  }
}

class Properties {
  Properties(this.key, this.value);

  final String key;
  final String value;
}
