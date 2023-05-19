// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_member_objective.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmMemberObjectiveCollection on Isar {
  IsarCollection<FarmMemberObjective> get farmMemberObjectives =>
      this.collection();
}

const FarmMemberObjectiveSchema = CollectionSchema(
  name: r'FarmMemberObjective',
  id: -5994908697867143927,
  properties: {
    r'farmMemberObjectiveId': PropertySchema(
      id: 0,
      name: r'farmMemberObjectiveId',
      type: IsarType.long,
    ),
    r'farmMemberObjectiveName': PropertySchema(
      id: 1,
      name: r'farmMemberObjectiveName',
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
  estimateSize: _farmMemberObjectiveEstimateSize,
  serialize: _farmMemberObjectiveSerialize,
  deserialize: _farmMemberObjectiveDeserialize,
  deserializeProp: _farmMemberObjectiveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmMemberObjectiveGetId,
  getLinks: _farmMemberObjectiveGetLinks,
  attach: _farmMemberObjectiveAttach,
  version: '3.0.5',
);

int _farmMemberObjectiveEstimateSize(
  FarmMemberObjective object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.farmMemberObjectiveName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmMemberObjectiveSerialize(
  FarmMemberObjective object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.farmMemberObjectiveId);
  writer.writeString(offsets[1], object.farmMemberObjectiveName);
  writer.writeLong(offsets[2], object.groupSchemeId);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeBool(offsets[4], object.isMasterDataSynced);
}

FarmMemberObjective _farmMemberObjectiveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmMemberObjective(
    farmMemberObjectiveId: reader.readLong(offsets[0]),
    farmMemberObjectiveName: reader.readStringOrNull(offsets[1]),
    groupSchemeId: reader.readLongOrNull(offsets[2]),
    isActive: reader.readBoolOrNull(offsets[3]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[4]),
  );
  return object;
}

P _farmMemberObjectiveDeserializeProp<P>(
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

Id _farmMemberObjectiveGetId(FarmMemberObjective object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmMemberObjectiveGetLinks(
    FarmMemberObjective object) {
  return [];
}

void _farmMemberObjectiveAttach(
    IsarCollection<dynamic> col, Id id, FarmMemberObjective object) {}

extension FarmMemberObjectiveQueryWhereSort
    on QueryBuilder<FarmMemberObjective, FarmMemberObjective, QWhere> {
  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmMemberObjectiveQueryWhere
    on QueryBuilder<FarmMemberObjective, FarmMemberObjective, QWhereClause> {
  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterWhereClause>
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

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterWhereClause>
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

extension FarmMemberObjectiveQueryFilter on QueryBuilder<FarmMemberObjective,
    FarmMemberObjective, QFilterCondition> {
  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmMemberObjectiveId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmMemberObjectiveId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmMemberObjectiveId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmMemberObjectiveName',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmMemberObjectiveName',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmMemberObjectiveName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmMemberObjectiveName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmMemberObjectiveName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmMemberObjectiveName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmMemberObjectiveName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmMemberObjectiveName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmMemberObjectiveName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      farmMemberObjectiveNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmMemberObjectiveName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
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

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
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

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
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

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
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

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
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

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
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

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterFilterCondition>
      isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }
}

extension FarmMemberObjectiveQueryObject on QueryBuilder<FarmMemberObjective,
    FarmMemberObjective, QFilterCondition> {}

extension FarmMemberObjectiveQueryLinks on QueryBuilder<FarmMemberObjective,
    FarmMemberObjective, QFilterCondition> {}

extension FarmMemberObjectiveQuerySortBy
    on QueryBuilder<FarmMemberObjective, FarmMemberObjective, QSortBy> {
  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByFarmMemberObjectiveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveId', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByFarmMemberObjectiveIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveId', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByFarmMemberObjectiveName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveName', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByFarmMemberObjectiveNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveName', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }
}

extension FarmMemberObjectiveQuerySortThenBy
    on QueryBuilder<FarmMemberObjective, FarmMemberObjective, QSortThenBy> {
  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByFarmMemberObjectiveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveId', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByFarmMemberObjectiveIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveId', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByFarmMemberObjectiveName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveName', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByFarmMemberObjectiveNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmMemberObjectiveName', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QAfterSortBy>
      thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }
}

extension FarmMemberObjectiveQueryWhereDistinct
    on QueryBuilder<FarmMemberObjective, FarmMemberObjective, QDistinct> {
  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QDistinct>
      distinctByFarmMemberObjectiveId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmMemberObjectiveId');
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QDistinct>
      distinctByFarmMemberObjectiveName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmMemberObjectiveName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QDistinct>
      distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FarmMemberObjective, FarmMemberObjective, QDistinct>
      distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }
}

extension FarmMemberObjectiveQueryProperty
    on QueryBuilder<FarmMemberObjective, FarmMemberObjective, QQueryProperty> {
  QueryBuilder<FarmMemberObjective, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmMemberObjective, int, QQueryOperations>
      farmMemberObjectiveIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmMemberObjectiveId');
    });
  }

  QueryBuilder<FarmMemberObjective, String?, QQueryOperations>
      farmMemberObjectiveNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmMemberObjectiveName');
    });
  }

  QueryBuilder<FarmMemberObjective, int?, QQueryOperations>
      groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<FarmMemberObjective, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FarmMemberObjective, bool?, QQueryOperations>
      isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmMemberObjective _$$_FarmMemberObjectiveFromJson(
        Map<String, dynamic> json) =>
    _$_FarmMemberObjective(
      farmMemberObjectiveName: json['FarmMemberObjectiveName'] as String?,
      farmMemberObjectiveId: json['FarmMemberObjectiveId'] as int,
      groupSchemeId: json['GroupSchemeId'] as int?,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterdataSynced'] as bool?,
    );

Map<String, dynamic> _$$_FarmMemberObjectiveToJson(
        _$_FarmMemberObjective instance) =>
    <String, dynamic>{
      'FarmMemberObjectiveName': instance.farmMemberObjectiveName,
      'FarmMemberObjectiveId': instance.farmMemberObjectiveId,
      'GroupSchemeId': instance.groupSchemeId,
      'IsActive': instance.isActive,
      'IsMasterdataSynced': instance.isMasterDataSynced,
    };
