import 'package:freezed_annotation/freezed_annotation.dart';

part 'impact_caused.freezed.dart';
part 'impact_caused.g.dart';

@freezed
class ImpactCaused with _$ImpactCaused {
  const factory ImpactCaused({
    @JsonKey(name: 'ImpactCausedId') int? impactCausedId,
    @JsonKey(name: 'ImpactCausedName') String? impactCausedName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _ImpactCaused;

  factory ImpactCaused.fromJson(Map<String, dynamic> json) => _$ImpactCausedFromJson(json);
}
