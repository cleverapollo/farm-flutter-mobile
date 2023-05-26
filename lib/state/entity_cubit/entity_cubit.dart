import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/service/entity_service.dart';
import 'package:cmo/utils/utils.dart';

part 'entity_state.dart';

class EntityCubit extends HydratedCubit<EntityState> {
  EntityCubit({EntityService? service}) : super(const EntityState()) {
    this.service = service ?? entityService;
  }
  final String topicMasterDataSync = 'Cmo.MasterDataDeviceSync.';
  final String topicTrickleFeedMasterDataByCompanyId = 'Cmo.MasterData.';

  late final EntityService service;

  Future<void> init() async {
    final cachedCompanies = await cmoDatabaseMasterService.getAllCachedCompanies();
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

    await delay(1000);

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
      primaryKey: companyId,
      systemEventName: 'SyncAssessmentMasterData',
      userDeviceId: userDeviceId,
    );

    var sync = true;
    while (sync) {
      MasterDataMessage? resPull;
      if (context.mounted) {
        resPull = await cmoApiService.pullMessage(
          topicMasterDataSync: topicMasterDataSync,
          pubsubApiKey: appInfoService.pubsubApiKey,
          currentClientId: userDeviceId,
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
          } catch (error) {
            handleError(error);
          } finally {
            logger.d('Sync successfully!');
          }
        }
      });

      if (context.mounted) {
        await cmoApiService.deleteMessage(
          pubsubApiKey: appInfoService.pubsubApiKey,
          currentClientId: userDeviceId,
          messages: messages,
        );
      }
    }

    final cachedCompanies = await cmoDatabaseMasterService.getAllCachedCompanies();
    emit(
      state.copyWith(
        syncMessage: '',
        entity: company.entity,
        company: company,
        isLoadingSync: false,
        companies: cachedCompanies,
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
        userId: userId,
      );
    }

    if (companies != null && companies.isNotEmpty) {
      final cachedCompanies = await cmoDatabaseMasterService.getAllCachedCompanies();

      final db = await cmoDatabaseMasterService.db;
      await db.writeTxn(() async {
        for (final company in companies ?? <Company>[]) {
          final find = cachedCompanies.firstWhereOrNull(
            (e) => e.companyId == company.companyId,
          );

          if (find == null) {
            await cmoDatabaseMasterService.cacheCompany(company);
          }
          await cmoDatabaseMasterService.db;
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
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final plantation = Plantation.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePlantation(plantation);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertUnit(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final unit = Unit.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheUnit(unit);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertContractor(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final contractor = Contractor.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheContractor(contractor);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertProvince(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final province = Province.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheProvince(province);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertMunicipality(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final municipality = Municipality.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheMunicipality(municipality);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertImpactCaused(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final impactCaused = ImpactCaused.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheImpactCaused(impactCaused);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertImpactOn(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final impactOn = ImpactOn.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheImpactOn(impactOn);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertJobCategory(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final jobCategory = JobCategory.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheJobCategory(jobCategory);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertJobDescription(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final jobDescription = JobDescription.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheJobDescription(jobDescription);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertJobElement(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final jobElement = JobElement.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheJobElement(jobElement);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertMmm(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final mmm = Mmm.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheMmm(mmm);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertPdca(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final pdca = Pdca.fromJson(bodyJson);
      return cmoDatabaseMasterService.cachePdca(pdca);
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

  Future<int?> insertSpeqs(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final speqs = Speqs.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSpeqs(speqs);
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

  Future<int?> insertTeam(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final team = Team.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheTeam(team);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertRejectReason(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final rejectReason = RejectReason.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheRejectReason(rejectReason);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertTrainingProvider(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final trainingProvider = TrainingProvider.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheTrainingProvider(trainingProvider);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertCourse(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final course = Course.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCourse(course);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertSchedule(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final schedule = Schedule.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheSchedule(schedule);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertScheduleActivity(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final scheduleActivity = ScheduleActivity.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheScheduleActivity(scheduleActivity);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertWorker(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final worker = Worker.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheWorker(worker);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  Future<int?> insertQuestion(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final question = CompanyQuestion.fromJson(bodyJson);
      return cmoDatabaseMasterService.cacheCompanyQuestion(question);
    } catch (e) {
      logger.d('insert error: $e');
    }
    return null;
  }

  void handleError(Object error) {
    logger.d(error);
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
