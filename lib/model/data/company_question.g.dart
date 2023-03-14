// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyQuestion _$$_CompanyQuestionFromJson(Map<String, dynamic> json) =>
    _$_CompanyQuestion(
      companyId: json['CompanyId'] as int?,
      jobCategoryId: json['JobCategoryId'] as int?,
      jobCategoryName: json['JobCategoryName'] as String?,
      companyQuestionId: json['CompanyQuestionId'] as int?,
      companyQuestionValue: json['CompanyQuestionValue'] as String?,
      jobElementId: json['JobElementId'] as int?,
      jobElementName: json['JobElementName'] as String?,
      pdcaId: json['PDCAId'] as int?,
      pdcaName: json['PDCAName'] as String?,
      speqsId: json['SPEQSId'] as int?,
      speqsName: json['SPEQSName'] as String?,
      impactOnId: json['ImpactOnId'] as int?,
      impactOnName: json['ImpactOnName'] as String?,
      impactCausedId: json['ImpactCausedId'] as int?,
      impactCausedName: json['ImpactCausedName'] as String?,
      severityId: json['SeverityId'] as int?,
      xBone: json['XBone'] as bool?,
      mmmId: json['MMMId'] as int?,
      mmmName: json['MMMName'] as String?,
      complianceName: json['ComplianceName'] as String?,
      complianceId: json['ComplianceId'] as int?,
      isCompanyQuestionComplete: json['IsCompanyQuestionComplete'] as bool?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_CompanyQuestionToJson(_$_CompanyQuestion instance) =>
    <String, dynamic>{
      'CompanyId': instance.companyId,
      'JobCategoryId': instance.jobCategoryId,
      'JobCategoryName': instance.jobCategoryName,
      'CompanyQuestionId': instance.companyQuestionId,
      'CompanyQuestionValue': instance.companyQuestionValue,
      'JobElementId': instance.jobElementId,
      'JobElementName': instance.jobElementName,
      'PDCAId': instance.pdcaId,
      'PDCAName': instance.pdcaName,
      'SPEQSId': instance.speqsId,
      'SPEQSName': instance.speqsName,
      'ImpactOnId': instance.impactOnId,
      'ImpactOnName': instance.impactOnName,
      'ImpactCausedId': instance.impactCausedId,
      'ImpactCausedName': instance.impactCausedName,
      'SeverityId': instance.severityId,
      'XBone': instance.xBone,
      'MMMId': instance.mmmId,
      'MMMName': instance.mmmName,
      'ComplianceName': instance.complianceName,
      'ComplianceId': instance.complianceId,
      'IsCompanyQuestionComplete': instance.isCompanyQuestionComplete,
      'IsActive': instance.isActive,
    };
