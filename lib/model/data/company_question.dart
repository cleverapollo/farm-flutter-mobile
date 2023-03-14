import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_question.freezed.dart';
part 'company_question.g.dart';

@freezed
class CompanyQuestion with _$CompanyQuestion {
  const factory CompanyQuestion({
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'JobCategoryId') int? jobCategoryId,
    @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
    @JsonKey(name: 'CompanyQuestionId') int? companyQuestionId,
    @JsonKey(name: 'CompanyQuestionValue') String? companyQuestionValue,
    @JsonKey(name: 'JobElementId') int? jobElementId,
    @JsonKey(name: 'JobElementName') String? jobElementName,
    @JsonKey(name: 'PDCAId') int? pdcaId,
    @JsonKey(name: 'PDCAName') String? pdcaName,
    @JsonKey(name: 'SPEQSId') int? speqsId,
    @JsonKey(name: 'SPEQSName') String? speqsName,
    @JsonKey(name: 'ImpactOnId') int? impactOnId,
    @JsonKey(name: 'ImpactOnName') String? impactOnName,
    @JsonKey(name: 'ImpactCausedId') int? impactCausedId,
    @JsonKey(name: 'ImpactCausedName') String? impactCausedName,
    @JsonKey(name: 'SeverityId') int? severityId,
    @JsonKey(name: 'XBone') bool? xBone,
    @JsonKey(name: 'MMMId') int? mmmId,
    @JsonKey(name: 'MMMName') String? mmmName,
    @JsonKey(name: 'ComplianceName') String? complianceName,
    @JsonKey(name: 'ComplianceId') int? complianceId,
    @JsonKey(name: 'IsCompanyQuestionComplete') bool? isCompanyQuestionComplete,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _CompanyQuestion;

  factory CompanyQuestion.fromJson(Map<String, dynamic> json) => _$CompanyQuestionFromJson(json);
}
