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
    @JsonKey(name: 'PhotoPath') String? photoPath,
  }) = _QuestionPhoto;

  factory QuestionPhoto.fromJson(Map<String, dynamic> json) =>
      _$QuestionPhotoFromJson(json);
  const QuestionPhoto._();

  @override
  Id get id => photoId ?? Isar.autoIncrement;
}

extension QuestionPhotoExtension on QuestionPhoto {
  QuestionPhotoPayLoad toPayLoad() {
    return QuestionPhotoPayLoad(
      PhotoId: photoId,
      AssessmentId: assessmentId,
      QuestionId: questionId,
      Photo: photo,
      NormalisedPhotoURL: normalisedPhotoURL,
      PhotoURL: photoURL,
    );
  }

  QuestionPhotoPayloadWithBase64 toPayLoadWithBase64() {
    return QuestionPhotoPayloadWithBase64(
      photoId: photoId,
      assessmentId: assessmentId,
      questionId: questionId,
      photo: 'data:image/jpeg;base64,$photo',
      normalisedPhotoURL: normalisedPhotoURL,
      photoURL: photoURL,
    );
  }
}

@freezed
class QuestionPhotoPayloadWithBase64 with _$QuestionPhotoPayloadWithBase64 {
  const factory QuestionPhotoPayloadWithBase64({
    @JsonKey(name: 'PhotoId') required int? photoId,
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'QuestionId') required int? questionId,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'NormalisedPhotoURL') String? normalisedPhotoURL,
    @JsonKey(name: 'Photo') required String? photo,
  }) = _QuestionPhotoPayloadWithBase64;

  factory QuestionPhotoPayloadWithBase64.fromJson(Map<String, dynamic> json) =>
      _$QuestionPhotoPayloadWithBase64FromJson(json);
  const QuestionPhotoPayloadWithBase64._();

  @override
  Id get id => photoId ?? Isar.autoIncrement;
}
