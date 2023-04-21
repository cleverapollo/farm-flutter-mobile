import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit_question_comment.freezed.dart';

part 'audit_question_comment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AuditQuestionComment with _$AuditQuestionComment {
  const AuditQuestionComment._();

  @override
  Id get id => answerId;

  const factory AuditQuestionComment({
    @JsonKey(name: 'AnswerId') required int answerId,
    @JsonKey(name: 'CommentId') required int commentId,
    @JsonKey(name: 'AuditId') int? auditId,
    @JsonKey(name: 'QuestionId') int? questionId,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CreateDT') String? createDT,
    @Default(-1) @JsonKey(name: 'RejectId') int? rejectId,
  }) = _AuditQuestionComment;

  factory AuditQuestionComment.fromJson(Map<String, dynamic> json) => _$AuditQuestionCommentFromJson(json);
}
