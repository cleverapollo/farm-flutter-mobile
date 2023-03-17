import 'dart:developer';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/cmo_database_company_service.dart';
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

  Future<void> init() async {
    final cachedCompanies = await cmoDatabaseService.getAllCachedCompanys();
    final userCompany =
        cachedCompanies.firstWhereOrNull((e) => e.isInUse ?? false);
    if (userCompany != null) {
      emit(
        state.copyWith(
          company: userCompany,
          entity: userCompany.entity,
        ),
      );
    }
  }

  Future<void> sync(Entity entity) async {
    emit(state.copyWith(isLoadingSync: true));

    await Future.delayed(const Duration(seconds: 1));

    emit(
      state.copyWith(
        entity: entity,
        isLoadingSync: false,
      ),
    );
  }

  Future<void> syncBehave({
    required BuildContext context,
    required Company company,
    required int? userDeviceId,
  }) async {
    if (userDeviceId == null) return;
    final companyId = company.companyId;
    if (companyId == null) return;
    emit(
      state.copyWith(
        isLoadingSync: true,
        syncMessage: '',
        countSchedules: 0,
        countWorkers: 0,
        countQuestion: 0,
      ),
    );

    await cmoApiService.createSystemEvent(
      context: context,
      primaryKey: companyId,
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

        final dbCompany = await state.companyService?.db;
        await dbCompany?.writeTxn(() async {
          for (var i = 0; i < messages.length; i++) {
            final item = messages[i];
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

              if (topic ==
                  '${topicMasterDataSync}JobDescription.$userDeviceId') {
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

              if (topic ==
                  '${topicMasterDataSync}TrainingProvider.$userDeviceId') {
                emit(
                  state.copyWith(
                    syncMessage: 'Syncing Training Provider...',
                  ),
                );
                await insertTrainingProvider(item);
              }

              if (topic == '${topicMasterDataSync}Course.$userDeviceId') {
                emit(state.copyWith(syncMessage: 'Syncing Course...'));
                await insertCourse(item);
              }

              if (topic == '${topicMasterDataSync}Schedule.$userDeviceId') {
                emit(
                  state.copyWith(
                    countSchedules: state.countSchedules + 1,
                    syncMessage:
                        'Syncing Schedule...${state.countSchedules + 1}',
                  ),
                );
                await insertSchedule(item);
              }

              if (topic ==
                  '${topicMasterDataSync}ScheduleActivity.$userDeviceId') {
                emit(
                  state.copyWith(
                    syncMessage: 'Syncing Schedule Activity...',
                  ),
                );
                await insertScheduleActivity(item);
              }

              if (topic == '${topicMasterDataSync}Worker.$userDeviceId') {
                emit(
                  state.copyWith(
                    countWorkers: state.countWorkers + 1,
                    syncMessage: 'Syncing Workers...${state.countWorkers + 1}',
                  ),
                );
                await insertWorker(item);
              }

              if (topic == '${topicMasterDataSync}Question.$userDeviceId') {
                emit(
                  state.copyWith(
                    countQuestion: state.countQuestion + 1,
                    syncMessage:
                        'Syncing Questions...${state.countQuestion + 1}',
                  ),
                );
                await insertQuestion(item);
              }

              await Future.delayed(const Duration(milliseconds: 100));
            } catch (e, s) {
              log('Failed to sync tricklefeed master data');
              log('$e $s');
            }
          }
        });

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

    final db = await cmoDatabaseService.db;
    final cachedCompanies = await cmoDatabaseService.getAllCachedCompanys();
    await db.writeTxn(() async {
      for (final cachedCompany in cachedCompanies) {
        await cmoDatabaseService.cacheCompany(
          cachedCompany.copyWith(isInUse: false, isMasterDataSynced: false),
        );
      }
      await cmoDatabaseService.cacheCompany(
        company.copyWith(isInUse: true, isMasterDataSynced: true),
      );
    });
    final cachedCompanies2 = await cmoDatabaseService.getAllCachedCompanys();

    emit(
      state.copyWith(
        syncMessage: '',
        entity: company.entity,
        company: company.copyWith(isInUse: true, isMasterDataSynced: true),
        isLoadingSync: false,
        companies: cachedCompanies2,
      ),
    );
  }

  Future<void> getCompanies({
    required BuildContext context,
    required int? userId,
  }) async {
    if (userId == null) return;
    emit(state.copyWith(isLoading: true));

    List<Company>? companies;

    if (context.mounted) {
      companies = await cmoApiService.getCompaniesByUserId(
        context: context,
        userId: userId,
      );
    }

    if (companies != null && companies.isNotEmpty) {
      final cachedCompanies = await cmoDatabaseService.getAllCachedCompanys();

      final db = await cmoDatabaseService.db;
      await db.writeTxn(() async {
        for (final company in companies ?? <Company>[]) {
          final find = cachedCompanies.firstWhereOrNull(
            (e) => e.companyId == company.companyId,
          );

          if (find == null) {
            await cmoDatabaseService.cacheCompany(company);
          }
          await CmoDatabaseCompanyService(companyId: company.companyId).db;
        }
      });
    }

    emit(
      state.copyWith(
        companies: companies,
        isLoading: false,
      ),
    );
  }

  Future<int?> insertPlantation(Message item) async {
    log('Insert Plantation $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final plantation = Plantation.fromJson(bodyJson);
      return state.companyService?.cachePlantation(plantation);
    } catch (e, s) {
      log('Insert Plantation Error: $e $s');
    }
    return null;
  }

  Future<int?> insertUnit(Message item) async {
    log('Insert Unit $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final unit = Unit.fromJson(bodyJson);
      return state.companyService?.cacheUnit(unit);
    } catch (e, s) {
      log('Insert Unit Error: $e $s');
    }
    return null;
  }

  Future<int?> insertContractor(Message item) async {
    log('Insert Contractor $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final contractor = Contractor.fromJson(bodyJson);
      return state.companyService?.cacheContractor(contractor);
    } catch (e, s) {
      log('Insert Contractor Error: $e $s');
    }
    return null;
  }

  Future<int?> insertProvince(Message item) async {
    log('Insert Province $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final province = Province.fromJson(bodyJson);
      return state.companyService?.cacheProvince(province);
    } catch (e, s) {
      log('Insert Province Error: $e $s');
    }
    return null;
  }

  Future<int?> insertMunicipality(Message item) async {
    log('Insert Municipality $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final municipality = Municipality.fromJson(bodyJson);
      return state.companyService?.cacheMunicipality(municipality);
    } catch (e, s) {
      log('Insert Municipality Error: $e $s');
    }
    return null;
  }

  Future<int?> insertImpactCaused(Message item) async {
    log('Insert ImpactCaused $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final impactCaused = ImpactCaused.fromJson(bodyJson);
      return state.companyService?.cacheImpactCaused(impactCaused);
    } catch (e, s) {
      log('Insert ImpactCaused Error: $e $s');
    }
    return null;
  }

  Future<int?> insertImpactOn(Message item) async {
    log('Insert ImpactOn $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final impactOn = ImpactOn.fromJson(bodyJson);
      return state.companyService?.cacheImpactOn(impactOn);
    } catch (e, s) {
      log('Insert ImpactOn Error: $e $s');
    }
    return null;
  }

  Future<int?> insertJobCategory(Message item) async {
    log('Insert JobCategory $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final jobCategory = JobCategory.fromJson(bodyJson);
      return state.companyService?.cacheJobCategory(jobCategory);
    } catch (e, s) {
      log('Insert JobCategory Error: $e $s');
    }
    return null;
  }

  Future<int?> insertJobDescription(Message item) async {
    log('Insert JobDescription $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final jobDescription = JobDescription.fromJson(bodyJson);
      return state.companyService?.cacheJobDescription(jobDescription);
    } catch (e, s) {
      log('Insert JobDescription Error: $e $s');
    }
    return null;
  }

  Future<int?> insertJobElement(Message item) async {
    log('Insert JobElement $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final jobElement = JobElement.fromJson(bodyJson);
      return state.companyService?.cacheJobElement(jobElement);
    } catch (e, s) {
      log('Insert JobElement Error: $e $s');
    }
    return null;
  }

  Future<int?> insertMmm(Message item) async {
    log('Insert Mmm $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final mmm = Mmm.fromJson(bodyJson);
      return state.companyService?.cacheMmm(mmm);
    } catch (e, s) {
      log('Insert Mmm Error: $e $s');
    }
    return null;
  }

  Future<int?> insertPdca(Message item) async {
    log('Insert Pdca $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final pdca = Pdca.fromJson(bodyJson);
      return state.companyService?.cachePdca(pdca);
    } catch (e, s) {
      log('Insert Pdca Error: $e $s');
    }
    return null;
  }

  Future<int?> insertSeverity(Message item) async {
    log('Insert Severity $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final severity = Severity.fromJson(bodyJson);
      return state.companyService?.cacheSeverity(severity);
    } catch (e, s) {
      log('Insert Severity Error: $e $s');
    }
    return null;
  }

  Future<int?> insertSpeqs(Message item) async {
    log('Insert Speqs $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final speqs = Speqs.fromJson(bodyJson);
      return state.companyService?.cacheSpeqs(speqs);
    } catch (e, s) {
      log('Insert Speqs Error: $e $s');
    }
    return null;
  }

  Future<int?> insertCompliance(Message item) async {
    log('Insert Compliance $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final compliance = Compliance.fromJson(bodyJson);
      return state.companyService?.cacheCompliance(compliance);
    } catch (e, s) {
      log('Insert Compliance Error: $e $s');
    }
    return null;
  }

  Future<int?> insertTeam(Message item) async {
    log('Insert Team $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final team = Team.fromJson(bodyJson);
      return state.companyService?.cacheTeam(team);
    } catch (e, s) {
      log('Insert Team Error: $e $s');
    }
    return null;
  }

  Future<int?> insertRejectReason(Message item) async {
    log('Insert RejectReason $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rejectReason = RejectReason.fromJson(bodyJson);
      return state.companyService?.cacheRejectReason(rejectReason);
    } catch (e, s) {
      log('Insert RejectReason Error: $e $s');
    }
    return null;
  }

  Future<int?> insertTrainingProvider(Message item) async {
    log('Insert TrainingProvider $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final trainingProvider = TrainingProvider.fromJson(bodyJson);
      return state.companyService?.cacheTrainingProvider(trainingProvider);
    } catch (e, s) {
      log('Insert TrainingProvider Error: $e $s');
    }
    return null;
  }

  Future<int?> insertCourse(Message item) async {
    log('Insert Course $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final course = Course.fromJson(bodyJson);
      return state.companyService?.cacheCourse(course);
    } catch (e, s) {
      log('Insert Course Error: $e $s');
    }
    return null;
  }

  Future<int?> insertSchedule(Message item) async {
    log('Insert Schedule $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final schedule = Schedule.fromJson(bodyJson);
      return state.companyService?.cacheSchedule(schedule);
    } catch (e, s) {
      log('Insert Schedule Error: $e $s');
    }
    return null;
  }

  Future<int?> insertScheduleActivity(Message item) async {
    log('Insert ScheduleActivity $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final scheduleActivity = ScheduleActivity.fromJson(bodyJson);
      return state.companyService?.cacheScheduleActivity(scheduleActivity);
    } catch (e, s) {
      log('Insert ScheduleActivity Error: $e $s');
    }
    return null;
  }

  Future<int?> insertWorker(Message item) async {
    log('Insert Worker $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final worker = Worker.fromJson(bodyJson);
      return state.companyService?.cacheWorker(worker);
    } catch (e, s) {
      log('Insert Worker Error: $e $s');
    }
    return null;
  }

  Future<int?> insertQuestion(Message item) async {
    log('Insert Question $item');
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final question = CompanyQuestion.fromJson(bodyJson);
      return state.companyService?.cacheCompanyQuestion(question);
    } catch (e, s) {
      log('Insert Question Error: $e $s');
    }
    return null;
  }

  @override
  Future<void> clear() async {
    emit(const EntityState());
    return super.clear();
  }

  @override
  EntityState? fromJson(Map<String, dynamic> json) {
    final entityRaw =
        Json.tryDecode(json['entity'].toString()) as Map<String, dynamic>?;
    final companyRaw =
        Json.tryDecode(json['company'].toString()) as Map<String, dynamic>?;
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
