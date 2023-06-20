import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_answer_pay_load.freezed.dart';
part 'question_answer_pay_load.g.dart';

@freezed
class QuestionAnswerPayLoad with _$QuestionAnswerPayLoad {
  const factory QuestionAnswerPayLoad({
    required int? AssessmentId,
    required int? QuestionId,
    required int? ComplianceId,
    required int? RejectReasonId,
    required String? RejectComment,
    required int? IsQuestionComplete,
  }) = _QuestionAnswerPayLoad;

  factory QuestionAnswerPayLoad.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerPayLoadFromJson(json);
}
