import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
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

  void setPrincipleFilter(int? id) {
    emit(state.copyWith(principleFilterId: id));
    applyFilter();
  }

  void setCarFilter(int? id) {
    emit(state.copyWith(carFilterId: id));
    applyFilter();
  }

  void setIndicatorFilter(int? id) {
    emit(state.copyWith(indicatorFilterId: id));
    applyFilter();
  }

  void setCriteriaFilter(int? id) {
    emit(state.copyWith(criteriaFilterId: id));
    applyFilter();
  }

  void setIncompleteFilter(int? status) {
    emit(state.copyWith(incompleteFilter: status));
    applyFilter();
  }

  Future<void> applyFilter() async {
    var filterList = state.questions;

    if (state.principleFilterId > -1) {
      filterList = filterList
          .where((s) => s.principleId == state.principleFilterId)
          .toList();
    }
    if (state.criteriaFilterId > -1) {
      filterList = filterList
          .where((s) => s.criteriaId == state.criteriaFilterId)
          .toList();
    }
    if (state.carFilterId > -1) {
      filterList =
          filterList.where((s) => s.severityId == state.carFilterId).toList();
    }

    if (state.indicatorFilterId > -1) {
      filterList = filterList
          .where((s) => s.indicatorId == state.indicatorFilterId)
          .toList();
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

    emit(state.copyWith(filteredQuestions: filterList));
  }

  Future<void> getPrinciples() async {
    final principles = await cmoDatabaseMasterService.getPrinciples();
    emit(state.copyWith(principles: principles));
  }

  Future<void> getCriterias() async {
    final criterias = await cmoDatabaseMasterService.getCriterias();
    emit(state.copyWith(criterias: criterias));
  }

  Future<void> getCars() async {
    final cars = await cmoDatabaseMasterService.getSeverities();

    // Only get minor and major item
    emit(
      state.copyWith(
        cars: [
          cars.first,
          cars.last,
        ],
      ),
    );
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
      emit(state.copyWith(audit: audit));

      await getPrinciples();
      await getCriterias();
      await getCars();
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
    final questions = await cmoDatabaseMasterService.getFarmQuestions(
      auditTemplateId: state.audit?.auditTemplateId,
      rmuId: rmu?.regionalManagerUnitId,
    );

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
    final questionComments =
        await cmoDatabaseMasterService.getQuestionCommentsByAssessmentId(
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
    var answer = state.answers
        .firstWhereOrNull((element) => element.questionId == questionId);
    if (answer != null) {
      answer = answer.copyWith(rejectReasonId: rejectReasonId);
      await cmoDatabaseMasterService.cacheQuestionAnswer(answer);
      await getListQuestionAnswers();
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
    await checkAllAuditQuestionCompleted();
  }

  Future<void> setAnswer(
    FarmQuestion question,
    Compliance compliance, {
    void Function()? onCallback,
  }) async {
    final answer = state.answers
        .firstWhereOrNull((e) => e.questionId == question.questionId);
    if (answer == null) return;

    final answerAfterSelect = state.answers.map((e) {
      if (e.questionId != question.questionId) return e;

      return e.copyWith(
        complianceId: compliance.complianceId,
        questionAnswerId: DateTime.now().millisecondsSinceEpoch,
        isQuestionComplete: 1,
        rejectReasonId: null,
        rejectComment: null,
      );
    }).toList();

    emit(state.copyWith(answers: answerAfterSelect));

    // await cmoDatabaseMasterService.cacheQuestionAnswer(answer);
    // await getListQuestionAnswers();
    // await markQuestionAnswerIsCompleted(question);
    onCallback?.call();
  }

  Future<void> refresh() async {
    await getListAuditQuestion();
    await getListQuestionAnswers();
    await getListQuestionComment();
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
  }
}
