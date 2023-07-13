import 'package:freezed_annotation/freezed_annotation.dart';

part 'biological_control_agent_register_payload.freezed.dart';
part 'biological_control_agent_register_payload.g.dart';

@freezed
class BiologicalControlAgentRegisterPayLoad
    with _$BiologicalControlAgentRegisterPayLoad {
  const factory BiologicalControlAgentRegisterPayLoad({
    String? BiologicalControlAgentRegisterNo,
    String? FarmId,
    num? BiologicalControlAgentTypeId,
    String? BiologicalControlAgentName,
    String? BiologicalControlAgentRegisterId,
    String? IssueDescription,
    DateTime? DateReleased,
    String? StakeholderId,
    num? MonitoringRequirementId,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? StakeholderName,
    String? BiologicalControlAgentTypeName,
    String? BiologicalControlAgentTypeScientificName,
    String? BiologicalControlAgentTypeCountryName,
    String? ReasonForBioAgent,
    String? MonitoringRequirementName,
  }) = _BiologicalControlAgentRegisterPayLoad;
  factory BiologicalControlAgentRegisterPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$BiologicalControlAgentRegisterPayLoadFromJson(json);
}
