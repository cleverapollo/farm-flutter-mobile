import 'package:freezed_annotation/freezed_annotation.dart';

part 'asi_register_photo_payload.freezed.dart';
part 'asi_register_photo_payload.g.dart';

@freezed
class AsiRegisterPhotoPayLoad with _$AsiRegisterPhotoPayLoad {
  const factory AsiRegisterPhotoPayLoad({
    num? AsiRegisterPhotoId,
    String? AsiRegisterPhotoNo,
    String? AsiRegisterId,
    String? AsiRegisterNo,
    String? Photo,
    String? PhotoURL,
    bool? IsActive,
    bool? IsMasterdataSynced,
  }) = _AsiRegisterPhotoPayLoad;
  factory AsiRegisterPhotoPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AsiRegisterPhotoPayLoadFromJson(json);
}
