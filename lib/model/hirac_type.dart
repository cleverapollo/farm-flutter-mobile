import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'hirac_type.freezed.dart';

part 'hirac_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class HiracType with _$HiracType {
  const HiracType._();

  @override
  Id get id => hiracTypeId ?? 0;

  const factory HiracType({
    @JsonKey(name: 'HiracTypeId') int? hiracTypeId,
    @JsonKey(name: 'HiracTypeName') String? hiracTypeName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'UpdateDT') String? updateDt,
    @JsonKey(name: 'CreateDT') String? createDt,
  }) = _HiracType;

  factory HiracType.fromJson(Map<String, dynamic> json) =>
      _$HiracTypeFromJson(json);
}
