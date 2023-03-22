import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'compliance.freezed.dart';
part 'compliance.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Compliance with _$Compliance {

  const factory Compliance({
    @JsonKey(name: 'ComplianceId') required int complianceId,
    @JsonKey(name: 'ComplianceName') String? complianceName,
    @JsonKey(name: 'CompanyId') int? companyId,
    @JsonKey(name: 'HasRejectReason') bool? hasRejectReason,
    @JsonKey(name: 'JobCategoryId') int? jobCategoryId,
    @JsonKey(name: 'IsActive') bool? isActive,
  }) = _Compliance;

  factory Compliance.fromJson(Map<String, dynamic> json) =>
      _$ComplianceFromJson(json);
  const Compliance._();

  @override
  
  Id get id => complianceId;
}
