// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicator.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIndicatorCollection on Isar {
  IsarCollection<Indicator> get indicators => this.collection();
}

const IndicatorSchema = CollectionSchema(
  name: r'Indicator',
  id: 8885452576699898474,
  properties: {
    r'indicatorId': PropertySchema(
      id: 0,
      name: r'indicatorId',
      type: IsarType.long,
    ),
    r'indicatorName': PropertySchema(
      id: 1,
      name: r'indicatorName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _indicatorEstimateSize,
  serialize: _indicatorSerialize,
  deserialize: _indicatorDeserialize,
  deserializeProp: _indicatorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _indicatorGetId,
  getLinks: _indicatorGetLinks,
  attach: _indicatorAttach,
  version: '3.0.5',
);

int _indicatorEstimateSize(
  Indicator object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.indicatorName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _indicatorSerialize(
  Indicator object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.indicatorId);
  writer.writeString(offsets[1], object.indicatorName);
  writer.writeBool(offsets[2], object.isActive);
}

Indicator _indicatorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Indicator(
    indicatorId: reader.readLong(offsets[0]),
    indicatorName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
  );
  return object;
}

P _indicatorDeserializeProp<P>(
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

Id _indicatorGetId(Indicator object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _indicatorGetLinks(Indicator object) {
  return [];
}

void _indicatorAttach(IsarCollection<dynamic> col, Id id, Indicator object) {}

extension IndicatorQueryWhereSort
    on QueryBuilder<Indicator, Indicator, QWhere> {
  QueryBuilder<Indicator, Indicator, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IndicatorQueryWhere
    on QueryBuilder<Indicator, Indicator, QWhereClause> {
  QueryBuilder<Indicator, Indicator, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Indicator, Indicator, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterWhereClause> idBetween(
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

extension IndicatorQueryFilter
    on QueryBuilder<Indicator, Indicator, QFilterCondition> {
  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> indicatorIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'indicatorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> indicatorIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'indicatorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> indicatorIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'indicatorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'indicatorName',
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'indicatorName',
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'indicatorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'indicatorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      indicatorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'indicatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension IndicatorQueryObject
    on QueryBuilder<Indicator, Indicator, QFilterCondition> {}

extension IndicatorQueryLinks
    on QueryBuilder<Indicator, Indicator, QFilterCondition> {}

extension IndicatorQuerySortBy on QueryBuilder<Indicator, Indicator, QSortBy> {
  QueryBuilder<Indicator, Indicator, QAfterSortBy> sortByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.asc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> sortByIndicatorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.desc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> sortByIndicatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.asc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> sortByIndicatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.desc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension IndicatorQuerySortThenBy
    on QueryBuilder<Indicator, Indicator, QSortThenBy> {
  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.asc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenByIndicatorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.desc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenByIndicatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.asc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenByIndicatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.desc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Indicator, Indicator, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension IndicatorQueryWhereDistinct
    on QueryBuilder<Indicator, Indicator, QDistinct> {
  QueryBuilder<Indicator, Indicator, QDistinct> distinctByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'indicatorId');
    });
  }

  QueryBuilder<Indicator, Indicator, QDistinct> distinctByIndicatorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'indicatorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Indicator, Indicator, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension IndicatorQueryProperty
    on QueryBuilder<Indicator, Indicator, QQueryProperty> {
  QueryBuilder<Indicator, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Indicator, int, QQueryOperations> indicatorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'indicatorId');
    });
  }

  QueryBuilder<Indicator, String?, QQueryOperations> indicatorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'indicatorName');
    });
  }

  QueryBuilder<Indicator, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Indicator _$$_IndicatorFromJson(Map<String, dynamic> json) => _$_Indicator(
      indicatorId: json['IndicatorId'] as int,
      indicatorName: json['IndicatorName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_IndicatorToJson(_$_Indicator instance) =>
    <String, dynamic>{
      'IndicatorId': instance.indicatorId,
      'IndicatorName': instance.indicatorName,
      'IsActive': instance.isActive,
    };
