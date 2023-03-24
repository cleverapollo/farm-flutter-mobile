// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'question_answer.freezed.dart';
part 'question_answer.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class QuestionAnswer with _$QuestionAnswer {
  const factory QuestionAnswer({
    @JsonKey(name: 'QuestionAnswerId') required int? questionAnswerId,
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'QuestionId') required int? questionId,
    @JsonKey(name: 'ComplianceId') required int? complianceId,
    @JsonKey(name: 'RejectReasonId') required int? rejectReasonId,
    @JsonKey(name: 'RejectComment') required String? rejectComment,
    @JsonKey(name: 'IsQuestionComplete') required int? isQuestionComplete,
  }) = _QuestionAnswer;

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerFromJson(json);
  const QuestionAnswer._();

  @override
  Id get id => questionAnswerId ?? Isar.autoIncrement;
}
