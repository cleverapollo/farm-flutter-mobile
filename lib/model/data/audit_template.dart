import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit_template.freezed.dart';

part 'audit_template.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AuditTemplate with _$AuditTemplate {
  const factory AuditTemplate({
    @JsonKey(name: 'AuditTemplateId') required int auditTemplateId,
    @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _AuditTemplate;

  factory AuditTemplate.fromJson(Map<String, dynamic> json) =>
      _$AuditTemplateFromJson(json);

  const AuditTemplate._();

  @override
  Id get id => auditTemplateId;
}
