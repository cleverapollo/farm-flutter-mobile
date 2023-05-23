// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlantationCollection on Isar {
  IsarCollection<Plantation> get plantations => this.collection();
}

const PlantationSchema = CollectionSchema(
  name: r'Plantation',
  id: 948143892792963652,
  properties: {
    r'companyId': PropertySchema(
      id: 0,
      name: r'companyId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 1,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'plantationId': PropertySchema(
      id: 2,
      name: r'plantationId',
      type: IsarType.long,
    ),
    r'plantationName': PropertySchema(
      id: 3,
      name: r'plantationName',
      type: IsarType.string,
    )
  },
  estimateSize: _plantationEstimateSize,
  serialize: _plantationSerialize,
  deserialize: _plantationDeserialize,
  deserializeProp: _plantationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _plantationGetId,
  getLinks: _plantationGetLinks,
  attach: _plantationAttach,
  version: '3.1.0',
);

int _plantationEstimateSize(
  Plantation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.plantationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _plantationSerialize(
  Plantation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyId);
  writer.writeBool(offsets[1], object.isActive);
  writer.writeLong(offsets[2], object.plantationId);
  writer.writeString(offsets[3], object.plantationName);
}

Plantation _plantationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Plantation(
    companyId: reader.readLongOrNull(offsets[0]),
    isActive: reader.readBoolOrNull(offsets[1]),
    plantationId: reader.readLong(offsets[2]),
    plantationName: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _plantationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _plantationGetId(Plantation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _plantationGetLinks(Plantation object) {
  return [];
}

void _plantationAttach(IsarCollection<dynamic> col, Id id, Plantation object) {}

extension PlantationQueryWhereSort
    on QueryBuilder<Plantation, Plantation, QWhere> {
  QueryBuilder<Plantation, Plantation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlantationQueryWhere
    on QueryBuilder<Plantation, Plantation, QWhereClause> {
  QueryBuilder<Plantation, Plantation, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Plantation, Plantation, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterWhereClause> idBetween(
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

extension PlantationQueryFilter
    on QueryBuilder<Plantation, Plantation, QFilterCondition> {
  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      companyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      companyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> companyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      companyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> companyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> companyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plantationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plantationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plantationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plantationName',
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plantationName',
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plantationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plantationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationName',
        value: '',
      ));
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterFilterCondition>
      plantationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plantationName',
        value: '',
      ));
    });
  }
}

extension PlantationQueryObject
    on QueryBuilder<Plantation, Plantation, QFilterCondition> {}

extension PlantationQueryLinks
    on QueryBuilder<Plantation, Plantation, QFilterCondition> {}

extension PlantationQuerySortBy
    on QueryBuilder<Plantation, Plantation, QSortBy> {
  QueryBuilder<Plantation, Plantation, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> sortByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> sortByPlantationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.desc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> sortByPlantationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy>
      sortByPlantationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.desc);
    });
  }
}

extension PlantationQuerySortThenBy
    on QueryBuilder<Plantation, Plantation, QSortThenBy> {
  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByPlantationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.desc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy> thenByPlantationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.asc);
    });
  }

  QueryBuilder<Plantation, Plantation, QAfterSortBy>
      thenByPlantationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.desc);
    });
  }
}

extension PlantationQueryWhereDistinct
    on QueryBuilder<Plantation, Plantation, QDistinct> {
  QueryBuilder<Plantation, Plantation, QDistinct> distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<Plantation, Plantation, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Plantation, Plantation, QDistinct> distinctByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantationId');
    });
  }

  QueryBuilder<Plantation, Plantation, QDistinct> distinctByPlantationName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantationName',
          caseSensitive: caseSensitive);
    });
  }
}

extension PlantationQueryProperty
    on QueryBuilder<Plantation, Plantation, QQueryProperty> {
  QueryBuilder<Plantation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Plantation, int?, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<Plantation, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Plantation, int, QQueryOperations> plantationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantationId');
    });
  }

  QueryBuilder<Plantation, String?, QQueryOperations> plantationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantationName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Plantation _$$_PlantationFromJson(Map<String, dynamic> json) =>
    _$_Plantation(
      plantationId: json['PlantationId'] as int,
      plantationName: json['PlantationName'] as String?,
      isActive: json['IsActive'] as bool?,
      companyId: json['CompanyId'] as int?,
    );

Map<String, dynamic> _$$_PlantationToJson(_$_Plantation instance) =>
    <String, dynamic>{
      'PlantationId': instance.plantationId,
      'PlantationName': instance.plantationName,
      'IsActive': instance.isActive,
      'CompanyId': instance.companyId,
    };
