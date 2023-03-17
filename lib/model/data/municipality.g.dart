// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMunicipalityCollection on Isar {
  IsarCollection<Municipality> get municipalitys => this.collection();
}

const MunicipalitySchema = CollectionSchema(
  name: r'Municipality',
  id: 395253279655471494,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'municipalityId': PropertySchema(
      id: 1,
      name: r'municipalityId',
      type: IsarType.long,
    ),
    r'municipalityName': PropertySchema(
      id: 2,
      name: r'municipalityName',
      type: IsarType.string,
    )
  },
  estimateSize: _municipalityEstimateSize,
  serialize: _municipalitySerialize,
  deserialize: _municipalityDeserialize,
  deserializeProp: _municipalityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _municipalityGetId,
  getLinks: _municipalityGetLinks,
  attach: _municipalityAttach,
  version: '3.0.5',
);

int _municipalityEstimateSize(
  Municipality object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.municipalityName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _municipalitySerialize(
  Municipality object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.municipalityId);
  writer.writeString(offsets[2], object.municipalityName);
}

Municipality _municipalityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Municipality(
    isActive: reader.readBoolOrNull(offsets[0]),
    municipalityId: reader.readLong(offsets[1]),
    municipalityName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _municipalityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _municipalityGetId(Municipality object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _municipalityGetLinks(Municipality object) {
  return [];
}

void _municipalityAttach(
    IsarCollection<dynamic> col, Id id, Municipality object) {}

extension MunicipalityQueryWhereSort
    on QueryBuilder<Municipality, Municipality, QWhere> {
  QueryBuilder<Municipality, Municipality, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MunicipalityQueryWhere
    on QueryBuilder<Municipality, Municipality, QWhereClause> {
  QueryBuilder<Municipality, Municipality, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Municipality, Municipality, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterWhereClause> idBetween(
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

extension MunicipalityQueryFilter
    on QueryBuilder<Municipality, Municipality, QFilterCondition> {
  QueryBuilder<Municipality, Municipality, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipalityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'municipalityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'municipalityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'municipalityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'municipalityName',
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'municipalityName',
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipalityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'municipalityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'municipalityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'municipalityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'municipalityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'municipalityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'municipalityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'municipalityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipalityName',
        value: '',
      ));
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterFilterCondition>
      municipalityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'municipalityName',
        value: '',
      ));
    });
  }
}

extension MunicipalityQueryObject
    on QueryBuilder<Municipality, Municipality, QFilterCondition> {}

extension MunicipalityQueryLinks
    on QueryBuilder<Municipality, Municipality, QFilterCondition> {}

extension MunicipalityQuerySortBy
    on QueryBuilder<Municipality, Municipality, QSortBy> {
  QueryBuilder<Municipality, Municipality, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      sortByMunicipalityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.asc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      sortByMunicipalityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.desc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      sortByMunicipalityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityName', Sort.asc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      sortByMunicipalityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityName', Sort.desc);
    });
  }
}

extension MunicipalityQuerySortThenBy
    on QueryBuilder<Municipality, Municipality, QSortThenBy> {
  QueryBuilder<Municipality, Municipality, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      thenByMunicipalityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.asc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      thenByMunicipalityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.desc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      thenByMunicipalityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityName', Sort.asc);
    });
  }

  QueryBuilder<Municipality, Municipality, QAfterSortBy>
      thenByMunicipalityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityName', Sort.desc);
    });
  }
}

extension MunicipalityQueryWhereDistinct
    on QueryBuilder<Municipality, Municipality, QDistinct> {
  QueryBuilder<Municipality, Municipality, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Municipality, Municipality, QDistinct>
      distinctByMunicipalityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipalityId');
    });
  }

  QueryBuilder<Municipality, Municipality, QDistinct>
      distinctByMunicipalityName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipalityName',
          caseSensitive: caseSensitive);
    });
  }
}

extension MunicipalityQueryProperty
    on QueryBuilder<Municipality, Municipality, QQueryProperty> {
  QueryBuilder<Municipality, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Municipality, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Municipality, int, QQueryOperations> municipalityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipalityId');
    });
  }

  QueryBuilder<Municipality, String?, QQueryOperations>
      municipalityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipalityName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Municipality _$$_MunicipalityFromJson(Map<String, dynamic> json) =>
    _$_Municipality(
      municipalityId: json['MunicipalityId'] as int,
      municipalityName: json['MunicipalityName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_MunicipalityToJson(_$_Municipality instance) =>
    <String, dynamic>{
      'MunicipalityId': instance.municipalityId,
      'MunicipalityName': instance.municipalityName,
      'IsActive': instance.isActive,
    };
