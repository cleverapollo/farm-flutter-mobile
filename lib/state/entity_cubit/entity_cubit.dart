import 'dart:developer';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/entity_service.dart';
import 'package:cmo/utils/json_converter.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'entity_state.dart';

class EntityCubit extends HydratedCubit<EntityState> {
  EntityCubit({EntityService? service}) : super(const EntityState()) {
    this.service = service ?? entityService;
  }
  final String topicMasterDataSync = 'Cmo.MasterDataDeviceSync.';
  final String topicTrickleFeedMasterDataByCompanyId = 'Cmo.MasterData.';

  late final EntityService service;

  Future<void> sync(Entity entity) async {
    emit(state.copyWith(isLoadingSync: true));

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
      entity: entity,
      isLoadingSync: false,
    ));
  }

  Future<void> syncBehave({
    required BuildContext context,
    required Company company,
    required int? userDeviceId,
  }) async {
    if (userDeviceId == null) return;
    emit(state.copyWith(
      isLoadingSync: true,
      syncMessage: '',
      countSchedules: 0,
      countWorkers: 0,
      countQuestion: 0,
    ));

    await cmoApiService.createSystemEvent(
      context: context,
      primaryKey: 8,
      systemEventName: 'SyncAssessmentMasterData',
      userDeviceId: userDeviceId,
    );

    Future<void> syncMasterData() async {
      var sync = true;
      while (sync) {
        MasterDataMessage? resPull;
        if (context.mounted) {
          resPull = await cmoApiService.pullMessage(
            context: context,
            topicMasterDataSync: topicMasterDataSync,
            pubsubApiKey: appInfoService.pubsubApiKey,
            currentClientId: userDeviceId,
          );
        }

        log('Pull Message: ${resPull?.paging} ${resPull?.message?.firstOrNull}');

        final messages = resPull?.message;
        if (messages == null || messages.isEmpty) {
          sync = false;
          break;
        }

        for (var item in messages) {
          log('Looping through messageId ${item.header?.messageId} original topic ${item.header?.originalTopic}');

          try {
            final topic = item.header?.originalTopic;
            if (topic == '${topicMasterDataSync}Plantation.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Plantations...'));
              await insertPlantation(item);
            }

            if (topic == '${topicMasterDataSync}Unit.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Units...'));
              await insertUnit(item);
            }

            if (topic == '${topicMasterDataSync}Contractor.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Contractors...'));
              await insertContractor(item);
            }

            if (topic == '${topicMasterDataSync}Province.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Province...'));
              await insertProvince(item);
            }

            if (topic == '${topicMasterDataSync}Municipality.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Municipality...'));
              await insertMunicipality(item);
            }

            if (topic == '${topicMasterDataSync}ImpactCaused.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Impact Caused...'));
              await insertImpactCaused(item);
            }

            if (topic == '${topicMasterDataSync}ImpactOn.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Impact On...'));
              await insertImpactOn(item);
            }

            if (topic == '${topicMasterDataSync}JobCategory.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Job Types...'));
              await insertJobCategory(item);
            }

            if (topic == '${topicMasterDataSync}JobDescription.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Job Description...'));
              await insertJobDescription(item);
            }

            if (topic == '${topicMasterDataSync}JobElement.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Job Elements...'));
              await insertJobElement(item);
            }

            if (topic == '${topicMasterDataSync}Mmm.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Mmm...'));
              await insertMmm(item);
            }

            if (topic == '${topicMasterDataSync}Pdca.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Pdca...'));
              await insertPdca(item);
            }

            if (topic == '${topicMasterDataSync}Severity.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Severity...'));
              await insertSeverity(item);
            }

            if (topic == '${topicMasterDataSync}Speqs.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Speqs...'));
              await insertSpeqs(item);
            }

            if (topic == '${topicMasterDataSync}Compliance.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Compliance...'));
              await insertCompliance(item);
            }

            if (topic == '${topicMasterDataSync}Team.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Team...'));
              await insertTeam(item);
            }

            if (topic == '${topicMasterDataSync}RejectReason.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Reject Reason...'));
              await insertRejectReason(item);
            }

            if (topic == '${topicMasterDataSync}TrainingProvider.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Training Provider...'));
              await insertTrainingProvider(item);
            }

            if (topic == '${topicMasterDataSync}Course.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Course...'));
              await insertCourse(item);
            }

            if (topic == '${topicMasterDataSync}Schedule.$userDeviceId') {
              emit(state.copyWith(
                countSchedules: state.countSchedules + 1,
                syncMessage: 'Syncing Schedule...${state.countSchedules + 1}',
              ));
              await insertSchedule(item);
            }

            if (topic == '${topicMasterDataSync}ScheduleActivity.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Schedule Activity...'));
              await insertScheduleActivity(item);
            }

            if (topic == '${topicMasterDataSync}Worker.$userDeviceId') {
              emit(state.copyWith(
                countWorkers: state.countWorkers + 1,
                syncMessage: 'Syncing Workers...${state.countWorkers + 1}',
              ));
              await insertWorker(item);
            }

            if (topic == '${topicMasterDataSync}Question.$userDeviceId') {
              emit(state.copyWith(
                countQuestion: state.countQuestion + 1,
                syncMessage: 'Syncing Questions...${state.countQuestion + 1}',
              ));
              await insertQuestion(item);
            }
          } catch (e, s) {
            log('Failed to sync tricklefeed master data');
            log('$e $s');
          }
        }

        if (context.mounted) {
          await cmoApiService.deleteMessage(
            context: context,
            pubsubApiKey: appInfoService.pubsubApiKey,
            currentClientId: userDeviceId,
            messages: messages,
          );
        }
      }
    }

    await syncMasterData();

    emit(
      state.copyWith(
        entity: Entity(
          name: company.companyName ?? '',
          type: EntityType.cpy,
        ),
        syncMessage: '',
        company: company,
        isLoadingSync: false,
      ),
    );
  }

  Future<void> getCompanies({
    required BuildContext context,
    required int? userId,
  }) async {
    if (userId == null) return;
    emit(state.copyWith(isLoading: true));

    final companies = await cmoApiService.getCompaniesByUserId(
      context: context,
      userId: userId,
    );

    emit(
      state.copyWith(
        companies: companies,
        isLoading: false,
      ),
    );
  }

  Future<void> insertPlantation(Message item) async {
    log('Insert Plantation $item');
    try {
      Plantation plantation = Plantation.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cachePlantation(plantation);
    } catch (e, s) {
      log('Insert Plantation Error: $e $s');
    }
  }

  Future<void> insertUnit(Message item) async {
    log('Insert Unit $item');
    try {
      Unit unit = Unit.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheUnit(unit);
    } catch (e, s) {
      log('Insert Unit Error: $e $s');
    }
  }

  Future<void> insertContractor(Message item) async {
    log('Insert Contractor $item');
    try {
      Contractor contractor = Contractor.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheContractor(contractor);
    } catch (e, s) {
      log('Insert Contractor Error: $e $s');
    }
  }

  Future<void> insertProvince(Message item) async {
    log('Insert Province $item');
    try {
      Province province = Province.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheProvince(province);
    } catch (e, s) {
      log('Insert Province Error: $e $s');
    }
  }

  Future<void> insertMunicipality(Message item) async {
    log('Insert Municipality $item');
    try {
      Municipality municipality = Municipality.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheMunicipality(municipality);
    } catch (e, s) {
      log('Insert Municipality Error: $e $s');
    }
  }

  Future<void> insertImpactCaused(Message item) async {
    log('Insert ImpactCaused $item');
    try {
      ImpactCaused impactCaused = ImpactCaused.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheImpactCaused(impactCaused);
    } catch (e, s) {
      log('Insert ImpactCaused Error: $e $s');
    }
  }

  Future<void> insertImpactOn(Message item) async {
    log('Insert ImpactOn $item');
    try {
      ImpactOn impactOn = ImpactOn.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheImpactOn(impactOn);
    } catch (e, s) {
      log('Insert ImpactOn Error: $e $s');
    }
  }

  Future<void> insertJobCategory(Message item) async {
    log('Insert JobCategory $item');
    try {
      JobCategory jobCategory = JobCategory.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheJobCategory(jobCategory);
    } catch (e, s) {
      log('Insert JobCategory Error: $e $s');
    }
  }

  Future<void> insertJobDescription(Message item) async {
    log('Insert JobDescription $item');
    try {
      JobDescription jobDescription = JobDescription.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheJobDescription(jobDescription);
    } catch (e, s) {
      log('Insert JobDescription Error: $e $s');
    }
  }

  Future<void> insertJobElement(Message item) async {
    log('Insert JobElement $item');
    try {
      JobElement jobElement = JobElement.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheJobElement(jobElement);
    } catch (e, s) {
      log('Insert JobElement Error: $e $s');
    }
  }

  Future<void> insertMmm(Message item) async {
    log('Insert Mmm $item');
    try {
      Mmm mmm = Mmm.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheMmm(mmm);
    } catch (e, s) {
      log('Insert Mmm Error: $e $s');
    }
  }

  Future<void> insertPdca(Message item) async {
    log('Insert Pdca $item');
    try {
      Pdca pdca = Pdca.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cachePdca(pdca);
    } catch (e, s) {
      log('Insert Pdca Error: $e $s');
    }
  }

  Future<void> insertSeverity(Message item) async {
    log('Insert Severity $item');
    try {
      Severity severity = Severity.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheSeverity(severity);
    } catch (e, s) {
      log('Insert Severity Error: $e $s');
    }
  }

  Future<void> insertSpeqs(Message item) async {
    log('Insert Speqs $item');
    try {
      Speqs speqs = Speqs.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheSpeqs(speqs);
    } catch (e, s) {
      log('Insert Speqs Error: $e $s');
    }
  }

  Future<void> insertCompliance(Message item) async {
    log('Insert Compliance $item');
    try {
      Compliance compliance = Compliance.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheCompliance(compliance);
    } catch (e, s) {
      log('Insert Compliance Error: $e $s');
    }
  }

  Future<void> insertTeam(Message item) async {
    log('Insert Team $item');
    try {
      Team team = Team.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheTeam(team);
    } catch (e, s) {
      log('Insert Team Error: $e $s');
    }
  }

  Future<void> insertRejectReason(Message item) async {
    log('Insert RejectReason $item');
    try {
      RejectReason rejectReason = RejectReason.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheRejectReason(rejectReason);
    } catch (e, s) {
      log('Insert RejectReason Error: $e $s');
    }
  }

  Future<void> insertTrainingProvider(Message item) async {
    log('Insert TrainingProvider $item');
    try {
      TrainingProvider trainingProvider = TrainingProvider.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheTrainingProvider(trainingProvider);
    } catch (e, s) {
      log('Insert TrainingProvider Error: $e $s');
    }
  }

  Future<void> insertCourse(Message item) async {
    log('Insert Course $item');
    try {
      Course course = Course.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheCourse(course);
    } catch (e, s) {
      log('Insert Course Error: $e $s');
    }
  }

  Future<void> insertSchedule(Message item) async {
    log('Insert Schedule $item');
    try {
      Schedule schedule = Schedule.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheSchedule(schedule);
    } catch (e, s) {
      log('Insert Schedule Error: $e $s');
    }
  }

  Future<void> insertScheduleActivity(Message item) async {
    log('Insert ScheduleActivity $item');
    try {
      ScheduleActivity scheduleActivity = ScheduleActivity.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheScheduleActivity(scheduleActivity);
    } catch (e, s) {
      log('Insert ScheduleActivity Error: $e $s');
    }
  }

  Future<void> insertWorker(Message item) async {
    log('Insert Worker $item');
    try {
      Worker worker = Worker.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheWorker(worker);
    } catch (e, s) {
      log('Insert Worker Error: $e $s');
    }
  }

  Future<void> insertQuestion(Message item) async {
    log('Insert Question $item');
    try {
      CompanyQuestion question = CompanyQuestion.fromJson(Json.tryDecode(item.body));
      cmoDatabaseService.cacheCompanyQuestion(question);
    } catch (e, s) {
      log('Insert Question Error: $e $s');
    }
  }

  @override
  Future<void> clear() async {
    emit(const EntityState());
    return super.clear();
  }

  @override
  EntityState? fromJson(Map<String, dynamic> json) {
    final entityRaw = Json.tryDecode(json['entity']) as Map<String, dynamic>?;
    final companyRaw = Json.tryDecode(json['company']) as Map<String, dynamic>?;
    final entity = entityRaw != null ? Entity.fromJson(entityRaw) : null;
    final company = companyRaw != null ? Company.fromJson(companyRaw) : null;

    return EntityState(
      entity: entity,
      company: company,
    );
  }

  @override
  Map<String, dynamic>? toJson(EntityState state) {
    return {
      'entity': Json.tryEncode(state.entity?.toJson()),
      'company': Json.tryEncode(state.company?.toJson()),
    };
  }
}
