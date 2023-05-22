// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_scheme_stake_holder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGroupSchemeStakeHolderCollection on Isar {
  IsarCollection<GroupSchemeStakeHolder> get groupSchemeStakeHolders =>
      this.collection();
}

const GroupSchemeStakeHolderSchema = CollectionSchema(
  name: r'GroupSchemeStakeHolder',
  id: 400967257666555777,
  properties: {
    r'groupSchemeId': PropertySchema(
      id: 0,
      name: r'groupSchemeId',
      type: IsarType.long,
    ),
    r'groupSchemeStakeHolderId': PropertySchema(
      id: 1,
      name: r'groupSchemeStakeHolderId',
      type: IsarType.string,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 2,
      name: r'isMasterDataSynced',
      type: IsarType.long,
    ),
    r'stakeHolderId': PropertySchema(
      id: 3,
      name: r'stakeHolderId',
      type: IsarType.string,
    )
  },
  estimateSize: _groupSchemeStakeHolderEstimateSize,
  serialize: _groupSchemeStakeHolderSerialize,
  deserialize: _groupSchemeStakeHolderDeserialize,
  deserializeProp: _groupSchemeStakeHolderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _groupSchemeStakeHolderGetId,
  getLinks: _groupSchemeStakeHolderGetLinks,
  attach: _groupSchemeStakeHolderAttach,
  version: '3.0.5',
);

int _groupSchemeStakeHolderEstimateSize(
  GroupSchemeStakeHolder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.groupSchemeStakeHolderId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stakeHolderId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _groupSchemeStakeHolderSerialize(
  GroupSchemeStakeHolder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.groupSchemeId);
  writer.writeString(offsets[1], object.groupSchemeStakeHolderId);
  writer.writeLong(offsets[2], object.isMasterDataSynced);
  writer.writeString(offsets[3], object.stakeHolderId);
}

GroupSchemeStakeHolder _groupSchemeStakeHolderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GroupSchemeStakeHolder(
    groupSchemeId: reader.readLongOrNull(offsets[0]),
    groupSchemeStakeHolderId: reader.readStringOrNull(offsets[1]),
    isMasterDataSynced: reader.readLongOrNull(offsets[2]),
    stakeHolderId: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _groupSchemeStakeHolderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groupSchemeStakeHolderGetId(GroupSchemeStakeHolder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groupSchemeStakeHolderGetLinks(
    GroupSchemeStakeHolder object) {
  return [];
}

void _groupSchemeStakeHolderAttach(
    IsarCollection<dynamic> col, Id id, GroupSchemeStakeHolder object) {}

extension GroupSchemeStakeHolderQueryWhereSort
    on QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QWhere> {
  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroupSchemeStakeHolderQueryWhere on QueryBuilder<
    GroupSchemeStakeHolder, GroupSchemeStakeHolder, QWhereClause> {
  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterWhereClause> idBetween(
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

extension GroupSchemeStakeHolderQueryFilter on QueryBuilder<
    GroupSchemeStakeHolder, GroupSchemeStakeHolder, QFilterCondition> {
  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeIdGreaterThan(
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

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeIdLessThan(
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

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeIdBetween(
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

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeStakeHolderId',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeStakeHolderId',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeStakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeStakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeStakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeStakeHolderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupSchemeStakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupSchemeStakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
          QAfterFilterCondition>
      groupSchemeStakeHolderIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupSchemeStakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
          QAfterFilterCondition>
      groupSchemeStakeHolderIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupSchemeStakeHolderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeStakeHolderId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> groupSchemeStakeHolderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupSchemeStakeHolderId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> isMasterDataSyncedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> isMasterDataSyncedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> isMasterDataSyncedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> isMasterDataSyncedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isMasterDataSynced',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeHolderId',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeHolderId',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeHolderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
          QAfterFilterCondition>
      stakeHolderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
          QAfterFilterCondition>
      stakeHolderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakeHolderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder,
      QAfterFilterCondition> stakeHolderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakeHolderId',
        value: '',
      ));
    });
  }
}

extension GroupSchemeStakeHolderQueryObject on QueryBuilder<
    GroupSchemeStakeHolder, GroupSchemeStakeHolder, QFilterCondition> {}

extension GroupSchemeStakeHolderQueryLinks on QueryBuilder<
    GroupSchemeStakeHolder, GroupSchemeStakeHolder, QFilterCondition> {}

extension GroupSchemeStakeHolderQuerySortBy
    on QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QSortBy> {
  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByGroupSchemeStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeStakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByGroupSchemeStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeStakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      sortByStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.desc);
    });
  }
}

extension GroupSchemeStakeHolderQuerySortThenBy on QueryBuilder<
    GroupSchemeStakeHolder, GroupSchemeStakeHolder, QSortThenBy> {
  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByGroupSchemeStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeStakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByGroupSchemeStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeStakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QAfterSortBy>
      thenByStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.desc);
    });
  }
}

extension GroupSchemeStakeHolderQueryWhereDistinct
    on QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QDistinct> {
  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QDistinct>
      distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QDistinct>
      distinctByGroupSchemeStakeHolderId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeStakeHolderId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QDistinct>
      distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, GroupSchemeStakeHolder, QDistinct>
      distinctByStakeHolderId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeHolderId',
          caseSensitive: caseSensitive);
    });
  }
}

extension GroupSchemeStakeHolderQueryProperty on QueryBuilder<
    GroupSchemeStakeHolder, GroupSchemeStakeHolder, QQueryProperty> {
  QueryBuilder<GroupSchemeStakeHolder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, int?, QQueryOperations>
      groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, String?, QQueryOperations>
      groupSchemeStakeHolderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeStakeHolderId');
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, int?, QQueryOperations>
      isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }

  QueryBuilder<GroupSchemeStakeHolder, String?, QQueryOperations>
      stakeHolderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeHolderId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupSchemeStakeHolder _$$_GroupSchemeStakeHolderFromJson(
        Map<String, dynamic> json) =>
    _$_GroupSchemeStakeHolder(
      groupSchemeStakeHolderId: json['GroupSchemeStakeHolderId'] as String?,
      stakeHolderId: json['StakeholderId'] as String?,
      groupSchemeId: json['GroupSchemeId'] as int?,
      isMasterDataSynced: json['IsMasterDataSynced'] as int?,
    );

Map<String, dynamic> _$$_GroupSchemeStakeHolderToJson(
        _$_GroupSchemeStakeHolder instance) =>
    <String, dynamic>{
      'GroupSchemeStakeHolderId': instance.groupSchemeStakeHolderId,
      'StakeholderId': instance.stakeHolderId,
      'GroupSchemeId': instance.groupSchemeId,
      'IsMasterDataSynced': instance.isMasterDataSynced,
    };
