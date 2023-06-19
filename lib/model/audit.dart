import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'audit.freezed.dart';

part 'audit.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Audit with _$Audit {
  const factory Audit({
    @JsonKey(name: 'AssessmentId') required int? assessmentId,
    @JsonKey(name: 'PrincipleId') required int? principleId,
    @JsonKey(name: 'IndicatorId') required int? indicatorId,
    @JsonKey(name: 'AuditId') required int? auditId,
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
    @JsonKey(name: 'Location') required String? location,
    @JsonKey(name: 'SignaturePoints') required String? signaturePoints,
    @JsonKey(name: 'SignatureImage') required String? signatureImage,
    @JsonKey(name: 'HasSignature') required String? hasSignature,
    @JsonKey(name: 'SignatureDate') required String? signatureDate,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @Default(false) @JsonKey(name: 'Completed') bool completed,
    @Default(false) @JsonKey(name: 'Synced') bool synced,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _Audit;

  const Audit._();

  factory Audit.fromJson(Map<String, dynamic> json) => _$AuditFromJson(json);

  @override
  Id get id => auditId ?? Isar.autoIncrement;
}
