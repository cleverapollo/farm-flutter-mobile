// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_question_photo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAuditQuestionPhotoCollection on Isar {
  IsarCollection<AuditQuestionPhoto> get auditQuestionPhotos =>
      this.collection();
}

const AuditQuestionPhotoSchema = CollectionSchema(
  name: r'AuditQuestionPhoto',
  id: 6062976077076296518,
  properties: {
    r'auditId': PropertySchema(
      id: 0,
      name: r'auditId',
      type: IsarType.long,
    ),
    r'photoId': PropertySchema(
      id: 1,
      name: r'photoId',
      type: IsarType.long,
    ),
    r'photoName': PropertySchema(
      id: 2,
      name: r'photoName',
      type: IsarType.string,
    ),
    r'photoPath': PropertySchema(
      id: 3,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 4,
      name: r'questionId',
      type: IsarType.long,
    )
  },
  estimateSize: _auditQuestionPhotoEstimateSize,
  serialize: _auditQuestionPhotoSerialize,
  deserialize: _auditQuestionPhotoDeserialize,
  deserializeProp: _auditQuestionPhotoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditQuestionPhotoGetId,
  getLinks: _auditQuestionPhotoGetLinks,
  attach: _auditQuestionPhotoAttach,
  version: '3.0.5',
);

int _auditQuestionPhotoEstimateSize(
  AuditQuestionPhoto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.photoName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _auditQuestionPhotoSerialize(
  AuditQuestionPhoto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.auditId);
  writer.writeLong(offsets[1], object.photoId);
  writer.writeString(offsets[2], object.photoName);
  writer.writeString(offsets[3], object.photoPath);
  writer.writeLong(offsets[4], object.questionId);
}

AuditQuestionPhoto _auditQuestionPhotoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AuditQuestionPhoto(
    auditId: reader.readLongOrNull(offsets[0]),
    photoId: reader.readLongOrNull(offsets[1]),
    photoName: reader.readStringOrNull(offsets[2]),
    photoPath: reader.readStringOrNull(offsets[3]),
    questionId: reader.readLongOrNull(offsets[4]),
  );
  return object;
}

P _auditQuestionPhotoDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditQuestionPhotoGetId(AuditQuestionPhoto object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditQuestionPhotoGetLinks(
    AuditQuestionPhoto object) {
  return [];
}

void _auditQuestionPhotoAttach(
    IsarCollection<dynamic> col, Id id, AuditQuestionPhoto object) {}

extension AuditQuestionPhotoQueryWhereSort
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QWhere> {
  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditQuestionPhotoQueryWhere
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QWhereClause> {
  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterWhereClause>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterWhereClause>
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

extension AuditQuestionPhotoQueryFilter
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QFilterCondition> {
  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      auditIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auditId',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      auditIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auditId',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      auditIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auditId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoName',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoName',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoName',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterFilterCondition>
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

extension AuditQuestionPhotoQueryObject
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QFilterCondition> {}

extension AuditQuestionPhotoQueryLinks
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QFilterCondition> {}

extension AuditQuestionPhotoQuerySortBy
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QSortBy> {
  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension AuditQuestionPhotoQuerySortThenBy
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QSortThenBy> {
  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByAuditIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auditId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension AuditQuestionPhotoQueryWhereDistinct
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QDistinct> {
  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QDistinct>
      distinctByAuditId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auditId');
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QDistinct>
      distinctByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoId');
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QDistinct>
      distinctByPhotoName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QDistinct>
      distinctByPhotoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QDistinct>
      distinctByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId');
    });
  }
}

extension AuditQuestionPhotoQueryProperty
    on QueryBuilder<AuditQuestionPhoto, AuditQuestionPhoto, QQueryProperty> {
  QueryBuilder<AuditQuestionPhoto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AuditQuestionPhoto, int?, QQueryOperations> auditIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auditId');
    });
  }

  QueryBuilder<AuditQuestionPhoto, int?, QQueryOperations> photoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoId');
    });
  }

  QueryBuilder<AuditQuestionPhoto, String?, QQueryOperations>
      photoNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoName');
    });
  }

  QueryBuilder<AuditQuestionPhoto, String?, QQueryOperations>
      photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<AuditQuestionPhoto, int?, QQueryOperations>
      questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuditQuestionPhoto _$$_AuditQuestionPhotoFromJson(
        Map<String, dynamic> json) =>
    _$_AuditQuestionPhoto(
      photoId: json['PhotoId'] as int?,
      auditId: json['AuditId'] as int?,
      questionId: json['QuestionId'] as int?,
      photoPath: json['PhotoPath'] as String?,
      photoName: json['PhotoName'] as String?,
    );

Map<String, dynamic> _$$_AuditQuestionPhotoToJson(
        _$_AuditQuestionPhoto instance) =>
    <String, dynamic>{
      'PhotoId': instance.photoId,
      'AuditId': instance.auditId,
      'QuestionId': instance.questionId,
      'PhotoPath': instance.photoPath,
      'PhotoName': instance.photoName,
    };
