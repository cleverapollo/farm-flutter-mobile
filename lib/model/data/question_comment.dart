// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'question_comment.freezed.dart';
part 'question_comment.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class QuestionComment with _$QuestionComment {
  const factory QuestionComment({
    @JsonKey(name: 'CommentId') required int commentId,
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'QuestionId') required int? questionId,
    @JsonKey(name: 'Comment') required String? comment,
  }) = _QuestionComment;

  factory QuestionComment.fromJson(Map<String, dynamic> json) =>
      _$QuestionCommentFromJson(json);
  const QuestionComment._();

  @override
  Id get id => commentId ?? Isar.autoIncrement;
}
