import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'fire_register_photo.freezed.dart';
part 'fire_register_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FireRegisterPhoto with _$FireRegisterPhoto {
  const factory FireRegisterPhoto({
    @JsonKey(name: 'FireRegisterPhotoId') int? fireRegisterPhotoId,
    @JsonKey(name: 'FireRegisterPhotoNo') String? fireRegisterPhotoNo,
    @JsonKey(name: 'FireRegisterNo') String? fireRegisterNo,
    @JsonKey(name: 'FireRegisterId') String? fireRegisterId,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _FireRegisterPhoto;

  const FireRegisterPhoto._();

  factory FireRegisterPhoto.fromJson(Map<String, dynamic> json) =>
      _$FireRegisterPhotoFromJson(json);

  Id get id =>
      int.tryParse(fireRegisterPhotoNo ?? '') ?? Isar.autoIncrement;
}
