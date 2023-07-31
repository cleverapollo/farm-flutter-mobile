import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'issue_type.freezed.dart';
part 'issue_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class IssueType with _$IssueType {
  const factory IssueType({
    @JsonKey(name: 'IssueTypeId') int? issueTypeId,
    @JsonKey(name: 'IssueTypeName') String? issueTypeName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _IssueType;

  const IssueType._();

  factory IssueType.fromJson(Map<String, dynamic> json) =>
      _$IssueTypeFromJson(json);

  @override
  Id get id => issueTypeId ?? Isar.autoIncrement;
}
