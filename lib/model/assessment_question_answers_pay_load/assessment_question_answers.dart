import 'package:cmo/model/question_answer_pay_load/question_answer_pay_load.dart';
import 'package:cmo/model/question_comment_pay_load/question_comment_pay_load.dart';
import 'package:cmo/model/question_photo_pay_load/question_photo_pay_load.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_question_answers.freezed.dart';
part 'assessment_question_answers.g.dart';

@freezed
class AssessmentQuestionAnswersPayLoad with _$AssessmentQuestionAnswersPayLoad {
  const factory AssessmentQuestionAnswersPayLoad({
    @Default([]) List<QuestionAnswerPayLoad> QuestionAnswer,
    @Default([]) List<QuestionCommentPayLoad> QuestionComment,
    @Default([]) List<QuestionPhotoPayLoad> QuestionPhoto,
  }) = _AssessmentQuestionAnswersPayLoad;

  factory AssessmentQuestionAnswersPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$AssessmentQuestionAnswersPayLoadFromJson(json);
}
