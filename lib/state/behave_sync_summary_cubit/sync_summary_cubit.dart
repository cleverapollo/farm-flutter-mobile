import 'dart:convert';

import 'package:cmo/di.dart';
import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/model/assessment_pay_load/assessment_pay_load.dart';
import 'package:cmo/model/assessment_question_answers_pay_load/assessment_question_answers.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/model/question_comment_pay_load/question_comment_pay_load.dart';
import 'package:cmo/model/question_photo_pay_load/question_photo_pay_load.dart';
import 'package:cmo/model/sync_summary_model.dart';
import 'package:cmo/state/behave_sync_summary_cubit/sync_summary_state.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/snack/snack_helper.dart';
import 'package:cmo/utils/json_converter.dart';
import 'package:cmo/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncSummaryCubit extends Cubit<SyncSummaryState> {
  SyncSummaryCubit(this.userDeviceCubit) : super(SyncSummaryState());

  final UserDeviceCubit userDeviceCubit;

  final _databaseMasterService = cmoDatabaseMasterService;
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
          ..add(_databaseMasterService
              .getQuestionByCompanyId(companyId)
              .then((value) => data = data.copyWith(mdQuestion: value.length)))
          ..add(_databaseMasterService.getAllAssessmentsStarted().then(
              (value) => data = data.copyWith(adInprogress: value.length)))
          ..add(_databaseMasterService
              .getAllAssessmentsCompleted()
              .then((value) => data = data.copyWith(adUnsynced: value.length)))
          ..add(_databaseMasterService.getWorkersLocal().then(
              (value) => data = data.copyWith(mdUnsyncWoker: value.length)))
          ..add(_databaseMasterService.getCompliances().then(
              (value) => data = data.copyWith(mdCompliance: value.length)))
          ..add(_databaseMasterService
              .getPlantationsByCompanyId(company!.companyId)
              .then(
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
          // ..add(_databaseMasterService.getSchedules().then((value) =>
          //     data = data.copyWith(schedulerUpcommingEvent: value.length)))
          ..add(_databaseMasterService
              .getSeverities()
              .then((value) => data = data.copyWith(mdSeverity: value.length)))
          // ..add(_databaseMasterService.getScheduleActivitys().then((value) =>
          //     data = data.copyWith(mdScheduleActivity: value.length)))
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

  Future<void> onSyncData(VoidCallback syncSuccess) async {
    try {
      if (state.isLoadingSync || state.isLoading) return;

      emit(
        state.copyWith(isLoadingSync: true, syncMessage: 'Syncing...'),
      );

      await userDeviceCubit.createBehaveUserDevice();

      final userDeviceId = userDeviceCubit.data?.userDeviceId;
      final userId = user?.userId;
      final companyId = company?.companyId;

      if (userDeviceId == null || companyId == null || userId == null) return;

      await syncAssessmentData(
          companyId: companyId, userDeviceId: userDeviceId, userId: userId);

      await syncMasterData(userDeviceId);

      final cachedCompanies =
          await _databaseMasterService.getAllCachedCompanies();
      for (final cachedCompany in cachedCompanies) {
        await _databaseMasterService.cacheCompany(
          cachedCompany.copyWith(isInUse: false, isMasterDataSynced: false),
        );
      }

      await _databaseMasterService.cacheCompany(
        company!.copyWith(isInUse: true, isMasterDataSynced: true),
      );

      emit(
        state.copyWith(syncMessage: '', isLoadingSync: false),
      );

      await onInitialData().whenComplete(() {
        showSnackSuccess(msg: 'Sync Success');
        syncSuccess.call();
      });
    } catch (e) {
      showSnackError(msg: e.toString());
      emit(
        state.copyWith(syncMessage: '', isLoadingSync: false),
      );
    }
  }

  Future<void> syncAssessmentData({
    required int companyId,
    required int userDeviceId,
    required int userId,
  }) async {
    final publicWorkerTopic = 'Cmo.MaserData.Worker.$companyId.$userDeviceId';
    final publishAssessmentTopic =
        'Cmo.Assessment.Complete.$companyId.$userDeviceId';
    final workers = await _databaseMasterService.getWorkersLocal();
    final assessments =
        await _databaseMasterService.getAllAssessmentsCompleted();

    await cmoBehaveApiService.createSystemEvent(
      primaryKey: companyId,
      systemEventName: 'SyncAssessmentMasterData',
      userDeviceId: userDeviceId,
    );

    // delay after created system event to make sure that the data is ready to pull
    await Future.delayed(const Duration(seconds: 3), () {});

    final workerFutures = <Future<dynamic>>[];
    final assessmentFutures = <Future<dynamic>>[];

    final workerMessages = <Message>[];
    final assessmentMessages = <Message>[];

    emit(
      state.copyWith(syncMessage: 'Syncing Workers...'),
    );

    for (final worker in workers) {
      workerMessages.add(
        Message(body: jsonEncode(worker.toPayLoad())),
      );
      workerFutures.add(
        _databaseMasterService.updateWorkerSyncStatus(worker: worker),
      );
    }

    workerFutures.add(
      cmoBehaveApiService.public(
          currentClientId: '$userDeviceId',
          topic: publicWorkerTopic,
          messages: workerMessages),
    );

    await Future.wait(workerFutures);

    emit(
      state.copyWith(syncMessage: 'Syncing Assessments...'),
    );

    for (final assessment in assessments) {
      var assessmentPayLoad = const AssessmentPayLoad();
      assessmentPayLoad = assessmentPayLoad.copyWith(
        AssessmentId: assessment.assessmentId,
        CompanyId: assessment.companyId,
        ContractorId: assessment.contractorId,
        JobCategoryId: assessment.jobCategoryId,
        JobDescriptionId: assessment.jobDescriptionId,
        Location: assessment.location,
        PlantationId: assessment.plantationId,
        TeamId: assessment.teamId,
        WorkerId: assessment.workerId,
        Created: assessment.createDT,
        Lat: assessment.lat,
        Lng: assessment.long,
        UserDeviceId: userDeviceId,
        UserId: userId,
        SignatureDate: assessment.signatureDate,
        SignatureImage: assessment.signatureImage.stringToBase64SyncServer,
        SignaturePoints: assessment.signaturePoints,
        HasSignature: assessment.hasSignature,
      );

      var assessmentQuestionAnswersPayLoad =
          const AssessmentQuestionAnswersPayLoad();

      final questionAnswers = await cmoDatabaseMasterService
          .getQuestionAnswersByCompanyIdAndJobCategoryIdAndAssessmentId(
              companyId, assessment.jobCategoryId, assessment.assessmentId);

      final questionCommentPayLoad = <QuestionCommentPayLoad>[];
      final questionPhotoPayLoad = <QuestionPhotoPayLoad>[];

      for (final question in questionAnswers) {
        final questionCommentResult =
            await cmoDatabaseMasterService.getQuestionComments(
                assessment.assessmentId!, question.questionId!);

        questionCommentPayLoad
            .addAll(questionCommentResult.map((e) => e.toPayLoad()).toList());

        final questionPhotoResult = await cmoDatabaseMasterService
            .getQuestionPhotosByAssessmentIdAndQuestionId(
          assessmentId: assessment.assessmentId,
          questionId: question.questionId,
        );

        questionPhotoPayLoad
            .addAll(questionPhotoResult.map((e) => e.toPayLoad()).toList());
      }

      final questionAnswerPayLoad =
          questionAnswers.map((e) => e.toPayLoad()).toList();

      assessmentQuestionAnswersPayLoad =
          assessmentQuestionAnswersPayLoad.copyWith(
        QuestionAnswer: questionAnswerPayLoad,
        QuestionComment: questionCommentPayLoad,
        QuestionPhoto: questionPhotoPayLoad,
      );

      assessmentPayLoad = assessmentPayLoad.copyWith(
        AssessmentQuestionAnswers: assessmentQuestionAnswersPayLoad,
      );

      assessmentMessages.add(Message(body: jsonEncode(assessmentPayLoad)));

      assessmentFutures.add(_databaseMasterService
          .cacheAssessment(assessment.copyWith(status: 3)));
    }

    assessmentFutures.add(cmoBehaveApiService.public(
      currentClientId: '$userDeviceId',
      topic: publishAssessmentTopic,
      messages: assessmentMessages,
    ));

    await Future.wait(assessmentFutures);
  }

  Future<void> syncMasterData(int userDeviceId) async {
    var sync = true;
    while (sync) {
      MasterDataMessage? masterDataPull;

      masterDataPull = await cmoBehaveApiService.pullMessage(
        topicMasterDataSync: _topicMasterDataSync,
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

            // if (topic ==
            //     '${_topicMasterDataSync}ScheduleActivity.$userDeviceId') {
              // emit(
              //   state.copyWith(
              //     syncMessage: 'Syncing Schedule Activity...',
              //   ),
              // );
              // await insertScheduleActivity(item);
            // }

            // if (topic == '${_topicMasterDataSync}Schedule.$userDeviceId') {
            //   emit(
            //     state.copyWith(
            //       syncMessage: 'Syncing Schedule...',
            //     ),
            //   );
            //   await insertSchedule(item);
            // }

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

      await cmoBehaveApiService.deleteMessage(
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

      return _databaseMasterService.cacheAssessment(assessment);
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
}
