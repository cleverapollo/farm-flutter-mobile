part of 'audit_question_comment_cubit.dart';

class AuditQuestionCommentState extends Equatable {
  const AuditQuestionCommentState({
    this.audit,
    this.question,
    this.questionComment,
    this.loading = false,
    this.rejectReasons = const <RejectReason>[],
  });

  final Audit? audit;
  final AuditQuestion? question;
  final AuditQuestionComment? questionComment;
  final bool loading;
  final List<RejectReason> rejectReasons;

  AuditQuestionCommentState copyWith({
    Audit? audit,
    AuditQuestion? question,
    AuditQuestionComment? questionComment,
    bool? loading,
    List<RejectReason>? rejectReasons,

  }) {
    return AuditQuestionCommentState(
      question: question ?? this.question,
      questionComment: questionComment ?? this.questionComment,
      loading: loading ?? this.loading,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      audit: audit ?? this.audit,
    );
  }

  @override
  List<Object?> get props => [
    audit,
    question,
    questionComment,
    loading,
    rejectReasons,
  ];
}
