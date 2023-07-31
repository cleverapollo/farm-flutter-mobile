import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_photo_pay_load.freezed.dart';
part 'question_photo_pay_load.g.dart';

@freezed
class QuestionPhotoPayLoad with _$QuestionPhotoPayLoad {
  const factory QuestionPhotoPayLoad({
    int? PhotoId,
    int? AssessmentId,
    int? QuestionId,
    String? Photo,
    String? NormalisedPhotoURL,
    String? PhotoURL,
  }) = _QuestionPhotoPayLoad;

  factory QuestionPhotoPayLoad.fromJson(Map<String, dynamic> json) =>
      _$QuestionPhotoPayLoadFromJson(json);
}
