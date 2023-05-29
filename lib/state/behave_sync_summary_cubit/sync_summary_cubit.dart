import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/assessment.dart';
import 'package:cmo/model/company.dart';
import 'package:cmo/model/data/company_question.dart';
import 'package:cmo/model/data/compliance.dart';
import 'package:cmo/model/data/contractor.dart';
import 'package:cmo/model/data/course.dart';
import 'package:cmo/model/data/impact_caused.dart';
import 'package:cmo/model/data/impact_on.dart';
import 'package:cmo/model/data/job_category.dart';
import 'package:cmo/model/data/job_description.dart';
import 'package:cmo/model/data/job_element.dart';
import 'package:cmo/model/data/mmm.dart';
import 'package:cmo/model/data/municipality.dart';
import 'package:cmo/model/data/pdca.dart';
import 'package:cmo/model/data/plantation.dart';
import 'package:cmo/model/data/province.dart';
import 'package:cmo/model/data/reject_reason.dart';
import 'package:cmo/model/data/schedule.dart';
import 'package:cmo/model/data/schedule_activity.dart';
import 'package:cmo/model/data/severity.dart';
import 'package:cmo/model/data/speqs.dart';
import 'package:cmo/model/data/team.dart';
import 'package:cmo/model/data/training_provider.dart';
import 'package:cmo/model/data/unit.dart';
import 'package:cmo/model/data/worker.dart';
import 'package:cmo/model/master_data_message.dart';
import 'package:cmo/model/sync_summary_model.dart';
import 'package:cmo/model/user_info.dart';
import 'package:cmo/service/cmo_api_service.dart';
import 'package:cmo/state/behave_sync_summary_cubit/sync_summary_state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/json_converter.dart';
import 'package:cmo/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncSummaryCubit extends Cubit<SyncSummaryState> {
  SyncSummaryCubit() : super(SyncSummaryState());

  final _databaseMasterService = cmoDatabaseMasterService;
  final _databaseService = cmoDatabaseService;
  final _topicMasterDataSync = 'Cmo.MasterDataDeviceSync.';

  SyncSummaryModel data = const SyncSummaryModel();

  UserInfo? user;
  List<Company>? companies = [];
  Company? company;

  Future<void> onInitialData() async {
    emit(state.copyWith(isLoading: true, dataLoaded: false));
    try {
      await _databaseMasterService.db.then((value) async {
        final futures = <Future<dynamic>>[];
        user = await configService.getActiveUser();
        company = await configService.getActiveCompany();

        if (company?.companyId == null || user?.userId == null) return;

        final companyId = company!.companyId;
        final userId = user!.userId!;

        futures
          ..add(_databaseMasterService
              .getAllCachedCompanies()
              .then((value) => data = data.copyWith(mdCompany: value.length)))
          ..add(_databaseMasterService
              .getQuestionByCompanyId(companyId)
              .then((value) => data = data.copyWith(mdQuestion: value.length)))
          ..add(
            _databaseMasterService
                .getAllAssessments(
                  companyId: companyId,
                  userId: userId,
                )
                .then(
                  (value) => data = data.copyWith(
                    adInprogress: value
                        .where(
                          (element) =>
                              element.statusEnum == AssessmentStatus.started,
                        )
                        .length,
                    adUnsynced: value
                        .where(
                          (element) =>
                              element.statusEnum == AssessmentStatus.completed,
                        )
                        .length,
                  ),
                ),
          )
          ..add(_databaseMasterService.getWorkersLocal().then(
              (value) => data = data.copyWith(mdUnsyncWoker: value.length)))
          ..add(_databaseMasterService.getCompliances().then(
              (value) => data = data.copyWith(mdCompliance: value.length)))
          ..add(_databaseMasterService.getPlantations().then(
              (value) => data = data.copyWith(mdPlantation: value.length)))
          ..add(_databaseMasterService
              .getUnits()
              .then((value) => data = data.copyWith(mdUnit: value.length)))
          ..add(_databaseMasterService.getContractors().then(
              (value) => data = data.copyWith(mdContractor: value.length)))
          ..add(_databaseMasterService
              .getProvinces()
              .then((value) => data = data.copyWith(mdProvince: value.length)))
          ..add(_databaseMasterService.getMunicipalitys().then(
              (value) => data = data.copyWith(mdMunicipality: value.length)))
          ..add(_databaseMasterService.getImpactCauseds().then(
              (value) => data = data.copyWith(mdImpactCaused: value.length)))
          ..add(_databaseMasterService
              .getImpactOns()
              .then((value) => data = data.copyWith(mdImpactOn: value.length)))
          ..add(_databaseMasterService.getJobCategories().then(
              (value) => data = data.copyWith(mdJobCategory: value.length)))
          ..add(_databaseMasterService.getJobDescriptions().then(
              (value) => data = data.copyWith(mdJobDescription: value.length)))
          ..add(_databaseMasterService
              .getJobElements()
              .then((value) => data = data.copyWith(mdElement: value.length)))
          ..add(_databaseMasterService
              .getMmms()
              .then((value) => data = data.copyWith(mdMmm: value.length)))
          ..add(_databaseMasterService
              .getPdcas()
              .then((value) => data = data.copyWith(mdPdca: value.length)))
          ..add(_databaseMasterService
              .getSpeqss()
              .then((value) => data = data.copyWith(mdSpeqs: value.length)))
          ..add(_databaseMasterService
              .getTeams()
              .then((value) => data = data.copyWith(mdTeam: value.length)))
          ..add(_databaseMasterService.getTrainingProviders().then((value) =>
              data = data.copyWith(mdTrainingProvider: value.length)))
          ..add(_databaseMasterService
              .getCourses()
              .then((value) => data = data.copyWith(mdCourse: value.length)))
          ..add(_databaseMasterService.getSchedules().then((value) =>
              data = data.copyWith(schedulerUpcommingEvent: value.length)))
          ..add(_databaseMasterService
              .getSeveritys()
              .then((value) => data = data.copyWith(mdSeverity: value.length)))
          ..add(_databaseMasterService.getScheduleActivitys().then((value) =>
              data = data.copyWith(mdScheduleActivity: value.length)))
          ..add(_databaseMasterService
              .getWorkers()
              .then((value) => data = data.copyWith(mdWoker: value.length)))
          ..add(_databaseMasterService.getRejectReasons().then(
              (value) => data = data.copyWith(mdRejectReason: value.length)));

        await Future.wait(futures).whenComplete(() => emit(state.copyWith(
              isLoading: false,
              dataLoaded: true,
              data: data,
            )));
      });
    } catch (e) {
      emit(state.copyWith(isLoading: false, dataLoaded: false));
      if (kDebugMode) throw FlutterError(e.toString());
    }
  }

  Future<void> onSyncData(BuildContext context) async {
    try {
      if (state.isLoadingSync || state.isLoading) return;

      final userDeviceId = user?.userId;
      final companyId = company?.companyId;

      if (userDeviceId == null || companyId == null) return;

      await syncAssessmentData(companyId, userDeviceId);

      await syncMasterData(userDeviceId);

      final db = await _databaseMasterService.db;
      final cachedCompanies = await _databaseMasterService.getAllCachedCompanies();
      await db.writeTxn(() async {
        for (final cachedCompany in cachedCompanies) {
          await _databaseMasterService.cacheCompany(
            cachedCompany.copyWith(isInUse: false, isMasterDataSynced: false),
          );
        }

        await _databaseMasterService.cacheCompany(
          company!.copyWith(isInUse: true, isMasterDataSynced: true),
        );
      });

      emit(
        state.copyWith(syncMessage: '', isLoadingSync: false),
      );

      await onInitialData()
          .whenComplete(() => showSnackSuccess(msg: 'Sync Success'));
    } catch (e) {
      showSnackError(msg: e.toString());
      emit(
        state.copyWith(syncMessage: '', isLoadingSync: false),
      );
    }
  }

  Future<void> syncAssessmentData(int companyId, int userId) async {
    emit(
      state.copyWith(
          isLoadingSync: true, syncMessage: 'Syncing Assessments...'),
    );

    await cmoApiService.createSystemEvent(
      primaryKey: companyId,
      systemEventName: 'SyncAssessmentMasterData',
      userDeviceId: userId,
    );
    final result = await _databaseService
        .getAllAssessmentUnSyncedByCompanyIdAndUserId(companyId, userId);

    final futures = <Future<dynamic>>[];

    final db = await _databaseService.db;

    await db.writeTxn(() async {
      if (result.isNotEmpty) {
        for (final item in result) {
          futures
              .add(_databaseService.cacheAssessment(item.copyWith(status: 3)));
        }
      }
    });
  }

  Future<void> syncMasterData(int userDeviceId) async {
    var sync = true;
    while (sync) {
      MasterDataMessage? masterDataPull;

      masterDataPull = await cmoApiService.pullMessage(
        topicMasterDataSync: _topicMasterDataSync,
        pubsubApiKey: appInfoService.pubsubApiKey,
        currentClientId: userDeviceId,
      );

      final result = await cmoApiService.pullAssessmentMessage(
        topicAssessment: 'Cmo.Assessment.Complete.${company?.companyId}',
        pubsubApiKey: appInfoService.pubsubApiKey,
        currentClientId: userDeviceId,
      );

      final masterDataMessage = masterDataPull?.message;

      if (masterDataMessage == null || masterDataMessage.isEmpty) {
        sync = false;
        break;
      }

      final dbCompany = await cmoDatabaseMasterService.db;

      await dbCompany.writeTxn(() async {
        for (var i = 0; i < masterDataMessage.length; i++) {
          final item = masterDataMessage[i];

          try {
            final topic = item.header?.originalTopic;

            // emit(state.copyWith(syncMessage: 'Syncing Assessments...'));
            // await insertAssessment(item);

            if (topic == '${_topicMasterDataSync}Plantation.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Plantations...'));
              await insertPlantation(item);
            }

            if (topic == '${_topicMasterDataSync}Unit.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Units...'));
              await insertUnit(item);
            }

            if (topic == '${_topicMasterDataSync}Contractor.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Contractors...'));
              await insertContractor(item);
            }

            if (topic == '${_topicMasterDataSync}Province.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Province...'));
              await insertProvince(item);
            }

            if (topic == '${_topicMasterDataSync}Municipality.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Municipality...'));
              await insertMunicipality(item);
            }

            if (topic == '${_topicMasterDataSync}ImpactCaused.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Impact Caused...'));
              await insertImpactCaused(item);
            }

            if (topic == '${_topicMasterDataSync}ImpactOn.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Impact On...'));
              await insertImpactOn(item);
            }

            if (topic == '${_topicMasterDataSync}JobCategory.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Job Types...'));
              await insertJobCategory(item);
            }

            if (topic ==
                '${_topicMasterDataSync}JobDescription.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Job Description...'));
              await insertJobDescription(item);
            }

            if (topic == '${_topicMasterDataSync}JobElement.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Job Elements...'));
              await insertJobElement(item);
            }

            if (topic == '${_topicMasterDataSync}Mmm.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Mmm...'));
              await insertMmm(item);
            }

            if (topic == '${_topicMasterDataSync}Pdca.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Pdca...'));
              await insertPdca(item);
            }

            if (topic == '${_topicMasterDataSync}Severity.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Severity...'));
              await insertSeverity(item);
            }

            if (topic == '${_topicMasterDataSync}Speqs.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Speqs...'));
              await insertSpeqs(item);
            }

            if (topic == '${_topicMasterDataSync}Compliance.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Compliance...'));
              await insertCompliance(item);
            }

            if (topic == '${_topicMasterDataSync}Team.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Team...'));
              await insertTeam(item);
            }

            if (topic == '${_topicMasterDataSync}RejectReason.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Reject Reason...'));
              await insertRejectReason(item);
            }

            if (topic ==
                '${_topicMasterDataSync}TrainingProvider.$userDeviceId') {
              emit(
                state.copyWith(
                  syncMessage: 'Syncing Training Provider...',
                ),
              );
              await insertTrainingProvider(item);
            }

            if (topic == '${_topicMasterDataSync}Course.$userDeviceId') {
              emit(state.copyWith(syncMessage: 'Syncing Course...'));
              await insertCourse(item);
            }

            if (topic ==
                '${_topicMasterDataSync}ScheduleActivity.$userDeviceId') {
              emit(
                state.copyWith(
                  syncMessage: 'Syncing Schedule Activity...',
                ),
              );
              await insertScheduleActivity(item);
            }

            if (topic == '${_topicMasterDataSync}Schedule.$userDeviceId') {
              emit(
                state.copyWith(
                  syncMessage: 'Syncing Schedule...',
                ),
              );
              await insertSchedule(item);
            }

            if (topic == '${_topicMasterDataSync}Worker.$userDeviceId') {
              emit(
                state.copyWith(
                  syncMessage: 'Syncing Workers...',
                ),
              );
              await insertWorker(item);
            }

            if (topic == '${_topicMasterDataSync}Question.$userDeviceId') {
              emit(
                state.copyWith(
                  syncMessage: 'Syncing Questions...',
                ),
              );
              await insertQuestion(item);
            }
          } finally {}
        }
      });

      await cmoApiService.deleteMessage(
        pubsubApiKey: appInfoService.pubsubApiKey,
        currentClientId: userDeviceId,
        messages: masterDataMessage ?? [],
      );
    }
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

  Future<int?> insertAssessment(Message item) async {
    try {
      final bodyJson = Json.tryDecode(item.body) as Map<String, dynamic>?;
      if (bodyJson == null) return null;
      final assessment = Assessment.fromJson(bodyJson);

      return cmoDatabaseService.cacheAssessment(assessment);
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

  publishAssessmentPayload() {}
}
