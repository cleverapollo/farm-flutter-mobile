import 'package:cmo/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit_question_photo.freezed.dart';
part 'audit_question_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AuditQuestionPhoto with _$AuditQuestionPhoto {
  const factory AuditQuestionPhoto({
    @JsonKey(name: 'PhotoId') required int? photoId,
    @JsonKey(name: 'AuditId') required int? auditId,
    @JsonKey(name: 'QuestionId') required int? questionId,
    @JsonKey(name: 'PhotoPath') required String? photoPath,
    @JsonKey(name: 'PhotoName') required String? photoName,
  }) = _AuditQuestionPhoto;

  factory AuditQuestionPhoto.fromJson(Map<String, dynamic> json) =>
      _$AuditQuestionPhotoFromJson(json);
  const AuditQuestionPhoto._();

  @override
  Id get id => fastHash(photoId.toString());
}
