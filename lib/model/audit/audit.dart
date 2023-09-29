import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit.freezed.dart';

part 'audit.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Audit with _$Audit {
  const factory Audit({
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'PrincipleId') int? principleId,
    @JsonKey(name: 'IndicatorId') int? indicatorId,
    @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
    @JsonKey(name: 'AuditTemplateId') int? auditTemplateId,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'CompartmentId') String? compartmentId,
    @JsonKey(name: 'FarmName') String? farmName,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'Created') String? created,
    @JsonKey(name: 'Lat') double? lat,
    @JsonKey(name: 'Lng') double? lng,
    @JsonKey(name: 'UserId') int? userId,
    @JsonKey(name: 'Location') String? location,
    @JsonKey(name: 'SignaturePoints') String? signaturePoints,
    @JsonKey(name: 'SignatureImage') String? signatureImage,
    @JsonKey(name: 'HasSignature') String? hasSignature,
    @JsonKey(name: 'SignatureDate') String? signatureDate,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(false) @JsonKey(name: 'Completed') bool completed,
    @Default(false) @JsonKey(name: 'Synced') bool synced,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'Note') String? note,
  }) = _Audit;

  const Audit._();

  factory Audit.fromJson(Map<String, dynamic> json) => _$AuditFromJson(json);

  @override
  Id get id => assessmentId ?? Isar.autoIncrement;
}
