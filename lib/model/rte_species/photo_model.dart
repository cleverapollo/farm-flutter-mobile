import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'photo_model.freezed.dart';

part 'photo_model.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    @JsonKey(name: 'PhotoId') int? photoId,
    @JsonKey(name: 'PhotoName') String? photoName,
    @JsonKey(name: 'PhotoPath') String? photoPath,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _PhotoModel;

  const PhotoModel._();

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  @override
  Id get id => photoId ?? Isar.autoIncrement;
}
