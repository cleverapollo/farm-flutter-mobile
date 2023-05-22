// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_template.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAuditTemplateCollection on Isar {
  IsarCollection<AuditTemplate> get auditTemplates => this.collection();
}

const AuditTemplateSchema = CollectionSchema(
  name: r'AuditTemplate',
  id: 2181171515252354251,
  properties: {
    r'auditTemplateId': PropertySchema(
      id: 0,
      name: r'auditTemplateId',
      type: IsarType.long,
    ),
    r'auditTemplateName': PropertySchema(
      id: 1,
      name: r'auditTemplateName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _auditTemplateEstimateSize,
  serialize: _auditTemplateSerialize,
  deserialize: _auditTemplateDeserialize,
  deserializeProp: _auditTemplateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditTemplateGetId,
  getLinks: _auditTemplateGetLinks,
  attach: _auditTemplateAttach,
  version: '3.0.5',
);

int _auditTemplateEstimateSize(
  AuditTemplate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.auditTemplateName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _auditTemplateSerialize(
  AuditTemplate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.auditTemplateId);
  writer.writeString(offsets[1], object.auditTemplateName);
  writer.writeBool(offsets[2], object.isActive);
}

AuditTemplate _auditTemplateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditTemplate(
    auditTemplateId: reader.readLong(offsets[0]),
    auditTemplateName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
  );
  return object;
}

P _auditTemplateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditTemplateGetId(AuditTemplate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditTemplateGetLinks(AuditTemplate object) {
  return [];
}

void _auditTemplateAttach(
    IsarCollection<dynamic> col, Id id, AuditTemplate object) {}

extension AuditTemplateQueryWhereSort
    on QueryBuilder<AuditTemplate, AuditTemplate, QWhere> {
  QueryBuilder<AuditTemplate, AuditTemplate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditTemplateQueryWhere
    on QueryBuilder<AuditTemplate, AuditTemplate, QWhereClause> {
  QueryBuilder<AuditTemplate, AuditTemplate, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AuditTemplateQueryFilter
    on QueryBuilder<AuditTemplate, AuditTemplate, QFilterCondition> {
  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auditTemplateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditTemplateName',
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditTemplateName',
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auditTemplateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'auditTemplateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      auditTemplateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'auditTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension AuditTemplateQueryObject
    on QueryBuilder<AuditTemplate, AuditTemplate, QFilterCondition> {}

extension AuditTemplateQueryLinks
    on QueryBuilder<AuditTemplate, AuditTemplate, QFilterCondition> {}

extension AuditTemplateQuerySortBy
    on QueryBuilder<AuditTemplate, AuditTemplate, QSortBy> {
  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      sortByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      sortByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      sortByAuditTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.asc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      sortByAuditTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.desc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension AuditTemplateQuerySortThenBy
    on QueryBuilder<AuditTemplate, AuditTemplate, QSortThenBy> {
  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      thenByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      thenByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      thenByAuditTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.asc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      thenByAuditTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.desc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension AuditTemplateQueryWhereDistinct
    on QueryBuilder<AuditTemplate, AuditTemplate, QDistinct> {
  QueryBuilder<AuditTemplate, AuditTemplate, QDistinct>
      distinctByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateId');
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QDistinct>
      distinctByAuditTemplateName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditTemplate, AuditTemplate, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension AuditTemplateQueryProperty
    on QueryBuilder<AuditTemplate, AuditTemplate, QQueryProperty> {
  QueryBuilder<AuditTemplate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditTemplate, int, QQueryOperations> auditTemplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateId');
    });
  }

  QueryBuilder<AuditTemplate, String?, QQueryOperations>
      auditTemplateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateName');
    });
  }

  QueryBuilder<AuditTemplate, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuditTemplate _$$_AuditTemplateFromJson(Map<String, dynamic> json) =>
    _$_AuditTemplate(
      auditTemplateId: json['AuditTemplateId'] as int,
      auditTemplateName: json['AuditTemplateName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_AuditTemplateToJson(_$_AuditTemplate instance) =>
    <String, dynamic>{
      'AuditTemplateId': instance.auditTemplateId,
      'AuditTemplateName': instance.auditTemplateName,
      'IsActive': instance.isActive,
    };
