// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPhotoModelCollection on Isar {
  IsarCollection<PhotoModel> get photoModels => this.collection();
}

const PhotoModelSchema = CollectionSchema(
  name: r'PhotoModel',
  id: -2122015663171639146,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 1,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'photoId': PropertySchema(
      id: 2,
      name: r'photoId',
      type: IsarType.long,
    ),
    r'photoName': PropertySchema(
      id: 3,
      name: r'photoName',
      type: IsarType.string,
    ),
    r'photoPath': PropertySchema(
      id: 4,
      name: r'photoPath',
      type: IsarType.string,
    )
  },
  estimateSize: _photoModelEstimateSize,
  serialize: _photoModelSerialize,
  deserialize: _photoModelDeserialize,
  deserializeProp: _photoModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _photoModelGetId,
  getLinks: _photoModelGetLinks,
  attach: _photoModelAttach,
  version: '3.0.5',
);

int _photoModelEstimateSize(
  PhotoModel object,
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

void _photoModelSerialize(
  PhotoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeBool(offsets[1], object.isLocal);
  writer.writeLong(offsets[2], object.photoId);
  writer.writeString(offsets[3], object.photoName);
  writer.writeString(offsets[4], object.photoPath);
}

PhotoModel _photoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhotoModel(
    isActive: reader.readBoolOrNull(offsets[0]),
    isLocal: reader.readBoolOrNull(offsets[1]),
    photoId: reader.readLongOrNull(offsets[2]),
    photoName: reader.readStringOrNull(offsets[3]),
    photoPath: reader.readStringOrNull(offsets[4]),
  );
  return object;
}

P _photoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _photoModelGetId(PhotoModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _photoModelGetLinks(PhotoModel object) {
  return [];
}

void _photoModelAttach(IsarCollection<dynamic> col, Id id, PhotoModel object) {}

extension PhotoModelQueryWhereSort
    on QueryBuilder<PhotoModel, PhotoModel, QWhere> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhotoModelQueryWhere
    on QueryBuilder<PhotoModel, PhotoModel, QWhereClause> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterWhereClause> idBetween(
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

extension PhotoModelQueryFilter
    on QueryBuilder<PhotoModel, PhotoModel, QFilterCondition> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> isLocalEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoId',
        value: value,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoIdLessThan(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoIdBetween(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoName',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoName',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoNameEqualTo(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoNameLessThan(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoNameBetween(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoNameEndsWith(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoName',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoName',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoPathEqualTo(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoPathLessThan(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoPathBetween(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoPathEndsWith(
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

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoPathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition> photoPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterFilterCondition>
      photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoPath',
        value: '',
      ));
    });
  }
}

extension PhotoModelQueryObject
    on QueryBuilder<PhotoModel, PhotoModel, QFilterCondition> {}

extension PhotoModelQueryLinks
    on QueryBuilder<PhotoModel, PhotoModel, QFilterCondition> {}

extension PhotoModelQuerySortBy
    on QueryBuilder<PhotoModel, PhotoModel, QSortBy> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension PhotoModelQuerySortThenBy
    on QueryBuilder<PhotoModel, PhotoModel, QSortThenBy> {
  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QAfterSortBy> thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }
}

extension PhotoModelQueryWhereDistinct
    on QueryBuilder<PhotoModel, PhotoModel, QDistinct> {
  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoId');
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByPhotoName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhotoModel, PhotoModel, QDistinct> distinctByPhotoPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }
}

extension PhotoModelQueryProperty
    on QueryBuilder<PhotoModel, PhotoModel, QQueryProperty> {
  QueryBuilder<PhotoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PhotoModel, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<PhotoModel, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<PhotoModel, int?, QQueryOperations> photoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoId');
    });
  }

  QueryBuilder<PhotoModel, String?, QQueryOperations> photoNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoName');
    });
  }

  QueryBuilder<PhotoModel, String?, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoModel _$$_PhotoModelFromJson(Map<String, dynamic> json) =>
    _$_PhotoModel(
      photoId: json['PhotoId'] as int?,
      photoName: json['PhotoName'] as String?,
      photoPath: json['PhotoPath'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_PhotoModelToJson(_$_PhotoModel instance) =>
    <String, dynamic>{
      'PhotoId': instance.photoId,
      'PhotoName': instance.photoName,
      'PhotoPath': instance.photoPath,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
