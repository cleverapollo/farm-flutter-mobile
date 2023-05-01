// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rte_species_photo_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRteSpeciesPhotoModelCollection on Isar {
  IsarCollection<RteSpeciesPhotoModel> get rteSpeciesPhotoModels =>
      this.collection();
}

const RteSpeciesPhotoModelSchema = CollectionSchema(
  name: r'RteSpeciesPhotoModel',
  id: 1579121269187386054,
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
    ),
    r'rteSpeciesId': PropertySchema(
      id: 5,
      name: r'rteSpeciesId',
      type: IsarType.long,
    )
  },
  estimateSize: _rteSpeciesPhotoModelEstimateSize,
  serialize: _rteSpeciesPhotoModelSerialize,
  deserialize: _rteSpeciesPhotoModelDeserialize,
  deserializeProp: _rteSpeciesPhotoModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _rteSpeciesPhotoModelGetId,
  getLinks: _rteSpeciesPhotoModelGetLinks,
  attach: _rteSpeciesPhotoModelAttach,
  version: '3.0.5',
);

int _rteSpeciesPhotoModelEstimateSize(
  RteSpeciesPhotoModel object,
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

void _rteSpeciesPhotoModelSerialize(
  RteSpeciesPhotoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeBool(offsets[1], object.isLocal);
  writer.writeLong(offsets[2], object.photoId);
  writer.writeString(offsets[3], object.photoName);
  writer.writeString(offsets[4], object.photoPath);
  writer.writeLong(offsets[5], object.rteSpeciesId);
}

RteSpeciesPhotoModel _rteSpeciesPhotoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RteSpeciesPhotoModel(
    isActive: reader.readBoolOrNull(offsets[0]),
    isLocal: reader.readBoolOrNull(offsets[1]),
    photoId: reader.readLongOrNull(offsets[2]),
    photoName: reader.readStringOrNull(offsets[3]),
    photoPath: reader.readStringOrNull(offsets[4]),
    rteSpeciesId: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _rteSpeciesPhotoModelDeserializeProp<P>(
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
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rteSpeciesPhotoModelGetId(RteSpeciesPhotoModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rteSpeciesPhotoModelGetLinks(
    RteSpeciesPhotoModel object) {
  return [];
}

void _rteSpeciesPhotoModelAttach(
    IsarCollection<dynamic> col, Id id, RteSpeciesPhotoModel object) {}

extension RteSpeciesPhotoModelQueryWhereSort
    on QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QWhere> {
  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RteSpeciesPhotoModelQueryWhere
    on QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QWhereClause> {
  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterWhereClause>
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterWhereClause>
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

extension RteSpeciesPhotoModelQueryFilter on QueryBuilder<RteSpeciesPhotoModel,
    RteSpeciesPhotoModel, QFilterCondition> {
  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoId',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoIdGreaterThan(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoIdLessThan(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoIdBetween(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoName',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoName',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameEqualTo(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameGreaterThan(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameLessThan(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameBetween(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameStartsWith(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameEndsWith(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
          QAfterFilterCondition>
      photoNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
          QAfterFilterCondition>
      photoNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoPath',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathEqualTo(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathGreaterThan(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathLessThan(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathBetween(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathStartsWith(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathEndsWith(
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

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
          QAfterFilterCondition>
      photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
          QAfterFilterCondition>
      photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> rteSpeciesIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rteSpeciesId',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> rteSpeciesIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rteSpeciesId',
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> rteSpeciesIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rteSpeciesId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> rteSpeciesIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rteSpeciesId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> rteSpeciesIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rteSpeciesId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel,
      QAfterFilterCondition> rteSpeciesIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rteSpeciesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RteSpeciesPhotoModelQueryObject on QueryBuilder<RteSpeciesPhotoModel,
    RteSpeciesPhotoModel, QFilterCondition> {}

extension RteSpeciesPhotoModelQueryLinks on QueryBuilder<RteSpeciesPhotoModel,
    RteSpeciesPhotoModel, QFilterCondition> {}

extension RteSpeciesPhotoModelQuerySortBy
    on QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QSortBy> {
  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByRteSpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      sortByRteSpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.desc);
    });
  }
}

extension RteSpeciesPhotoModelQuerySortThenBy
    on QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QSortThenBy> {
  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByPhotoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoId', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByPhotoName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByPhotoNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoName', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByRteSpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.asc);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QAfterSortBy>
      thenByRteSpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.desc);
    });
  }
}

extension RteSpeciesPhotoModelQueryWhereDistinct
    on QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QDistinct> {
  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QDistinct>
      distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QDistinct>
      distinctByPhotoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoId');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QDistinct>
      distinctByPhotoName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QDistinct>
      distinctByPhotoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, RteSpeciesPhotoModel, QDistinct>
      distinctByRteSpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rteSpeciesId');
    });
  }
}

extension RteSpeciesPhotoModelQueryProperty on QueryBuilder<
    RteSpeciesPhotoModel, RteSpeciesPhotoModel, QQueryProperty> {
  QueryBuilder<RteSpeciesPhotoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, bool?, QQueryOperations>
      isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, int?, QQueryOperations> photoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoId');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, String?, QQueryOperations>
      photoNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoName');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, String?, QQueryOperations>
      photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<RteSpeciesPhotoModel, int?, QQueryOperations>
      rteSpeciesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rteSpeciesId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RteSpeciesPhotoModel _$$_RteSpeciesPhotoModelFromJson(
        Map<String, dynamic> json) =>
    _$_RteSpeciesPhotoModel(
      rteSpeciesId: json['RteSpeciesId'] as int?,
      photoId: json['PhotoId'] as int?,
      photoName: json['PhotoName'] as String?,
      photoPath: json['PhotoPath'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_RteSpeciesPhotoModelToJson(
        _$_RteSpeciesPhotoModel instance) =>
    <String, dynamic>{
      'RteSpeciesId': instance.rteSpeciesId,
      'PhotoId': instance.photoId,
      'PhotoName': instance.photoName,
      'PhotoPath': instance.photoPath,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
