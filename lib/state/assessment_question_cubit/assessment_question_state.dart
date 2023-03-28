part of 'assessment_question_cubit.dart';

class AssessmentQuestionState extends Equatable {
  const AssessmentQuestionState({
    this.assessment,
    this.questions = const <CompanyQuestion>[],
    this.filteredQuestions = const <CompanyQuestion>[],
    this.compliances = const <Compliance>[],
    this.rejectReasons = const <RejectReason>[],
    this.answers = const <QuestionAnswer>[],
    this.speqss = const <Speqs>[],
    this.impactOns = const <ImpactOn>[],
    this.pdcas = const <Pdca>[],
    this.jobElements = const <JobElement>[],
    this.questionPhotos = const <QuestionPhoto>[],
    this.questionComments = const <QuestionComment>[],
    this.speqsFilterId = -1,
    this.impactOnFilterId = -1,
    this.pdcaFilterId = -1,
    this.jobElementFilterId = -1,
    this.incompleteFilter = 0,
  });

  final Assessment? assessment;
  final List<CompanyQuestion> questions;
  final List<CompanyQuestion> filteredQuestions;
  final List<Compliance> compliances;
  final List<RejectReason> rejectReasons;
  final List<QuestionAnswer> answers;
  final List<QuestionPhoto> questionPhotos;
  final List<QuestionComment> questionComments;

  final List<Speqs> speqss;
  final List<ImpactOn> impactOns;
  final List<Pdca> pdcas;
  final List<JobElement> jobElements;
  final int speqsFilterId;
  final int impactOnFilterId;
  final int pdcaFilterId;
  final int jobElementFilterId;
  final int incompleteFilter;

  AssessmentQuestionState copyWith({
    Assessment? assessment,
    List<CompanyQuestion>? questions,
    List<CompanyQuestion>? filteredQuestions,
    List<Compliance>? compliances,
    List<RejectReason>? rejectReasons,
    List<QuestionAnswer>? answers,
    List<Speqs>? speqss,
    List<ImpactOn>? impactOns,
    List<Pdca>? pdcas,
    List<JobElement>? jobElements,
    List<QuestionPhoto>? questionPhotos,
    List<QuestionComment>? questionComments,
    int? speqsFilterId,
    int? impactOnFilterId,
    int? pdcaFilterId,
    int? jobElementFilterId,
    int? incompleteFilter,
  }) {
    return AssessmentQuestionState(
      assessment: assessment ?? this.assessment,
      questions: questions ?? this.questions,
      filteredQuestions: filteredQuestions ?? this.filteredQuestions,
      compliances: compliances ?? this.compliances,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      answers: answers ?? this.answers,
      speqss: speqss ?? this.speqss,
      impactOns: impactOns ?? this.impactOns,
      pdcas: pdcas ?? this.pdcas,
      jobElements: jobElements ?? this.jobElements,
      questionPhotos: questionPhotos ?? this.questionPhotos,
      questionComments: questionComments ?? this.questionComments,
      speqsFilterId: speqsFilterId ?? this.speqsFilterId,
      impactOnFilterId: impactOnFilterId ?? this.impactOnFilterId,
      pdcaFilterId: pdcaFilterId ?? this.pdcaFilterId,
      jobElementFilterId: jobElementFilterId ?? this.jobElementFilterId,
      incompleteFilter: incompleteFilter ?? this.incompleteFilter,
    );
  }

  @override
  List<Object?> get props => [
        assessment,
        questions,
        filteredQuestions,
        compliances,
        rejectReasons,
        answers,
        speqss,
        impactOns,
        pdcas,
        jobElements,
        questionPhotos,
        questionComments,
        speqsFilterId,
        impactOnFilterId,
        pdcaFilterId,
        jobElementFilterId,
        incompleteFilter,
      ];
}
