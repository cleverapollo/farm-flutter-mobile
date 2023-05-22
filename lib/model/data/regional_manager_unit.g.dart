// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regional_manager_unit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRegionalManagerUnitCollection on Isar {
  IsarCollection<RegionalManagerUnit> get regionalManagerUnits =>
      this.collection();
}

const RegionalManagerUnitSchema = CollectionSchema(
  name: r'RegionalManagerUnit',
  id: -2803947701266043912,
  properties: {
    r'groupSchemeId': PropertySchema(
      id: 0,
      name: r'groupSchemeId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 1,
      name: r'isActive',
      type: IsarType.long,
    ),
    r'regionalManagerUnitId': PropertySchema(
      id: 2,
      name: r'regionalManagerUnitId',
      type: IsarType.long,
    ),
    r'regionalManagerUnitName': PropertySchema(
      id: 3,
      name: r'regionalManagerUnitName',
      type: IsarType.string,
    )
  },
  estimateSize: _regionalManagerUnitEstimateSize,
  serialize: _regionalManagerUnitSerialize,
  deserialize: _regionalManagerUnitDeserialize,
  deserializeProp: _regionalManagerUnitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _regionalManagerUnitGetId,
  getLinks: _regionalManagerUnitGetLinks,
  attach: _regionalManagerUnitAttach,
  version: '3.0.5',
);

int _regionalManagerUnitEstimateSize(
  RegionalManagerUnit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.regionalManagerUnitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _regionalManagerUnitSerialize(
  RegionalManagerUnit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.groupSchemeId);
  writer.writeLong(offsets[1], object.isActive);
  writer.writeLong(offsets[2], object.regionalManagerUnitId);
  writer.writeString(offsets[3], object.regionalManagerUnitName);
}

RegionalManagerUnit _regionalManagerUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RegionalManagerUnit(
    groupSchemeId: reader.readLongOrNull(offsets[0]),
    isActive: reader.readLongOrNull(offsets[1]),
    regionalManagerUnitId: reader.readLong(offsets[2]),
    regionalManagerUnitName: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _regionalManagerUnitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _regionalManagerUnitGetId(RegionalManagerUnit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _regionalManagerUnitGetLinks(
    RegionalManagerUnit object) {
  return [];
}

void _regionalManagerUnitAttach(
    IsarCollection<dynamic> col, Id id, RegionalManagerUnit object) {}

extension RegionalManagerUnitQueryWhereSort
    on QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QWhere> {
  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RegionalManagerUnitQueryWhere
    on QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QWhereClause> {
  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterWhereClause>
      idBetween(
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

extension RegionalManagerUnitQueryFilter on QueryBuilder<RegionalManagerUnit,
    RegionalManagerUnit, QFilterCondition> {
  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      groupSchemeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      groupSchemeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      groupSchemeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
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

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      isActiveEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      isActiveGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      isActiveLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      isActiveBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isActive',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regionalManagerUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionalManagerUnitName',
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionalManagerUnitName',
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regionalManagerUnitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'regionalManagerUnitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitName',
        value: '',
      ));
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'regionalManagerUnitName',
        value: '',
      ));
    });
  }
}

extension RegionalManagerUnitQueryObject on QueryBuilder<RegionalManagerUnit,
    RegionalManagerUnit, QFilterCondition> {}

extension RegionalManagerUnitQueryLinks on QueryBuilder<RegionalManagerUnit,
    RegionalManagerUnit, QFilterCondition> {}

extension RegionalManagerUnitQuerySortBy
    on QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QSortBy> {
  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.desc);
    });
  }
}

extension RegionalManagerUnitQuerySortThenBy
    on QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QSortThenBy> {
  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.asc);
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.desc);
    });
  }
}

extension RegionalManagerUnitQueryWhereDistinct
    on QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QDistinct> {
  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QDistinct>
      distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QDistinct>
      distinctByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QDistinct>
      distinctByRegionalManagerUnitName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitName',
          caseSensitive: caseSensitive);
    });
  }
}

extension RegionalManagerUnitQueryProperty
    on QueryBuilder<RegionalManagerUnit, RegionalManagerUnit, QQueryProperty> {
  QueryBuilder<RegionalManagerUnit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RegionalManagerUnit, int?, QQueryOperations>
      groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<RegionalManagerUnit, int?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RegionalManagerUnit, int, QQueryOperations>
      regionalManagerUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<RegionalManagerUnit, String?, QQueryOperations>
      regionalManagerUnitNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegionalManagerUnit _$$_RegionalManagerUnitFromJson(
        Map<String, dynamic> json) =>
    _$_RegionalManagerUnit(
      regionalManagerUnitId: json['RegionalManagerUnitId'] as int,
      regionalManagerUnitName: json['RegionalManagerUnitName'] as String?,
      groupSchemeId: json['GroupschemeId'] as int?,
      isActive: json['IsActive'] as int?,
    );

Map<String, dynamic> _$$_RegionalManagerUnitToJson(
        _$_RegionalManagerUnit instance) =>
    <String, dynamic>{
      'RegionalManagerUnitId': instance.regionalManagerUnitId,
      'RegionalManagerUnitName': instance.regionalManagerUnitName,
      'GroupschemeId': instance.groupSchemeId,
      'IsActive': instance.isActive,
    };
