import 'package:freezed_annotation/freezed_annotation.dart';

part 'sanction_register_payload.freezed.dart';
part 'sanction_register_payload.g.dart';

@freezed
class SanctionRegisterPayLoad with _$SanctionRegisterPayLoad {
  const factory SanctionRegisterPayLoad({
    String? SanctionRegisterId,
    String? FarmId,
    String? WorkerId,
    String? CampId,
    String? CampOrCompartment,
    DateTime? DateRecieved,
    int? IssueTypeId,
    String? DescriptionOfSanction,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    String? SignaturePoints,
    String? SignatureImage,
    String? SignatureDate,
    bool? IsActive,
    bool? IsSynced,
    bool? IsLocal,
    String? DisplayWorkerName,
    String? CampName,
    String? IssueTypeName,
  }) = _SanctionRegisterPayLoad;
  factory SanctionRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$SanctionRegisterPayLoadFromJson(json);
}
