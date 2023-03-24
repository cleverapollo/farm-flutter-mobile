import 'package:cmo/di.dart';
import 'package:cmo/model/model.dart';
import 'package:cmo/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'assessment_question_state.dart';

class AssessmentQuestionCubit extends Cubit<AssessmentQuestionState> {
  AssessmentQuestionCubit() : super(const AssessmentQuestionState());

  List<Speqs> getSpeqs() {
    return state.speqss;
  }

  List<ImpactOn> getImpactOns() {
    return state.impactOns;
  }

  List<Pdca> getPdcas() {
    return state.pdcas;
  }

  List<CompanyQuestion> getFilteredQuestions() {
    return state.filteredQuestions;
  }

  List<CompanyQuestion> getUnAnsweredFilteredQuestions() {
    return state.filteredQuestions
        .where(
          (x) => x.isQuestionComplete != null && x.isQuestionComplete! == true,
        )
        .toList();
  }

  List<CompanyQuestion> getAllQuestions() {
    return state.questions;
  }

  List<Compliance> getCompliances() {
    return state.compliances;
  }

  List<RejectReason> getRejectReasons() {
    return state.rejectReasons;
  }

  List<QuestionAnswer> getAnswers() {
    return state.answers;
  }

  List<JobElement> getJobElements() {
    return state.jobElements;
  }

  int getSpeqsFilter() {
    return state.speqsFilterId;
  }

  int getPdcaFilter() {
    return state.pdcaFilterId;
  }

  int getJobElementFilter() {
    return state.jobElementFilterId;
  }

  CompanyQuestion getQuestion(int index) {
    return state.filteredQuestions[index];
  }

  String getJobCategoryName() {
    return state.assessment?.jobCategoryName ?? '';
  }

  Assessment? getAssessment() {
    return state.assessment;
  }

  void setSpeqsFilter(int id) {
    state.copyWith(speqsFilterId: id);
    // this.applyFilter();
  }

  void setImpactOnFilter(int id) {
    state.copyWith(impactOnFilterId: id);
    // this.applyFilter();
  }

  void setPdcaFilter(int id) {
    state.copyWith(pdcaFilterId: id);
    // this.applyFilter();
  }

  void setJobElementFilter(int id) {
    state.copyWith(jobElementFilterId: id);
    // this.applyFilter();
  }

  void setIncompleteFilter(int status) {
    state.copyWith(incompleteFilter: status);
    // this.applyFilter();
  }

  int nextQuestionIndex(int i) {
    var index = i;

    index++;
    if (index >= state.filteredQuestions.length) {
      index = 0;
    }

    return index;
  }

  int prevQuestionIndex(int i) {
    var index = i;

    index--;
    if (index < 0) {
      index = state.filteredQuestions.length - 1;
    }

    return index;
  }

  Future<void> applyFilter() async {
    var filterList = state.questions;

    if (state.speqsFilterId > -1) {
      filterList =
          filterList.where((s) => s.speqsId == state.speqsFilterId).toList();
    }
    if (state.impactOnFilterId > -1) {
      filterList = filterList
          .where((s) => s.impactOnId == state.impactOnFilterId)
          .toList();
    }
    if (state.pdcaFilterId > -1) {
      filterList =
          filterList.where((s) => s.pdcaId == state.pdcaFilterId).toList();
    }
    if (state.jobElementFilterId > -1) {
      filterList = filterList
          .where((s) => s.jobElementId == state.jobElementFilterId)
          .toList();
    }
    if (state.incompleteFilter == 1) {
      filterList = filterList
          .where(
            (s) =>
                s.isQuestionComplete == false || s.isQuestionComplete == null,
          )
          .toList();
    }
    emit(state.copyWith(filteredQuestions: filterList));
  }

  Future<void> initialize(Assessment assessment) async {
    try {
      logger.d('Initialise assessmentId: ${assessment.assessmentId}');
      emit(state.copyWith(assessment: assessment));

      final questions = await cmoDatabaseMasterService
          .getQuestionsByCompanyIdAndJobCategoryIdAndAssessmentId(
        assessment.companyId,
        assessment.jobCategoryId,
        assessment.assessmentId,
      );
      emit(state.copyWith(questions: questions));

      logger.d('Get compliance by companyId and jobCategoryId');

      final compliances =
          await cmoDatabaseMasterService.getCompliancesByCompanyIdJobCategoryId(
        assessment.companyId,
        assessment.jobCategoryId,
      );
      emit(state.copyWith(compliances: compliances));

      if (compliances.isEmpty) {
        logger.d('Get compliance by companyId only');
        final compliances = await cmoDatabaseMasterService
            .getCompliancesByCompanyId(assessment.companyId);
        emit(state.copyWith(compliances: compliances));
      }

      final rejectReasons = await cmoDatabaseMasterService.getRejectReasons();
      emit(state.copyWith(rejectReasons: rejectReasons));

      final speqss = await cmoDatabaseMasterService
          .getSpeqssByJobCategoryId(assessment.jobCategoryId);
      emit(state.copyWith(speqss: speqss));

      final pdcas = await cmoDatabaseMasterService
          .getPdcasByJobCategoryId(assessment.jobCategoryId);
      emit(state.copyWith(pdcas: pdcas));

      final jobElements = await cmoDatabaseMasterService
          .getJobElementsByJobCategoryId(assessment.jobCategoryId);
      emit(state.copyWith(jobElements: jobElements));

      logger.d('Get question answers');
      final answers = await cmoDatabaseMasterService
          .getQuestionAnswersByCompanyIdAndJobCategoryIdAndAssessmentId(
        assessment.companyId,
        assessment.jobCategoryId,
        assessment.assessmentId,
      );
      emit(state.copyWith(answers: answers));

      await applyFilter();
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(Object error) {
    logger.d(error);
  }
}
