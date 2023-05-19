// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk_profile_question.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRiskProfileQuestionCollection on Isar {
  IsarCollection<RiskProfileQuestion> get riskProfileQuestions =>
      this.collection();
}

const RiskProfileQuestionSchema = CollectionSchema(
  name: r'RiskProfileQuestion',
  id: 5424811457491702542,
  properties: {
    r'groupSchemeId': PropertySchema(
      id: 0,
      name: r'groupSchemeId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 1,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 2,
      name: r'isMasterDataSynced',
      type: IsarType.bool,
    ),
    r'riskProfileQuestionId': PropertySchema(
      id: 3,
      name: r'riskProfileQuestionId',
      type: IsarType.long,
    ),
    r'riskProfileQuestionName': PropertySchema(
      id: 4,
      name: r'riskProfileQuestionName',
      type: IsarType.string,
    )
  },
  estimateSize: _riskProfileQuestionEstimateSize,
  serialize: _riskProfileQuestionSerialize,
  deserialize: _riskProfileQuestionDeserialize,
  deserializeProp: _riskProfileQuestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _riskProfileQuestionGetId,
  getLinks: _riskProfileQuestionGetLinks,
  attach: _riskProfileQuestionAttach,
  version: '3.0.5',
);

int _riskProfileQuestionEstimateSize(
  RiskProfileQuestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.riskProfileQuestionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _riskProfileQuestionSerialize(
  RiskProfileQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.groupSchemeId);
  writer.writeBool(offsets[1], object.isActive);
  writer.writeBool(offsets[2], object.isMasterDataSynced);
  writer.writeLong(offsets[3], object.riskProfileQuestionId);
  writer.writeString(offsets[4], object.riskProfileQuestionName);
}

RiskProfileQuestion _riskProfileQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RiskProfileQuestion(
    groupSchemeId: reader.readLongOrNull(offsets[0]),
    isActive: reader.readBoolOrNull(offsets[1]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[2]),
    riskProfileQuestionId: reader.readLong(offsets[3]),
    riskProfileQuestionName: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _riskProfileQuestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _riskProfileQuestionGetId(RiskProfileQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _riskProfileQuestionGetLinks(
    RiskProfileQuestion object) {
  return [];
}

void _riskProfileQuestionAttach(
    IsarCollection<dynamic> col, Id id, RiskProfileQuestion object) {}

extension RiskProfileQuestionQueryWhereSort
    on QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QWhere> {
  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RiskProfileQuestionQueryWhere
    on QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QWhereClause> {
  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterWhereClause>
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

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterWhereClause>
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

extension RiskProfileQuestionQueryFilter on QueryBuilder<RiskProfileQuestion,
    RiskProfileQuestion, QFilterCondition> {
  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
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

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
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

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
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

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
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

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
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

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
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

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riskProfileQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'riskProfileQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'riskProfileQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'riskProfileQuestionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'riskProfileQuestionName',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'riskProfileQuestionName',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riskProfileQuestionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'riskProfileQuestionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'riskProfileQuestionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'riskProfileQuestionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'riskProfileQuestionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'riskProfileQuestionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'riskProfileQuestionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'riskProfileQuestionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riskProfileQuestionName',
        value: '',
      ));
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterFilterCondition>
      riskProfileQuestionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'riskProfileQuestionName',
        value: '',
      ));
    });
  }
}

extension RiskProfileQuestionQueryObject on QueryBuilder<RiskProfileQuestion,
    RiskProfileQuestion, QFilterCondition> {}

extension RiskProfileQuestionQueryLinks on QueryBuilder<RiskProfileQuestion,
    RiskProfileQuestion, QFilterCondition> {}

extension RiskProfileQuestionQuerySortBy
    on QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QSortBy> {
  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByRiskProfileQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionId', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByRiskProfileQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionId', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByRiskProfileQuestionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionName', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      sortByRiskProfileQuestionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionName', Sort.desc);
    });
  }
}

extension RiskProfileQuestionQuerySortThenBy
    on QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QSortThenBy> {
  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByRiskProfileQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionId', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByRiskProfileQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionId', Sort.desc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByRiskProfileQuestionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionName', Sort.asc);
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QAfterSortBy>
      thenByRiskProfileQuestionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskProfileQuestionName', Sort.desc);
    });
  }
}

extension RiskProfileQuestionQueryWhereDistinct
    on QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QDistinct> {
  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QDistinct>
      distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QDistinct>
      distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QDistinct>
      distinctByRiskProfileQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'riskProfileQuestionId');
    });
  }

  QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QDistinct>
      distinctByRiskProfileQuestionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'riskProfileQuestionName',
          caseSensitive: caseSensitive);
    });
  }
}

extension RiskProfileQuestionQueryProperty
    on QueryBuilder<RiskProfileQuestion, RiskProfileQuestion, QQueryProperty> {
  QueryBuilder<RiskProfileQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RiskProfileQuestion, int?, QQueryOperations>
      groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<RiskProfileQuestion, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RiskProfileQuestion, bool?, QQueryOperations>
      isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }

  QueryBuilder<RiskProfileQuestion, int, QQueryOperations>
      riskProfileQuestionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'riskProfileQuestionId');
    });
  }

  QueryBuilder<RiskProfileQuestion, String?, QQueryOperations>
      riskProfileQuestionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'riskProfileQuestionName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RiskProfileQuestion _$$_RiskProfileQuestionFromJson(
        Map<String, dynamic> json) =>
    _$_RiskProfileQuestion(
      riskProfileQuestionName: json['RiskProfileQuestionName'] as String?,
      groupSchemeId: json['GroupSchemeId'] as int?,
      riskProfileQuestionId: json['RiskProfileQuestionId'] as int,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterdataSynced'] as bool?,
    );

Map<String, dynamic> _$$_RiskProfileQuestionToJson(
        _$_RiskProfileQuestion instance) =>
    <String, dynamic>{
      'RiskProfileQuestionName': instance.riskProfileQuestionName,
      'GroupSchemeId': instance.groupSchemeId,
      'RiskProfileQuestionId': instance.riskProfileQuestionId,
      'IsActive': instance.isActive,
      'IsMasterdataSynced': instance.isMasterDataSynced,
    };
