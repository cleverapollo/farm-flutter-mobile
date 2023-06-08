import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/state/sync/base_sync_cubit.dart';
import 'package:cmo/state/sync/base_sync_state.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';

part 'farmer_sync_state.dart';

class FarmerSyncCubit extends BaseSyncCubit<FarmerSyncState> {
  FarmerSyncCubit(super.state);

  final String topicMasterDataSync = 'Cmo.MasterDataDeviceSync.';

  Future<void> sync(
      {required BuildContext context, required String userDeviceId}) async {
    emit(
      state.copyWith(
        syncMessage: 'Syncing All Master Data...',
      ),
    );

    Future<void> syncMasterData() async {
      var sync = true;
      while (sync) {
        MasterDataMessage? resPull;

        if (context.mounted) {
          resPull = await cmoPerformApiService.pullMessage(
            topicMasterDataSync: topicMasterDataSync,
            currentClientId: int.parse(userDeviceId),
          );
        }

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          sync = false;
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
              }
              // } else if (topic ==
              //     '${topicMasterDataSync}SanctionRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Disciplinary Register...'));
              //   await insertSanctionRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AnnFarmProd.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Annual Farm Produdction...'));
              //   await insertAnnualFarmProduction(item);
              // } else if (topic == '${topicMasterDataSync}Camp.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Camps...'));
              //   await insertCamp(item);
              //   didSyncCamps = true;
              // } else if (topic ==
              //     '${topicMasterDataSync}JobDescription.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Job Description...'));
              //   await insertJobDescription(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}Country.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Country...'));
              //   await insertCountry(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}Gender.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Gender...'));
              //   await insertGender(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}ScheduleActivity.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Schedule Activity...'));
              //   await insertScheduleActivity(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}GroupScheme.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Group Scheme...'));
              //   await insertGroupScheme(item);
              // } else if (topic == '${topicMasterDataSync}SU.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Social Upliftment...'));
              //   await insertSocialUpliftment(item);
              // } else if (topic == '${topicMasterDataSync}SS.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Special Site...'));
              //   await insertSpecialSite(item);
              // } else if (topic == '${topicMasterDataSync}CUR.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Customary Use Right...'));
              //   await insertCustomaryUseRight(item);
              // } else if (topic == '${topicMasterDataSync}SHT.$userDeviceId') {
              //   emit(
              //       state.copyWith(syncMessage: 'Syncing Stakeholder Type...'));
              //   await insertStakeholderType(item);
              // } else if (topic == '${topicMasterDataSync}SH.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Stakeholder...'));
              //   await insertStakeholder(item);
              // } else if (topic == '${topicMasterDataSync}FS.$userDeviceId') {
              //   emit(
              //       state.copyWith(syncMessage: 'Syncing Farm Stakeholder...'));
              //   await insertFarmStakeholder(item);
              // } else if (topic == '${topicMasterDataSync}GSS.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing GroupScheme Stakeholder...'));
              //   await insertGroupSchemeStakeholder(item);
              // } else if (topic == '${topicMasterDataSync}FSCUR.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Farm Stakeholder Customary Use Right...'));
              //   await insertFarmStakeholderCustomaryUseRight(item);
              // } else if (topic == '${topicMasterDataSync}FSSU.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Farm Stakeholder Social Upliftment...'));
              //   await insertFarmStakeholderSocialUpliftment(item);
              // } else if (topic == '${topicMasterDataSync}FSSS.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Farm Stakeholder Special Site...'));
              //   await insertFarmStakeholderSpecialSite(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AnnFrmBudTransCat.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Annual Farm Annual Farm Budget Transaction Categories...'));
              //   await insertAnnualFarmBudgetTransactionCategory(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AnnFrmBud.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Annual Farm Budgets...'));
              //   await insertAnnualFarmBudget(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AnnFrmBudTrans.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Annual Farm Budget Transactions...'));
              //   await insertAnnualFarmTransactionBudget(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}Schedule.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Schedule...'));
              //   await insertSchedule(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AaiRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Accident and Incident Registers...'));
              //   await insertAccidentAndIncidentRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}BcaRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Biological Control Agent Registers...'));
              //   await insertBiologicalControlAgentRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}ChemicalRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Chemical Registers...'));
              //   await insertChemicalRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AsiRegister.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Asi Registers...'));
              //   await insertAsiRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}FireRegister.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Fire Registers...'));
              //   await insertFireRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}CndRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Complaints and Disputes Registers...'));
              //   await insertComplaintsAndDisputesRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}GrievanceRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Grievance Registers...'));
              //   await insertGrievanceRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}PndRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Pests and Diseases Registers...'));
              //   await insertPestsAndDiseasesRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}RteSpeciesRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Rte Species Registers...'));
              //   await insertRteSpeciesRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}TrainingRegister.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Training Register...'));
              //   await insertTrainingRegister(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AnimalType.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Species Type...'));
              //   await insertAnimalType(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}SpeciesRange.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Species Range...'));
              //   await insertSpeciesRange(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}MonitoringRequirement.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Monitoring Requirement...'));
              //   await insertMonitoringRequirement(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}TrainingType.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Training Type...'));
              //   await insertTrainingType(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}PestsAndDiseaseType.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Pests and Disease Type...'));
              //   await insertPestsAndDiseaseType(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}GrievanceIssue.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Grievance Issue...'));
              //   await insertGrievanceIssue(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}PropertyDamaged.$userDeviceId') {
              //   emit(
              //       state.copyWith(syncMessage: 'Syncing Property Damaged...'));
              //   await insertPropertyDamaged(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}BCAType.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Biological Control Agent Type...'));
              //   await insertBiologicalControlAgentType(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}IssueType.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Disciplinaries Issues...'));
              //   await insertIssueType(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}ChemicalType.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Chemical Type...'));
              //   await insertChemicalType(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AsiType.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Asi Type...'));
              //   await insertAsiType(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}FireCause.$userDeviceId') {
              //   emit(state.copyWith(syncMessage: 'Syncing Fire Cause...'));
              //   await insertFireCause(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}NatureOfInjury.$userDeviceId') {
              //   emit(
              //       state.copyWith(syncMessage: 'Syncing Nature of Injury...'));
              //   await insertNatureOfInjury(item);
              // } else if (topic == '${topicMasterDataSync}CAM.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Chemical Application Method...'));
              //   await insertChemicalApplicationMethod(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}TreatmentMethod.$userDeviceId') {
              //   emit(
              //       state.copyWith(syncMessage: 'Syncing Treatment Method...'));
              //   await insertTreatmentMethod(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AsiRegisterPhoto.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Asi Register Photos...'));
              //   await insertAsiRegisterPhoto(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}AaiRegPropertyDamaged.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Accident and Incident Property Damaged...'));
              //   await insertAccidentAndIncidentPropertyDamaged(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}PndRegisterTreatmentMethod.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Pest and Disease Treatment Method...'));
              //   await insertPestsAndDiseasesRegisterTreatmentMethod(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}PndTypeTreatmentMethod.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage:
              //           'Syncing Pests and Disease Type Treatment Method...'));
              //   await insertPestsAndDiseaseTypeTreatmentMethod(item);
              // } else if (topic ==
              //     '${topicMasterDataSync}RteSpeciesRegisterPhoto.$userDeviceId') {
              //   emit(state.copyWith(
              //       syncMessage: 'Syncing Rte Species Register Photos...'));
              //   await insertRteSpeciesRegisterPhoto(item);
              // }
            } finally {}
          }
        });

        if (context.mounted) {
          await cmoPerformApiService.deleteMessage(
            currentClientId: int.parse(userDeviceId),
            messages: messages,
          );
        }
      }
    }

    await syncMasterData();
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
}
