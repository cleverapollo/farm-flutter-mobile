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
    r'auditTemplateId': PropertySchema(
      id: 1,
      name: r'auditTemplateId',
      type: IsarType.long,
    ),
    r'auditTemplateName': PropertySchema(
      id: 2,
      name: r'auditTemplateName',
      type: IsarType.string,
    ),
    r'compartmentId': PropertySchema(
      id: 3,
      name: r'compartmentId',
      type: IsarType.long,
    ),
    r'compartmentName': PropertySchema(
      id: 4,
      name: r'compartmentName',
      type: IsarType.string,
    ),
    r'completed': PropertySchema(
      id: 5,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'createDT': PropertySchema(
      id: 6,
      name: r'createDT',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 7,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 8,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'siteId': PropertySchema(
      id: 9,
      name: r'siteId',
      type: IsarType.long,
    ),
    r'siteName': PropertySchema(
      id: 10,
      name: r'siteName',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.long,
    ),
    r'updateDT': PropertySchema(
      id: 12,
      name: r'updateDT',
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
    final value = object.auditTemplateName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.compartmentName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createDT;
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
  {
    final value = object.updateDT;
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
  writer.writeLong(offsets[1], object.auditTemplateId);
  writer.writeString(offsets[2], object.auditTemplateName);
  writer.writeLong(offsets[3], object.compartmentId);
  writer.writeString(offsets[4], object.compartmentName);
  writer.writeBool(offsets[5], object.completed);
  writer.writeString(offsets[6], object.createDT);
  writer.writeBool(offsets[7], object.isActive);
  writer.writeBool(offsets[8], object.isLocal);
  writer.writeLong(offsets[9], object.siteId);
  writer.writeString(offsets[10], object.siteName);
  writer.writeLong(offsets[11], object.status);
  writer.writeString(offsets[12], object.updateDT);
}

Audit _auditDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Audit(
    auditId: reader.readLongOrNull(offsets[0]),
    auditTemplateId: reader.readLongOrNull(offsets[1]),
    auditTemplateName: reader.readStringOrNull(offsets[2]),
    compartmentId: reader.readLongOrNull(offsets[3]),
    compartmentName: reader.readStringOrNull(offsets[4]),
    completed: reader.readBoolOrNull(offsets[5]),
    createDT: reader.readStringOrNull(offsets[6]),
    isActive: reader.readBoolOrNull(offsets[7]),
    isLocal: reader.readBoolOrNull(offsets[8]),
    siteId: reader.readLongOrNull(offsets[9]),
    siteName: reader.readStringOrNull(offsets[10]),
    status: reader.readLongOrNull(offsets[11]),
    updateDT: reader.readStringOrNull(offsets[12]),
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
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditTemplateId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditTemplateId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateIdGreaterThan(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateIdLessThan(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateIdBetween(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditTemplateName',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition>
      auditTemplateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditTemplateName',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition>
      auditTemplateNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auditTemplateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'auditTemplateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> auditTemplateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition>
      auditTemplateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'auditTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compartmentId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compartmentId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> compartmentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compartmentId',
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> completedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completed',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> completedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completed',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> completedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completed',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> createDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDT',
        value: '',
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siteId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siteId',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siteId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> siteIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> statusEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> statusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> statusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> updateDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDT',
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

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByAuditTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByAuditTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCompartmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.desc);
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

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
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

  QueryBuilder<Audit, Audit, QAfterSortBy> sortBySiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortBySiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.desc);
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

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
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

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByAuditTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByAuditTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCompartmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.desc);
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

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
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

  QueryBuilder<Audit, Audit, QAfterSortBy> thenBySiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenBySiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.desc);
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

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }
}

extension AuditQueryWhereDistinct on QueryBuilder<Audit, Audit, QDistinct> {
  QueryBuilder<Audit, Audit, QDistinct> distinctByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditId');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateId');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByAuditTemplateName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compartmentId');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByCompartmentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compartmentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completed');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByCreateDT(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT', caseSensitive: caseSensitive);
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

  QueryBuilder<Audit, Audit, QDistinct> distinctBySiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siteId');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctBySiteName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siteName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByUpdateDT(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT', caseSensitive: caseSensitive);
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

  QueryBuilder<Audit, int?, QQueryOperations> auditTemplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateId');
    });
  }

  QueryBuilder<Audit, String?, QQueryOperations> auditTemplateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateName');
    });
  }

  QueryBuilder<Audit, int?, QQueryOperations> compartmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compartmentId');
    });
  }

  QueryBuilder<Audit, String?, QQueryOperations> compartmentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compartmentName');
    });
  }

  QueryBuilder<Audit, bool?, QQueryOperations> completedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completed');
    });
  }

  QueryBuilder<Audit, String?, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
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

  QueryBuilder<Audit, int?, QQueryOperations> siteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siteId');
    });
  }

  QueryBuilder<Audit, String?, QQueryOperations> siteNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siteName');
    });
  }

  QueryBuilder<Audit, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Audit, String?, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Audit _$$_AuditFromJson(Map<String, dynamic> json) => _$_Audit(
      auditId: json['AuditId'] as int?,
      auditTemplateName: json['AuditTemplateName'] as String?,
      auditTemplateId: json['AuditTemplateId'] as int?,
      compartmentName: json['CompartmentName'] as String?,
      compartmentId: json['CompartmentId'] as int?,
      siteName: json['SiteName'] as String?,
      siteId: json['SiteId'] as int?,
      completed: json['Completed'] as bool?,
      createDT: json['CreateDT'] as String?,
      updateDT: json['UpdateDT'] as String?,
      status: json['Status'] as int? ?? 1,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AuditToJson(_$_Audit instance) => <String, dynamic>{
      'AuditId': instance.auditId,
      'AuditTemplateName': instance.auditTemplateName,
      'AuditTemplateId': instance.auditTemplateId,
      'CompartmentName': instance.compartmentName,
      'CompartmentId': instance.compartmentId,
      'SiteName': instance.siteName,
      'SiteId': instance.siteId,
      'Completed': instance.completed,
      'CreateDT': instance.createDT,
      'UpdateDT': instance.updateDT,
      'Status': instance.status,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
