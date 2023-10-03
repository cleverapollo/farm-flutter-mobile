import 'package:cmo/model/question_answer_pay_load/question_answer_pay_load.dart';
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
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
  }) = _QuestionAnswer;

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerFromJson(json);
  const QuestionAnswer._();

  @override
  Id get id => questionAnswerId ?? Isar.autoIncrement;
}

extension QuestionAnswerPayLoadExtension on QuestionAnswer {
  QuestionAnswerPayLoad toPayLoad() {
    return QuestionAnswerPayLoad(
        AssessmentId: assessmentId,
        QuestionId: questionId,
        ComplianceId: complianceId,
        RejectReasonId: rejectReasonId,
        RejectComment: rejectComment,
        IsQuestionComplete: isQuestionComplete);
  }
}
