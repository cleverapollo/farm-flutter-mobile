import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit.freezed.dart';
part 'audit.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Audit with _$Audit {
  const factory Audit({
    @JsonKey(name: 'AuditId') required int? auditId,
    @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
    @JsonKey(name: 'AuditTemplateId') int? auditTemplateId,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'CompartmentId') int? compartmentId,
    @JsonKey(name: 'SiteName') String? siteName,
    @JsonKey(name: 'SiteId') int? siteId,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(false)
    @JsonKey(name: 'Completed') bool completed,
    @Default(false)
    @JsonKey(name: 'Synced') bool synced,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true)
    @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _Audit;

  const Audit._();

  factory Audit.fromJson(Map<String, dynamic> json) =>
      _$AuditFromJson(json);

  @override
  Id get id => auditId ?? Isar.autoIncrement;
}
