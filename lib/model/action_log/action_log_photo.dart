import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'action_log_photo.freezed.dart';
part 'action_log_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ActionLogPhoto with _$ActionLogPhoto {
  const factory ActionLogPhoto({
    @JsonKey(name: 'Id') int? actionLogPhotoId,
    @JsonKey(name: 'ActionLogId') int? actionLogId,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterdataSynced') bool isMasterdataSynced,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _ActionLogPhoto;

  const ActionLogPhoto._();

  factory ActionLogPhoto.fromJson(Map<String, dynamic> json) =>
      _$ActionLogPhotoFromJson(json);

  Id get id => actionLogPhotoId ?? Isar.autoIncrement;
}
