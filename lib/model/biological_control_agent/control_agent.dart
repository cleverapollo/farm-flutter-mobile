import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'control_agent.freezed.dart';

part 'control_agent.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class ControlAgent with _$ControlAgent {
  const factory ControlAgent({
    @JsonKey(name: 'ControlAgentId') int? controlAgentId,
    @JsonKey(name: 'NameControlAgent') String? nameControlAgent,
    @JsonKey(name: 'ScientificName') String? scientificName,
    @JsonKey(name: 'CountryOrigin') String? countryOrigin,
    @JsonKey(name: 'ReasonBioAgent') String? reasonBioAgent,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _ControlAgent;

  const ControlAgent._();

  factory ControlAgent.fromJson(Map<String, dynamic> json) => _$ControlAgentFromJson(json);

  @override
  Id get id => controlAgentId ?? Isar.autoIncrement;
}
