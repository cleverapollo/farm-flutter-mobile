import 'package:freezed_annotation/freezed_annotation.dart';

import '../model.dart';

part 'audit_payload.freezed.dart';

part 'audit_payload.g.dart';

@freezed
class AuditPayload with _$AuditPayload {
  const factory AuditPayload({
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'IndicatorId') int? indicatorId,
    @Default(0) @JsonKey(name: 'PrincipleId') int? principleId,
    @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
    @JsonKey(name: 'AuditTemplateId') int? auditTemplateId,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'CompartmentId') int? compartmentId,
    @JsonKey(name: 'FarmName') String? farmName,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'Created') String? created,
    @Default(0) @JsonKey(name: 'Lat') double lat,
    @Default(0) @JsonKey(name: 'Lng') double lng,
    @JsonKey(name: 'UserId') required int? userId,
    @JsonKey(name: 'UserDeviceId') required int? userDeviceId,
    @JsonKey(name: 'Location') required String? location,
    @JsonKey(name: 'SignaturePoints') required String? signaturePoints,
    @JsonKey(name: 'SignatureImage') required String? signatureImage,
    @JsonKey(name: 'HasSignature') required String? hasSignature,
    @JsonKey(name: 'SignatureDate') required String? signatureDate,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @JsonKey(name: 'AssessmentQuestionAnswers') AssessmentQuestionAnswers? assessmentQuestionAnswers,
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
      lat: audit.lat ?? 0,
      lng: audit.lng ?? 0,
      userId: audit.userId,
      signaturePoints: audit.signaturePoints,
      signatureImage: audit.signatureImage,
      signatureDate: audit.signatureDate,
      hasSignature: audit.hasSignature,
      userDeviceId: null,
      assessmentQuestionAnswers: AssessmentQuestionAnswers(),
    );
  }
}

@freezed
class AssessmentQuestionAnswers with _$AssessmentQuestionAnswers {
  const factory AssessmentQuestionAnswers({
    @Default(<QuestionAnswer>[]) @JsonKey(name: 'QuestionAnswer') List<QuestionAnswer> questionAnswer,
    @Default(<QuestionComment>[]) @JsonKey(name: 'QuestionComment') List<QuestionComment> questionComment,
    @Default(<QuestionPhotoPayloadWithBase64>[]) @JsonKey(name: 'QuestionPhoto') List<QuestionPhotoPayloadWithBase64> questionPhoto,
  }) = _AssessmentQuestionAnswers;

  const AssessmentQuestionAnswers._();

  factory AssessmentQuestionAnswers.fromJson(Map<String, dynamic> json) =>
      _$AssessmentQuestionAnswersFromJson(json);
}
