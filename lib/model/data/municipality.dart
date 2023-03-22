import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'municipality.freezed.dart';
part 'municipality.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Municipality with _$Municipality {

  const factory Municipality({
    @JsonKey(name: 'MunicipalityId') required int municipalityId,
    @JsonKey(name: 'MunicipalityName') String? municipalityName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Municipality;

  factory Municipality.fromJson(Map<String, dynamic> json) =>
      _$MunicipalityFromJson(json);
  const Municipality._();

  @override
  Id get id => municipalityId;
}
