import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'asi_photo.freezed.dart';
part 'asi_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AsiPhoto with _$AsiPhoto {
  const factory AsiPhoto({
    @JsonKey(name: 'AsiRegisterLocalId') int? asiRegisterLocalId,
    @JsonKey(name: 'AsiRegisterPhotoId') int? asiRegisterPhotoId,
    @JsonKey(name: 'AsiRegisterPhotoNo') String? asiRegisterPhotoNo,
    @JsonKey(name: 'AsiRegisterId') String? asiRegisterId,
    @JsonKey(name: 'AsiRegisterNo') String? asiRegisterNo,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false) @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _AsiPhoto;

  const AsiPhoto._();

  factory AsiPhoto.fromJson(Map<String, dynamic> json) =>
      _$AsiPhotoFromJson(json);

  Id get id => int.tryParse(asiRegisterPhotoNo ?? '') ?? Isar.autoIncrement;
}
