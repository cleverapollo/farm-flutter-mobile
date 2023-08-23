import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'species_group_template.freezed.dart';
part 'species_group_template.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class SpeciesGroupTemplate with _$SpeciesGroupTemplate {
  const factory SpeciesGroupTemplate({
    @JsonKey(name: 'LocalId') int? localId,
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

  const SpeciesGroupTemplate._();

  factory SpeciesGroupTemplate.fromJson(Map<String, dynamic> json) =>
      _$SpeciesGroupTemplateFromJson(json);

  @override
  Id get id => localId ?? Isar.autoIncrement;
}
