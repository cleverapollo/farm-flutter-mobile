// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_question.freezed.dart';

part 'farm_question.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmQuestion with _$FarmQuestion {
  const factory FarmQuestion({
    @JsonKey(name: 'RegionalManagerUnitId') int? regionalManagerUnitId,
    @JsonKey(name: 'AuditTemplateId') int? auditTemplateId,
    @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
    @JsonKey(name: 'QuestionId') required int questionId,
    @JsonKey(name: 'QuestionValue') String? questionValue,
    @JsonKey(name: 'PrincipleId') int? principleId,
    @JsonKey(name: 'PrincipleName') String? principleName,
    @JsonKey(name: 'ImpactOnId') int? impactOnId,
    @JsonKey(name: 'ImpactOnName') String? impactOnName,
    @JsonKey(name: 'ImpactCausedId') int? impactCausedId,
    @JsonKey(name: 'ImpactCausedName') String? impactCausedName,
    @JsonKey(name: 'CriteriaId') int? criteriaId,
    @JsonKey(name: 'CriteriaName') String? criteriaName,
    @JsonKey(name: 'SeverityId') int? severityId,
    @JsonKey(name: 'XBone') bool? xBone,
    @JsonKey(name: 'MMMId') int? mmmId,
    @JsonKey(name: 'MMMName') String? mmmName,
    @JsonKey(name: 'ComplianceName') String? complianceName,
    @JsonKey(name: 'ComplianceId') int? complianceId,
    @JsonKey(name: 'IsQuestionComplete') int? isQuestionComplete,
    @JsonKey(name: 'IndicatorId') int? indicatorId,
    @JsonKey(name: 'IndicatorName') String? indicatorName,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _FarmQuestion;

  const FarmQuestion._();

  factory FarmQuestion.fromJson(Map<String, dynamic> json) =>
      _$FarmQuestionFromJson(json);

  @override
  Id get id => questionId;
}
