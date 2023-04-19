import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit_question.freezed.dart';

part 'audit_question.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AuditQuestion with _$AuditQuestion {
  const AuditQuestion._();

  @override
  Id get id => questionId ?? Isar.autoIncrement;

  const factory AuditQuestion({
    @JsonKey(name: 'AuditId') required int auditId,
    @JsonKey(name: 'QuestionId') int? questionId,
    @JsonKey(name: 'QuestionValue') String? questionValue,
    @JsonKey(name: 'PrincipleId') int? principleId,
    @JsonKey(name: 'PrincipleName') String? principleName,
    @JsonKey(name: 'IndicatorId') int? indicatorId,
    @JsonKey(name: 'IndicatorName') String? indicatorName,
    @JsonKey(name: 'CarId') int? carId,
    @JsonKey(name: 'CarName') String? carName,
    @JsonKey(name: 'CriteriaId') int? criteriaId,
    @JsonKey(name: 'CriteriaName') String? criteriaName,
    @JsonKey(name: 'JobCategoryId') int? jobCategoryId,
    @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
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
    @JsonKey(name: 'IsQuestionComplete') int? isQuestionComplete,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _AuditQuestion;

  factory AuditQuestion.fromJson(Map<String, dynamic> json) => _$AuditQuestionFromJson(json);

  factory AuditQuestion.generateMockData() {
    return AuditQuestion(
      auditId: DateTime.now().millisecondsSinceEpoch,
      isActive: true,
      carId: -1,
      carName: 'car name',
      complianceId: -1,
      complianceName: 'compliance name',
      criteriaId: -1,
      criteriaName: 'criteria name',
      impactCausedId: 0,
      impactCausedName: 'impactCausedName',
      impactOnId: 0,
      impactOnName: 'impactOnName',
      indicatorId: -1,
      indicatorName: 'indicator Name',
      isQuestionComplete: 1,
      principleId: -1,
      principleName: 'principleName',
      questionId: DateTime.now().millisecondsSinceEpoch,
      xBone: DateTime.now().millisecondsSinceEpoch % 2 == 0 ? true : false,
      questionValue: 'questionValue',
    );
  }
}
