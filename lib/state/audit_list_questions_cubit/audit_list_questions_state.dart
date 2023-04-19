part of 'audit_list_questions_cubit.dart';

class AuditListQuestionsState extends Equatable {
  const AuditListQuestionsState({
    this.audit,
    this.questions = const <AuditQuestion>[],
    this.answers = const <AuditQuestionAnswer>[],
    this.rejectReasons = const <RejectReason>[],
    this.questionComments = const <AuditQuestionComment>[],
    this.auditQuestionPhotos = const <AuditQuestionPhoto>[],
    this.filteredQuestions = const <AuditQuestion>[],
    this.compliances = const <AuditCompliance>[],
    this.principles = const <Principle>[],
    this.indicators = const <Indicator>[],
    this.cars = const <Car>[],
    this.criterias = const <Criteria>[],
    this.impactOns = const <ImpactOn>[],
    this.impactOnFilterId = -1,
    this.incompleteFilter = 0,
    this.principleFilterId = -1,
    this.indicatorFilterId = -1,
    this.carFilterId = -1,
    this.criteriaFilterId = -1,
  });

  final Audit? audit;
  final List<AuditQuestion> questions;
  final List<AuditQuestionAnswer> answers;
  final List<AuditQuestion> filteredQuestions;
  final List<AuditQuestionPhoto> auditQuestionPhotos;
  final List<AuditQuestionComment> questionComments;
  final List<AuditCompliance> compliances;
  final List<RejectReason> rejectReasons;
  final List<Principle> principles;
  final List<Criteria> criterias;
  final List<Car> cars;
  final List<Indicator> indicators;
  final List<ImpactOn> impactOns;
  final int impactOnFilterId;
  final int incompleteFilter;
  final int principleFilterId;
  final int carFilterId;
  final int criteriaFilterId;
  final int indicatorFilterId;

  AuditListQuestionsState copyWith({
    Audit? audit,
    List<RejectReason>? rejectReasons,
    List<AuditQuestion>? questions,
    List<AuditQuestion>? filteredQuestions,
    List<AuditQuestionPhoto>? auditQuestionPhotos,
    List<AuditQuestionComment>? questionComments,
    List<AuditQuestionAnswer>? answers,
    List<AuditCompliance>? compliances,
    List<Principle>? principles,
    List<Car>? cars,
    List<Indicator>? indicators,
    List<Criteria>? criterias,
    List<ImpactOn>? impactOns,
    int? impactOnFilterId,
    int? incompleteFilter,
    int? principleFilterId,
    int? carFilterId,
    int? criteriaFilterId,
    int? indicatorFilterId,
  }) {
    return AuditListQuestionsState(
      rejectReasons: rejectReasons ?? this.rejectReasons,
      answers: answers ?? this.answers,
      impactOns: impactOns ?? this.impactOns,
      questionComments: questionComments ?? this.questionComments,
      impactOnFilterId: impactOnFilterId ?? this.impactOnFilterId,
      incompleteFilter: incompleteFilter ?? this.incompleteFilter,
      questions: questions ?? this.questions,
      filteredQuestions: filteredQuestions ?? this.filteredQuestions,
      auditQuestionPhotos: auditQuestionPhotos ?? this.auditQuestionPhotos,
      compliances: compliances ?? this.compliances,
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
