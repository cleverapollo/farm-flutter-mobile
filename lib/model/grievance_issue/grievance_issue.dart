import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'grievance_issue.freezed.dart';

part 'grievance_issue.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GrievanceIssue with _$GrievanceIssue {
  const factory GrievanceIssue({
    @JsonKey(name: 'GrievanceIssueId') int? grievanceIssueId,
    @JsonKey(name: 'GrievanceIssueName') String? grievanceIssueName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _GrievanceIssue;

  const GrievanceIssue._();

  factory GrievanceIssue.fromJson(Map<String, dynamic> json) =>
      _$GrievanceIssueFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
