// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stakeholder_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetStakeHolderTypeCollection on Isar {
  IsarCollection<StakeHolderType> get stakeHolderTypes => this.collection();
}

const StakeHolderTypeSchema = CollectionSchema(
  name: r'StakeHolderType',
  id: -1600395962880368486,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 1,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 2,
      name: r'isMasterDataSynced',
      type: IsarType.bool,
    ),
    r'stakeholderTypeId': PropertySchema(
      id: 3,
      name: r'stakeholderTypeId',
      type: IsarType.long,
    ),
    r'stakeholderTypeName': PropertySchema(
      id: 4,
      name: r'stakeholderTypeName',
      type: IsarType.string,
    )
  },
  estimateSize: _stakeHolderTypeEstimateSize,
  serialize: _stakeHolderTypeSerialize,
  deserialize: _stakeHolderTypeDeserialize,
  deserializeProp: _stakeHolderTypeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stakeHolderTypeGetId,
  getLinks: _stakeHolderTypeGetLinks,
  attach: _stakeHolderTypeAttach,
  version: '3.0.5',
);

int _stakeHolderTypeEstimateSize(
  StakeHolderType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.stakeholderTypeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _stakeHolderTypeSerialize(
  StakeHolderType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeBool(offsets[1], object.isLocal);
  writer.writeBool(offsets[2], object.isMasterDataSynced);
  writer.writeLong(offsets[3], object.stakeholderTypeId);
  writer.writeString(offsets[4], object.stakeholderTypeName);
}

StakeHolderType _stakeHolderTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StakeHolderType(
    isActive: reader.readBoolOrNull(offsets[0]),
    isLocal: reader.readBoolOrNull(offsets[1]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[2]),
    stakeholderTypeId: reader.readLongOrNull(offsets[3]),
    stakeholderTypeName: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _stakeHolderTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stakeHolderTypeGetId(StakeHolderType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stakeHolderTypeGetLinks(StakeHolderType object) {
  return [];
}

void _stakeHolderTypeAttach(
    IsarCollection<dynamic> col, Id id, StakeHolderType object) {}

extension StakeHolderTypeQueryWhereSort
    on QueryBuilder<StakeHolderType, StakeHolderType, QWhere> {
  QueryBuilder<StakeHolderType, StakeHolderType, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StakeHolderTypeQueryWhere
    on QueryBuilder<StakeHolderType, StakeHolderType, QWhereClause> {
  QueryBuilder<StakeHolderType, StakeHolderType, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterWhereClause>
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

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterWhereClause> idBetween(
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

extension StakeHolderTypeQueryFilter
    on QueryBuilder<StakeHolderType, StakeHolderType, QFilterCondition> {
  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
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

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
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

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
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

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeholderTypeId',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeholderTypeId',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeholderTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeholderTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeholderTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeholderTypeName',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeholderTypeName',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeholderTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeholderTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeholderTypeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakeholderTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakeholderTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakeholderTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakeholderTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterFilterCondition>
      stakeholderTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakeholderTypeName',
        value: '',
      ));
    });
  }
}

extension StakeHolderTypeQueryObject
    on QueryBuilder<StakeHolderType, StakeHolderType, QFilterCondition> {}

extension StakeHolderTypeQueryLinks
    on QueryBuilder<StakeHolderType, StakeHolderType, QFilterCondition> {}

extension StakeHolderTypeQuerySortBy
    on QueryBuilder<StakeHolderType, StakeHolderType, QSortBy> {
  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByStakeholderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeId', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByStakeholderTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeId', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByStakeholderTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeName', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      sortByStakeholderTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeName', Sort.desc);
    });
  }
}

extension StakeHolderTypeQuerySortThenBy
    on QueryBuilder<StakeHolderType, StakeHolderType, QSortThenBy> {
  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByStakeholderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeId', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByStakeholderTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeId', Sort.desc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByStakeholderTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeName', Sort.asc);
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QAfterSortBy>
      thenByStakeholderTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderTypeName', Sort.desc);
    });
  }
}

extension StakeHolderTypeQueryWhereDistinct
    on QueryBuilder<StakeHolderType, StakeHolderType, QDistinct> {
  QueryBuilder<StakeHolderType, StakeHolderType, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QDistinct>
      distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QDistinct>
      distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QDistinct>
      distinctByStakeholderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderTypeId');
    });
  }

  QueryBuilder<StakeHolderType, StakeHolderType, QDistinct>
      distinctByStakeholderTypeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderTypeName',
          caseSensitive: caseSensitive);
    });
  }
}

extension StakeHolderTypeQueryProperty
    on QueryBuilder<StakeHolderType, StakeHolderType, QQueryProperty> {
  QueryBuilder<StakeHolderType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StakeHolderType, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<StakeHolderType, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<StakeHolderType, bool?, QQueryOperations>
      isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }

  QueryBuilder<StakeHolderType, int?, QQueryOperations>
      stakeholderTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderTypeId');
    });
  }

  QueryBuilder<StakeHolderType, String?, QQueryOperations>
      stakeholderTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderTypeName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StakeHolderType _$$_StakeHolderTypeFromJson(Map<String, dynamic> json) =>
    _$_StakeHolderType(
      stakeholderTypeId: json['StakeholderTypeId'] as int?,
      stakeholderTypeName: json['StakeholderTypeName'] as String?,
      isMasterDataSynced: json['IsMasterDataSynced'] as bool?,
      isActive: json['IsActive'] as bool?,
      isLocal: json['IsLocal'] as bool?,
    );

Map<String, dynamic> _$$_StakeHolderTypeToJson(_$_StakeHolderType instance) =>
    <String, dynamic>{
      'StakeholderTypeId': instance.stakeholderTypeId,
      'StakeholderTypeName': instance.stakeholderTypeName,
      'IsMasterDataSynced': instance.isMasterDataSynced,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
