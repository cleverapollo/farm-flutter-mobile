import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_photo_pay_load.freezed.dart';
part 'question_photo_pay_load.g.dart';

@freezed
class QuestionPhotoPayLoad with _$QuestionPhotoPayLoad {
  const factory QuestionPhotoPayLoad({
    required int? PhotoId,
    required int? AssessmentId,
    required int? QuestionId,
    required String? PhotoPath,
  }) = _QuestionPhotoPayLoad;

  factory QuestionPhotoPayLoad.fromJson(Map<String, dynamic> json) =>
      _$QuestionPhotoPayLoadFromJson(json);
}
