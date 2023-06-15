import 'package:cmo/model/data/question_comment.dart';
import 'package:cmo/model/data/question_photo.dart';
import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment_question_answers.freezed.dart';
part 'assessment_question_answers.g.dart';

@freezed
class AssessmentQuestionAnswers with _$AssessmentQuestionAnswers {
  const factory AssessmentQuestionAnswers({
    @Default([]) List<QuestionAnswer> questionAnswer,
    @Default([]) List<QuestionComment> questionComment,
    @Default([]) List<QuestionPhoto> questionPhoto,
  }) = _AssessmentQuestionAnswers;

  factory AssessmentQuestionAnswers.fromJson(Map<String, dynamic> json) =>
      _$AssessmentQuestionAnswersFromJson(json);
}
