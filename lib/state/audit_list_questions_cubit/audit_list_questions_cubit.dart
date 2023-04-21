import 'dart:ffi';
import 'dart:ui';

import 'package:cmo/di.dart';
import 'package:cmo/enum/enum.dart';
import 'package:cmo/extensions/iterable_extensions.dart';
import 'package:cmo/model/data/audit_compliance.dart';
import 'package:cmo/model/data/audit_question_answer.dart';
import 'package:cmo/model/data/audit_question_comment.dart';
import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/data/question_photo.dart';
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

  List<AuditQuestion> getAllQuestions() {
    return state.questions;
  }

  List<RejectReason> getRejectReasons() {
    return state.rejectReasons;
  }

  List<AuditQuestionAnswer> getAnswers() {
    return state.answers;
  }

  AuditQuestionAnswer? getAnswerByQuestionId(int? questionId) {
    if (questionId == null) return null;
    return state.answers.firstWhereOrNull(
      (e) => e.questionId != null && e.questionId == questionId,
    );
  }

  AuditQuestion getQuestion(int index) {
    return state.filteredQuestions[index];
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
        getListAuditQuestionPhotosWithAuditId(),
        getListAuditQuestionCommentsWithAuditId(),
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

  Future<void> getListAuditQuestionCommentsWithAuditId() async {
    final questionComments = await cmoDatabaseMasterService.getAuditQuestionComments(
      auditId: state.audit?.auditId,
    );

    emit(state.copyWith(questionComments: questionComments));
  }

  Future<void> getListAuditQuestionPhotosWithAuditId() async {
    final auditQuestionPhoto = await cmoDatabaseMasterService.getAuditQuestionPhotosByAuditId(state.audit?.auditId);
    emit(state.copyWith(auditQuestionPhotos: auditQuestionPhoto));
  }

  Future<void> getListAuditCompliances() async {
    final compliances = <AuditCompliance>[
      AuditCompliance(complianceId: AuditComplianceEnum.n.data, complianceName: AuditComplianceEnum.n.valueName),
      AuditCompliance(complianceId: AuditComplianceEnum.nc.data, complianceName: AuditComplianceEnum.nc.valueName),
      AuditCompliance(complianceId: AuditComplianceEnum.na.data, complianceName: AuditComplianceEnum.na.valueName),
    ];

    emit(state.copyWith(compliances: compliances));
  }

  Future<void> addCommentFromReasonCode(
      QuestionComment comment,
      CompanyQuestion question,
      Compliance compliance,
      ) async {
    // final answer = state.answers
    //     .firstWhereOrNull((e) => e.questionId == question.questionId);
    //
    // await cmoDatabaseMasterService.cacheQuestionComment(comment);
    //
    // await checkComplianceHasRejectReason(
    //   compliance.hasRejectReason ?? false,
    //   answer,
    // );
  }

  Future<void> markQuestionAnswerHasComment(
      AuditQuestion question,
  ) async {
    final answer = state.answers.firstWhereOrNull((e) => e.questionId == question.questionId);
    if (answer == null) return;
    await cmoDatabaseMasterService.cacheAuditQuestionAnswer(answer.copyWith(haveComment: true));
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
    //
    // if (answer.complianceId == compliance.complianceId) {
    //   logger.d(
    //     'Answer complianceId: ${answer.complianceId} = ${compliance.complianceId}',
    //   );
    //   answer = answer.copyWith(assessmentId: 0);
    //   logger.d(
    //     'Remove answer for AssessmentId: ${answer.assessmentId} QuestionId: ${answer.questionId}',
    //   );
    //   answer = answer.copyWith(isQuestionComplete: 0);
    //
    //   await cmoDatabaseMasterService.removeQuestionAnswer(answer);
    //   await checkIfAssessmentIscomplete();
    // } else {
    //   logger.d('Set answer complianceId to: ${compliance.complianceId}');
    //   answer = answer.copyWith(complianceId: compliance.complianceId);
    //   logger.d('Check compliance reject reason: ${compliance.hasRejectReason}');
    //   await checkComplianceHasRejectReason(
    //     compliance.hasRejectReason ?? false,
    //     answer,
    //   );
    // }
  }

  Future<void> checkComplianceHasRejectReason(
      bool hasRejectReason,
      QuestionAnswer? answerData,
      ) async {
    var answer = answerData;
    final assessmentId = answer?.assessmentId;
    final questionId = answer?.questionId;
    if (answer == null || assessmentId == null || questionId == null) return;
    if (hasRejectReason) {
      logger.d(
        'Check if has comments: ${await checkIfComments(assessmentId, questionId)}',
      );
      logger.d('Check reject reasonId: ${answer.rejectReasonId}');

      if ((await checkIfComments(assessmentId, questionId)) &&
          (answer.rejectReasonId ?? -1) > -1) {
        logger.d('Question is complete');
        answer = answer.copyWith(isQuestionComplete: 1);
      } else {
        logger.d('Question is not complete');
        answer = answer.copyWith(isQuestionComplete: 0);
      }
    } else {
      logger.d('Question is complete');
      answer = answer.copyWith(isQuestionComplete: 1);
    }
    logger.d(
      'Add answer for AssessmentId: ${answer.assessmentId} QuestionId: ${answer.questionId}',
    );
    await cmoDatabaseMasterService.cacheQuestionAnswer(answer);
    // final answers = await cmoDatabaseMasterService
    //     .getQuestionAnswersByCompanyIdAndJobCategoryIdAndAssessmentId(
    //   state.assessment?.companyId,
    //   state.assessment?.jobCategoryId,
    //   state.assessment?.assessmentId,
    // );
    // emit(state.copyWith(answers: answers));
    await checkIfAssessmentIscomplete();
  }

  Future<bool> checkIfComments(int assessmentId, int questionId) async {
    final comments = await cmoDatabaseMasterService.getQuestionComments(
      assessmentId,
      questionId,
    );
    return comments.isNotBlank;
  }

  Future<void> checkIfAssessmentIscomplete() async {
    logger.d('Check if all questions are answered');
    // final answered =
    // getAnswers().where((x) => x.isQuestionComplete == 1).toList();
    //
    // logger.d('Answered count: ${answered.length}');
    // final questionCount = getAllQuestions().length;
    // logger.d('Question count: $questionCount');
    //
    // if (answered.length == questionCount) {
    //   if (state.assessment?.completed != true) {
    //     emit(
    //       state.copyWith(
    //         assessment: state.assessment?.copyWith(completed: true),
    //       ),
    //     );
    //     if (state.assessment != null) {
    //       await cmoDatabaseService.cacheAssessment(state.assessment!);
    //     }
    //   }
    // } else {
    //   final completed = state.assessment?.completed;
    //   if (completed != null && completed == true) {
    //     emit(
    //       state.copyWith(
    //         assessment: state.assessment?.copyWith(completed: false),
    //       ),
    //     );
    //     if (state.assessment != null) {
    //       await cmoDatabaseService.cacheAssessment(state.assessment!);
    //     }
    //   }
    // }
  }

  Future<AuditQuestionPhoto?> addPhoto({
    required int? questionId,
    required String photoPath,
    required String photoName,
  }) async {
    final audit = state.audit;
    final photo = AuditQuestionPhoto(
      auditId: audit?.auditId,
      photoPath: photoPath,
      questionId: questionId,
      photoId: DateTime.now().millisecondsSinceEpoch,
      photoName: photoName,
    );
    await cmoDatabaseMasterService.cacheAuditQuestionPhoto(photo);
    final photoData = await cmoDatabaseMasterService.getAuditQuestionPhotoByPhotoPath(photoPath);
    if (photoData != null) {
      emit(
        state.copyWith(
          auditQuestionPhotos: [
            ...state.auditQuestionPhotos,
            photoData,
          ],
        ),
      );
    }
    return photoData;
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
