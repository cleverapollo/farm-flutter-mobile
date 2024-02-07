import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'illegal_activity_register.freezed.dart';
part 'illegal_activity_register.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class IllegalActivityRegister with _$IllegalActivityRegister {
  const factory IllegalActivityRegister({
    @JsonKey(name: 'IllegalActivityId') String? illegalActivityId,
    @JsonKey(name: 'IllegalActivityNo') String? illegalActivityNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'ComplaintName') String? complaintName,
    @JsonKey(name: 'IssueRaised') String? issueRaised,
    @JsonKey(name: 'DateReceived') DateTime? dateReceived,
    @JsonKey(name: 'DateClosed') DateTime? dateClosed,
    @JsonKey(name: 'ClosureDetails') String? closureDetails,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
  }) = _IllegalActivityRegister;

  const IllegalActivityRegister._();

  factory IllegalActivityRegister.fromJson(Map<String, dynamic> json) =>
      _$IllegalActivityRegisterFromJson(json);

  Id get id => int.tryParse(illegalActivityNo ?? '') ?? Isar.autoIncrement;
}
