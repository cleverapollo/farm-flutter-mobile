// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_question.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmQuestionCollection on Isar {
  IsarCollection<FarmQuestion> get farmQuestions => this.collection();
}

const FarmQuestionSchema = CollectionSchema(
  name: r'FarmQuestion',
  id: 7475302381787362134,
  properties: {
    r'auditTemplateId': PropertySchema(
      id: 0,
      name: r'auditTemplateId',
      type: IsarType.long,
    ),
    r'auditTemplateName': PropertySchema(
      id: 1,
      name: r'auditTemplateName',
      type: IsarType.string,
    ),
    r'complianceId': PropertySchema(
      id: 2,
      name: r'complianceId',
      type: IsarType.long,
    ),
    r'complianceName': PropertySchema(
      id: 3,
      name: r'complianceName',
      type: IsarType.string,
    ),
    r'criteriaId': PropertySchema(
      id: 4,
      name: r'criteriaId',
      type: IsarType.long,
    ),
    r'criteriaName': PropertySchema(
      id: 5,
      name: r'criteriaName',
      type: IsarType.string,
    ),
    r'impactCausedId': PropertySchema(
      id: 6,
      name: r'impactCausedId',
      type: IsarType.long,
    ),
    r'impactCausedName': PropertySchema(
      id: 7,
      name: r'impactCausedName',
      type: IsarType.string,
    ),
    r'impactOnId': PropertySchema(
      id: 8,
      name: r'impactOnId',
      type: IsarType.long,
    ),
    r'impactOnName': PropertySchema(
      id: 9,
      name: r'impactOnName',
      type: IsarType.string,
    ),
    r'indicatorId': PropertySchema(
      id: 10,
      name: r'indicatorId',
      type: IsarType.long,
    ),
    r'indicatorName': PropertySchema(
      id: 11,
      name: r'indicatorName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 12,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isQuestionComplete': PropertySchema(
      id: 13,
      name: r'isQuestionComplete',
      type: IsarType.long,
    ),
    r'mmmId': PropertySchema(
      id: 14,
      name: r'mmmId',
      type: IsarType.long,
    ),
    r'mmmName': PropertySchema(
      id: 15,
      name: r'mmmName',
      type: IsarType.string,
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
  estimateSize: _farmQuestionEstimateSize,
  serialize: _farmQuestionSerialize,
  deserialize: _farmQuestionDeserialize,
  deserializeProp: _farmQuestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmQuestionGetId,
  getLinks: _farmQuestionGetLinks,
  attach: _farmQuestionAttach,
  version: '3.0.5',
);

int _farmQuestionEstimateSize(
  FarmQuestion object,
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
    final value = object.mmmName;
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

void _farmQuestionSerialize(
  FarmQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.auditTemplateId);
  writer.writeString(offsets[1], object.auditTemplateName);
  writer.writeLong(offsets[2], object.complianceId);
  writer.writeString(offsets[3], object.complianceName);
  writer.writeLong(offsets[4], object.criteriaId);
  writer.writeString(offsets[5], object.criteriaName);
  writer.writeLong(offsets[6], object.impactCausedId);
  writer.writeString(offsets[7], object.impactCausedName);
  writer.writeLong(offsets[8], object.impactOnId);
  writer.writeString(offsets[9], object.impactOnName);
  writer.writeLong(offsets[10], object.indicatorId);
  writer.writeString(offsets[11], object.indicatorName);
  writer.writeBool(offsets[12], object.isActive);
  writer.writeLong(offsets[13], object.isQuestionComplete);
  writer.writeLong(offsets[14], object.mmmId);
  writer.writeString(offsets[15], object.mmmName);
  writer.writeLong(offsets[16], object.principleId);
  writer.writeString(offsets[17], object.principleName);
  writer.writeLong(offsets[18], object.questionId);
  writer.writeString(offsets[19], object.questionValue);
  writer.writeLong(offsets[20], object.regionalManagerUnitId);
  writer.writeLong(offsets[21], object.severityId);
  writer.writeBool(offsets[22], object.xBone);
}

FarmQuestion _farmQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmQuestion(
    auditTemplateId: reader.readLongOrNull(offsets[0]),
    auditTemplateName: reader.readStringOrNull(offsets[1]),
    complianceId: reader.readLongOrNull(offsets[2]),
    complianceName: reader.readStringOrNull(offsets[3]),
    criteriaId: reader.readLongOrNull(offsets[4]),
    criteriaName: reader.readStringOrNull(offsets[5]),
    impactCausedId: reader.readLongOrNull(offsets[6]),
    impactCausedName: reader.readStringOrNull(offsets[7]),
    impactOnId: reader.readLongOrNull(offsets[8]),
    impactOnName: reader.readStringOrNull(offsets[9]),
    indicatorId: reader.readLongOrNull(offsets[10]),
    indicatorName: reader.readStringOrNull(offsets[11]),
    isActive: reader.readBoolOrNull(offsets[12]),
    isQuestionComplete: reader.readLongOrNull(offsets[13]),
    mmmId: reader.readLongOrNull(offsets[14]),
    mmmName: reader.readStringOrNull(offsets[15]),
    principleId: reader.readLongOrNull(offsets[16]),
    principleName: reader.readStringOrNull(offsets[17]),
    questionId: reader.readLong(offsets[18]),
    questionValue: reader.readStringOrNull(offsets[19]),
    regionalManagerUnitId: reader.readLongOrNull(offsets[20]),
    severityId: reader.readLongOrNull(offsets[21]),
    xBone: reader.readBoolOrNull(offsets[22]),
  );
  return object;
}

P _farmQuestionDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    case 22:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmQuestionGetId(FarmQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmQuestionGetLinks(FarmQuestion object) {
  return [];
}

void _farmQuestionAttach(
    IsarCollection<dynamic> col, Id id, FarmQuestion object) {}

extension FarmQuestionQueryWhereSort
    on QueryBuilder<FarmQuestion, FarmQuestion, QWhere> {
  QueryBuilder<FarmQuestion, FarmQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmQuestionQueryWhere
    on QueryBuilder<FarmQuestion, FarmQuestion, QWhereClause> {
  QueryBuilder<FarmQuestion, FarmQuestion, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterWhereClause> idBetween(
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

extension FarmQuestionQueryFilter
    on QueryBuilder<FarmQuestion, FarmQuestion, QFilterCondition> {
  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditTemplateId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditTemplateId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditTemplateName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditTemplateName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameEqualTo(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameLessThan(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameBetween(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameStartsWith(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameEndsWith(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'auditTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'auditTemplateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      auditTemplateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'auditTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complianceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      complianceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'criteriaId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'criteriaId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'criteriaName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'criteriaName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'criteriaName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      criteriaNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'criteriaName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactCausedId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactCausedId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactCausedName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactCausedNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactOnId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactOnId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactOnName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      impactOnNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'indicatorId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'indicatorId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'indicatorName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'indicatorName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'indicatorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'indicatorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'indicatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      indicatorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'indicatorName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      isQuestionCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      isQuestionCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      isQuestionCompleteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isQuestionComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mmmId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mmmId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> mmmIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> mmmIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> mmmIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mmmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mmmName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mmmName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mmmName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mmmName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      mmmNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mmmName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'principleId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'principleId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'principleName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'principleName',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'principleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      principleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'principleName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionIdGreaterThan(
    int value, {
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionIdLessThan(
    int value, {
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionValue',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionValue',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      questionValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      regionalManagerUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      regionalManagerUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      regionalManagerUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      severityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'severityId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      severityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'severityId',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      severityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
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

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      xBoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xBone',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition>
      xBoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xBone',
      ));
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterFilterCondition> xBoneEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xBone',
        value: value,
      ));
    });
  }
}

extension FarmQuestionQueryObject
    on QueryBuilder<FarmQuestion, FarmQuestion, QFilterCondition> {}

extension FarmQuestionQueryLinks
    on QueryBuilder<FarmQuestion, FarmQuestion, QFilterCondition> {}

extension FarmQuestionQuerySortBy
    on QueryBuilder<FarmQuestion, FarmQuestion, QSortBy> {
  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByAuditTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByAuditTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByCriteriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByCriteriaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByCriteriaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByIndicatorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByIndicatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByIndicatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByMmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByMmmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByMmmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByPrincipleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByPrincipleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByPrincipleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByQuestionValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByQuestionValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      sortBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> sortByXBoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.desc);
    });
  }
}

extension FarmQuestionQuerySortThenBy
    on QueryBuilder<FarmQuestion, FarmQuestion, QSortThenBy> {
  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByAuditTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByAuditTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByAuditTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditTemplateName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByCriteriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByCriteriaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByCriteriaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByIndicatorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByIndicatorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByIndicatorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'indicatorName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByMmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByMmmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByMmmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByPrincipleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByPrincipleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByPrincipleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByQuestionValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByQuestionValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy>
      thenBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.asc);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QAfterSortBy> thenByXBoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.desc);
    });
  }
}

extension FarmQuestionQueryWhereDistinct
    on QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> {
  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct>
      distinctByAuditTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct>
      distinctByAuditTemplateName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditTemplateName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByComplianceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criteriaId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByCriteriaName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criteriaName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct>
      distinctByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct>
      distinctByImpactCausedName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByImpactOnName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByIndicatorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'indicatorId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByIndicatorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'indicatorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct>
      distinctByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isQuestionComplete');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mmmId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByMmmName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mmmName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principleId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByPrincipleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principleName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByQuestionValue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct>
      distinctByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'severityId');
    });
  }

  QueryBuilder<FarmQuestion, FarmQuestion, QDistinct> distinctByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xBone');
    });
  }
}

extension FarmQuestionQueryProperty
    on QueryBuilder<FarmQuestion, FarmQuestion, QQueryProperty> {
  QueryBuilder<FarmQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> auditTemplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations>
      auditTemplateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditTemplateName');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> complianceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations>
      complianceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceName');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> criteriaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criteriaId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations> criteriaNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criteriaName');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> impactCausedIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations>
      impactCausedNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedName');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> impactOnIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations> impactOnNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnName');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> indicatorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'indicatorId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations>
      indicatorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'indicatorName');
    });
  }

  QueryBuilder<FarmQuestion, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations>
      isQuestionCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isQuestionComplete');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> mmmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mmmId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations> mmmNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mmmName');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> principleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principleId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations>
      principleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principleName');
    });
  }

  QueryBuilder<FarmQuestion, int, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<FarmQuestion, String?, QQueryOperations>
      questionValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionValue');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations>
      regionalManagerUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<FarmQuestion, int?, QQueryOperations> severityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'severityId');
    });
  }

  QueryBuilder<FarmQuestion, bool?, QQueryOperations> xBoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xBone');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmQuestion _$$_FarmQuestionFromJson(Map<String, dynamic> json) =>
    _$_FarmQuestion(
      regionalManagerUnitId: json['RegionalManagerUnitId'] as int?,
      auditTemplateId: json['AuditTemplateId'] as int?,
      auditTemplateName: json['AuditTemplateName'] as String?,
      questionId: json['QuestionId'] as int,
      questionValue: json['QuestionValue'] as String?,
      principleId: json['PrincipleId'] as int?,
      principleName: json['PrincipleName'] as String?,
      impactOnId: json['ImpactOnId'] as int?,
      impactOnName: json['ImpactOnName'] as String?,
      impactCausedId: json['ImpactCausedId'] as int?,
      impactCausedName: json['ImpactCausedName'] as String?,
      criteriaId: json['CriteriaId'] as int?,
      criteriaName: json['CriteriaName'] as String?,
      severityId: json['SeverityId'] as int?,
      xBone: json['XBone'] as bool?,
      mmmId: json['MMMId'] as int?,
      mmmName: json['MMMName'] as String?,
      complianceName: json['ComplianceName'] as String?,
      complianceId: json['ComplianceId'] as int?,
      isQuestionComplete: json['IsQuestionComplete'] as int?,
      indicatorId: json['IndicatorId'] as int?,
      indicatorName: json['IndicatorName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_FarmQuestionToJson(_$_FarmQuestion instance) =>
    <String, dynamic>{
      'RegionalManagerUnitId': instance.regionalManagerUnitId,
      'AuditTemplateId': instance.auditTemplateId,
      'AuditTemplateName': instance.auditTemplateName,
      'QuestionId': instance.questionId,
      'QuestionValue': instance.questionValue,
      'PrincipleId': instance.principleId,
      'PrincipleName': instance.principleName,
      'ImpactOnId': instance.impactOnId,
      'ImpactOnName': instance.impactOnName,
      'ImpactCausedId': instance.impactCausedId,
      'ImpactCausedName': instance.impactCausedName,
      'CriteriaId': instance.criteriaId,
      'CriteriaName': instance.criteriaName,
      'SeverityId': instance.severityId,
      'XBone': instance.xBone,
      'MMMId': instance.mmmId,
      'MMMName': instance.mmmName,
      'ComplianceName': instance.complianceName,
      'ComplianceId': instance.complianceId,
      'IsQuestionComplete': instance.isQuestionComplete,
      'IndicatorId': instance.indicatorId,
      'IndicatorName': instance.indicatorName,
      'IsActive': instance.isActive,
    };
