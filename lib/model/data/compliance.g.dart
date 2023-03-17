// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compliance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetComplianceCollection on Isar {
  IsarCollection<Compliance> get compliances => this.collection();
}

const ComplianceSchema = CollectionSchema(
  name: r'Compliance',
  id: 7301354547899538900,
  properties: {
    r'companyId': PropertySchema(
      id: 0,
      name: r'companyId',
      type: IsarType.long,
    ),
    r'complianceId': PropertySchema(
      id: 1,
      name: r'complianceId',
      type: IsarType.long,
    ),
    r'complianceName': PropertySchema(
      id: 2,
      name: r'complianceName',
      type: IsarType.string,
    ),
    r'hasRejectReason': PropertySchema(
      id: 3,
      name: r'hasRejectReason',
      type: IsarType.bool,
    ),
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'jobCategoryId': PropertySchema(
      id: 5,
      name: r'jobCategoryId',
      type: IsarType.long,
    )
  },
  estimateSize: _complianceEstimateSize,
  serialize: _complianceSerialize,
  deserialize: _complianceDeserialize,
  deserializeProp: _complianceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _complianceGetId,
  getLinks: _complianceGetLinks,
  attach: _complianceAttach,
  version: '3.0.5',
);

int _complianceEstimateSize(
  Compliance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.complianceName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _complianceSerialize(
  Compliance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyId);
  writer.writeLong(offsets[1], object.complianceId);
  writer.writeString(offsets[2], object.complianceName);
  writer.writeBool(offsets[3], object.hasRejectReason);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeLong(offsets[5], object.jobCategoryId);
}

Compliance _complianceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Compliance(
    companyId: reader.readLongOrNull(offsets[0]),
    complianceId: reader.readLong(offsets[1]),
    complianceName: reader.readStringOrNull(offsets[2]),
    hasRejectReason: reader.readBoolOrNull(offsets[3]),
    isActive: reader.readBoolOrNull(offsets[4]),
    jobCategoryId: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _complianceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _complianceGetId(Compliance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _complianceGetLinks(Compliance object) {
  return [];
}

void _complianceAttach(IsarCollection<dynamic> col, Id id, Compliance object) {}

extension ComplianceQueryWhereSort
    on QueryBuilder<Compliance, Compliance, QWhere> {
  QueryBuilder<Compliance, Compliance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ComplianceQueryWhere
    on QueryBuilder<Compliance, Compliance, QWhereClause> {
  QueryBuilder<Compliance, Compliance, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Compliance, Compliance, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterWhereClause> idBetween(
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

extension ComplianceQueryFilter
    on QueryBuilder<Compliance, Compliance, QFilterCondition> {
  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      companyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      companyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> companyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      companyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> companyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> companyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'complianceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'complianceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complianceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      complianceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      hasRejectReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasRejectReason',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      hasRejectReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasRejectReason',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      hasRejectReasonEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasRejectReason',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      jobCategoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobCategoryId',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      jobCategoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobCategoryId',
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      jobCategoryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      jobCategoryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      jobCategoryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterFilterCondition>
      jobCategoryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobCategoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ComplianceQueryObject
    on QueryBuilder<Compliance, Compliance, QFilterCondition> {}

extension ComplianceQueryLinks
    on QueryBuilder<Compliance, Compliance, QFilterCondition> {}

extension ComplianceQuerySortBy
    on QueryBuilder<Compliance, Compliance, QSortBy> {
  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy>
      sortByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByHasRejectReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy>
      sortByHasRejectReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> sortByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }
}

extension ComplianceQuerySortThenBy
    on QueryBuilder<Compliance, Compliance, QSortThenBy> {
  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy>
      thenByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByHasRejectReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy>
      thenByHasRejectReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<Compliance, Compliance, QAfterSortBy> thenByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }
}

extension ComplianceQueryWhereDistinct
    on QueryBuilder<Compliance, Compliance, QDistinct> {
  QueryBuilder<Compliance, Compliance, QDistinct> distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<Compliance, Compliance, QDistinct> distinctByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceId');
    });
  }

  QueryBuilder<Compliance, Compliance, QDistinct> distinctByComplianceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compliance, Compliance, QDistinct> distinctByHasRejectReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasRejectReason');
    });
  }

  QueryBuilder<Compliance, Compliance, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Compliance, Compliance, QDistinct> distinctByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobCategoryId');
    });
  }
}

extension ComplianceQueryProperty
    on QueryBuilder<Compliance, Compliance, QQueryProperty> {
  QueryBuilder<Compliance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Compliance, int?, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<Compliance, int, QQueryOperations> complianceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceId');
    });
  }

  QueryBuilder<Compliance, String?, QQueryOperations> complianceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceName');
    });
  }

  QueryBuilder<Compliance, bool?, QQueryOperations> hasRejectReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasRejectReason');
    });
  }

  QueryBuilder<Compliance, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Compliance, int?, QQueryOperations> jobCategoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobCategoryId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Compliance _$$_ComplianceFromJson(Map<String, dynamic> json) =>
    _$_Compliance(
      complianceId: json['ComplianceId'] as int,
      complianceName: json['ComplianceName'] as String?,
      companyId: json['CompanyId'] as int?,
      hasRejectReason: json['HasRejectReason'] as bool?,
      jobCategoryId: json['JobCategoryId'] as int?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ComplianceToJson(_$_Compliance instance) =>
    <String, dynamic>{
      'ComplianceId': instance.complianceId,
      'ComplianceName': instance.complianceName,
      'CompanyId': instance.companyId,
      'HasRejectReason': instance.hasRejectReason,
      'JobCategoryId': instance.jobCategoryId,
      'IsActive': instance.isActive,
    };
