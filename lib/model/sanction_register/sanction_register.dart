import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'sanction_register.freezed.dart';
part 'sanction_register.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class SanctionRegister with _$SanctionRegister {
  const factory SanctionRegister({
    @JsonKey(name: 'SanctionRegisterId') String? sanctionRegisterId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'WorkerId') String? workerId,
    @JsonKey(name: 'CampId') String? campId,
    @JsonKey(name: 'CampOrCompartment') String? campOrCompartment,
    @JsonKey(name: 'DateReceived') DateTime? dateReceived,
    @JsonKey(name: 'IssueTypeId') int? issueTypeId,
    @JsonKey(name: 'DescriptionOfSanction') String? descriptionOfSanction,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'SignaturePoints') String? signaturePoints,
    @JsonKey(name: 'SignatureImage') String? signatureImage,
    @JsonKey(name: 'SignatureDate') String? signatureDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsSynced') bool? isSynced,
    @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'DisplayWorkerName') String? displayWorkerName,
    @JsonKey(name: 'CampName') String? campName,
    @JsonKey(name: 'IssueTypeName') String? issueTypeName,
  }) = _SanctionRegister;

  const SanctionRegister._();

  factory SanctionRegister.fromJson(Map<String, dynamic> json) =>
      _$SanctionRegisterFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
