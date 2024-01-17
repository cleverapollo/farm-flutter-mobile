part of 'audit_list_questions_cubit.dart';

class AuditListQuestionsState extends Equatable {
  const AuditListQuestionsState({
    this.audit,
    this.questions = const <FarmQuestion>[],
    this.filteredQuestions = const <FarmQuestion>[],
    this.answers = const <QuestionAnswer>[],
    this.questionComments = const <QuestionComment>[],
    this.questionPhotos = const <QuestionPhoto>[],
    this.rejectReasons = const <RejectReason>[],
    this.compliances = const <Compliance>[],
    this.indicators = const <Indicator>[],
    this.carFilterEnums = const <CarFilterEnum>[],
    this.impactOns = const <ImpactOn>[],
    this.impactOnFilterId = -1,
    this.incompleteFilter = -1,
    this.totalComments = 0,
    this.totalPhotos = 0,
    this.selectedCARFilter,
    this.selectedComplianceFilter,
    this.searchText,
    this.loading = false,
    this.isOpenedCarFilter = false,
  });

  final bool loading;
  final Audit? audit;
  final List<FarmQuestion> questions;
  final List<FarmQuestion> filteredQuestions;
  final List<QuestionAnswer> answers;
  final List<QuestionComment> questionComments;
  final List<QuestionPhoto> questionPhotos;
  final List<Compliance> compliances;
  final List<RejectReason> rejectReasons;
  final List<Indicator> indicators;
  final List<ImpactOn> impactOns;
  final List<CarFilterEnum> carFilterEnums;
  final CarFilterEnum? selectedCARFilter;
  final Compliance? selectedComplianceFilter;
  final int impactOnFilterId;
  final int incompleteFilter;
  final int totalComments;
  final int totalPhotos;
  final String? searchText;
  final bool isOpenedCarFilter;

  AuditListQuestionsState copyWith({
    Audit? audit,
    bool? loading,
    CarFilterEnum? selectedCARFilter,
    Compliance? selectedComplianceFilter,
    List<CarFilterEnum>? carFilterEnums,
    List<FarmQuestion>? questions,
    List<FarmQuestion>? filteredQuestions,
    List<QuestionAnswer>? answers,
    List<QuestionComment>? questionComments,
    List<QuestionPhoto>? questionPhotos,
    List<RejectReason>? rejectReasons,
    List<Compliance>? compliances,
    List<Principle>? principles,
    List<Indicator>? indicators,
    List<Criteria>? criterias,
    List<ImpactOn>? impactOns,
    int? impactOnFilterId,
    int? incompleteFilter,
    int? totalComments,
    int? totalPhotos,
    String? searchText,
    bool? isOpenedCarFilter,
  }) {
    return AuditListQuestionsState(
      loading: loading ?? this.loading,
      questions: questions ?? this.questions,
      selectedCARFilter: selectedCARFilter ?? this.selectedCARFilter,
      carFilterEnums: carFilterEnums ?? this.carFilterEnums,
      selectedComplianceFilter: selectedComplianceFilter ?? this.selectedComplianceFilter,
      filteredQuestions: filteredQuestions ?? this.filteredQuestions,
      answers: answers ?? this.answers,
      questionComments: questionComments ?? this.questionComments,
      questionPhotos: questionPhotos ?? this.questionPhotos,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      impactOns: impactOns ?? this.impactOns,
      impactOnFilterId: impactOnFilterId ?? this.impactOnFilterId,
      incompleteFilter: incompleteFilter ?? this.incompleteFilter,
      compliances: compliances ?? this.compliances,
      audit: audit ?? this.audit,
      indicators: indicators ?? this.indicators,
      totalComments: totalComments ?? this.totalComments,
      totalPhotos: totalPhotos ?? this.totalPhotos,
      searchText: searchText ?? this.searchText,
      isOpenedCarFilter: isOpenedCarFilter ?? this.isOpenedCarFilter,
    );
  }

  @override
  List<Object?> get props =>
      [
        loading,
        audit,
        questions,
        filteredQuestions,
        answers,
        questionComments,
        questionPhotos,
        compliances,
        rejectReasons,
        searchText,
        indicators,
        impactOns,
        carFilterEnums,
        selectedCARFilter,
        selectedComplianceFilter,
        impactOnFilterId,
        incompleteFilter,
        totalPhotos,
        totalComments,
        isOpenedCarFilter,
      ];

  List<QuestionAnswer> getAnsweredQuestions() {
    return answers
        .where(
          (answer) =>
              answer.isQuestionComplete == 1 &&
              questions.firstWhereOrNull(
                    (question) => question.questionId == answer.questionId,
                  ) !=
                  null,
        )
        .toList();
  }

  List<QuestionAnswer> getAnsweredFilteredQuestions() {
    return answers
        .where(
          (answer) =>
              answer.isQuestionComplete == 1 &&
              filteredQuestions.firstWhereOrNull(
                    (question) => question.questionId == answer.questionId,
                  ) !=
                  null,
        )
        .toList();
  }

  QuestionComment? getQuestionCommentsWithQuestionId(int? questionId) {
    return questionComments.firstWhereOrNull((comment) => comment.questionId == questionId);
  }

  List<QuestionPhoto> getListPhotoFilteredQuestions(int? questionId) {
    return questionPhotos
        .where(
          (photo) =>
              photo.questionId == questionId &&
              filteredQuestions.firstWhereOrNull(
                    (question) => question.questionId == questionId,
                  ) !=
                  null,
        )
        .toList();
  }

  bool reactMaximumUploadedPhoto() {
    return totalPhotos >= Constants.MAX_UPLOADED_PHOTOS_AUDIT;
  }
}
