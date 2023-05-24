import 'package:freezed_annotation/freezed_annotation.dart';

part 'species_group_template.freezed.dart';
part 'species_group_template.g.dart';

@freezed
class SpeciesGroupTemplate with _$SpeciesGroupTemplate {
  const factory SpeciesGroupTemplate({
    @JsonKey(name: 'AreaTypeId') String? areaTypeId,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'SpeciesGroupTemplateDescription')
        String? speciesGroupTemplateDescription,
    @JsonKey(name: 'SpeciesGroupTemplateId') String? speciesGroupTemplateId,
    @JsonKey(name: 'SpeciesGroupTemplateName') String? speciesGroupTemplateName,
    @JsonKey(name: 'SpeciesGroupTemplateSpeciesMasterDatas')
        String? speciesGroupTemplateSpeciesMasterDatas,
    @JsonKey(name: 'TotalRows') int? totalRows,
    @JsonKey(name: 'UpdateDT') String? updateDT,
  }) = _SpeciesGroupTemplate;

  factory SpeciesGroupTemplate.fromJson(Map<String, dynamic> json) =>
      _$SpeciesGroupTemplateFromJson(json);
}
