import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdca.freezed.dart';
part 'pdca.g.dart';

@freezed
class Pdca with _$Pdca {
  const factory Pdca({
    @JsonKey(name: 'PDCAId') int? pdcaId,
    @JsonKey(name: 'PDCAName') String? pdcaName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Pdca;

  factory Pdca.fromJson(Map<String, dynamic> json) => _$PdcaFromJson(json);
}
