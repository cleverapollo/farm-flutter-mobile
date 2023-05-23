// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact_caused.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetImpactCausedCollection on Isar {
  IsarCollection<ImpactCaused> get impactCauseds => this.collection();
}

const ImpactCausedSchema = CollectionSchema(
  name: r'ImpactCaused',
  id: 3146612102663780333,
  properties: {
    r'impactCausedId': PropertySchema(
      id: 0,
      name: r'impactCausedId',
      type: IsarType.long,
    ),
    r'impactCausedName': PropertySchema(
      id: 1,
      name: r'impactCausedName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _impactCausedEstimateSize,
  serialize: _impactCausedSerialize,
  deserialize: _impactCausedDeserialize,
  deserializeProp: _impactCausedDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _impactCausedGetId,
  getLinks: _impactCausedGetLinks,
  attach: _impactCausedAttach,
  version: '3.1.0',
);

int _impactCausedEstimateSize(
  ImpactCaused object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.impactCausedName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _impactCausedSerialize(
  ImpactCaused object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.impactCausedId);
  writer.writeString(offsets[1], object.impactCausedName);
  writer.writeBool(offsets[2], object.isActive);
}

ImpactCaused _impactCausedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ImpactCaused(
    impactCausedId: reader.readLong(offsets[0]),
    impactCausedName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
  );
  return object;
}

P _impactCausedDeserializeProp<P>(
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

Id _impactCausedGetId(ImpactCaused object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _impactCausedGetLinks(ImpactCaused object) {
  return [];
}

void _impactCausedAttach(
    IsarCollection<dynamic> col, Id id, ImpactCaused object) {}

extension ImpactCausedQueryWhereSort
    on QueryBuilder<ImpactCaused, ImpactCaused, QWhere> {
  QueryBuilder<ImpactCaused, ImpactCaused, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ImpactCausedQueryWhere
    on QueryBuilder<ImpactCaused, ImpactCaused, QWhereClause> {
  QueryBuilder<ImpactCaused, ImpactCaused, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterWhereClause> idBetween(
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

extension ImpactCausedQueryFilter
    on QueryBuilder<ImpactCaused, ImpactCaused, QFilterCondition> {
  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactCausedId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactCausedName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactCausedName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      impactCausedNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension ImpactCausedQueryObject
    on QueryBuilder<ImpactCaused, ImpactCaused, QFilterCondition> {}

extension ImpactCausedQueryLinks
    on QueryBuilder<ImpactCaused, ImpactCaused, QFilterCondition> {}

extension ImpactCausedQuerySortBy
    on QueryBuilder<ImpactCaused, ImpactCaused, QSortBy> {
  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      sortByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      sortByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      sortByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      sortByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension ImpactCausedQuerySortThenBy
    on QueryBuilder<ImpactCaused, ImpactCaused, QSortThenBy> {
  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      thenByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      thenByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      thenByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy>
      thenByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension ImpactCausedQueryWhereDistinct
    on QueryBuilder<ImpactCaused, ImpactCaused, QDistinct> {
  QueryBuilder<ImpactCaused, ImpactCaused, QDistinct>
      distinctByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedId');
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QDistinct>
      distinctByImpactCausedName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImpactCaused, ImpactCaused, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension ImpactCausedQueryProperty
    on QueryBuilder<ImpactCaused, ImpactCaused, QQueryProperty> {
  QueryBuilder<ImpactCaused, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ImpactCaused, int, QQueryOperations> impactCausedIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedId');
    });
  }

  QueryBuilder<ImpactCaused, String?, QQueryOperations>
      impactCausedNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedName');
    });
  }

  QueryBuilder<ImpactCaused, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImpactCaused _$$_ImpactCausedFromJson(Map<String, dynamic> json) =>
    _$_ImpactCaused(
      impactCausedId: json['ImpactCausedId'] as int,
      impactCausedName: json['ImpactCausedName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ImpactCausedToJson(_$_ImpactCaused instance) =>
    <String, dynamic>{
      'ImpactCausedId': instance.impactCausedId,
      'ImpactCausedName': instance.impactCausedName,
      'IsActive': instance.isActive,
    };
