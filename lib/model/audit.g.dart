// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAuditCollection on Isar {
  IsarCollection<Audit> get audits => this.collection();
}

const AuditSchema = CollectionSchema(
  name: r'Audit',
  id: -7922666049281415834,
  properties: {
    r'auditId': PropertySchema(
      id: 0,
      name: r'auditId',
      type: IsarType.long,
    ),
    r'compartmentName': PropertySchema(
      id: 1,
      name: r'compartmentName',
      type: IsarType.string,
    ),
    r'createTime': PropertySchema(
      id: 2,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 4,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'siteName': PropertySchema(
      id: 5,
      name: r'siteName',
      type: IsarType.string,
    )
  },
  estimateSize: _auditEstimateSize,
  serialize: _auditSerialize,
  deserialize: _auditDeserialize,
  deserializeProp: _auditDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditGetId,
  getLinks: _auditGetLinks,
  attach: _auditAttach,
  version: '3.0.5',
);

int _auditEstimateSize(
  Audit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.compartmentName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siteName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _auditSerialize(
  Audit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.auditId);
  writer.writeString(offsets[1], object.compartmentName);
  writer.writeDateTime(offsets[2], object.createTime);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeBool(offsets[4], object.isLocal);
  writer.writeString(offsets[5], object.siteName);
}

Audit _auditDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Audit(
    auditId: reader.readLongOrNull(offsets[0]),
    compartmentName: reader.readStringOrNull(offsets[1]),
    createTime: reader.readDateTimeOrNull(offsets[2]),
    isActive: reader.readBoolOrNull(offsets[3]),
    isLocal: reader.readBoolOrNull(offsets[4]),
    siteName: reader.readStringOrNull(offsets[5]),
  );
  return object;
}

P _auditDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditGetId(Audit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditGetLinks(Audit object) {
  return [];
}

void _auditAttach(IsarCollection<dynamic> col, Id id, Audit object) {}

extension AuditQueryWhereSort on QueryBuilder<Audit, Audit, QWhere> {
  QueryBuilder<Audit, Audit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditQueryWhere on QueryBuilder<Audit, Audit, QWhereClause> {
  QueryBuilder<Audit, Audit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Audit, Audit, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Audit, Audit, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Audit, Audit, QAfterWhereClause> idBetween(
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

extension AuditQueryFilter on QueryBuilder<Audit, Audit, QFilterCondition> {
  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auditId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auditId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auditId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compartmentName',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compartmentName',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compartmentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'compartmentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition>
      compartmentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'compartmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createTime',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createTime',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> isLocalEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siteName',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siteName',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siteName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siteName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siteName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siteName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siteName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siteName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siteName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siteName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siteName',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siteName',
        value: '',
      ));
    });
  }
}

extension AuditQueryObject on QueryBuilder<Audit, Audit, QFilterCondition> {}

extension AuditQueryLinks on QueryBuilder<Audit, Audit, QFilterCondition> {}

extension AuditQuerySortBy on QueryBuilder<Audit, Audit, QSortBy> {
  QueryBuilder<Audit, Audit, QAfterSortBy> sortByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCompartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCompartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortBySiteName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteName', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortBySiteNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteName', Sort.desc);
    });
  }
}

extension AuditQuerySortThenBy on QueryBuilder<Audit, Audit, QSortThenBy> {
  QueryBuilder<Audit, Audit, QAfterSortBy> thenByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCompartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCompartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenBySiteName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteName', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenBySiteNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteName', Sort.desc);
    });
  }
}

extension AuditQueryWhereDistinct on QueryBuilder<Audit, Audit, QDistinct> {
  QueryBuilder<Audit, Audit, QDistinct> distinctByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditId');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByCompartmentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compartmentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctBySiteName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siteName', caseSensitive: caseSensitive);
    });
  }
}

extension AuditQueryProperty on QueryBuilder<Audit, Audit, QQueryProperty> {
  QueryBuilder<Audit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Audit, int?, QQueryOperations> auditIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditId');
    });
  }

  QueryBuilder<Audit, String?, QQueryOperations> compartmentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compartmentName');
    });
  }

  QueryBuilder<Audit, DateTime?, QQueryOperations> createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<Audit, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Audit, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<Audit, String?, QQueryOperations> siteNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siteName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Audit _$$_AuditFromJson(Map<String, dynamic> json) => _$_Audit(
      auditId: json['AuditId'] as int?,
      createTime: json['CreateTime'] == null
          ? null
          : DateTime.parse(json['CreateTime'] as String),
      compartmentName: json['CompartmentName'] as String?,
      siteName: json['SiteName'] as String?,
      isActive: json['IsActive'] as bool?,
      isLocal: json['IsLocal'] as bool?,
    );

Map<String, dynamic> _$$_AuditToJson(_$_Audit instance) => <String, dynamic>{
      'AuditId': instance.auditId,
      'CreateTime': instance.createTime?.toIso8601String(),
      'CompartmentName': instance.compartmentName,
      'SiteName': instance.siteName,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
