import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'accident_and_incident_photo.freezed.dart';
part 'accident_and_incident_photo.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AccidentAndIncidentPhoto with _$AccidentAndIncidentPhoto {
  const factory AccidentAndIncidentPhoto({
    @JsonKey(name: 'AccidentAndIncidentRegisterPhotoId') int? accidentAndIncidentRegisterPhotoId,
    @JsonKey(name: 'AccidentAndIncidentRegisterPhotoNo') String? accidentAndIncidentRegisterPhotoNo,
    @JsonKey(name: 'AccidentAndIncidentRegisterId') String? accidentAndIncidentRegisterId,
    @JsonKey(name: 'AccidentAndIncidentRegisterNo') String? accidentAndIncidentRegisterNo,
    @JsonKey(name: 'Photo') String? photo,
    @JsonKey(name: 'PhotoURL') String? photoURL,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false)
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _AccidentAndIncidentPhoto;

  const AccidentAndIncidentPhoto._();

  factory AccidentAndIncidentPhoto.fromJson(Map<String, dynamic> json) =>
      _$AccidentAndIncidentPhotoFromJson(json);

  Id get id =>
      int.tryParse(accidentAndIncidentRegisterPhotoNo ?? '') ?? Isar.autoIncrement;
}
