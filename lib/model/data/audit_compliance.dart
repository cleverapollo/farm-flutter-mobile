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

  factory AuditCompliance.generateMockData() {
    return AuditCompliance(
      isActive: true,
      complianceId: 1,
      complianceName: 'compliance name',
      auditTemplateId: 0,
      hasRejectReason: true,
      regionalManagerUnitId: 1,
      rejectReasonId: 1,
    );
  }
}

extension AuditComplianceExtensions on AuditCompliance {
  AuditComplianceEnum get complianceEnum {
    switch (complianceId) {
      case 0:
        return AuditComplianceEnum.unknown;
      case 1:
        return AuditComplianceEnum.n;
      case 2:
        return AuditComplianceEnum.nc;
      case 3:
        return AuditComplianceEnum.na;
      default:
        return AuditComplianceEnum.unknown;
    }
  }

  int complianceType(AuditComplianceEnum type) {
    switch (type) {
      case AuditComplianceEnum.unknown:
        return 0;
      case AuditComplianceEnum.n:
        return 1;
      case AuditComplianceEnum.nc:
        return 2;
      case AuditComplianceEnum.na:
        return 3;
    }
  }
}
