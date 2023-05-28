import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'fire_cause.freezed.dart';

part 'fire_cause.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FireCause with _$FireCause {
  const factory FireCause({
    @JsonKey(name: 'FireCauseId') int? fireCauseId,
    @JsonKey(name: 'FireCauseName') String? fireCauseName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _FireCause;

  const FireCause._();

  factory FireCause.fromJson(Map<String, dynamic> json) =>
      _$FireCauseFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
