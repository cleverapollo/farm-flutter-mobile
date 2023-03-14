import 'package:freezed_annotation/freezed_annotation.dart';

part 'municipality.freezed.dart';
part 'municipality.g.dart';

@freezed
class Municipality with _$Municipality {
  const factory Municipality({
    @JsonKey(name: 'MunicipalityId') int? municipalityId,
    @JsonKey(name: 'MunicipalityName') String? municipalityName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Municipality;

  factory Municipality.fromJson(Map<String, dynamic> json) => _$MunicipalityFromJson(json);
}
