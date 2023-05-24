// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_group_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpeciesGroupTemplate _$$_SpeciesGroupTemplateFromJson(
        Map<String, dynamic> json) =>
    _$_SpeciesGroupTemplate(
      areaTypeId: json['AreaTypeId'] as String?,
      createDT: json['CreateDT'] as String?,
      groupSchemeId: json['GroupSchemeId'] as int?,
      isActive: json['IsActive'] as bool?,
      speciesGroupTemplateDescription:
          json['SpeciesGroupTemplateDescription'] as String?,
      speciesGroupTemplateId: json['SpeciesGroupTemplateId'] as String?,
      speciesGroupTemplateName: json['SpeciesGroupTemplateName'] as String?,
      speciesGroupTemplateSpeciesMasterDatas:
          json['SpeciesGroupTemplateSpeciesMasterDatas'] as String?,
      totalRows: json['TotalRows'] as int?,
      updateDT: json['UpdateDT'] as String?,
    );

Map<String, dynamic> _$$_SpeciesGroupTemplateToJson(
        _$_SpeciesGroupTemplate instance) =>
    <String, dynamic>{
      'AreaTypeId': instance.areaTypeId,
      'CreateDT': instance.createDT,
      'GroupSchemeId': instance.groupSchemeId,
      'IsActive': instance.isActive,
      'SpeciesGroupTemplateDescription':
          instance.speciesGroupTemplateDescription,
      'SpeciesGroupTemplateId': instance.speciesGroupTemplateId,
      'SpeciesGroupTemplateName': instance.speciesGroupTemplateName,
      'SpeciesGroupTemplateSpeciesMasterDatas':
          instance.speciesGroupTemplateSpeciesMasterDatas,
      'TotalRows': instance.totalRows,
      'UpdateDT': instance.updateDT,
    };
