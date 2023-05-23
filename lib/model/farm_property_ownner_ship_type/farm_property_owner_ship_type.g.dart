// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_property_owner_ship_type.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFarmPropertyOwnerShipTypeCollection on Isar {
  IsarCollection<FarmPropertyOwnerShipType> get farmPropertyOwnerShipTypes =>
      this.collection();
}

const FarmPropertyOwnerShipTypeSchema = CollectionSchema(
  name: r'FarmPropertyOwnerShipType',
  id: -4742813268028381267,
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
    )
  },
  estimateSize: _farmPropertyOwnerShipTypeEstimateSize,
  serialize: _farmPropertyOwnerShipTypeSerialize,
  deserialize: _farmPropertyOwnerShipTypeDeserialize,
  deserializeProp: _farmPropertyOwnerShipTypeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmPropertyOwnerShipTypeGetId,
  getLinks: _farmPropertyOwnerShipTypeGetLinks,
  attach: _farmPropertyOwnerShipTypeAttach,
  version: '3.1.0',
);

int _farmPropertyOwnerShipTypeEstimateSize(
  FarmPropertyOwnerShipType object,
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

void _farmPropertyOwnerShipTypeSerialize(
  FarmPropertyOwnerShipType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.farmPropertyOwnershipTypeId);
  writer.writeString(offsets[1], object.farmPropertyOwnershipTypeName);
}

FarmPropertyOwnerShipType _farmPropertyOwnerShipTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmPropertyOwnerShipType(
    farmPropertyOwnershipTypeId: reader.readLongOrNull(offsets[0]),
    farmPropertyOwnershipTypeName: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _farmPropertyOwnerShipTypeDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmPropertyOwnerShipTypeGetId(FarmPropertyOwnerShipType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmPropertyOwnerShipTypeGetLinks(
    FarmPropertyOwnerShipType object) {
  return [];
}

void _farmPropertyOwnerShipTypeAttach(
    IsarCollection<dynamic> col, Id id, FarmPropertyOwnerShipType object) {}

extension FarmPropertyOwnerShipTypeQueryWhereSort on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QWhere> {
  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmPropertyOwnerShipTypeQueryWhere on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QWhereClause> {
  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

extension FarmPropertyOwnerShipTypeQueryFilter on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QFilterCondition> {
  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmPropertyOwnershipTypeId',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmPropertyOwnershipTypeId',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmPropertyOwnershipTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdGreaterThan(
    int? value, {
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdLessThan(
    int? value, {
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmPropertyOwnershipTypeName',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmPropertyOwnershipTypeName',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmPropertyOwnershipTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> farmPropertyOwnershipTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmPropertyOwnershipTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
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
}

extension FarmPropertyOwnerShipTypeQueryObject on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QFilterCondition> {}

extension FarmPropertyOwnerShipTypeQueryLinks on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QFilterCondition> {}

extension FarmPropertyOwnerShipTypeQuerySortBy on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QSortBy> {
  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> sortByFarmPropertyOwnershipTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.desc);
    });
  }
}

extension FarmPropertyOwnerShipTypeQuerySortThenBy on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QSortThenBy> {
  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeId', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> thenByFarmPropertyOwnershipTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmPropertyOwnershipTypeName', Sort.desc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension FarmPropertyOwnerShipTypeQueryWhereDistinct on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QDistinct> {
  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QDistinct>
      distinctByFarmPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmPropertyOwnershipTypeId');
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QDistinct>
      distinctByFarmPropertyOwnershipTypeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmPropertyOwnershipTypeName',
          caseSensitive: caseSensitive);
    });
  }
}

extension FarmPropertyOwnerShipTypeQueryProperty on QueryBuilder<
    FarmPropertyOwnerShipType, FarmPropertyOwnerShipType, QQueryProperty> {
  QueryBuilder<FarmPropertyOwnerShipType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, int?, QQueryOperations>
      farmPropertyOwnershipTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmPropertyOwnershipTypeId');
    });
  }

  QueryBuilder<FarmPropertyOwnerShipType, String?, QQueryOperations>
      farmPropertyOwnershipTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmPropertyOwnershipTypeName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmPropertyOwnerShipType _$$_FarmPropertyOwnerShipTypeFromJson(
        Map<String, dynamic> json) =>
    _$_FarmPropertyOwnerShipType(
      farmPropertyOwnershipTypeId: json['FarmPropertyOwnershipTypeId'] as int?,
      farmPropertyOwnershipTypeName:
          json['FarmPropertyOwnershipTypeName'] as String?,
    );

Map<String, dynamic> _$$_FarmPropertyOwnerShipTypeToJson(
        _$_FarmPropertyOwnerShipType instance) =>
    <String, dynamic>{
      'FarmPropertyOwnershipTypeId': instance.farmPropertyOwnershipTypeId,
      'FarmPropertyOwnershipTypeName': instance.farmPropertyOwnershipTypeName,
    };
