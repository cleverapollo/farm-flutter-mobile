part of 'audit_list_questions_cubit.dart';

class AuditListQuestionsState extends Equatable {
  const AuditListQuestionsState({
    this.assessment,
    this.compliances = const <Compliance>[],
    this.rejectReasons = const <RejectReason>[],
    this.answers = const <QuestionAnswer>[],
    this.impactOns = const <ImpactOn>[],
    this.questionComments = const <QuestionComment>[],
    this.impactOnFilterId = -1,
    this.incompleteFilter = 0,


    this.audit,
    this.questions = const <AuditQuestion>[],
    this.auditQuestionPhotos = const <AuditQuestionPhoto>[],
    this.filteredQuestions = const <AuditQuestion>[],
    this.principles = const <Principle>[],
    this.indicators = const <Indicator>[],
    this.cars = const <Car>[],
    this.criterias = const <Criteria>[],
    this.principleFilterId = -1,
    this.indicatorFilterId = -1,
    this.carFilterId = -1,
    this.criteriaFilterId = -1,
  });

  final Assessment? assessment;
  final List<Compliance> compliances;
  final List<RejectReason> rejectReasons;
  final List<QuestionAnswer> answers;
  final List<QuestionComment> questionComments;
  final List<ImpactOn> impactOns;
  final int impactOnFilterId;
  final int incompleteFilter;


  final Audit? audit;
  final List<AuditQuestion> questions;
  final List<AuditQuestion> filteredQuestions;
  final List<AuditQuestionPhoto> auditQuestionPhotos;
  final List<Principle> principles;
  final List<Criteria> criterias;
  final List<Car> cars;
  final List<Indicator> indicators;
  final int principleFilterId;
  final int carFilterId;
  final int criteriaFilterId;
  final int indicatorFilterId;

  AuditListQuestionsState copyWith({
    Assessment? assessment,

    List<Compliance>? compliances,
    List<RejectReason>? rejectReasons,
    List<QuestionAnswer>? answers,
    List<ImpactOn>? impactOns,
    List<QuestionComment>? questionComments,
    int? impactOnFilterId,
    int? incompleteFilter,

    Audit? audit,
    List<AuditQuestion>? questions,
    List<AuditQuestion>? filteredQuestions,
    List<AuditQuestionPhoto>? auditQuestionPhotos,
    List<Principle>? principles,
    List<Car>? cars,
    List<Indicator>? indicators,
    List<Criteria>? criterias,
    int? principleFilterId,
    int? carFilterId,
    int? criteriaFilterId,
    int? indicatorFilterId,
  }) {
    return AuditListQuestionsState(
      assessment: assessment ?? this.assessment,
      compliances: compliances ?? this.compliances,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      answers: answers ?? this.answers,
      impactOns: impactOns ?? this.impactOns,
      questionComments: questionComments ?? this.questionComments,
      impactOnFilterId: impactOnFilterId ?? this.impactOnFilterId,
      incompleteFilter: incompleteFilter ?? this.incompleteFilter,


      questions: questions ?? this.questions,
      filteredQuestions: filteredQuestions ?? this.filteredQuestions,
      auditQuestionPhotos: auditQuestionPhotos ?? this.auditQuestionPhotos,
      audit: audit ?? this.audit,
      cars: cars ?? this.cars,
      criterias: criterias ?? this.criterias,
      indicators: indicators ?? this.indicators,
      principles: principles ?? this.principles,
      principleFilterId: principleFilterId ?? this.principleFilterId,
      carFilterId: carFilterId ?? this.carFilterId,
      criteriaFilterId: criteriaFilterId ?? this.criteriaFilterId,
      indicatorFilterId: indicatorFilterId ?? this.indicatorFilterId,
    );
  }

  @override
  List<Object?> get props => [
    assessment,
    compliances,
    rejectReasons,
    answers,
    impactOns,
    questionComments,
    impactOnFilterId,
    incompleteFilter,

    audit,
    questions,
    auditQuestionPhotos,
    filteredQuestions,
    cars,
    principles,
    criterias,
    indicators,
    carFilterId,
    principleFilterId,
    criteriaFilterId,
    indicatorFilterId,
  ];
}
