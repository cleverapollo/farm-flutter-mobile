// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGenderCollection on Isar {
  IsarCollection<Gender> get genders => this.collection();
}

const GenderSchema = CollectionSchema(
  name: r'Gender',
  id: -3936478105572216743,
  properties: {
    r'genderId': PropertySchema(
      id: 0,
      name: r'genderId',
      type: IsarType.long,
    ),
    r'genderName': PropertySchema(
      id: 1,
      name: r'genderName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _genderEstimateSize,
  serialize: _genderSerialize,
  deserialize: _genderDeserialize,
  deserializeProp: _genderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _genderGetId,
  getLinks: _genderGetLinks,
  attach: _genderAttach,
  version: '3.0.5',
);

int _genderEstimateSize(
  Gender object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.genderName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _genderSerialize(
  Gender object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.genderId);
  writer.writeString(offsets[1], object.genderName);
  writer.writeBool(offsets[2], object.isActive);
}

Gender _genderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Gender(
    genderId: reader.readLongOrNull(offsets[0]),
    genderName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
  );
  return object;
}

P _genderDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _genderGetId(Gender object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _genderGetLinks(Gender object) {
  return [];
}

void _genderAttach(IsarCollection<dynamic> col, Id id, Gender object) {}

extension GenderQueryWhereSort on QueryBuilder<Gender, Gender, QWhere> {
  QueryBuilder<Gender, Gender, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GenderQueryWhere on QueryBuilder<Gender, Gender, QWhereClause> {
  QueryBuilder<Gender, Gender, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Gender, Gender, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Gender, Gender, QAfterWhereClause> idBetween(
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

extension GenderQueryFilter on QueryBuilder<Gender, Gender, QFilterCondition> {
  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genderId',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genderId',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genderName',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genderName',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genderName',
        value: '',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> genderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genderName',
        value: '',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Gender, Gender, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Gender, Gender, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension GenderQueryObject on QueryBuilder<Gender, Gender, QFilterCondition> {}

extension GenderQueryLinks on QueryBuilder<Gender, Gender, QFilterCondition> {}

extension GenderQuerySortBy on QueryBuilder<Gender, Gender, QSortBy> {
  QueryBuilder<Gender, Gender, QAfterSortBy> sortByGenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> sortByGenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.desc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> sortByGenderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderName', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> sortByGenderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderName', Sort.desc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension GenderQuerySortThenBy on QueryBuilder<Gender, Gender, QSortThenBy> {
  QueryBuilder<Gender, Gender, QAfterSortBy> thenByGenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByGenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.desc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByGenderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderName', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByGenderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderName', Sort.desc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Gender, Gender, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension GenderQueryWhereDistinct on QueryBuilder<Gender, Gender, QDistinct> {
  QueryBuilder<Gender, Gender, QDistinct> distinctByGenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genderId');
    });
  }

  QueryBuilder<Gender, Gender, QDistinct> distinctByGenderName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genderName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Gender, Gender, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension GenderQueryProperty on QueryBuilder<Gender, Gender, QQueryProperty> {
  QueryBuilder<Gender, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Gender, int?, QQueryOperations> genderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genderId');
    });
  }

  QueryBuilder<Gender, String?, QQueryOperations> genderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genderName');
    });
  }

  QueryBuilder<Gender, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gender _$$_GenderFromJson(Map<String, dynamic> json) => _$_Gender(
      genderId: json['GenderId'] as int?,
      genderName: json['GenderName'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$_GenderToJson(_$_Gender instance) => <String, dynamic>{
      'GenderId': instance.genderId,
      'GenderName': instance.genderName,
      'IsActive': instance.isActive,
    };
