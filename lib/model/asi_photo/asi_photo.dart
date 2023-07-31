import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/asi_register_photo_payload/asi_register_photo_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'asi_photo.freezed.dart';
part 'asi_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AsiPhoto with _$AsiPhoto {
  const factory AsiPhoto({
    @JsonKey(name: 'AsiRegisterPhotoId') int? asiRegisterPhotoId,
    @JsonKey(name: 'AsiRegisterPhotoNo') String? asiRegisterPhotoNo,
    @JsonKey(name: 'AsiRegisterId') String? asiRegisterId,
    @JsonKey(name: 'AsiRegisterNo') String? asiRegisterNo,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
  }) = _AsiPhoto;

  const AsiPhoto._();

  factory AsiPhoto.fromJson(Map<String, dynamic> json) =>
      _$AsiPhotoFromJson(json);

  @override
  Id get id => int.tryParse(asiRegisterPhotoNo ?? '') ?? Isar.autoIncrement;
}

extension AsiPhotoX on AsiPhoto {
  AsiRegisterPhotoPayLoad toPayLoad() {
    return AsiRegisterPhotoPayLoad(
      AsiRegisterPhotoId: asiRegisterPhotoId,
      AsiRegisterPhotoNo: asiRegisterPhotoNo,
      AsiRegisterId: asiRegisterId,
      AsiRegisterNo: asiRegisterNo,
      Photo: photo,
      PhotoURL: photoURL,
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
    );
  }
}
