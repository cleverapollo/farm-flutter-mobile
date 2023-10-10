part of 'audit_question_comment_cubit.dart';

class AuditQuestionCommentState extends Equatable {
  const AuditQuestionCommentState({
    this.question,
    this.questionComment,
    this.loading = false,
    this.isEditing = false,
    this.rejectReasons = const <RejectReason>[],
    this.auditId,
    this.selectedRejectReason,
  });

  final FarmQuestion? question;
  final QuestionComment? questionComment;
  final int? auditId;
  final bool loading;
  final bool isEditing;
  final List<RejectReason> rejectReasons;
  final RejectReason? selectedRejectReason;

  AuditQuestionCommentState copyWith({
    Audit? audit,
    FarmQuestion? question,
    QuestionComment? questionComment,
    bool? loading,
    bool? isEditing,
    List<RejectReason>? rejectReasons,
    int? auditId,
    RejectReason? selectedRejectReason,
  }) {
    return AuditQuestionCommentState(
      question: question ?? this.question,
      questionComment: questionComment ?? this.questionComment,
      loading: loading ?? this.loading,
      isEditing: isEditing ?? this.isEditing,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      auditId: auditId ?? this.auditId,
      selectedRejectReason: selectedRejectReason ?? this.selectedRejectReason,
    );
  }

  AuditQuestionCommentState clearSelectedRejectReason() {
    return AuditQuestionCommentState(
      question: question,
      questionComment: questionComment,
      loading: loading,
      rejectReasons: rejectReasons,
      auditId: auditId,
      isEditing: isEditing,
    );
  }

  @override
  List<Object?> get props => [
        question,
        questionComment,
        loading,
        rejectReasons,
        auditId,
        selectedRejectReason,
        isEditing,
      ];
}
