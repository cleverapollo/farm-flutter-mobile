import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit.freezed.dart';
part 'audit.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Audit with _$Audit {
  const factory Audit({
    @JsonKey(name: 'AuditId') required int? auditId,
    @JsonKey(name: 'CreateTime') DateTime? createTime,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'SiteName') String? siteName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _Audit;

  const Audit._();

  factory Audit.fromJson(Map<String, dynamic> json) =>
      _$AuditFromJson(json);

  @override
  Id get id => auditId ?? Isar.autoIncrement;
}