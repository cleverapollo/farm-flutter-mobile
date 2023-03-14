// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compliance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Compliance _$$_ComplianceFromJson(Map<String, dynamic> json) =>
    _$_Compliance(
      complianceId: json['ComplianceId'] as int?,
      complianceName: json['ComplianceName'] as String?,
      companyId: json['CompanyId'] as int?,
      hasRejectReason: json['HasRejectReason'] as bool?,
      jobCategoryId: json['JobCategoryId'] as bool?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ComplianceToJson(_$_Compliance instance) =>
    <String, dynamic>{
      'ComplianceId': instance.complianceId,
      'ComplianceName': instance.complianceName,
      'CompanyId': instance.companyId,
      'HasRejectReason': instance.hasRejectReason,
      'JobCategoryId': instance.jobCategoryId,
      'IsActive': instance.isActive,
    };
