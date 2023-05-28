import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'asi_type.freezed.dart';

part 'asi_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AsiType with _$AsiType {
  const factory AsiType({
    @JsonKey(name: 'AsiTypeId') int? asiTypeId,
    @JsonKey(name: 'AsiTypeName') String? asiTypeName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _AsiType;

  const AsiType._();

  factory AsiType.fromJson(Map<String, dynamic> json) =>
      _$AsiTypeFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
