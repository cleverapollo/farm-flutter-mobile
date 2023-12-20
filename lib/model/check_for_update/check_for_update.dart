import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_for_update.g.dart';
part 'check_for_update.freezed.dart';

@freezed
class CheckForUpdate with _$CheckForUpdate {
  const factory CheckForUpdate({
    @JsonKey(name: 'AppVersionId') int? appVersionId,
    @JsonKey(name: 'AppName') String? appName,
    @JsonKey(name: 'VersionNumber') String? versionNumber,
    @JsonKey(name: 'ReleasedDate') DateTime? releasedDate,
    @JsonKey(name: 'Note') String? note,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _CheckForUpdate;

  factory CheckForUpdate.fromJson(Map<String, dynamic> json) => _$CheckForUpdateFromJson(json);
}