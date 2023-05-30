import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'audit_list_questions_state.dart';

class AuditListQuestionsCubit extends Cubit<AuditListQuestionsState> {
  AuditListQuestionsCubit() : super(const AuditListQuestionsState());

  AuditQuestionAnswer? getAnswerByQuestionId(int? questionId) {
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
      filterList = filterList.where((s) => s.principleId == state.principleFilterId).toList();
    }
    if (state.criteriaFilterId > -1) {
      filterList = filterList.where((s) => s.criteriaId == state.criteriaFilterId).toList();
    }
    if (state.carFilterId > -1) {
      filterList = filterList.where((s) => s.carId == state.carFilterId).toList();
    }

    if (state.indicatorFilterId > -1) {
      filterList = filterList.where((s) => s.indicatorId == state.indicatorFilterId).toList();
    }

    filterList = filterList
        .where(
          (s) => s.isQuestionComplete == state.incompleteFilter,
        )
        .toList();

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
    final cars = await cmoDatabaseMasterService.getCars();
    emit(state.copyWith(cars: cars));
  }

  Future<void> getIndicators() async {
    final indicators = await cmoDatabaseMasterService.getIndicators();
    emit(state.copyWith(indicators: indicators));
  }

  Future<void> getRejectReasons() async {
    final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
    emit(state.copyWith(rejectReasons: rejectReasons));
  }

  Future<void> initialize(Audit audit) async {
    try {
      logger.d('Initialise auditId: ${audit.auditId}');
      emit(state.copyWith(audit: audit));

      await getPrinciples();
      await getCriterias();
      await getCars();
      await getIndicators();
      await getRejectReasons();
      await getListAuditCompliances();
      await refresh();
    } catch (error) {
      handleError(error);
    }
  }


  Future<void> getListAuditQuestion() async {
    final questions = await cmoDatabaseMasterService.getListAuditQuestion(
      auditId: state.audit?.auditId,
      auditTemplateId: state.audit?.auditTemplateId,
    );

    emit(state.copyWith(questions: questions));
  }

  Future<void> getListAuditQuestionAnswerWithAuditId() async {
    final answers = await cmoDatabaseMasterService.getAuditQuestionAnswersWithAuditId(state.audit?.auditId);
    emit(state.copyWith(answers: answers));
  }

  Future<void> getTotalCommentsAndPhotos() async {
    final questionComments = await cmoDatabaseMasterService.getAuditQuestionComments(
      auditId: state.audit?.auditId,
    );

    final auditQuestionPhotos = await cmoDatabaseMasterService.getAuditQuestionPhotos(
      auditId: state.audit?.auditId,
    );

    emit(state.copyWith(
      totalPhotos: auditQuestionPhotos.length,
      totalComments: questionComments.length,
    ));
  }

  Future<void> getListAuditCompliances() async {
    final compliances = <AuditCompliance>[
      AuditCompliance(complianceId: AuditComplianceEnum.n.data, complianceName: AuditComplianceEnum.n.valueName),
      AuditCompliance(complianceId: AuditComplianceEnum.nc.data, complianceName: AuditComplianceEnum.nc.valueName),
      AuditCompliance(complianceId: AuditComplianceEnum.na.data, complianceName: AuditComplianceEnum.na.valueName),
    ];

    emit(state.copyWith(compliances: compliances));
  }

  Future<void> markQuestionAnswerHasComment(
      AuditQuestion question,
  ) async {
    final answer = state.answers.firstWhereOrNull((e) => e.questionId == question.questionId);
    if (answer == null) return;
    await cmoDatabaseMasterService.cacheAuditQuestionAnswer(answer.copyWith(haveComment: true));
    await refresh();
    await markQuestionAnswerIsCompleted(question);
  }

  Future<void> markQuestionAnswerHasPhoto(
      AuditQuestion question,
      ) async {
    final answer = state.answers.firstWhereOrNull((e) => e.questionId == question.questionId);
    if (answer == null) return;
    await cmoDatabaseMasterService.cacheAuditQuestionAnswer(answer.copyWith(havePhoto: true));
    await refresh();
  }

  Future<void> markQuestionAnswerIsCompleted(
      AuditQuestion question,
      ) async {
    var isComplete = false;
    final answer = state.answers.firstWhereOrNull((e) => e.questionId == question.questionId);
    if (answer == null) return;
    switch (answer.complianceEnum) {
      case AuditComplianceEnum.n:
      case AuditComplianceEnum.na:
        isComplete = true;
        break;
      case AuditComplianceEnum.nc:
        isComplete = answer.haveComment ?? false;
        break;
      case AuditComplianceEnum.unknown:
        return;
    }

    await cmoDatabaseMasterService.cacheAuditQuestion(question.copyWith(isQuestionComplete: isComplete ? 0 : 1));
    await refresh();
  }

  Future<void> setAnswer(
    AuditQuestion question,
    AuditCompliance compliance,
  ) async {
    var answer = state.answers.firstWhereOrNull((e) => e.questionId == question.questionId);
    answer ??= AuditQuestionAnswer(
      auditId: state.audit?.auditId,
      answerId: DateTime.now().millisecondsSinceEpoch,
      questionId: question.questionId,
    );

    answer = answer.copyWith(
      complianceId: compliance.complianceId,
    );

    await cmoDatabaseMasterService.cacheAuditQuestionAnswer(answer);
    await getListAuditQuestionAnswerWithAuditId();
    await markQuestionAnswerIsCompleted(question);
  }

  Future<void> refresh() async {
    await getListAuditQuestion();
    await getListAuditQuestionAnswerWithAuditId();
    await getTotalCommentsAndPhotos();
    await applyFilter();
  }

  Future<void> checkAllAuditQuestionCompleted() async {
    final questions = state.questions;
    final uncompletedQuestions = questions.firstWhereOrNull((element) => element.isQuestionComplete == 1, orElse: null);
    await cmoDatabaseMasterService.cacheAudit(state.audit!.copyWith(completed: uncompletedQuestions == null));
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
