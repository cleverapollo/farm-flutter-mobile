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

  List<ImpactOn> getImpactOns() {
    return state.impactOns;
  }

  List<AuditQuestion> getFilteredQuestions() {
    return state.filteredQuestions;
  }

  List<AuditQuestion> getListIncompleteQuestion() {
    return state.filteredQuestions
        .where(
          (x) => x.isQuestionComplete != null && x.isQuestionComplete! == 1,
        )
        .toList();
  }

  List<AuditQuestion> getListCompletedQuestion() {
    return state.filteredQuestions
        .where(
          (x) => x.isQuestionComplete != null && x.isQuestionComplete! == 0,
    )
        .toList();
  }

  List<AuditQuestion> getUnAnsweredFilteredQuestions() {
    return state.filteredQuestions
        .where(
          (x) => x.isQuestionComplete != null && x.isQuestionComplete! == 1,
    )
        .toList();
  }

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
    if (state.incompleteFilter == 1) {
      filterList = filterList
          .where(
            (s) => s.isQuestionComplete == 1,
      )
          .toList();
    }


    if (state.impactOnFilterId > -1) {
      filterList = filterList
          .where((s) => s.impactOnId == state.impactOnFilterId)
          .toList();
    }

    emit(state.copyWith(filteredQuestions: filterList));
  }

  Future<void> initialize(Audit audit) async {
    try {
      logger.d('Initialise auditId: ${audit.auditId}');
      emit(state.copyWith(audit: audit));

      const principles = <Principle>[
        Principle(principleId: 1, principleName: 'Principle 1'),
        Principle(principleId: 2, principleName: 'Principle 2'),
      ];
      emit(state.copyWith(principles: principles));

      const criterias = <Criteria>[
        Criteria(criteriaId: 1, criteriaName: 'Criteria 1'),
        Criteria(criteriaId: 2, criteriaName: 'Criteria 2'),
      ];
      emit(state.copyWith(criterias: criterias));

      const cars = <Car>[
        Car(carId: 1, carName: 'Car 1'),
        Car(carId: 2, carName: 'Car 2'),
      ];
      emit(state.copyWith(cars: cars));

      const indicators = <Indicator>[
        Indicator(indicatorId: 1, indicatorName: 'Indicator 1'),
        Indicator(indicatorId: 2, indicatorName: 'Indicator 2'),
      ];
      emit(state.copyWith(indicators: indicators));

      final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
      emit(state.copyWith(rejectReasons: rejectReasons));

      await Future.wait([
        getListAuditQuestionWithAuditTemplate(),
        getListAuditQuestionAnswerWithAuditId(),
        getListAuditCompliances(),
        applyFilter(),
      ]);

    } catch (error) {
      handleError(error);
    }
  }


  Future<void> getListAuditQuestionWithAuditTemplate() async {
    final questions = await cmoDatabaseMasterService.getAuditQuestionWithAuditTemplateId(
      state.audit?.auditTemplateId,
    );

    emit(state.copyWith(questions: questions));
  }

  Future<void> getListAuditQuestionAnswerWithAuditId() async {
    final answers = await cmoDatabaseMasterService.getAuditQuestionAnswersWithAuditId(state.audit?.auditId);
    emit(state.copyWith(answers: answers));
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
    await getListAuditQuestionAnswerWithAuditId();
  }

  Future<void> markQuestionAnswerHasPhoto(
      AuditQuestion question,
      ) async {
    final answer = state.answers.firstWhereOrNull((e) => e.questionId == question.questionId);
    if (answer == null) return;
    await cmoDatabaseMasterService.cacheAuditQuestionAnswer(answer.copyWith(havePhoto: true));
    await getListAuditQuestionAnswerWithAuditId();
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

    switch (compliance.complianceEnum) {
      case AuditComplianceEnum.unknown:
        return;
      case AuditComplianceEnum.n:
      case AuditComplianceEnum.na:
        answer = answer.copyWith(
          complianceId: compliance.complianceId,
        );

        await cmoDatabaseMasterService.cacheAuditQuestionAnswer(answer);
        break;
      case AuditComplianceEnum.nc:
        answer = answer.copyWith(
          complianceId: compliance.complianceId,
        );

        await cmoDatabaseMasterService.cacheAuditQuestionAnswer(answer);
        break;
    }

    await getListAuditQuestionAnswerWithAuditId();
  }

  Future<void> checkAuditQuestionComplete() async {
    final questions = state.questions;
    var isAllQuestionCompleted = true;
    for (final question in questions) {
      var isQuestionComplete = false;
      final answer = state.answers.firstWhereOrNull((e) => e.questionId == question.questionId);
      if (answer != null) {
        switch (answer.complianceEnum) {
          case AuditComplianceEnum.n:
          case AuditComplianceEnum.na:
          isQuestionComplete = true;
            break;
          case AuditComplianceEnum.nc:
            if ((answer.haveComment ?? false) && answer.rejectReasonId != null && answer.rejectReasonId != -1) {
              isQuestionComplete = true;
            }
            break;
          case AuditComplianceEnum.unknown:
            break;
        }
      }

      if (isQuestionComplete) {
        continue;
      } else {
        isAllQuestionCompleted = false;
        break;
      }
    }

    await cmoDatabaseMasterService.cacheAudit(state.audit!.copyWith(completed: isAllQuestionCompleted));
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
