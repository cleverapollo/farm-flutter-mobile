import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_database_status.freezed.dart';
part 'local_database_status.g.dart';

@freezed
class LocalDatabaseStatus with _$LocalDatabaseStatus {
  const factory LocalDatabaseStatus({
    @JsonKey(name: 'LatestUsername') String? latestUserName,
    @JsonKey(name: 'LatestGroupSchemeId') int? latestGroupSchemeId,
    @JsonKey(name: 'LatestGroupSchemeName') String? latestGroupSchemeName,
    @JsonKey(name: 'LatestRegionalManagerUnitId') int? latestRegionalManagerUnitId,
    @JsonKey(name: 'LatestRegionalManagerUnitName') String? latestRegionalManagerUnitName,
  }) = _LocalDatabaseStatus;

  const LocalDatabaseStatus._();

  factory LocalDatabaseStatus.fromJson(Map<String, dynamic> json) =>
      _$LocalDatabaseStatusFromJson(json);
}
