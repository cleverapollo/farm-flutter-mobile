import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rte_species_photo_model.freezed.dart';

part 'rte_species_photo_model.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RteSpeciesPhotoModel with _$RteSpeciesPhotoModel {
  const factory RteSpeciesPhotoModel({
    @JsonKey(name: 'RteSpeciesId') int? rteSpeciesId,
    @JsonKey(name: 'PhotoId') int? photoId,
    @JsonKey(name: 'PhotoName') String? photoName,
    @JsonKey(name: 'PhotoPath') String? photoPath,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _RteSpeciesPhotoModel;

  const RteSpeciesPhotoModel._();

  factory RteSpeciesPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$RteSpeciesPhotoModelFromJson(json);

  @override
  Id get id => photoId ?? Isar.autoIncrement;
}
