import 'package:cmo/model/question_photo_pay_load/question_photo_pay_load.dart';
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
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'NormalisedPhotoURL') String? normalisedPhotoURL,
    @JsonKey(name: 'Photo') required String? photo,
  }) = _QuestionPhoto;

  factory QuestionPhoto.fromJson(Map<String, dynamic> json) =>
      _$QuestionPhotoFromJson(json);
  const QuestionPhoto._();

  @override
  Id get id => fastHash(photo.toString());
}

extension QuestionPhotoExtension on QuestionPhoto {
  QuestionPhotoPayLoad toPayLoad() {
    return QuestionPhotoPayLoad(
        PhotoId: photoId,
        AssessmentId: assessmentId,
        QuestionId: questionId,
        PhotoPath: photoPath);
  }
}
