part of 'audit_question_comment_cubit.dart';

class AuditQuestionCommentState extends Equatable {
  const AuditQuestionCommentState({
    this.question,
    this.questionComment,
    this.loading = false,
    this.rejectReasons = const <RejectReason>[],
    this.listComments = const <QuestionComment>[],
    this.auditId,
  });

  final FarmQuestion? question;
  final List<QuestionComment> listComments;
  final QuestionComment? questionComment;
  final int? auditId;
  final bool loading;
  final List<RejectReason> rejectReasons;

  AuditQuestionCommentState copyWith({
    Audit? audit,
    FarmQuestion? question,
    QuestionComment? questionComment,
    bool? loading,
    List<RejectReason>? rejectReasons,
    int? auditId,
    List<QuestionComment>? listComments,
  }) {
    return AuditQuestionCommentState(
      question: question ?? this.question,
      questionComment: questionComment ?? this.questionComment,
      loading: loading ?? this.loading,
      rejectReasons: rejectReasons ?? this.rejectReasons,
      auditId: auditId ?? this.auditId,
      listComments: listComments ?? this.listComments,
    );
  }

  @override
  List<Object?> get props => [
        question,
        questionComment,
        loading,
        rejectReasons,
        auditId,
        listComments,
      ];
}
