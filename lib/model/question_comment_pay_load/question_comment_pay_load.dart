import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_comment_pay_load.freezed.dart';
part 'question_comment_pay_load.g.dart';

@freezed
class QuestionCommentPayLoad with _$QuestionCommentPayLoad {
  const factory QuestionCommentPayLoad({
    required int CommentId,
    required int? AssessmentId,
    required int? QuestionId,
    required String? Comment,
  }) = _QuestionCommentPayLoad;

  factory QuestionCommentPayLoad.fromJson(Map<String, dynamic> json) =>
      _$QuestionCommentPayLoadFromJson(json);
}
