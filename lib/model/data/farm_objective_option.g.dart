// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_objective_option.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmObjectiveOptionCollection on Isar {
  IsarCollection<FarmObjectiveOption> get farmObjectiveOptions =>
      this.collection();
}

const FarmObjectiveOptionSchema = CollectionSchema(
  name: r'FarmObjectiveOption',
  id: -5015045600204517435,
  properties: {
    r'farmObjectiveOptionId': PropertySchema(
      id: 0,
      name: r'farmObjectiveOptionId',
      type: IsarType.long,
    ),
    r'farmObjectiveOptionName': PropertySchema(
      id: 1,
      name: r'farmObjectiveOptionName',
      type: IsarType.string,
    ),
    r'groupSchemeId': PropertySchema(
      id: 2,
      name: r'groupSchemeId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 4,
      name: r'isMasterDataSynced',
      type: IsarType.bool,
    )
  },
  estimateSize: _farmObjectiveOptionEstimateSize,
  serialize: _farmObjectiveOptionSerialize,
  deserialize: _farmObjectiveOptionDeserialize,
  deserializeProp: _farmObjectiveOptionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmObjectiveOptionGetId,
  getLinks: _farmObjectiveOptionGetLinks,
  attach: _farmObjectiveOptionAttach,
  version: '3.0.5',
);

int _farmObjectiveOptionEstimateSize(
  FarmObjectiveOption object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.farmObjectiveOptionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmObjectiveOptionSerialize(
  FarmObjectiveOption object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.farmObjectiveOptionId);
  writer.writeString(offsets[1], object.farmObjectiveOptionName);
  writer.writeLong(offsets[2], object.groupSchemeId);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeBool(offsets[4], object.isMasterDataSynced);
}

FarmObjectiveOption _farmObjectiveOptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmObjectiveOption(
    farmObjectiveOptionId: reader.readLong(offsets[0]),
    farmObjectiveOptionName: reader.readStringOrNull(offsets[1]),
    groupSchemeId: reader.readLongOrNull(offsets[2]),
    isActive: reader.readBoolOrNull(offsets[3]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[4]),
  );
  return object;
}

P _farmObjectiveOptionDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmObjectiveOptionGetId(FarmObjectiveOption object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmObjectiveOptionGetLinks(
    FarmObjectiveOption object) {
  return [];
}

void _farmObjectiveOptionAttach(
    IsarCollection<dynamic> col, Id id, FarmObjectiveOption object) {}

extension FarmObjectiveOptionQueryWhereSort
    on QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QWhere> {
  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmObjectiveOptionQueryWhere
    on QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QWhereClause> {
  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterWhereClause>
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

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterWhereClause>
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

extension FarmObjectiveOptionQueryFilter on QueryBuilder<FarmObjectiveOption,
    FarmObjectiveOption, QFilterCondition> {
  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmObjectiveOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmObjectiveOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmObjectiveOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmObjectiveOptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmObjectiveOptionName',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmObjectiveOptionName',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmObjectiveOptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmObjectiveOptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmObjectiveOptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmObjectiveOptionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmObjectiveOptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmObjectiveOptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmObjectiveOptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmObjectiveOptionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmObjectiveOptionName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      farmObjectiveOptionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmObjectiveOptionName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
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

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
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

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
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

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
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

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
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

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
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

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterFilterCondition>
      isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }
}

extension FarmObjectiveOptionQueryObject on QueryBuilder<FarmObjectiveOption,
    FarmObjectiveOption, QFilterCondition> {}

extension FarmObjectiveOptionQueryLinks on QueryBuilder<FarmObjectiveOption,
    FarmObjectiveOption, QFilterCondition> {}

extension FarmObjectiveOptionQuerySortBy
    on QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QSortBy> {
  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByFarmObjectiveOptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionId', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByFarmObjectiveOptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionId', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByFarmObjectiveOptionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionName', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByFarmObjectiveOptionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionName', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }
}

extension FarmObjectiveOptionQuerySortThenBy
    on QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QSortThenBy> {
  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByFarmObjectiveOptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionId', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByFarmObjectiveOptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionId', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByFarmObjectiveOptionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionName', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByFarmObjectiveOptionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmObjectiveOptionName', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QAfterSortBy>
      thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }
}

extension FarmObjectiveOptionQueryWhereDistinct
    on QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QDistinct> {
  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QDistinct>
      distinctByFarmObjectiveOptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmObjectiveOptionId');
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QDistinct>
      distinctByFarmObjectiveOptionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmObjectiveOptionName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QDistinct>
      distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QDistinct>
      distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }
}

extension FarmObjectiveOptionQueryProperty
    on QueryBuilder<FarmObjectiveOption, FarmObjectiveOption, QQueryProperty> {
  QueryBuilder<FarmObjectiveOption, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmObjectiveOption, int, QQueryOperations>
      farmObjectiveOptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmObjectiveOptionId');
    });
  }

  QueryBuilder<FarmObjectiveOption, String?, QQueryOperations>
      farmObjectiveOptionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmObjectiveOptionName');
    });
  }

  QueryBuilder<FarmObjectiveOption, int?, QQueryOperations>
      groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<FarmObjectiveOption, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FarmObjectiveOption, bool?, QQueryOperations>
      isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmObjectiveOption _$$_FarmObjectiveOptionFromJson(
        Map<String, dynamic> json) =>
    _$_FarmObjectiveOption(
      farmObjectiveOptionName: json['FarmObjectiveOptionName'] as String?,
      farmObjectiveOptionId: json['FarmObjectiveOptionId'] as int,
      groupSchemeId: json['GroupSchemeId'] as int?,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterdataSynced'] as bool?,
    );

Map<String, dynamic> _$$_FarmObjectiveOptionToJson(
        _$_FarmObjectiveOption instance) =>
    <String, dynamic>{
      'FarmObjectiveOptionName': instance.farmObjectiveOptionName,
      'FarmObjectiveOptionId': instance.farmObjectiveOptionId,
      'GroupSchemeId': instance.groupSchemeId,
      'IsActive': instance.isActive,
      'IsMasterdataSynced': instance.isMasterDataSynced,
    };
