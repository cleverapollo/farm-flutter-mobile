import 'package:cmo/enum/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit_compliance.freezed.dart';

part 'audit_compliance.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AuditCompliance with _$AuditCompliance {
  const AuditCompliance._();

  @override
  Id get id => complianceId ?? Isar.autoIncrement;

  factory AuditCompliance.fromJson(Map<String, dynamic> json) => _$AuditComplianceFromJson(json);

  const factory AuditCompliance({
    @JsonKey(name: 'ComplianceName') String? complianceName,
    @JsonKey(name: 'ComplianceId') int? complianceId,
    @JsonKey(name: 'HasRejectReason') bool? hasRejectReason,
    @JsonKey(name: 'RegionalManagerUnitId') int? regionalManagerUnitId,
    @JsonKey(name: 'AuditTemplateId') int? auditTemplateId,
    @JsonKey(name: 'RejectReasonId') int? rejectReasonId,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
  }) = _AuditCompliance;
}
