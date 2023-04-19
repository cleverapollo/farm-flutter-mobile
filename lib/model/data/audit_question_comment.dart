import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit_question_comment.freezed.dart';

part 'audit_question_comment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AuditQuestionComment with _$AuditQuestionComment {
  const AuditQuestionComment._();

  @override
  Id get id => answerId ?? Isar.autoIncrement;

  const factory AuditQuestionComment({
    @JsonKey(name: 'AnswerId') required int answerId,
    @JsonKey(name: 'CommentId') required int commentId,
    @JsonKey(name: 'AuditId') required int auditId,
    @JsonKey(name: 'QuestionId') int? questionId,
    @JsonKey(name: 'Comment') String? comment,
  }) = _AuditQuestionComment;

  factory AuditQuestionComment.fromJson(Map<String, dynamic> json) => _$AuditQuestionCommentFromJson(json);

  factory AuditQuestionComment.generateMockData() {
    return AuditQuestionComment(
      answerId: DateTime.now().millisecondsSinceEpoch,
      auditId: DateTime.now().millisecondsSinceEpoch,
      questionId: DateTime.now().millisecondsSinceEpoch,
      commentId: DateTime.now().millisecondsSinceEpoch,
      comment: 'comment',
    );
  }
}
