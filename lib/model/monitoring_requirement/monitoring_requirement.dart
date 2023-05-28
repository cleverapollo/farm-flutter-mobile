import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'monitoring_requirement.freezed.dart';

part 'monitoring_requirement.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class MonitoringRequirement with _$MonitoringRequirement {
  const factory MonitoringRequirement({
    @JsonKey(name: 'MonitoringRequirementId') int? monitoringRequirementId,
    @JsonKey(name: 'MonitoringRequirementName')
        String? monitoringRequirementName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _MonitoringRequirement;

  const MonitoringRequirement._();

  factory MonitoringRequirement.fromJson(Map<String, dynamic> json) =>
      _$MonitoringRequirementFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
