import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'biological_control_agent_type.freezed.dart';

part 'biological_control_agent_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class BiologicalControlAgentType with _$BiologicalControlAgentType {
  const factory BiologicalControlAgentType({
    @JsonKey(name: 'BiologicalControlAgentTypeId')
        int? biologicalControlAgentTypeId,
    @JsonKey(name: 'BiologicalControlAgentTypeName')
        String? biologicalControlAgentTypeName,
    @JsonKey(name: 'BiologicalControlAgentTypeScientificName')
        String? biologicalControlAgentTypeScientificName,
    @JsonKey(name: 'ReasonForBioAgent') String? reasonForBioAgent,
    @JsonKey(name: 'CountryId') int? countryId,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _BiologicalControlAgentType;

  const BiologicalControlAgentType._();

  factory BiologicalControlAgentType.fromJson(Map<String, dynamic> json) =>
      _$BiologicalControlAgentTypeFromJson(json);

  @override
  Id get id => biologicalControlAgentTypeId ?? Isar.autoIncrement;
}
