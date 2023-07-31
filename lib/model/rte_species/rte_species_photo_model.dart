import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/rte_species_register_photo_payload/rte_species_register_photo_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rte_species_photo_model.freezed.dart';
part 'rte_species_photo_model.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RteSpeciesPhotoModel with _$RteSpeciesPhotoModel {
  const factory RteSpeciesPhotoModel({
    @JsonKey(name: 'RteSpeciesId') String? rteSpeciesId,
    @JsonKey(name: 'RteSpeciesNo') String? rteSpeciesNo,
    @JsonKey(name: 'PhotoId') int? photoId,
    @JsonKey(name: 'PhotoName') String? photoName,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'PhotoPath') String? photoPath,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true)
    @JsonKey(name: 'IsMasterdataSynced')
        bool? isMasterdataSynced,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'RteSpeciesRegisterPhotoId') int? rteSpeciesRegisterPhotoId,
    @JsonKey(name: 'RteSpeciesRegisterPhotoNo')
        String? rteSpeciesRegisterPhotoNo,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'PhotoURL') String? photoURL,
  }) = _RteSpeciesPhotoModel;

  const RteSpeciesPhotoModel._();

  factory RteSpeciesPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesPhotoModelFromJson(json);

  @override
  Id get id => int.tryParse(rteSpeciesNo ?? '') ?? Isar.autoIncrement;
}

extension RteSpeciesPhotoModelX on RteSpeciesPhotoModel {
  RteSpeciesRegisterPhotoPayLoad toPayLoad() {
    return RteSpeciesRegisterPhotoPayLoad(
      RteSpeciesRegisterId: rteSpeciesId,
      RteSpeciesRegisterNo: rteSpeciesNo,
      RteSpeciesRegisterPhotoId: rteSpeciesRegisterPhotoId,
      RteSpeciesRegisterPhotoNo: rteSpeciesRegisterPhotoNo,
      Photo: photo,
      PhotoURL: photoURL,
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
    );
  }
}
