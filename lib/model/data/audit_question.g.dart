// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_question.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAuditQuestionCollection on Isar {
  IsarCollection<AuditQuestion> get auditQuestions => this.collection();
}

const AuditQuestionSchema = CollectionSchema(
  name: r'AuditQuestion',
  id: -2264919554206462333,
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
    r'carId': PropertySchema(
      id: 2,
      name: r'carId',
      type: IsarType.long,
    ),
    r'carName': PropertySchema(
      id: 3,
      name: r'carName',
      type: IsarType.string,
    ),
    r'complianceId': PropertySchema(
      id: 4,
      name: r'complianceId',
      type: IsarType.long,
    ),
    r'complianceName': PropertySchema(
      id: 5,
      name: r'complianceName',
      type: IsarType.string,
    ),
    r'criteriaId': PropertySchema(
      id: 6,
      name: r'criteriaId',
      type: IsarType.long,
    ),
    r'criteriaName': PropertySchema(
      id: 7,
      name: r'criteriaName',
      type: IsarType.string,
    ),
    r'impactCausedId': PropertySchema(
      id: 8,
      name: r'impactCausedId',
      type: IsarType.long,
    ),
    r'impactCausedName': PropertySchema(
      id: 9,
      name: r'impactCausedName',
      type: IsarType.string,
    ),
    r'impactOnId': PropertySchema(
      id: 10,
      name: r'impactOnId',
      type: IsarType.long,
    ),
    r'impactOnName': PropertySchema(
      id: 11,
      name: r'impactOnName',
      type: IsarType.string,
    ),
    r'indicatorId': PropertySchema(
      id: 12,
      name: r'indicatorId',
      type: IsarType.long,
    ),
    r'indicatorName': PropertySchema(
      id: 13,
      name: r'indicatorName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 14,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isQuestionComplete': PropertySchema(
      id: 15,
      name: r'isQuestionComplete',
      type: IsarType.long,
    ),
    r'principleId': PropertySchema(
      id: 16,
      name: r'principleId',
      type: IsarType.long,
    ),
    r'principleName': PropertySchema(
      id: 17,
      name: r'principleName',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 18,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'questionValue': PropertySchema(
      id: 19,
      name: r'questionValue',
      type: IsarType.string,
    ),
    r'regionalManagerUnitId': PropertySchema(
      id: 20,
      name: r'regionalManagerUnitId',
      type: IsarType.long,
    ),
    r'severityId': PropertySchema(
      id: 21,
      name: r'severityId',
      type: IsarType.long,
    ),
    r'xBone': PropertySchema(
      id: 22,
      name: r'xBone',
      type: IsarType.bool,
    )
  },
  estimateSize: _auditQuestionEstimateSize,
  serialize: _auditQuestionSerialize,
  deserialize: _auditQuestionDeserialize,
  deserializeProp: _auditQuestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditQuestionGetId,
  getLinks: _auditQuestionGetLinks,
  attach: _auditQuestionAttach,
  version: '3.0.5',
);

int _auditQuestionEstimateSize(
  AuditQuestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.carName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.complianceName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.criteriaName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.impactCausedName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.impactOnName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.indicatorName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.principleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.questionValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _auditQuestionSerialize(
  AuditQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.auditId);
  writer.writeLong(offsets[1], object.auditTemplateId);
  writer.writeLong(offsets[2], object.carId);
  writer.writeString(offsets[3], object.carName);
  writer.writeLong(offsets[4], object.complianceId);
  writer.writeString(offsets[5], object.complianceName);
  writer.writeLong(offsets[6], object.criteriaId);
  writer.writeString(offsets[7], object.criteriaName);
  writer.writeLong(offsets[8], object.impactCausedId);
  writer.writeString(offsets[9], object.impactCausedName);
  writer.writeLong(offsets[10], object.impactOnId);
  writer.writeString(offsets[11], object.impactOnName);
  writer.writeLong(offsets[12], object.indicatorId);
  writer.writeString(offsets[13], object.indicatorName);
  writer.writeBool(offsets[14], object.isActive);
  writer.writeLong(offsets[15], object.isQuestionComplete);
  writer.writeLong(offsets[16], object.principleId);
  writer.writeString(offsets[17], object.principleName);
  writer.writeLong(offsets[18], object.questionId);
  writer.writeString(offsets[19], object.questionValue);
  writer.writeLong(offsets[20], object.regionalManagerUnitId);
  writer.writeLong(offsets[21], object.severityId);
  writer.writeBool(offsets[22], object.xBone);
}

AuditQuestion _auditQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditQuestion(
    auditId: reader.readLong(offsets[0]),
    auditTemplateId: reader.readLong(offsets[1]),
    carId: reader.readLongOrNull(offsets[2]),
    carName: reader.readStringOrNull(offsets[3]),
    complianceId: reader.readLongOrNull(offsets[4]),
    complianceName: reader.readStringOrNull(offsets[5]),
    criteriaId: reader.readLongOrNull(offsets[6]),
    criteriaName: reader.readStringOrNull(offsets[7]),
    impactCausedId: reader.readLongOrNull(offsets[8]),
    impactCausedName: reader.readStringOrNull(offsets[9]),
    impactOnId: reader.readLongOrNull(offsets[10]),
    impactOnName: reader.readStringOrNull(offsets[11]),
    indicatorId: reader.readLongOrNull(offsets[12]),
    indicatorName: reader.readStringOrNull(offsets[13]),
    isActive: reader.readBoolOrNull(offsets[14]),
    isQuestionComplete: reader.readLongOrNull(offsets[15]),
    principleId: reader.readLongOrNull(offsets[16]),
    principleName: reader.readStringOrNull(offsets[17]),
    questionId: reader.readLongOrNull(offsets[18]),
    questionValue: reader.readStringOrNull(offsets[19]),
    regionalManagerUnitId: reader.readLong(offsets[20]),
    severityId: reader.readLongOrNull(offsets[21]),
    xBone: reader.readBoolOrNull(offsets[22]),
  );
  return object;
}

P _auditQuestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readBoolOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    case 22:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditQuestionGetId(AuditQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditQuestionGetLinks(AuditQuestion object) {
  return [];
}

void _auditQuestionAttach(
    IsarCollection<dynamic> col, Id id, AuditQuestion object) {}

extension AuditQuestionQueryWhereSort
    on QueryBuilder<AuditQuestion, AuditQuestion, QWhere> {
  QueryBuilder<AuditQuestion, AuditQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditQuestionQueryWhere
    on QueryBuilder<AuditQuestion, AuditQuestion, QWhereClause> {
  QueryBuilder<AuditQuestion, AuditQuestion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterWhereClause> idBetween(
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

extension AuditQuestionQueryFilter
    on QueryBuilder<AuditQuestion, AuditQuestion, QFilterCondition> {
  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditIdGreaterThan(
    int value, {
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditIdLessThan(
    int value, {
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditTemplateIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditTemplateIdGreaterThan(
    int value, {
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditTemplateIdLessThan(
    int value, {
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      auditTemplateIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'carName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'carName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'carName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'carName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      carNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'carName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complianceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      complianceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'criteriaId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'criteriaId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'criteriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'criteriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'criteriaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'criteriaName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'criteriaName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'criteriaName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'criteriaName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      criteriaNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'criteriaName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactCausedId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactCausedId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactCausedId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactCausedName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactCausedName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactCausedNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactOnId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactOnId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactOnId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactOnName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactOnName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      impactOnNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'indicatorId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'indicatorId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'indicatorId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'indicatorId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'indicatorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'indicatorName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'indicatorName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'indicatorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'indicatorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      indicatorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'indicatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isQuestionCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isQuestionCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isQuestionCompleteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isQuestionComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isQuestionCompleteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isQuestionComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isQuestionCompleteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isQuestionComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      isQuestionCompleteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isQuestionComplete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'principleId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'principleId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'principleId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'principleId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'principleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'principleName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'principleName',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'principleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'principleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      principleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'principleName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionValue',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionValue',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      questionValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      regionalManagerUnitIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      severityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'severityId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      severityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'severityId',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      severityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      severityIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      severityIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      severityIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'severityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      xBoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xBone',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      xBoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xBone',
      ));
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterFilterCondition>
      xBoneEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xBone',
        value: value,
      ));
    });
  }
}

extension AuditQuestionQueryObject
    on QueryBuilder<AuditQuestion, AuditQuestion, QFilterCondition> {}

extension AuditQuestionQueryLinks
    on QueryBuilder<AuditQuestion, AuditQuestion, QFilterCondition> {}

extension AuditQuestionQuerySortBy
    on QueryBuilder<AuditQuestion, AuditQuestion, QSortBy> {
  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByCarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByCarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByCarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByCarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByCriteriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByCriteriaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByCriteriaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByIndicatorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByIndicatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByIndicatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByPrincipleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByPrincipleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByPrincipleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByQuestionValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByQuestionValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      sortBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> sortByXBoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.desc);
    });
  }
}

extension AuditQuestionQuerySortThenBy
    on QueryBuilder<AuditQuestion, AuditQuestion, QSortThenBy> {
  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByCarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByCarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByCarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByCarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByCriteriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByCriteriaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByCriteriaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByIndicatorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByIndicatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByIndicatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByPrincipleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByPrincipleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByPrincipleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByQuestionValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByQuestionValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy>
      thenBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QAfterSortBy> thenByXBoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.desc);
    });
  }
}

extension AuditQuestionQueryWhereDistinct
    on QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> {
  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByCarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByCarName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByComplianceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criteriaId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByCriteriaName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criteriaName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByImpactCausedName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByImpactOnName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'indicatorId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByIndicatorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'indicatorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isQuestionComplete');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principleId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByPrincipleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principleName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByQuestionValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct>
      distinctByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'severityId');
    });
  }

  QueryBuilder<AuditQuestion, AuditQuestion, QDistinct> distinctByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xBone');
    });
  }
}

extension AuditQuestionQueryProperty
    on QueryBuilder<AuditQuestion, AuditQuestion, QQueryProperty> {
  QueryBuilder<AuditQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditQuestion, int, QQueryOperations> auditIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditId');
    });
  }

  QueryBuilder<AuditQuestion, int, QQueryOperations> auditTemplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateId');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> carIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations> carNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carName');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> complianceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations>
      complianceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceName');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> criteriaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criteriaId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations>
      criteriaNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criteriaName');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> impactCausedIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations>
      impactCausedNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedName');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> impactOnIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations>
      impactOnNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnName');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> indicatorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'indicatorId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations>
      indicatorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'indicatorName');
    });
  }

  QueryBuilder<AuditQuestion, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations>
      isQuestionCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isQuestionComplete');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> principleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principleId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations>
      principleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principleName');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<AuditQuestion, String?, QQueryOperations>
      questionValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionValue');
    });
  }

  QueryBuilder<AuditQuestion, int, QQueryOperations>
      regionalManagerUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<AuditQuestion, int?, QQueryOperations> severityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'severityId');
    });
  }

  QueryBuilder<AuditQuestion, bool?, QQueryOperations> xBoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xBone');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuditQuestion _$$_AuditQuestionFromJson(Map<String, dynamic> json) =>
    _$_AuditQuestion(
      auditId: json['AuditId'] as int,
      regionalManagerUnitId: json['RegionalManagerUnitId'] as int,
      auditTemplateId: json['AuditTemplateId'] as int,
      questionId: json['QuestionId'] as int?,
      questionValue: json['QuestionValue'] as String?,
      principleId: json['PrincipleId'] as int?,
      indicatorId: json['IndicatorId'] as int?,
      carId: json['CarId'] as int?,
      criteriaId: json['CriteriaId'] as int?,
      criteriaName: json['CriteriaName'] as String?,
      carName: json['CarName'] as String?,
      principleName: json['PrincipleName'] as String?,
      indicatorName: json['IndicatorName'] as String?,
      severityId: json['SeverityId'] as int?,
      impactOnId: json['ImpactOnId'] as int?,
      impactOnName: json['ImpactOnName'] as String?,
      impactCausedName: json['ImpactCausedName'] as String?,
      impactCausedId: json['ImpactCausedId'] as int?,
      xBone: json['XBone'] as bool?,
      complianceName: json['ComplianceName'] as String?,
      complianceId: json['ComplianceId'] as int?,
      isQuestionComplete: json['IsQuestionComplete'] as int?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_AuditQuestionToJson(_$_AuditQuestion instance) =>
    <String, dynamic>{
      'AuditId': instance.auditId,
      'RegionalManagerUnitId': instance.regionalManagerUnitId,
      'AuditTemplateId': instance.auditTemplateId,
      'QuestionId': instance.questionId,
      'QuestionValue': instance.questionValue,
      'PrincipleId': instance.principleId,
      'IndicatorId': instance.indicatorId,
      'CarId': instance.carId,
      'CriteriaId': instance.criteriaId,
      'CriteriaName': instance.criteriaName,
      'CarName': instance.carName,
      'PrincipleName': instance.principleName,
      'IndicatorName': instance.indicatorName,
      'SeverityId': instance.severityId,
      'ImpactOnId': instance.impactOnId,
      'ImpactOnName': instance.impactOnName,
      'ImpactCausedName': instance.impactCausedName,
      'ImpactCausedId': instance.impactCausedId,
      'XBone': instance.xBone,
      'ComplianceName': instance.complianceName,
      'ComplianceId': instance.complianceId,
      'IsQuestionComplete': instance.isQuestionComplete,
      'IsActive': instance.isActive,
    };
