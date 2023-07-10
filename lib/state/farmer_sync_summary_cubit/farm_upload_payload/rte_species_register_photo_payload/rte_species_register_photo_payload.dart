import 'package:freezed_annotation/freezed_annotation.dart';

part 'rte_species_register_photo_payload.freezed.dart';
part 'rte_species_register_photo_payload.g.dart';

@freezed
class RteSpeciesRegisterPhotoPayLoad with _$RteSpeciesRegisterPhotoPayLoad {
  const factory RteSpeciesRegisterPhotoPayLoad({
    int? RteSpeciesRegisterPhotoId,
    String? RteSpeciesRegisterPhotoNo,
    String? RteSpeciesRegisterId,
    String? RteSpeciesRegisterNo,
    String? Photo,
    String? PhotoURL,
    bool? IsActive,
    bool? IsMasterdataSynced,
  }) = _RteSpeciesRegisterPhotoPayLoad;
  factory RteSpeciesRegisterPhotoPayLoad.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesRegisterPhotoPayLoadFromJson(json);
}
