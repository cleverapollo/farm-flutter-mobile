import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'impact_caused.freezed.dart';
part 'impact_caused.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ImpactCaused with _$ImpactCaused {

  const factory ImpactCaused({
    @JsonKey(name: 'ImpactCausedId') required int impactCausedId,
    @JsonKey(name: 'ImpactCausedName') String? impactCausedName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _ImpactCaused;

  factory ImpactCaused.fromJson(Map<String, dynamic> json) =>
      _$ImpactCausedFromJson(json);
  const ImpactCaused._();

  @override
  Id get id => impactCausedId;
}
