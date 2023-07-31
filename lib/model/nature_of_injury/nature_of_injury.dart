import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'nature_of_injury.freezed.dart';
part 'nature_of_injury.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class NatureOfInjury with _$NatureOfInjury {
  const factory NatureOfInjury({
    @JsonKey(name: 'NatureOfInjuryId') int? natureOfInjuryId,
    @JsonKey(name: 'NatureOfInjuryName') String? natureOfInjuryName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _NatureOfInjury;

  const NatureOfInjury._();

  factory NatureOfInjury.fromJson(Map<String, dynamic> json) =>
      _$NatureOfInjuryFromJson(json);

  @override
  Id get id => natureOfInjuryId ?? Isar.autoIncrement;
}
