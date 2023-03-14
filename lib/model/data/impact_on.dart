import 'package:freezed_annotation/freezed_annotation.dart';

part 'impact_on.freezed.dart';
part 'impact_on.g.dart';

@freezed
class ImpactOn with _$ImpactOn {
  const factory ImpactOn({
    @JsonKey(name: 'ImpactOnId') int? impactOnId,
    @JsonKey(name: 'ImpactOnName') String? impactOnName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _ImpactOn;

  factory ImpactOn.fromJson(Map<String, dynamic> json) => _$ImpactOnFromJson(json);
}
