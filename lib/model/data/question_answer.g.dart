// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_answer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetQuestionAnswerCollection on Isar {
  IsarCollection<QuestionAnswer> get questionAnswers => this.collection();
}

const QuestionAnswerSchema = CollectionSchema(
  name: r'QuestionAnswer',
  id: -6466208862556138916,
  properties: {
    r'assessmentId': PropertySchema(
      id: 0,
      name: r'assessmentId',
      type: IsarType.long,
    ),
    r'complianceId': PropertySchema(
      id: 1,
      name: r'complianceId',
      type: IsarType.long,
    ),
    r'isQuestionComplete': PropertySchema(
      id: 2,
      name: r'isQuestionComplete',
      type: IsarType.long,
    ),
    r'questionAnswerId': PropertySchema(
      id: 3,
      name: r'questionAnswerId',
      type: IsarType.long,
    ),
    r'questionId': PropertySchema(
      id: 4,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'rejectComment': PropertySchema(
      id: 5,
      name: r'rejectComment',
      type: IsarType.string,
    ),
    r'rejectReasonId': PropertySchema(
      id: 6,
      name: r'rejectReasonId',
      type: IsarType.long,
    )
  },
  estimateSize: _questionAnswerEstimateSize,
  serialize: _questionAnswerSerialize,
  deserialize: _questionAnswerDeserialize,
  deserializeProp: _questionAnswerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _questionAnswerGetId,
  getLinks: _questionAnswerGetLinks,
  attach: _questionAnswerAttach,
  version: '3.0.5',
);

int _questionAnswerEstimateSize(
  QuestionAnswer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.rejectComment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _questionAnswerSerialize(
  QuestionAnswer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.assessmentId);
  writer.writeLong(offsets[1], object.complianceId);
  writer.writeLong(offsets[2], object.isQuestionComplete);
  writer.writeLong(offsets[3], object.questionAnswerId);
  writer.writeLong(offsets[4], object.questionId);
  writer.writeString(offsets[5], object.rejectComment);
  writer.writeLong(offsets[6], object.rejectReasonId);
}

QuestionAnswer _questionAnswerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionAnswer(
    assessmentId: reader.readLongOrNull(offsets[0]),
    complianceId: reader.readLongOrNull(offsets[1]),
    isQuestionComplete: reader.readLongOrNull(offsets[2]),
    questionAnswerId: reader.readLongOrNull(offsets[3]),
    questionId: reader.readLongOrNull(offsets[4]),
    rejectComment: reader.readStringOrNull(offsets[5]),
    rejectReasonId: reader.readLongOrNull(offsets[6]),
  );
  return object;
}

P _questionAnswerDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionAnswerGetId(QuestionAnswer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionAnswerGetLinks(QuestionAnswer object) {
  return [];
}

void _questionAnswerAttach(
    IsarCollection<dynamic> col, Id id, QuestionAnswer object) {}

extension QuestionAnswerQueryWhereSort
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QWhere> {
  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionAnswerQueryWhere
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QWhereClause> {
  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterWhereClause> idBetween(
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

extension QuestionAnswerQueryFilter
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QFilterCondition> {
  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      assessmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      assessmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      assessmentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      assessmentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      assessmentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      assessmentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assessmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      complianceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      complianceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complianceId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      complianceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complianceId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      isQuestionCompleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      isQuestionCompleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isQuestionComplete',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      isQuestionCompleteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isQuestionComplete',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionAnswerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionAnswerId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionAnswerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionAnswerId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionAnswerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionAnswerId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionAnswerIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionAnswerId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionAnswerIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionAnswerId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionAnswerIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionAnswerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rejectComment',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rejectComment',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rejectComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rejectComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rejectComment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rejectComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rejectComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rejectComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rejectComment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectComment',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectCommentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rejectComment',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectReasonIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rejectReasonId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectReasonIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rejectReasonId',
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
      rejectReasonIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterFilterCondition>
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

extension QuestionAnswerQueryObject
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QFilterCondition> {}

extension QuestionAnswerQueryLinks
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QFilterCondition> {}

extension QuestionAnswerQuerySortBy
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QSortBy> {
  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByQuestionAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswerId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByQuestionAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswerId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByRejectComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectComment', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByRejectCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectComment', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      sortByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }
}

extension QuestionAnswerQuerySortThenBy
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QSortThenBy> {
  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByComplianceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complianceId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByIsQuestionCompleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQuestionComplete', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByQuestionAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswerId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByQuestionAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionAnswerId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByRejectComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectComment', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByRejectCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectComment', Sort.desc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QAfterSortBy>
      thenByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }
}

extension QuestionAnswerQueryWhereDistinct
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct> {
  QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct>
      distinctByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessmentId');
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct>
      distinctByComplianceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complianceId');
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct>
      distinctByIsQuestionComplete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isQuestionComplete');
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct>
      distinctByQuestionAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionAnswerId');
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct>
      distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct>
      distinctByRejectComment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectComment',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionAnswer, QuestionAnswer, QDistinct>
      distinctByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectReasonId');
    });
  }
}

extension QuestionAnswerQueryProperty
    on QueryBuilder<QuestionAnswer, QuestionAnswer, QQueryProperty> {
  QueryBuilder<QuestionAnswer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionAnswer, int?, QQueryOperations> assessmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessmentId');
    });
  }

  QueryBuilder<QuestionAnswer, int?, QQueryOperations> complianceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complianceId');
    });
  }

  QueryBuilder<QuestionAnswer, int?, QQueryOperations>
      isQuestionCompleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isQuestionComplete');
    });
  }

  QueryBuilder<QuestionAnswer, int?, QQueryOperations>
      questionAnswerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionAnswerId');
    });
  }

  QueryBuilder<QuestionAnswer, int?, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<QuestionAnswer, String?, QQueryOperations>
      rejectCommentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectComment');
    });
  }

  QueryBuilder<QuestionAnswer, int?, QQueryOperations>
      rejectReasonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectReasonId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionAnswer _$$_QuestionAnswerFromJson(Map<String, dynamic> json) =>
    _$_QuestionAnswer(
      questionAnswerId: json['QuestionAnswerId'] as int?,
      assessmentId: json['AssessmentId'] as int?,
      questionId: json['QuestionId'] as int?,
      complianceId: json['ComplianceId'] as int?,
      rejectReasonId: json['RejectReasonId'] as int?,
      rejectComment: json['RejectComment'] as String?,
      isQuestionComplete: json['IsQuestionComplete'] as int?,
    );

Map<String, dynamic> _$$_QuestionAnswerToJson(_$_QuestionAnswer instance) =>
    <String, dynamic>{
      'QuestionAnswerId': instance.questionAnswerId,
      'AssessmentId': instance.assessmentId,
      'QuestionId': instance.questionId,
      'ComplianceId': instance.complianceId,
      'RejectReasonId': instance.rejectReasonId,
      'RejectComment': instance.rejectComment,
      'IsQuestionComplete': instance.isQuestionComplete,
    };
