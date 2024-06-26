import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/extensions/string.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audit_list_questions_state.dart';

class AuditListQuestionsCubit extends Cubit<AuditListQuestionsState> {
  AuditListQuestionsCubit() : super(const AuditListQuestionsState());

  QuestionAnswer? getAnswerByQuestionId(int? questionId) {
    if (questionId == null) return null;
    return state.answers.firstWhereOrNull(
      (e) => e.questionId != null && e.questionId == questionId,
    );
  }

  void setImpactOnFilter(int? id) {
    emit(state.copyWith(impactOnFilterId: id));
    applyFilter();
  }

  void setCarFilter(CarFilterEnum? filterEnum) {
    emit(
      state.copyWith(
        selectedCARFilter: filterEnum,
        isOpenedCarFilter: false,
      ),
    );

    applyFilter();
  }

  void setComplianceFilter(Compliance? compliance) {
    final ncCompliance = state.compliances.firstWhereOrNull(
          (element) => element.isNC,
    );

    final isNCCompliance = compliance != null &&
            compliance.complianceId == ncCompliance?.complianceId
        ? true
        : null;
    emit(
      state.copyWith(
        selectedComplianceFilter: compliance,
        isOpenedCarFilter: isNCCompliance,
      ),
    );

    applyFilter();
  }

  void onTapCarFilterDropdown() {
    emit(state.copyWith(isOpenedCarFilter: !state.isOpenedCarFilter));
  }

  void setIncompleteFilter(int? status) {
    emit(state.copyWith(incompleteFilter: status));
    applyFilter();
  }

  void searching(String? searchText) {
    emit(state.copyWith(searchText: searchText));
    applyFilter();
  }

  String getTotalQuestionsValue() {
    if ((state.selectedCARFilter != null && state.selectedCARFilter != CarFilterEnum.allCARs) ||
        (state.selectedComplianceFilter != null && state.selectedComplianceFilter?.complianceId != -1) ||
        (state.incompleteFilter == 1)) {
      return state.filteredQuestions.length.toString();
    }

    return state.getAnsweredQuestions().length.toString();
  }

  Future<void> applyFilter() async {
    var filterList = state.questions;

    final ncComplianceId = state.compliances.firstWhereOrNull((element) => element.isNC)?.complianceId;
    final answerWithNCCompliance = state.answers.where((answer) => answer.complianceId == ncComplianceId).toList();
    switch (state.selectedCARFilter) {
      case CarFilterEnum.minorCARs:
        filterList = filterList
            .where(
              (question) =>
                  (question.xBone == null || question.xBone == false)
                      // &&
                  // answerWithNCCompliance.firstWhereOrNull(
                  //       (element) =>
                  //           element.complianceId == ncComplianceId &&
                  //           question.questionId == element.questionId,
                  //     ) != null,
            )
            .toList();
        break;
      case CarFilterEnum.majorCARs:
        filterList = filterList
            .where(
              (question) =>
                  (question.xBone != null && question.xBone!)
                      // &&
                  // answerWithNCCompliance.firstWhereOrNull(
                  //       (element) =>
                  //           element.complianceId == ncComplianceId &&
                  //           question.questionId == element.questionId,
                  //     ) != null,
            )
            .toList();
        break;
      case CarFilterEnum.allCARs:
      case CarFilterEnum.noCars:
      default:
        break;
    }

    if (state.selectedComplianceFilter != null && state.selectedComplianceFilter?.complianceId != -1) {
      filterList = filterList.where((question) {
        final answer = state.answers.firstWhereOrNull(
          (answer) =>
              answer.questionId == question.questionId &&
              answer.complianceId == state.selectedComplianceFilter?.complianceId,
        );
        return answer != null;
      }).toList();
    }

    if (state.incompleteFilter == 1) {
      filterList = filterList.where((question) {
        final answer = state.answers.firstWhereOrNull(
          (answer) => answer.questionId == question.questionId,
        );
        return answer?.isQuestionComplete != 1;
      }).toList();
    }

    if (state.impactOnFilterId > -1) {
      filterList = filterList
          .where((s) => s.impactOnId == state.impactOnFilterId)
          .toList();
    }

    if (state.searchText.isNotBlank) {
      filterList = filterList
          .where(
            (question) =>
                '${question.indicatorName?.toLowerCase() ?? ''} ${question.questionValue?.toLowerCase() ?? ''}'
                    .contains(state.searchText!.toLowerCase()) ||
                (question.complianceName?.toLowerCase() ?? '').contains(state.searchText!.toLowerCase()),
          )
          .toList();
    }

    emit(state.copyWith(filteredQuestions: filterList));
  }

  void getCarFilters() {
    emit(state.copyWith(carFilterEnums: CarFilterEnum.values));
  }

  Future<void> getIndicators() async {
    final indicators = await cmoDatabaseMasterService.getIndicators();
    emit(state.copyWith(indicators: indicators));
  }

  Future<void> getRejectReasons() async {
    final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
    emit(state.copyWith(rejectReasons: rejectReasons));
  }

  Future<void> getListCompliances() async {
    final rmu = await configService.getActiveRegionalManager();
    final compliances = await cmoDatabaseMasterService.getCompliancesByRmuId(
        rmuId: rmu?.regionalManagerUnitId);
    emit(state.copyWith(compliances: compliances));
  }

  Future<void> initialize(Audit audit) async {
    try {
      logger.d('Initialise auditId: ${audit.assessmentId}');
      emit(AuditListQuestionsState(audit: audit));

      getCarFilters();
      await getIndicators();
      await getRejectReasons();
      await getListCompliances();
      await refresh();
    } catch (error) {
      handleError(error);
    }
  }

  Future<void> getListAuditQuestion() async {
    final rmu = await configService.getActiveRegionalManager();
    var questions = await cmoDatabaseMasterService.getFarmQuestions(
      auditTemplateId: state.audit?.auditTemplateId,
      rmuId: rmu?.regionalManagerUnitId,
    );

    questions = questions?.map((question) {
      final indicator = state.indicators.firstWhereOrNull((indicator) => indicator.indicatorId == question.indicatorId);
      return question.copyWith(
        indicatorName: indicator?.indicatorName,
      );
    }).toList();

    questions?.sort((first, second) {
      final firstIndicatorNumber = first.indicatorName.getExtendedVersionNumber();
      final secondIndicatorNumber = second.indicatorName.getExtendedVersionNumber();
      if (firstIndicatorNumber != null && secondIndicatorNumber != null) {
        return firstIndicatorNumber.compareTo(secondIndicatorNumber);
      }

      return (first.indicatorName ?? '').compareTo(second.indicatorName ?? '');
    });

    emit(state.copyWith(questions: questions));
  }

  Future<void> getListQuestionAnswers() async {
    final rmu = await configService.getActiveRegionalManager();
    final answers = await cmoDatabaseMasterService
        .getQuestionAnswersByRmuIdAndAuditTemplateIdAndAssessmentId(
      rmuId: rmu?.regionalManagerUnitId,
      auditTemplateId: state.audit?.auditTemplateId,
      assessmentId: state.audit?.assessmentId,
    );
    emit(state.copyWith(answers: answers));
  }

  Future<void> getListQuestionComment() async {
    final questionComments = await cmoDatabaseMasterService.getQuestionCommentsByAssessmentId(
      state.audit?.assessmentId,
    );

    emit(
      state.copyWith(
        questionComments: questionComments,
        totalComments: questionComments.length,
      ),
    );
  }

  Future<void> getListQuestionPhoto() async {
    final questionPhoto =
        await cmoDatabaseMasterService.getQuestionPhotosByAssessmentId(
      state.audit?.assessmentId,
    );

    emit(
      state.copyWith(
        questionPhotos: questionPhoto,
        totalPhotos: questionPhoto.length,
      ),
    );
  }

  Future<void> updateQuestionAnswer({
    required int? questionId,
    required int? rejectReasonId,
  }) async {
    if (questionId == null || rejectReasonId == null) return;
    var answer = state.answers.firstWhereOrNull((element) => element.questionId == questionId);
    if (answer != null) {
      answer = answer.copyWith(rejectReasonId: rejectReasonId);
      await cmoDatabaseMasterService.cacheQuestionAnswer(answer);
      await getListQuestionAnswers();
    }
  }

  Future<void> updateLocationQuestionAnswer({
    required int? questionId,
    required double? lat,
    required double? lng,
  }) async {
    emit(state.copyWith(loading: true));
    if (questionId == null) return;
    var answer = state.answers.firstWhereOrNull((element) => element.questionId == questionId);
    if (answer != null) {
      answer = answer.copyWith(
        latitude: lat,
        longitude: lng,
      );

      await cmoDatabaseMasterService.cacheQuestionAnswer(answer);
      await getListQuestionAnswers();
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> markQuestionAnswerIsCompleted(
    FarmQuestion question,
  ) async {
    final answer = state.answers.firstWhereOrNull(
      (e) => e.questionId == question.questionId,
    );

    if (answer == null) return;

    logger.d('Question is complete');
    await cmoDatabaseMasterService.cacheFarmQuestion(
      question.copyWith(isQuestionComplete: 1),
      isDirect: true,
    );

    await refresh();
  }

  Future<void> setAnswer(
    FarmQuestion question,
    Compliance compliance, {
    void Function()? onCallback,
  }) async {
    var answer = state.answers
        .firstWhereOrNull((e) => e.questionId == question.questionId);
    if (answer == null) return;

    final ncCompliance = state.compliances.firstWhereOrNull(
          (element) => element.isNC,
    );

    final isNCCompliance = answer.complianceId == ncCompliance?.complianceId;

    if (answer.complianceId == compliance.complianceId) {
      answer = answer.copyWith(
        complianceId: null,
        isQuestionComplete: 0,
        longitude: answer.longitude,
        latitude: answer.latitude,
      );
    } else {
      answer = answer.copyWith(
        complianceId: compliance.complianceId,
        questionAnswerId: DateTime.now().millisecondsSinceEpoch,
        isQuestionComplete: 1,
        rejectReasonId: null,
        rejectComment: null,
        longitude: answer.longitude,
        latitude: answer.latitude,
      );
    }

    if (!compliance.isNC && isNCCompliance) {
      answer = answer.copyWith(
        rejectReasonId: null,
        rejectComment: null,
      );

      await cmoDatabaseMasterService.removeQuestionCommentByQuestionId(question.questionId);
      await getListQuestionComment();
    }

    await cmoDatabaseMasterService.cacheQuestionAnswer(answer);
    await getListQuestionAnswers();
    await markQuestionAnswerIsCompleted(question);
    await applyFilter();

    if (answer.complianceId != null) {
      onCallback?.call();
    }
  }

  Future<void> refresh() async {
    await getListAuditQuestion();
    await getListQuestionAnswers();
    await getListQuestionComment();
    await getListQuestionPhoto();
    await applyFilter();
  }

  Future<void> addPhoto({
    required String photoPath,
    required FarmQuestion auditQuestion,
  }) async {
    final photo = QuestionPhoto(
      photo: photoPath,
      assessmentId: state.audit?.assessmentId,
      questionId: auditQuestion.questionId,
      photoId: generatorInt32Id(),
    );

    await cmoDatabaseMasterService.cacheQuestionPhoto(photo);
    await refreshAfterUploadPhoto();
  }

  Future<void> refreshAfterUploadPhoto() async {
    await getListQuestionPhoto();
    await applyFilter();
  }

  Future<void> checkAllAuditQuestionCompleted() async {
    final answered =
        state.answers.where((x) => x.isQuestionComplete == 1).toList();
    final questionCount = state.questions.length;
    if (answered.length == questionCount) {
      if (state.audit?.completed != true) {
        emit(
          state.copyWith(
            audit: state.audit?.copyWith(
              completed: true,
              synced: false,
            ),
          ),
        );
        if (state.audit != null) {
          await cmoDatabaseMasterService.cacheAudit(state.audit!);
        }
      }
    } else {
      final completed = state.audit?.completed;
      if (completed != null && completed == true) {
        emit(
          state.copyWith(
            audit: state.audit?.copyWith(
              completed: false,
              synced: false,
            ),
          ),
        );
        if (state.audit != null) {
          await cmoDatabaseMasterService.cacheAudit(state.audit!);
        }
      }
    }
  }

  void handleError(Object error) {
    logger.d(error);
  }

  Future<void> onSave() async {
    if(state.audit != null) {
      await cmoDatabaseMasterService.cacheAudit(state.audit!);
    }

    final answeredQuestion =
        state.answers.where((element) => element.questionAnswerId != null);

    for (final answer in answeredQuestion) {
      await cmoDatabaseMasterService.cacheQuestionAnswer(answer);
    }

    final completedQuestions = state.filteredQuestions.map((e) {
      if (answeredQuestion.firstWhereOrNull(
              (element) => element.questionId == e.questionId) !=
          null) {
        return e;
      }
    }).toList();

    for (final question in completedQuestions) {
      if (question == null) return;

      await markQuestionAnswerIsCompleted(question);
    }

    // await checkAllAuditQuestionCompleted();
  }

  void onChangeNote(String? value) {
    emit(state.copyWith(audit: state.audit?.copyWith(note: value)));
  }
}
