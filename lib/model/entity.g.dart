// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entity _$$_EntityFromJson(Map<String, dynamic> json) => _$_Entity(
      name: json['name'] as String,
      type: $enumDecode(_$EntityTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_EntityToJson(_$_Entity instance) => <String, dynamic>{
      'name': instance.name,
      'type': _$EntityTypeEnumMap[instance.type]!,
    };

const _$EntityTypeEnumMap = {
  EntityType.gs: 'gs',
  EntityType.rmu: 'rmu',
  EntityType.cpy: 'cpy',
};
