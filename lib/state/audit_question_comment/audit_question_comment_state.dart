part of 'audit_question_comment_cubit.dart';

class AuditQuestionCommentState extends Equatable {
  const AuditQuestionCommentState({
    this.question,
    this.questionComment,
    this.loading = false,
    this.rejectReasons = const <RejectReason>[],
  });

  final FarmQuestion? question;
  final AuditQuestionComment? questionComment;
  final bool loading;
  final List<RejectReason> rejectReasons;

  AuditQuestionCommentState copyWith({
    Audit? audit,
    FarmQuestion? question,
    AuditQuestionComment? questionComment,
    bool? loading,
    List<RejectReason>? rejectReasons,

  }) {
    return AuditQuestionCommentState(
      question: question ?? this.question,
      questionComment: questionComment ?? this.questionComment,
      loading: loading ?? this.loading,
      rejectReasons: rejectReasons ?? this.rejectReasons,
    );
  }

  @override
  List<Object?> get props => [
    question,
    questionComment,
    loading,
    rejectReasons,
  ];
}
