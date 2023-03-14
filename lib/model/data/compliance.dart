import 'package:freezed_annotation/freezed_annotation.dart';

part 'compliance.freezed.dart';
part 'compliance.g.dart';

@freezed
class Compliance with _$Compliance {
  const factory Compliance({
    @JsonKey(name: 'ComplianceId') int? complianceId,
    @JsonKey(name: 'ComplianceName') String? complianceName,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'HasRejectReason') bool? hasRejectReason,
    @JsonKey(name: 'JobCategoryId') bool? jobCategoryId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Compliance;

  factory Compliance.fromJson(Map<String, dynamic> json) => _$ComplianceFromJson(json);
}
