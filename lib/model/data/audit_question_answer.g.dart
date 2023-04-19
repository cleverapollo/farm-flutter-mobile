// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_question_answer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAuditQuestionAnswerCollection on Isar {
  IsarCollection<AuditQuestionAnswer> get auditQuestionAnswers =>
      this.collection();
}

const AuditQuestionAnswerSchema = CollectionSchema(
  name: r'AuditQuestionAnswer',
  id: -4394552004296166395,
  properties: {
    r'answerId': PropertySchema(
      id: 0,
      name: r'answerId',
      type: IsarType.long,
    ),
    r'auditId': PropertySchema(
      id: 1,
      name: r'auditId',
      type: IsarType.long,
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
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isQuestionComplete': PropertySchema(
      id: 5,
      name: r'isQuestionComplete',
      type: IsarType.bool,
    ),
    r'questionId': PropertySchema(
      id: 6,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'rejectReasonId': PropertySchema(
      id: 7,
      name: r'rejectReasonId',
      type: IsarType.long,
    )
  },
  estimateSize: _auditQuestionAnswerEstimateSize,
  serialize: _auditQuestionAnswerSerialize,
  deserialize: _auditQuestionAnswerDeserialize,
  deserializeProp: _auditQuestionAnswerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditQuestionAnswerGetId,
  getLinks: _auditQuestionAnswerGetLinks,
  attach: _auditQuestionAnswerAttach,
  version: '3.0.5',
);

int _auditQuestionAnswerEstimateSize(
  AuditQuestionAnswer object,
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

void _auditQuestionAnswerSerialize(
  AuditQuestionAnswer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.answerId);
  writer.writeLong(offsets[1], object.auditId);
  writer.writeLong(offsets[2], object.complianceId);
  writer.writeString(offsets[3], object.complianceName);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeBool(offsets[5], object.isQuestionComplete);
  writer.writeLong(offsets[6], object.questionId);
  writer.writeLong(offsets[7], object.rejectReasonId);
}

AuditQuestionAnswer _auditQuestionAnswerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditQuestionAnswer(
    answerId: reader.readLongOrNull(offsets[0]),
    auditId: reader.readLongOrNull(offsets[1]),
    complianceId: reader.readLongOrNull(offsets[2]),
    complianceName: reader.readStringOrNull(offsets[3]),
    isActive: reader.readBoolOrNull(offsets[4]),
    isQuestionComplete: reader.readBoolOrNull(offsets[5]),
    questionId: reader.readLongOrNull(offsets[6]),
    rejectReasonId: reader.readLongOrNull(offsets[7]),
  );
  return object;
}

P _auditQuestionAnswerDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditQuestionAnswerGetId(AuditQuestionAnswer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditQuestionAnswerGetLinks(
    AuditQuestionAnswer object) {
  return [];
}

void _auditQuestionAnswerAttach(
    IsarCollection<dynamic> col, Id id, AuditQuestionAnswer object) {}

extension AuditQuestionAnswerQueryWhereSort
    on QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QWhere> {
  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditQuestionAnswerQueryWhere
    on QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QWhereClause> {
  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterWhereClause>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterWhereClause>
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

extension AuditQuestionAnswerQueryFilter on QueryBuilder<AuditQuestionAnswer,
    AuditQuestionAnswer, QFilterCondition> {
  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      answerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answerId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      answerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answerId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      answerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      answerIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      answerIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      answerIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      auditIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      auditIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      auditIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      auditIdGreaterThan(
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      auditIdLessThan(
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      auditIdBetween(
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceName',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complianceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complianceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      complianceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complianceName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      isQuestionCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      isQuestionCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      isQuestionCompleteEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isQuestionComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      rejectReasonIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rejectReasonId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      rejectReasonIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rejectReasonId',
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
      rejectReasonIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterFilterCondition>
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

extension AuditQuestionAnswerQueryObject on QueryBuilder<AuditQuestionAnswer,
    AuditQuestionAnswer, QFilterCondition> {}

extension AuditQuestionAnswerQueryLinks on QueryBuilder<AuditQuestionAnswer,
    AuditQuestionAnswer, QFilterCondition> {}

extension AuditQuestionAnswerQuerySortBy
    on QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QSortBy> {
  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      sortByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }
}

extension AuditQuestionAnswerQuerySortThenBy
    on QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QSortThenBy> {
  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByComplianceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByComplianceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QAfterSortBy>
      thenByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }
}

extension AuditQuestionAnswerQueryWhereDistinct
    on QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct> {
  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByComplianceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isQuestionComplete');
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QDistinct>
      distinctByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectReasonId');
    });
  }
}

extension AuditQuestionAnswerQueryProperty
    on QueryBuilder<AuditQuestionAnswer, AuditQuestionAnswer, QQueryProperty> {
  QueryBuilder<AuditQuestionAnswer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditQuestionAnswer, int?, QQueryOperations> answerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, int?, QQueryOperations> auditIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, int?, QQueryOperations>
      complianceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, String?, QQueryOperations>
      complianceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceName');
    });
  }

  QueryBuilder<AuditQuestionAnswer, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<AuditQuestionAnswer, bool?, QQueryOperations>
      isQuestionCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isQuestionComplete');
    });
  }

  QueryBuilder<AuditQuestionAnswer, int?, QQueryOperations>
      questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<AuditQuestionAnswer, int?, QQueryOperations>
      rejectReasonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectReasonId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuditQuestionAnswer _$$_AuditQuestionAnswerFromJson(
        Map<String, dynamic> json) =>
    _$_AuditQuestionAnswer(
      answerId: json['AnswerId'] as int?,
      auditId: json['AuditId'] as int?,
      questionId: json['QuestionId'] as int?,
      complianceName: json['ComplianceName'] as String?,
      complianceId: json['ComplianceId'] as int?,
      rejectReasonId: json['RejectReasonId'] as int?,
      isActive: json['IsActive'] as bool? ?? true,
      isQuestionComplete: json['IsQuestionComplete'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AuditQuestionAnswerToJson(
        _$_AuditQuestionAnswer instance) =>
    <String, dynamic>{
      'AnswerId': instance.answerId,
      'AuditId': instance.auditId,
      'QuestionId': instance.questionId,
      'ComplianceName': instance.complianceName,
      'ComplianceId': instance.complianceId,
      'RejectReasonId': instance.rejectReasonId,
      'IsActive': instance.isActive,
      'IsQuestionComplete': instance.isQuestionComplete,
    };
