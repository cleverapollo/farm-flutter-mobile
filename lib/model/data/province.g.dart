// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetProvinceCollection on Isar {
  IsarCollection<Province> get provinces => this.collection();
}

const ProvinceSchema = CollectionSchema(
  name: r'Province',
  id: -1130278499051240386,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'provinceId': PropertySchema(
      id: 1,
      name: r'provinceId',
      type: IsarType.long,
    ),
    r'provinceName': PropertySchema(
      id: 2,
      name: r'provinceName',
      type: IsarType.string,
    )
  },
  estimateSize: _provinceEstimateSize,
  serialize: _provinceSerialize,
  deserialize: _provinceDeserialize,
  deserializeProp: _provinceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _provinceGetId,
  getLinks: _provinceGetLinks,
  attach: _provinceAttach,
  version: '3.0.5',
);

int _provinceEstimateSize(
  Province object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.provinceName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _provinceSerialize(
  Province object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.provinceId);
  writer.writeString(offsets[2], object.provinceName);
}

Province _provinceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Province(
    isActive: reader.readBoolOrNull(offsets[0]),
    provinceId: reader.readLong(offsets[1]),
    provinceName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _provinceDeserializeProp<P>(
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

Id _provinceGetId(Province object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _provinceGetLinks(Province object) {
  return [];
}

void _provinceAttach(IsarCollection<dynamic> col, Id id, Province object) {}

extension ProvinceQueryWhereSort on QueryBuilder<Province, Province, QWhere> {
  QueryBuilder<Province, Province, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProvinceQueryWhere on QueryBuilder<Province, Province, QWhereClause> {
  QueryBuilder<Province, Province, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Province, Province, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Province, Province, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Province, Province, QAfterWhereClause> idBetween(
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

extension ProvinceQueryFilter
    on QueryBuilder<Province, Province, QFilterCondition> {
  QueryBuilder<Province, Province, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Province, Province, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Province, Province, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Province, Province, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'provinceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'provinceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'provinceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'provinceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'provinceName',
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition>
      provinceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'provinceName',
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'provinceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition>
      provinceNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'provinceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'provinceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'provinceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition>
      provinceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'provinceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'provinceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'provinceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition> provinceNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'provinceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition>
      provinceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'provinceName',
        value: '',
      ));
    });
  }

  QueryBuilder<Province, Province, QAfterFilterCondition>
      provinceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'provinceName',
        value: '',
      ));
    });
  }
}

extension ProvinceQueryObject
    on QueryBuilder<Province, Province, QFilterCondition> {}

extension ProvinceQueryLinks
    on QueryBuilder<Province, Province, QFilterCondition> {}

extension ProvinceQuerySortBy on QueryBuilder<Province, Province, QSortBy> {
  QueryBuilder<Province, Province, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> sortByProvinceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.asc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> sortByProvinceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.desc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> sortByProvinceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceName', Sort.asc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> sortByProvinceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceName', Sort.desc);
    });
  }
}

extension ProvinceQuerySortThenBy
    on QueryBuilder<Province, Province, QSortThenBy> {
  QueryBuilder<Province, Province, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> thenByProvinceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.asc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> thenByProvinceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.desc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> thenByProvinceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceName', Sort.asc);
    });
  }

  QueryBuilder<Province, Province, QAfterSortBy> thenByProvinceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceName', Sort.desc);
    });
  }
}

extension ProvinceQueryWhereDistinct
    on QueryBuilder<Province, Province, QDistinct> {
  QueryBuilder<Province, Province, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Province, Province, QDistinct> distinctByProvinceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'provinceId');
    });
  }

  QueryBuilder<Province, Province, QDistinct> distinctByProvinceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'provinceName', caseSensitive: caseSensitive);
    });
  }
}

extension ProvinceQueryProperty
    on QueryBuilder<Province, Province, QQueryProperty> {
  QueryBuilder<Province, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Province, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Province, int, QQueryOperations> provinceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'provinceId');
    });
  }

  QueryBuilder<Province, String?, QQueryOperations> provinceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'provinceName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Province _$$_ProvinceFromJson(Map<String, dynamic> json) => _$_Province(
      provinceId: json['ProvinceId'] as int,
      provinceName: json['ProvinceName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ProvinceToJson(_$_Province instance) =>
    <String, dynamic>{
      'ProvinceId': instance.provinceId,
      'ProvinceName': instance.provinceName,
      'IsActive': instance.isActive,
    };
