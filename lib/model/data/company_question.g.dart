// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_question.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCompanyQuestionCollection on Isar {
  IsarCollection<CompanyQuestion> get companyQuestions => this.collection();
}

const CompanyQuestionSchema = CollectionSchema(
  name: r'CompanyQuestion',
  id: 4784806335997987177,
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
    r'impactCausedId': PropertySchema(
      id: 3,
      name: r'impactCausedId',
      type: IsarType.long,
    ),
    r'impactCausedName': PropertySchema(
      id: 4,
      name: r'impactCausedName',
      type: IsarType.string,
    ),
    r'impactOnId': PropertySchema(
      id: 5,
      name: r'impactOnId',
      type: IsarType.long,
    ),
    r'impactOnName': PropertySchema(
      id: 6,
      name: r'impactOnName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 7,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isQuestionComplete': PropertySchema(
      id: 8,
      name: r'isQuestionComplete',
      type: IsarType.long,
    ),
    r'jobCategoryId': PropertySchema(
      id: 9,
      name: r'jobCategoryId',
      type: IsarType.long,
    ),
    r'jobCategoryName': PropertySchema(
      id: 10,
      name: r'jobCategoryName',
      type: IsarType.string,
    ),
    r'jobElementId': PropertySchema(
      id: 11,
      name: r'jobElementId',
      type: IsarType.long,
    ),
    r'jobElementName': PropertySchema(
      id: 12,
      name: r'jobElementName',
      type: IsarType.string,
    ),
    r'mmmId': PropertySchema(
      id: 13,
      name: r'mmmId',
      type: IsarType.long,
    ),
    r'mmmName': PropertySchema(
      id: 14,
      name: r'mmmName',
      type: IsarType.string,
    ),
    r'pdcaId': PropertySchema(
      id: 15,
      name: r'pdcaId',
      type: IsarType.long,
    ),
    r'pdcaName': PropertySchema(
      id: 16,
      name: r'pdcaName',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 17,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'questionValue': PropertySchema(
      id: 18,
      name: r'questionValue',
      type: IsarType.string,
    ),
    r'severityId': PropertySchema(
      id: 19,
      name: r'severityId',
      type: IsarType.long,
    ),
    r'speqsId': PropertySchema(
      id: 20,
      name: r'speqsId',
      type: IsarType.long,
    ),
    r'speqsName': PropertySchema(
      id: 21,
      name: r'speqsName',
      type: IsarType.string,
    ),
    r'xBone': PropertySchema(
      id: 22,
      name: r'xBone',
      type: IsarType.bool,
    )
  },
  estimateSize: _companyQuestionEstimateSize,
  serialize: _companyQuestionSerialize,
  deserialize: _companyQuestionDeserialize,
  deserializeProp: _companyQuestionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _companyQuestionGetId,
  getLinks: _companyQuestionGetLinks,
  attach: _companyQuestionAttach,
  version: '3.0.5',
);

int _companyQuestionEstimateSize(
  CompanyQuestion object,
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
    final value = object.jobCategoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.jobElementName;
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
    final value = object.pdcaName;
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
  {
    final value = object.speqsName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _companyQuestionSerialize(
  CompanyQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyId);
  writer.writeLong(offsets[1], object.complianceId);
  writer.writeString(offsets[2], object.complianceName);
  writer.writeLong(offsets[3], object.impactCausedId);
  writer.writeString(offsets[4], object.impactCausedName);
  writer.writeLong(offsets[5], object.impactOnId);
  writer.writeString(offsets[6], object.impactOnName);
  writer.writeBool(offsets[7], object.isActive);
  writer.writeLong(offsets[8], object.isQuestionComplete);
  writer.writeLong(offsets[9], object.jobCategoryId);
  writer.writeString(offsets[10], object.jobCategoryName);
  writer.writeLong(offsets[11], object.jobElementId);
  writer.writeString(offsets[12], object.jobElementName);
  writer.writeLong(offsets[13], object.mmmId);
  writer.writeString(offsets[14], object.mmmName);
  writer.writeLong(offsets[15], object.pdcaId);
  writer.writeString(offsets[16], object.pdcaName);
  writer.writeLong(offsets[17], object.questionId);
  writer.writeString(offsets[18], object.questionValue);
  writer.writeLong(offsets[19], object.severityId);
  writer.writeLong(offsets[20], object.speqsId);
  writer.writeString(offsets[21], object.speqsName);
  writer.writeBool(offsets[22], object.xBone);
}

CompanyQuestion _companyQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CompanyQuestion(
    companyId: reader.readLong(offsets[0]),
    complianceId: reader.readLongOrNull(offsets[1]),
    complianceName: reader.readStringOrNull(offsets[2]),
    impactCausedId: reader.readLongOrNull(offsets[3]),
    impactCausedName: reader.readStringOrNull(offsets[4]),
    impactOnId: reader.readLongOrNull(offsets[5]),
    impactOnName: reader.readStringOrNull(offsets[6]),
    isActive: reader.readBoolOrNull(offsets[7]),
    isQuestionComplete: reader.readLongOrNull(offsets[8]),
    jobCategoryId: reader.readLongOrNull(offsets[9]),
    jobCategoryName: reader.readStringOrNull(offsets[10]),
    jobElementId: reader.readLongOrNull(offsets[11]),
    jobElementName: reader.readStringOrNull(offsets[12]),
    mmmId: reader.readLongOrNull(offsets[13]),
    mmmName: reader.readStringOrNull(offsets[14]),
    pdcaId: reader.readLongOrNull(offsets[15]),
    pdcaName: reader.readStringOrNull(offsets[16]),
    questionId: reader.readLongOrNull(offsets[17]),
    questionValue: reader.readStringOrNull(offsets[18]),
    severityId: reader.readLongOrNull(offsets[19]),
    speqsId: reader.readLongOrNull(offsets[20]),
    speqsName: reader.readStringOrNull(offsets[21]),
    xBone: reader.readBoolOrNull(offsets[22]),
  );
  return object;
}

P _companyQuestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _companyQuestionGetId(CompanyQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _companyQuestionGetLinks(CompanyQuestion object) {
  return [];
}

void _companyQuestionAttach(
    IsarCollection<dynamic> col, Id id, CompanyQuestion object) {}

extension CompanyQuestionQueryWhereSort
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QWhere> {
  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompanyQuestionQueryWhere
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QWhereClause> {
  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterWhereClause>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterWhereClause> idBetween(
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

extension CompanyQuestionQueryFilter
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QFilterCondition> {
  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      companyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      companyIdGreaterThan(
    int value, {
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      companyIdLessThan(
    int value, {
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      companyIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complianceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      complianceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactCausedId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactCausedId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactCausedName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactCausedName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactCausedName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactCausedNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactCausedName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactOnId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactOnId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactOnName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      impactOnNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      isQuestionCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      isQuestionCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      isQuestionCompleteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isQuestionComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobCategoryId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobCategoryId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobCategoryName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobCategoryName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobCategoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobCategoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobCategoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobCategoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobElementId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobElementId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobElementId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobElementId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobElementId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobElementId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobElementName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobElementName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobElementName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobElementName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobElementName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      jobElementNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobElementName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mmmId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mmmId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmIdLessThan(
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmIdBetween(
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mmmName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mmmName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mmmName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      mmmNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mmmName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdcaId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdcaId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdcaId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdcaId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdcaId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdcaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdcaName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdcaName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdcaName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdcaName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdcaName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      pdcaNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdcaName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionValue',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionValue',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      questionValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      severityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'severityId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      severityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'severityId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      severityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
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

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speqsId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speqsId',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speqsId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speqsId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speqsId',
        value: value,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speqsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speqsName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speqsName',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speqsName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speqsName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speqsName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      speqsNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speqsName',
        value: '',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      xBoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xBone',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      xBoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xBone',
      ));
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterFilterCondition>
      xBoneEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xBone',
        value: value,
      ));
    });
  }
}

extension CompanyQuestionQueryObject
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QFilterCondition> {}

extension CompanyQuestionQueryLinks
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QFilterCondition> {}

extension CompanyQuestionQuerySortBy
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QSortBy> {
  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobElementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobElementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobElementName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByJobElementNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> sortByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByMmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> sortByMmmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByMmmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> sortByPdcaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByPdcaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByPdcaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByPdcaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByQuestionValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByQuestionValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> sortBySpeqsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortBySpeqsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortBySpeqsName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortBySpeqsNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> sortByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      sortByXBoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.desc);
    });
  }
}

extension CompanyQuestionQuerySortThenBy
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QSortThenBy> {
  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactCausedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactCausedName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactCausedNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactCausedName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobElementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobElementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobElementName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByJobElementNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> thenByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByMmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> thenByMmmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByMmmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> thenByPdcaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByPdcaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByPdcaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByPdcaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByQuestionValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByQuestionValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionValue', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> thenBySpeqsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenBySpeqsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenBySpeqsName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenBySpeqsNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.desc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy> thenByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.asc);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QAfterSortBy>
      thenByXBoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xBone', Sort.desc);
    });
  }
}

extension CompanyQuestionQueryWhereDistinct
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct> {
  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByComplianceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByImpactCausedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByImpactCausedName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactCausedName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByImpactOnName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isQuestionComplete');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobCategoryId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByJobCategoryName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobCategoryName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByJobElementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobElementId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByJobElementName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobElementName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct> distinctByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mmmId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct> distinctByMmmName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mmmName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct> distinctByPdcaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdcaId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct> distinctByPdcaName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdcaName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctByQuestionValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionValue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'severityId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct>
      distinctBySpeqsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speqsId');
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct> distinctBySpeqsName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speqsName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanyQuestion, CompanyQuestion, QDistinct> distinctByXBone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xBone');
    });
  }
}

extension CompanyQuestionQueryProperty
    on QueryBuilder<CompanyQuestion, CompanyQuestion, QQueryProperty> {
  QueryBuilder<CompanyQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CompanyQuestion, int, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> complianceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations>
      complianceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceName');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations>
      impactCausedIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations>
      impactCausedNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactCausedName');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> impactOnIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations>
      impactOnNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnName');
    });
  }

  QueryBuilder<CompanyQuestion, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations>
      isQuestionCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isQuestionComplete');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations>
      jobCategoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobCategoryId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations>
      jobCategoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobCategoryName');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> jobElementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobElementId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations>
      jobElementNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobElementName');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> mmmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mmmId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations> mmmNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mmmName');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> pdcaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdcaId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations> pdcaNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdcaName');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations>
      questionValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionValue');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> severityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'severityId');
    });
  }

  QueryBuilder<CompanyQuestion, int?, QQueryOperations> speqsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speqsId');
    });
  }

  QueryBuilder<CompanyQuestion, String?, QQueryOperations> speqsNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speqsName');
    });
  }

  QueryBuilder<CompanyQuestion, bool?, QQueryOperations> xBoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xBone');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyQuestion _$$_CompanyQuestionFromJson(Map<String, dynamic> json) =>
    _$_CompanyQuestion(
      companyId: json['CompanyId'] as int,
      jobCategoryId: json['JobCategoryId'] as int?,
      jobCategoryName: json['JobCategoryName'] as String?,
      questionId: json['QuestionId'] as int?,
      questionValue: json['QuestionValue'] as String?,
      jobElementId: json['JobElementId'] as int?,
      jobElementName: json['JobElementName'] as String?,
      pdcaId: json['PDCAId'] as int?,
      pdcaName: json['PDCAName'] as String?,
      speqsId: json['SPEQSId'] as int?,
      speqsName: json['SPEQSName'] as String?,
      impactOnId: json['ImpactOnId'] as int?,
      impactOnName: json['ImpactOnName'] as String?,
      impactCausedId: json['ImpactCausedId'] as int?,
      impactCausedName: json['ImpactCausedName'] as String?,
      severityId: json['SeverityId'] as int?,
      xBone: json['XBone'] as bool?,
      mmmId: json['MMMId'] as int?,
      mmmName: json['MMMName'] as String?,
      complianceName: json['ComplianceName'] as String?,
      complianceId: json['ComplianceId'] as int?,
      isQuestionComplete: json['IsQuestionComplete'] as int?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_CompanyQuestionToJson(_$_CompanyQuestion instance) =>
    <String, dynamic>{
      'CompanyId': instance.companyId,
      'JobCategoryId': instance.jobCategoryId,
      'JobCategoryName': instance.jobCategoryName,
      'QuestionId': instance.questionId,
      'QuestionValue': instance.questionValue,
      'JobElementId': instance.jobElementId,
      'JobElementName': instance.jobElementName,
      'PDCAId': instance.pdcaId,
      'PDCAName': instance.pdcaName,
      'SPEQSId': instance.speqsId,
      'SPEQSName': instance.speqsName,
      'ImpactOnId': instance.impactOnId,
      'ImpactOnName': instance.impactOnName,
      'ImpactCausedId': instance.impactCausedId,
      'ImpactCausedName': instance.impactCausedName,
      'SeverityId': instance.severityId,
      'XBone': instance.xBone,
      'MMMId': instance.mmmId,
      'MMMName': instance.mmmName,
      'ComplianceName': instance.complianceName,
      'ComplianceId': instance.complianceId,
      'IsQuestionComplete': instance.isQuestionComplete,
      'IsActive': instance.isActive,
    };
