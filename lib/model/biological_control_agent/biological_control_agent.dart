import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../state/farmer_sync_summary_cubit/farm_upload_payload/biological_control_agent_register_payload/biological_control_agent_register_payload.dart';

part 'biological_control_agent.freezed.dart';
part 'biological_control_agent.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class BiologicalControlAgent with _$BiologicalControlAgent {
  const factory BiologicalControlAgent({
    @JsonKey(name: 'BiologicalControlAgentRegisterNo')
        String? biologicalControlAgentRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'BiologicalControlAgentTypeId')
        int? biologicalControlAgentTypeId,
    @JsonKey(name: 'BiologicalControlAgentName')
        String? biologicalControlAgentName,
    @JsonKey(name: 'BiologicalControlAgentRegisterId')
        String? biologicalControlAgentRegisterId,
    @JsonKey(name: 'IssueDescription') String? issueDescription,
    @JsonKey(name: 'DateReleased') DateTime? dateReleased,
    @JsonKey(name: 'StakeholderId') String? stakeholderId,
    @JsonKey(name: 'MonitoringRequirementId') int? monitoringRequirementId,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterDataSynced,
    @JsonKey(name: 'StakeholderName') String? stakeholderName,
    @JsonKey(name: 'BiologicalControlAgentTypeName')
        String? biologicalControlAgentTypeName,
    @JsonKey(name: 'BiologicalControlAgentTypeScientificName')
        String? biologicalControlAgentTypeScientificName,
    @JsonKey(name: 'BiologicalControlAgentTypeCountryName')
        String? biologicalControlAgentTypeCountryName,
    @JsonKey(name: 'ReasonForBioAgent') String? reasonForBioAgent,
    @JsonKey(name: 'MonitoringRequirementName')
        String? monitoringRequirementName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _BiologicalControlAgent;

  const BiologicalControlAgent._();

  factory BiologicalControlAgent.fromJson(Map<String, dynamic> json) =>
      _$BiologicalControlAgentFromJson(json);

  @override
  Id get id =>
      int.tryParse(biologicalControlAgentRegisterNo ?? '') ??
      Isar.autoIncrement;
}

extension BiologicalControlAgentX on BiologicalControlAgent {

  BiologicalControlAgent clearCARData({
    bool carRaised = false,
    bool carClosed = false,
  }) {
    return BiologicalControlAgent(
      biologicalControlAgentRegisterNo: biologicalControlAgentRegisterNo,
      farmId: farmId,
      biologicalControlAgentTypeId: biologicalControlAgentTypeId,
      biologicalControlAgentName: biologicalControlAgentName,
      biologicalControlAgentRegisterId: biologicalControlAgentRegisterId,
      biologicalControlAgentTypeName: biologicalControlAgentTypeName,
      biologicalControlAgentTypeScientificName: biologicalControlAgentTypeScientificName,
      biologicalControlAgentTypeCountryName: biologicalControlAgentTypeCountryName,
      issueDescription: issueDescription,
      dateReleased: dateReleased,
      stakeholderId: stakeholderId,
      monitoringRequirementId: monitoringRequirementId,
      comment: comment,
      isActive: isActive,
      isMasterDataSynced: isMasterDataSynced,
      stakeholderName: stakeholderName,
      reasonForBioAgent: reasonForBioAgent,
      monitoringRequirementName: monitoringRequirementName,
      carRaisedDate: carRaised ? null : carRaisedDate,
      carClosedDate: carClosed ? null : carClosedDate,
      createDT: createDT,
      updateDT: updateDT,
    );
  }

  BiologicalControlAgentRegisterPayLoad toPayLoad() {
    return BiologicalControlAgentRegisterPayLoad(
      BiologicalControlAgentRegisterNo: biologicalControlAgentRegisterNo,
      FarmId: farmId,
      BiologicalControlAgentTypeId: biologicalControlAgentTypeId,
      BiologicalControlAgentName: biologicalControlAgentName,
      BiologicalControlAgentRegisterId: biologicalControlAgentRegisterId,
      IssueDescription: issueDescription,
      DateReleased: dateReleased,
      StakeholderId: stakeholderId,
      MonitoringRequirementId: monitoringRequirementId,
      Comment: comment,
      CarRaisedDate: carRaisedDate,
      CarClosedDate: carClosedDate,
      IsActive: isActive,
      IsMasterdataSynced: isMasterDataSynced,
      StakeholderName: stakeholderName,
      BiologicalControlAgentTypeName: biologicalControlAgentTypeName,
      BiologicalControlAgentTypeScientificName:
          biologicalControlAgentTypeScientificName,
      BiologicalControlAgentTypeCountryName:
          biologicalControlAgentTypeCountryName,
      ReasonForBioAgent: reasonForBioAgent,
      MonitoringRequirementName: monitoringRequirementName,
      CreateDT: createDT,
      UpdateDT: updateDT,
    );
  }
}
