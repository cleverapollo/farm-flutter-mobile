// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_question_comment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAuditQuestionCommentCollection on Isar {
  IsarCollection<AuditQuestionComment> get auditQuestionComments =>
      this.collection();
}

const AuditQuestionCommentSchema = CollectionSchema(
  name: r'AuditQuestionComment',
  id: 7410015410289548514,
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
    r'comment': PropertySchema(
      id: 2,
      name: r'comment',
      type: IsarType.string,
    ),
    r'commentId': PropertySchema(
      id: 3,
      name: r'commentId',
      type: IsarType.long,
    ),
    r'questionId': PropertySchema(
      id: 4,
      name: r'questionId',
      type: IsarType.long,
    )
  },
  estimateSize: _auditQuestionCommentEstimateSize,
  serialize: _auditQuestionCommentSerialize,
  deserialize: _auditQuestionCommentDeserialize,
  deserializeProp: _auditQuestionCommentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditQuestionCommentGetId,
  getLinks: _auditQuestionCommentGetLinks,
  attach: _auditQuestionCommentAttach,
  version: '3.0.5',
);

int _auditQuestionCommentEstimateSize(
  AuditQuestionComment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _auditQuestionCommentSerialize(
  AuditQuestionComment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.answerId);
  writer.writeLong(offsets[1], object.auditId);
  writer.writeString(offsets[2], object.comment);
  writer.writeLong(offsets[3], object.commentId);
  writer.writeLong(offsets[4], object.questionId);
}

AuditQuestionComment _auditQuestionCommentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditQuestionComment(
    answerId: reader.readLong(offsets[0]),
    auditId: reader.readLong(offsets[1]),
    comment: reader.readStringOrNull(offsets[2]),
    commentId: reader.readLong(offsets[3]),
    questionId: reader.readLongOrNull(offsets[4]),
  );
  return object;
}

P _auditQuestionCommentDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditQuestionCommentGetId(AuditQuestionComment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditQuestionCommentGetLinks(
    AuditQuestionComment object) {
  return [];
}

void _auditQuestionCommentAttach(
    IsarCollection<dynamic> col, Id id, AuditQuestionComment object) {}

extension AuditQuestionCommentQueryWhereSort
    on QueryBuilder<AuditQuestionComment, AuditQuestionComment, QWhere> {
  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditQuestionCommentQueryWhere
    on QueryBuilder<AuditQuestionComment, AuditQuestionComment, QWhereClause> {
  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterWhereClause>
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterWhereClause>
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

extension AuditQuestionCommentQueryFilter on QueryBuilder<AuditQuestionComment,
    AuditQuestionComment, QFilterCondition> {
  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> answerIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> answerIdGreaterThan(
    int value, {
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> answerIdLessThan(
    int value, {
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> answerIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> auditIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> auditIdGreaterThan(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> auditIdLessThan(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> auditIdBetween(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
          QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
          QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commentId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commentId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> commentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> questionIdGreaterThan(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> questionIdLessThan(
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

  QueryBuilder<AuditQuestionComment, AuditQuestionComment,
      QAfterFilterCondition> questionIdBetween(
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
}

extension AuditQuestionCommentQueryObject on QueryBuilder<AuditQuestionComment,
    AuditQuestionComment, QFilterCondition> {}

extension AuditQuestionCommentQueryLinks on QueryBuilder<AuditQuestionComment,
    AuditQuestionComment, QFilterCondition> {}

extension AuditQuestionCommentQuerySortBy
    on QueryBuilder<AuditQuestionComment, AuditQuestionComment, QSortBy> {
  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByCommentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByCommentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension AuditQuestionCommentQuerySortThenBy
    on QueryBuilder<AuditQuestionComment, AuditQuestionComment, QSortThenBy> {
  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'answerId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByCommentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByCommentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension AuditQuestionCommentQueryWhereDistinct
    on QueryBuilder<AuditQuestionComment, AuditQuestionComment, QDistinct> {
  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QDistinct>
      distinctByAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerId');
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QDistinct>
      distinctByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditId');
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QDistinct>
      distinctByComment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QDistinct>
      distinctByCommentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentId');
    });
  }

  QueryBuilder<AuditQuestionComment, AuditQuestionComment, QDistinct>
      distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }
}

extension AuditQuestionCommentQueryProperty on QueryBuilder<
    AuditQuestionComment, AuditQuestionComment, QQueryProperty> {
  QueryBuilder<AuditQuestionComment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditQuestionComment, int, QQueryOperations> answerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerId');
    });
  }

  QueryBuilder<AuditQuestionComment, int, QQueryOperations> auditIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditId');
    });
  }

  QueryBuilder<AuditQuestionComment, String?, QQueryOperations>
      commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<AuditQuestionComment, int, QQueryOperations>
      commentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentId');
    });
  }

  QueryBuilder<AuditQuestionComment, int?, QQueryOperations>
      questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuditQuestionComment _$$_AuditQuestionCommentFromJson(
        Map<String, dynamic> json) =>
    _$_AuditQuestionComment(
      answerId: json['AnswerId'] as int,
      commentId: json['CommentId'] as int,
      auditId: json['AuditId'] as int,
      questionId: json['QuestionId'] as int?,
      comment: json['Comment'] as String?,
    );

Map<String, dynamic> _$$_AuditQuestionCommentToJson(
        _$_AuditQuestionComment instance) =>
    <String, dynamic>{
      'AnswerId': instance.answerId,
      'CommentId': instance.commentId,
      'AuditId': instance.auditId,
      'QuestionId': instance.questionId,
      'Comment': instance.comment,
    };
