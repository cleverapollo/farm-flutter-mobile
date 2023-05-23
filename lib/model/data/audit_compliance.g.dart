// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_compliance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAuditComplianceCollection on Isar {
  IsarCollection<AuditCompliance> get auditCompliances => this.collection();
}

const AuditComplianceSchema = CollectionSchema(
  name: r'AuditCompliance',
  id: -5454840801626637688,
  properties: {
    r'auditTemplateId': PropertySchema(
      id: 0,
      name: r'auditTemplateId',
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
    r'regionalManagerUnitId': PropertySchema(
      id: 5,
      name: r'regionalManagerUnitId',
      type: IsarType.long,
    ),
    r'rejectReasonId': PropertySchema(
      id: 6,
      name: r'rejectReasonId',
      type: IsarType.long,
    )
  },
  estimateSize: _auditComplianceEstimateSize,
  serialize: _auditComplianceSerialize,
  deserialize: _auditComplianceDeserialize,
  deserializeProp: _auditComplianceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditComplianceGetId,
  getLinks: _auditComplianceGetLinks,
  attach: _auditComplianceAttach,
  version: '3.1.0',
);

int _auditComplianceEstimateSize(
  AuditCompliance object,
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

void _auditComplianceSerialize(
  AuditCompliance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.auditTemplateId);
  writer.writeLong(offsets[1], object.complianceId);
  writer.writeString(offsets[2], object.complianceName);
  writer.writeBool(offsets[3], object.hasRejectReason);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeLong(offsets[5], object.regionalManagerUnitId);
  writer.writeLong(offsets[6], object.rejectReasonId);
}

AuditCompliance _auditComplianceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditCompliance(
    auditTemplateId: reader.readLongOrNull(offsets[0]),
    complianceId: reader.readLongOrNull(offsets[1]),
    complianceName: reader.readStringOrNull(offsets[2]),
    hasRejectReason: reader.readBoolOrNull(offsets[3]),
    isActive: reader.readBoolOrNull(offsets[4]),
    regionalManagerUnitId: reader.readLongOrNull(offsets[5]),
    rejectReasonId: reader.readLongOrNull(offsets[6]),
  );
  return object;
}

P _auditComplianceDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditComplianceGetId(AuditCompliance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditComplianceGetLinks(AuditCompliance object) {
  return [];
}

void _auditComplianceAttach(
    IsarCollection<dynamic> col, Id id, AuditCompliance object) {}

extension AuditComplianceQueryWhereSort
    on QueryBuilder<AuditCompliance, AuditCompliance, QWhere> {
  QueryBuilder<AuditCompliance, AuditCompliance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditComplianceQueryWhere
    on QueryBuilder<AuditCompliance, AuditCompliance, QWhereClause> {
  QueryBuilder<AuditCompliance, AuditCompliance, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterWhereClause>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterWhereClause> idBetween(
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

extension AuditComplianceQueryFilter
    on QueryBuilder<AuditCompliance, AuditCompliance, QFilterCondition> {
  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      auditTemplateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditTemplateId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      auditTemplateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditTemplateId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      auditTemplateIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      auditTemplateIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      auditTemplateIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      auditTemplateIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auditTemplateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceIdGreaterThan(
    int? value, {
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceIdLessThan(
    int? value, {
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complianceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      complianceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      hasRejectReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasRejectReason',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      hasRejectReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasRejectReason',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      hasRejectReasonEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasRejectReason',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      regionalManagerUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      regionalManagerUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      regionalManagerUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      regionalManagerUnitIdGreaterThan(
    int? value, {
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      regionalManagerUnitIdLessThan(
    int? value, {
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      regionalManagerUnitIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      rejectReasonIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rejectReasonId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      rejectReasonIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rejectReasonId',
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      rejectReasonIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      rejectReasonIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      rejectReasonIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterFilterCondition>
      rejectReasonIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rejectReasonId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AuditComplianceQueryObject
    on QueryBuilder<AuditCompliance, AuditCompliance, QFilterCondition> {}

extension AuditComplianceQueryLinks
    on QueryBuilder<AuditCompliance, AuditCompliance, QFilterCondition> {}

extension AuditComplianceQuerySortBy
    on QueryBuilder<AuditCompliance, AuditCompliance, QSortBy> {
  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByHasRejectReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByHasRejectReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      sortByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }
}

extension AuditComplianceQuerySortThenBy
    on QueryBuilder<AuditCompliance, AuditCompliance, QSortThenBy> {
  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByHasRejectReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByHasRejectReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRejectReason', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QAfterSortBy>
      thenByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }
}

extension AuditComplianceQueryWhereDistinct
    on QueryBuilder<AuditCompliance, AuditCompliance, QDistinct> {
  QueryBuilder<AuditCompliance, AuditCompliance, QDistinct>
      distinctByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateId');
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QDistinct>
      distinctByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceId');
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QDistinct>
      distinctByComplianceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QDistinct>
      distinctByHasRejectReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasRejectReason');
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QDistinct>
      distinctByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<AuditCompliance, AuditCompliance, QDistinct>
      distinctByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectReasonId');
    });
  }
}

extension AuditComplianceQueryProperty
    on QueryBuilder<AuditCompliance, AuditCompliance, QQueryProperty> {
  QueryBuilder<AuditCompliance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditCompliance, int?, QQueryOperations>
      auditTemplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateId');
    });
  }

  QueryBuilder<AuditCompliance, int?, QQueryOperations> complianceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceId');
    });
  }

  QueryBuilder<AuditCompliance, String?, QQueryOperations>
      complianceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceName');
    });
  }

  QueryBuilder<AuditCompliance, bool?, QQueryOperations>
      hasRejectReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasRejectReason');
    });
  }

  QueryBuilder<AuditCompliance, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<AuditCompliance, int?, QQueryOperations>
      regionalManagerUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<AuditCompliance, int?, QQueryOperations>
      rejectReasonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectReasonId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuditCompliance _$$_AuditComplianceFromJson(Map<String, dynamic> json) =>
    _$_AuditCompliance(
      complianceName: json['ComplianceName'] as String?,
      complianceId: json['ComplianceId'] as int?,
      hasRejectReason: json['HasRejectReason'] as bool?,
      regionalManagerUnitId: json['RegionalManagerUnitId'] as int?,
      auditTemplateId: json['AuditTemplateId'] as int?,
      rejectReasonId: json['RejectReasonId'] as int?,
      isActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AuditComplianceToJson(_$_AuditCompliance instance) =>
    <String, dynamic>{
      'ComplianceName': instance.complianceName,
      'ComplianceId': instance.complianceId,
      'HasRejectReason': instance.hasRejectReason,
      'RegionalManagerUnitId': instance.regionalManagerUnitId,
      'AuditTemplateId': instance.auditTemplateId,
      'RejectReasonId': instance.rejectReasonId,
      'IsActive': instance.isActive,
    };
