// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_property_ownership_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmPropertyOwnershipTypeCollection on Isar {
  IsarCollection<FarmPropertyOwnershipType> get farmPropertyOwnershipTypes =>
      this.collection();
}

const FarmPropertyOwnershipTypeSchema = CollectionSchema(
  name: r'FarmPropertyOwnershipType',
  id: 1859816943181959566,
  properties: {
    r'farmPropertyOwnershipTypeId': PropertySchema(
      id: 0,
      name: r'farmPropertyOwnershipTypeId',
      type: IsarType.long,
    ),
    r'farmPropertyOwnershipTypeName': PropertySchema(
      id: 1,
      name: r'farmPropertyOwnershipTypeName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.long,
    )
  },
  estimateSize: _farmPropertyOwnershipTypeEstimateSize,
  serialize: _farmPropertyOwnershipTypeSerialize,
  deserialize: _farmPropertyOwnershipTypeDeserialize,
  deserializeProp: _farmPropertyOwnershipTypeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmPropertyOwnershipTypeGetId,
  getLinks: _farmPropertyOwnershipTypeGetLinks,
  attach: _farmPropertyOwnershipTypeAttach,
  version: '3.0.5',
);

int _farmPropertyOwnershipTypeEstimateSize(
  FarmPropertyOwnershipType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.farmPropertyOwnershipTypeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmPropertyOwnershipTypeSerialize(
  FarmPropertyOwnershipType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.farmPropertyOwnershipTypeId);
  writer.writeString(offsets[1], object.farmPropertyOwnershipTypeName);
  writer.writeLong(offsets[2], object.isActive);
}

FarmPropertyOwnershipType _farmPropertyOwnershipTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmPropertyOwnershipType(
    farmPropertyOwnershipTypeId: reader.readLong(offsets[0]),
    farmPropertyOwnershipTypeName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _farmPropertyOwnershipTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmPropertyOwnershipTypeGetId(FarmPropertyOwnershipType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmPropertyOwnershipTypeGetLinks(
    FarmPropertyOwnershipType object) {
  return [];
}

void _farmPropertyOwnershipTypeAttach(
    IsarCollection<dynamic> col, Id id, FarmPropertyOwnershipType object) {}

extension FarmPropertyOwnershipTypeQueryWhereSort on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QWhere> {
  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmPropertyOwnershipTypeQueryWhere on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QWhereClause> {
  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterWhereClause> idBetween(
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

extension FarmPropertyOwnershipTypeQueryFilter on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QFilterCondition> {
  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmPropertyOwnershipTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmPropertyOwnershipTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmPropertyOwnershipTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmPropertyOwnershipTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmPropertyOwnershipTypeName',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmPropertyOwnershipTypeName',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmPropertyOwnershipTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmPropertyOwnershipTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmPropertyOwnershipTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmPropertyOwnershipTypeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmPropertyOwnershipTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmPropertyOwnershipTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
          QAfterFilterCondition>
      farmPropertyOwnershipTypeNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmPropertyOwnershipTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
          QAfterFilterCondition>
      farmPropertyOwnershipTypeNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmPropertyOwnershipTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmPropertyOwnershipTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmPropertyOwnershipTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
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

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
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

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
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

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> isActiveEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> isActiveGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> isActiveLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterFilterCondition> isActiveBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isActive',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FarmPropertyOwnershipTypeQueryObject on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QFilterCondition> {}

extension FarmPropertyOwnershipTypeQueryLinks on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QFilterCondition> {}

extension FarmPropertyOwnershipTypeQuerySortBy on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QSortBy> {
  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension FarmPropertyOwnershipTypeQuerySortThenBy on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QSortThenBy> {
  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType,
      QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension FarmPropertyOwnershipTypeQueryWhereDistinct on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QDistinct> {
  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType, QDistinct>
      distinctByFarmPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmPropertyOwnershipTypeId');
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType, QDistinct>
      distinctByFarmPropertyOwnershipTypeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmPropertyOwnershipTypeName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, FarmPropertyOwnershipType, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension FarmPropertyOwnershipTypeQueryProperty on QueryBuilder<
    FarmPropertyOwnershipType, FarmPropertyOwnershipType, QQueryProperty> {
  QueryBuilder<FarmPropertyOwnershipType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, int, QQueryOperations>
      farmPropertyOwnershipTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmPropertyOwnershipTypeId');
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, String?, QQueryOperations>
      farmPropertyOwnershipTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmPropertyOwnershipTypeName');
    });
  }

  QueryBuilder<FarmPropertyOwnershipType, int?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmPropertyOwnershipType _$$_FarmPropertyOwnershipTypeFromJson(
        Map<String, dynamic> json) =>
    _$_FarmPropertyOwnershipType(
      farmPropertyOwnershipTypeId: json['FarmPropertyOwnershipTypeId'] as int,
      farmPropertyOwnershipTypeName:
          json['FarmPropertyOwnershipTypeName'] as String?,
      isActive: json['IsActive'] as int?,
    );

Map<String, dynamic> _$$_FarmPropertyOwnershipTypeToJson(
        _$_FarmPropertyOwnershipType instance) =>
    <String, dynamic>{
      'FarmPropertyOwnershipTypeId': instance.farmPropertyOwnershipTypeId,
      'FarmPropertyOwnershipTypeName': instance.farmPropertyOwnershipTypeName,
      'IsActive': instance.isActive,
    };
