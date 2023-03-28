// ignore_for_file: invalid_annotation_target, override_on_non_overriding_member, avoid_js_rounded_ints

import 'package:cmo/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'question_photo.freezed.dart';
part 'question_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class QuestionPhoto with _$QuestionPhoto {
  const factory QuestionPhoto({
    @JsonKey(name: 'PhotoId') required int? photoId,
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'QuestionId') required int? questionId,
    @JsonKey(name: 'PhotoPath') required String? photoPath,
  }) = _QuestionPhoto;

  factory QuestionPhoto.fromJson(Map<String, dynamic> json) =>
      _$QuestionPhotoFromJson(json);
  const QuestionPhoto._();

  @override
  Id get id => fastHash(photoPath.toString());
}
