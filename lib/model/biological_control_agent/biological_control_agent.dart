import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'biological_control_agent.freezed.dart';

part 'biological_control_agent.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class BiologicalControlAgent with _$BiologicalControlAgent {
  const factory BiologicalControlAgent({
    @JsonKey(name: 'BiologicalControlAgentsId') int? biologicalControlAgentId,
    @JsonKey(name: 'NameControlAgent') String? nameControlAgent,
    @JsonKey(name: 'ControlAgentId') String? controlAgentId,
    @JsonKey(name: 'ScientificName') String? scientificName,
    @JsonKey(name: 'CountryOrigin') String? countryOrigin,
    @JsonKey(name: 'ReasonBioAgent') String? reasonBioAgent,
    @JsonKey(name: 'DateReleased') String? dateReleased,
    @JsonKey(name: 'StakeholderName') String? stakeholderName,
    @JsonKey(name: 'StakeholderId') int? stakeholderId,
    @JsonKey(name: 'DescriptionMonitoringRequirements') String? descriptionMonitoringRequirements,
    @JsonKey(name: 'DescriptionMonitoringRequirementsId') int? descriptionMonitoringRequirementsId,
    @JsonKey(name: 'GeneralComments') String? generalComments,
    @Default(false) @JsonKey(name: 'CarRaised') bool? carRaised,
    @Default(false) @JsonKey(name: 'CarClosed') bool? carClosed,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _BiologicalControlAgent;

  const BiologicalControlAgent._();

  factory BiologicalControlAgent.fromJson(Map<String, dynamic> json) => _$BiologicalControlAgentFromJson(json);

  @override
  Id get id => biologicalControlAgentId ?? Isar.autoIncrement;
}
