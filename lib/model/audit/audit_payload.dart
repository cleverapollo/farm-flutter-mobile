import 'package:freezed_annotation/freezed_annotation.dart';

import '../model.dart';

part 'audit_payload.freezed.dart';

part 'audit_payload.g.dart';

@freezed
class AuditPayload with _$AuditPayload {
  const factory AuditPayload({
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'IndicatorId') int? indicatorId,
    @JsonKey(name: 'PrincipleId') int? principleId,
    @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
    @JsonKey(name: 'AuditTemplateId') int? auditTemplateId,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'CompartmentId') int? compartmentId,
    @JsonKey(name: 'FarmName') String? farmName,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'Created') String? created,
    @JsonKey(name: 'Lat') required double? lat,
    @JsonKey(name: 'Lng') required double? lng,
    @JsonKey(name: 'UserId') required int? userId,
    @JsonKey(name: 'UserDeviceId') required int? userDeviceId,
    @JsonKey(name: 'Location') required String? location,
    @JsonKey(name: 'SignaturePoints') required String? signaturePoints,
    @JsonKey(name: 'SignatureImage') required String? signatureImage,
    @JsonKey(name: 'HasSignature') required String? hasSignature,
    @JsonKey(name: 'SignatureDate') required String? signatureDate,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @JsonKey(name: 'AuditQuestionAnswers') AuditQuestionAnswers? auditQuestionAnswers,
    @Default(false) @JsonKey(name: 'Completed') bool completed,
    @Default(false) @JsonKey(name: 'Synced') bool synced,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _AuditPayload;

  const AuditPayload._();

  factory AuditPayload.fromJson(Map<String, dynamic> json) =>
      _$AuditPayloadFromJson(json);

  factory AuditPayload.fromAudit(Audit audit) {
    return AuditPayload(
      assessmentId: audit.assessmentId,
      farmId: audit.farmId,
      auditTemplateId: audit.auditTemplateId,
      location: audit.location,
      created: audit.created,
      lat: audit.lat,
      lng: audit.lng,
      userId: audit.userId,
      signaturePoints: audit.signaturePoints,
      signatureImage: audit.signatureImage,
      signatureDate: audit.signatureDate,
      hasSignature: audit.hasSignature,
      userDeviceId: null,
      auditQuestionAnswers: const AuditQuestionAnswers(),
    );
  }
}

@freezed
class AuditQuestionAnswers with _$AuditQuestionAnswers {
  const factory AuditQuestionAnswers({
    @Default(<QuestionAnswer>[]) @JsonKey(name: 'QuestionAnswer') List<QuestionAnswer> questionAnswer,
    @Default(<QuestionComment>[]) @JsonKey(name: 'QuestionComment') List<QuestionComment> questionComment,
    @Default(<QuestionPhoto>[]) @JsonKey(name: 'QuestionPhoto') List<QuestionPhoto> questionPhoto,
  }) = _AuditQuestionAnswers;

  const AuditQuestionAnswers._();

  factory AuditQuestionAnswers.fromJson(Map<String, dynamic> json) =>
      _$AuditQuestionAnswersFromJson(json);
}
