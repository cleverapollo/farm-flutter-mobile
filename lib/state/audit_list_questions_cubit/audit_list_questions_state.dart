part of 'audit_list_questions_cubit.dart';

class AuditListQuestionsState extends Equatable {
  const AuditListQuestionsState({
    this.audit,
    this.questions = const <FarmQuestion>[],
    this.filteredQuestions = const <FarmQuestion>[],
    this.answers = const <QuestionAnswer>[],
    this.questionComments = const <QuestionComment>[],
    this.rejectReasons = const <RejectReason>[],
    this.compliances = const <Compliance>[],
    this.principles = const <Principle>[],
    this.indicators = const <Indicator>[],
    this.cars = const <Car>[],
    this.criterias = const <Criteria>[],
    this.impactOns = const <ImpactOn>[],
    this.impactOnFilterId = -1,
    this.incompleteFilter = 1,
    this.principleFilterId = -1,
    this.indicatorFilterId = -1,
    this.carFilterId = -1,
    this.criteriaFilterId = -1,
    this.totalComments = 0,
    this.totalPhotos = 0,
  });

  final Audit? audit;
  final List<FarmQuestion> questions;
  final List<FarmQuestion> filteredQuestions;
  final List<QuestionAnswer> answers;
  final List<QuestionComment> questionComments;
  final List<Compliance> compliances;
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
  final int totalComments;
  final int totalPhotos;

  AuditListQuestionsState copyWith({
    Audit? audit,
    List<FarmQuestion>? questions,
    List<FarmQuestion>? filteredQuestions,
    List<QuestionAnswer>? answers,
    List<QuestionComment>? questionComments,
    List<RejectReason>? rejectReasons,
    List<Compliance>? compliances,
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
    int? totalComments,
    int? totalPhotos,
  }) {
    return AuditListQuestionsState(
      questions: questions ?? this.questions,
      filteredQuestions: filteredQuestions ?? this.filteredQuestions,
      answers: answers ?? this.answers,
      questionComments: questionComments ?? this.questionComments,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      impactOns: impactOns ?? this.impactOns,
      impactOnFilterId: impactOnFilterId ?? this.impactOnFilterId,
      incompleteFilter: incompleteFilter ?? this.incompleteFilter,
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
      totalComments: totalComments ?? this.totalComments,
      totalPhotos: totalPhotos ?? this.totalPhotos,
    );
  }

  @override
  List<Object?> get props => [
    compliances,
    rejectReasons,
    answers,
    impactOns,
    impactOnFilterId,
    incompleteFilter,
    audit,
    questions,
    filteredQuestions,
    cars,
    principles,
    criterias,
    indicators,
    carFilterId,
    principleFilterId,
    criteriaFilterId,
    indicatorFilterId,
    totalPhotos,
    totalComments,
  ];
}
