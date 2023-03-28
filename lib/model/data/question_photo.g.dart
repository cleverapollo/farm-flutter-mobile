// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_photo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetQuestionPhotoCollection on Isar {
  IsarCollection<QuestionPhoto> get questionPhotos => this.collection();
}

const QuestionPhotoSchema = CollectionSchema(
  name: r'QuestionPhoto',
  id: -7598959828959581067,
  properties: {
    r'assessmentId': PropertySchema(
      id: 0,
      name: r'assessmentId',
      type: IsarType.long,
    ),
    r'photoId': PropertySchema(
      id: 1,
      name: r'photoId',
      type: IsarType.long,
    ),
    r'photoPath': PropertySchema(
      id: 2,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 3,
      name: r'questionId',
      type: IsarType.long,
    )
  },
  estimateSize: _questionPhotoEstimateSize,
  serialize: _questionPhotoSerialize,
  deserialize: _questionPhotoDeserialize,
  deserializeProp: _questionPhotoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _questionPhotoGetId,
  getLinks: _questionPhotoGetLinks,
  attach: _questionPhotoAttach,
  version: '3.0.5',
);

int _questionPhotoEstimateSize(
  QuestionPhoto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _questionPhotoSerialize(
  QuestionPhoto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.assessmentId);
  writer.writeLong(offsets[1], object.photoId);
  writer.writeString(offsets[2], object.photoPath);
  writer.writeLong(offsets[3], object.questionId);
}

QuestionPhoto _questionPhotoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionPhoto(
    assessmentId: reader.readLongOrNull(offsets[0]),
    photoId: reader.readLongOrNull(offsets[1]),
    photoPath: reader.readStringOrNull(offsets[2]),
    questionId: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _questionPhotoDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionPhotoGetId(QuestionPhoto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionPhotoGetLinks(QuestionPhoto object) {
  return [];
}

void _questionPhotoAttach(
    IsarCollection<dynamic> col, Id id, QuestionPhoto object) {}

extension QuestionPhotoQueryWhereSort
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QWhere> {
  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionPhotoQueryWhere
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QWhereClause> {
  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterWhereClause> idBetween(
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

extension QuestionPhotoQueryFilter
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QFilterCondition> {
  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      assessmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      assessmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      assessmentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterFilterCondition>
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

extension QuestionPhotoQueryObject
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QFilterCondition> {}

extension QuestionPhotoQueryLinks
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QFilterCondition> {}

extension QuestionPhotoQuerySortBy
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QSortBy> {
  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      sortByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      sortByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> sortByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> sortByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension QuestionPhotoQuerySortThenBy
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QSortThenBy> {
  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      thenByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      thenByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> thenByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> thenByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy> thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension QuestionPhotoQueryWhereDistinct
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QDistinct> {
  QueryBuilder<QuestionPhoto, QuestionPhoto, QDistinct>
      distinctByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessmentId');
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QDistinct> distinctByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoId');
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QDistinct> distinctByPhotoPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionPhoto, QuestionPhoto, QDistinct> distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }
}

extension QuestionPhotoQueryProperty
    on QueryBuilder<QuestionPhoto, QuestionPhoto, QQueryProperty> {
  QueryBuilder<QuestionPhoto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionPhoto, int?, QQueryOperations> assessmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessmentId');
    });
  }

  QueryBuilder<QuestionPhoto, int?, QQueryOperations> photoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoId');
    });
  }

  QueryBuilder<QuestionPhoto, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<QuestionPhoto, int?, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionPhoto _$$_QuestionPhotoFromJson(Map<String, dynamic> json) =>
    _$_QuestionPhoto(
      photoId: json['PhotoId'] as int?,
      assessmentId: json['AssessmentId'] as int?,
      questionId: json['QuestionId'] as int?,
      photoPath: json['PhotoPath'] as String?,
    );

Map<String, dynamic> _$$_QuestionPhotoToJson(_$_QuestionPhoto instance) =>
    <String, dynamic>{
      'PhotoId': instance.photoId,
      'AssessmentId': instance.assessmentId,
      'QuestionId': instance.questionId,
      'PhotoPath': instance.photoPath,
    };
