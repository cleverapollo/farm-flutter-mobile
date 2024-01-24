import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rte_species_register_photo.freezed.dart';
part 'rte_species_register_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RteSpeciesRegisterPhoto with _$RteSpeciesRegisterPhoto {
  const factory RteSpeciesRegisterPhoto({
    @JsonKey(name: 'RteSpeciesRegisterPhotoId') int? rteSpeciesRegisterPhotoId,
    @JsonKey(name: 'RteSpeciesRegisterPhotoNo') String? rteSpeciesRegisterPhotoNo,
    @JsonKey(name: 'RteSpeciesRegisterId') String? rteSpeciesRegisterId,
    @JsonKey(name: 'RteSpeciesRegisterNo') String? rteSpeciesRegisterNo,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _RteSpeciesRegisterPhoto;

  const RteSpeciesRegisterPhoto._();

  factory RteSpeciesRegisterPhoto.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesRegisterPhotoFromJson(json);

  Id get id =>
      int.tryParse(rteSpeciesRegisterPhotoNo ?? '') ?? Isar.autoIncrement;
}
