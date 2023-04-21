import 'package:cmo/enum/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit_question_answer.freezed.dart';

part 'audit_question_answer.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AuditQuestionAnswer with _$AuditQuestionAnswer {
  const AuditQuestionAnswer._();

  @override
  Id get id => answerId ?? Isar.autoIncrement;

  const factory AuditQuestionAnswer({
    @JsonKey(name: 'AnswerId') int? answerId,
    @JsonKey(name: 'AuditId') int? auditId,
    @JsonKey(name: 'QuestionId') int? questionId,
    @JsonKey(name: 'ComplianceId') int? complianceId,
    @JsonKey(name: 'RejectReasonId') int? rejectReasonId,
    @Default(false)
    @JsonKey(name: 'HaveComment') bool? haveComment,
    @Default(false)
    @JsonKey(name: 'HavePhoto') bool? havePhoto,
    @Default(true)
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _AuditQuestionAnswer;

  factory AuditQuestionAnswer.fromJson(Map<String, dynamic> json) => _$AuditQuestionAnswerFromJson(json);
}

extension AuditQuestionAnswerExtension on AuditQuestionAnswer {
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
}
