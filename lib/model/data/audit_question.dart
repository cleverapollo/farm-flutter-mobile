import 'dart:math';

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
    @JsonKey(name: 'RegionalManagerUnitId') required int regionalManagerUnitId,
    @JsonKey(name: 'AuditTemplateId') required int auditTemplateId,
    @JsonKey(name: 'QuestionId') int? questionId,
    @JsonKey(name: 'QuestionValue') String? questionValue,
    @JsonKey(name: 'PrincipleId') int? principleId,
    @JsonKey(name: 'IndicatorId') int? indicatorId,
    @JsonKey(name: 'CarId') int? carId,
    @JsonKey(name: 'CriteriaId') int? criteriaId,
    @JsonKey(name: 'CriteriaName') String? criteriaName,
    @JsonKey(name: 'CarName') String? carName,
    @JsonKey(name: 'PrincipleName') String? principleName,
    @JsonKey(name: 'IndicatorName') String? indicatorName,
    @JsonKey(name: 'SeverityId') int? severityId,
    @JsonKey(name: 'ImpactOnId') int? impactOnId,
    @JsonKey(name: 'ImpactOnName') String? impactOnName,
    @JsonKey(name: 'ImpactCausedName') String? impactCausedName,
    @JsonKey(name: 'ImpactCausedId') int? impactCausedId,
    @JsonKey(name: 'XBone') bool? xBone,
    @JsonKey(name: 'ComplianceName') String? complianceName,
    @JsonKey(name: 'ComplianceId') int? complianceId,
    @JsonKey(name: 'IsQuestionComplete') int? isQuestionComplete,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _AuditQuestion;

  factory AuditQuestion.fromJson(Map<String, dynamic> json) => _$AuditQuestionFromJson(json);

  factory AuditQuestion.generateMockData() {
    final ids = <int>[1,2,3,4];
    final randomQuestionId = ids[Random().nextInt(ids.length)];

    return AuditQuestion(
      auditId: DateTime.now().millisecondsSinceEpoch,
      auditTemplateId: DateTime.now().millisecondsSinceEpoch,
      questionId: randomQuestionId,
      regionalManagerUnitId: 1,
      severityId: 1,
      isActive: true,
      carId: 1,
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
      xBone: DateTime.now().millisecondsSinceEpoch % 2 == 0 ? true : false,
      questionValue: 'questionValue',
    );
  }
}
