// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_comment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionCommentCollection on Isar {
  IsarCollection<QuestionComment> get questionComments => this.collection();
}

const QuestionCommentSchema = CollectionSchema(
  name: r'QuestionComment',
  id: -6488540488985277860,
  properties: {
    r'assessmentId': PropertySchema(
      id: 0,
      name: r'assessmentId',
      type: IsarType.long,
    ),
    r'comment': PropertySchema(
      id: 1,
      name: r'comment',
      type: IsarType.string,
    ),
    r'commentId': PropertySchema(
      id: 2,
      name: r'commentId',
      type: IsarType.long,
    ),
    r'questionId': PropertySchema(
      id: 3,
      name: r'questionId',
      type: IsarType.long,
    )
  },
  estimateSize: _questionCommentEstimateSize,
  serialize: _questionCommentSerialize,
  deserialize: _questionCommentDeserialize,
  deserializeProp: _questionCommentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _questionCommentGetId,
  getLinks: _questionCommentGetLinks,
  attach: _questionCommentAttach,
  version: '3.1.0',
);

int _questionCommentEstimateSize(
  QuestionComment object,
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

void _questionCommentSerialize(
  QuestionComment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.assessmentId);
  writer.writeString(offsets[1], object.comment);
  writer.writeLong(offsets[2], object.commentId);
  writer.writeLong(offsets[3], object.questionId);
}

QuestionComment _questionCommentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionComment(
    assessmentId: reader.readLongOrNull(offsets[0]),
    comment: reader.readStringOrNull(offsets[1]),
    commentId: reader.readLongOrNull(offsets[2]),
    questionId: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _questionCommentDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionCommentGetId(QuestionComment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionCommentGetLinks(QuestionComment object) {
  return [];
}

void _questionCommentAttach(
    IsarCollection<dynamic> col, Id id, QuestionComment object) {}

extension QuestionCommentQueryWhereSort
    on QueryBuilder<QuestionComment, QuestionComment, QWhere> {
  QueryBuilder<QuestionComment, QuestionComment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionCommentQueryWhere
    on QueryBuilder<QuestionComment, QuestionComment, QWhereClause> {
  QueryBuilder<QuestionComment, QuestionComment, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterWhereClause>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterWhereClause> idBetween(
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

extension QuestionCommentQueryFilter
    on QueryBuilder<QuestionComment, QuestionComment, QFilterCondition> {
  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      assessmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      assessmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      assessmentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentEqualTo(
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentGreaterThan(
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentLessThan(
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentBetween(
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentStartsWith(
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentEndsWith(
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commentId',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commentId',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIdGreaterThan(
    int? value, {
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIdLessThan(
    int? value, {
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      commentIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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

  QueryBuilder<QuestionComment, QuestionComment, QAfterFilterCondition>
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
}

extension QuestionCommentQueryObject
    on QueryBuilder<QuestionComment, QuestionComment, QFilterCondition> {}

extension QuestionCommentQueryLinks
    on QueryBuilder<QuestionComment, QuestionComment, QFilterCondition> {}

extension QuestionCommentQuerySortBy
    on QueryBuilder<QuestionComment, QuestionComment, QSortBy> {
  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      sortByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      sortByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      sortByCommentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      sortByCommentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension QuestionCommentQuerySortThenBy
    on QueryBuilder<QuestionComment, QuestionComment, QSortThenBy> {
  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      thenByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      thenByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      thenByCommentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      thenByCommentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension QuestionCommentQueryWhereDistinct
    on QueryBuilder<QuestionComment, QuestionComment, QDistinct> {
  QueryBuilder<QuestionComment, QuestionComment, QDistinct>
      distinctByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessmentId');
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QDistinct>
      distinctByCommentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentId');
    });
  }

  QueryBuilder<QuestionComment, QuestionComment, QDistinct>
      distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }
}

extension QuestionCommentQueryProperty
    on QueryBuilder<QuestionComment, QuestionComment, QQueryProperty> {
  QueryBuilder<QuestionComment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionComment, int?, QQueryOperations> assessmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessmentId');
    });
  }

  QueryBuilder<QuestionComment, String?, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<QuestionComment, int?, QQueryOperations> commentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentId');
    });
  }

  QueryBuilder<QuestionComment, int?, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionComment _$$_QuestionCommentFromJson(Map<String, dynamic> json) =>
    _$_QuestionComment(
      commentId: json['CommentId'] as int?,
      assessmentId: json['AssessmentId'] as int?,
      questionId: json['QuestionId'] as int?,
      comment: json['Comment'] as String?,
    );

Map<String, dynamic> _$$_QuestionCommentToJson(_$_QuestionComment instance) =>
    <String, dynamic>{
      'CommentId': instance.commentId,
      'AssessmentId': instance.assessmentId,
      'QuestionId': instance.questionId,
      'Comment': instance.comment,
    };
