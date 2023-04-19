// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criteria.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCriteriaCollection on Isar {
  IsarCollection<Criteria> get criterias => this.collection();
}

const CriteriaSchema = CollectionSchema(
  name: r'Criteria',
  id: 6568827833719761542,
  properties: {
    r'criteriaId': PropertySchema(
      id: 0,
      name: r'criteriaId',
      type: IsarType.long,
    ),
    r'criteriaName': PropertySchema(
      id: 1,
      name: r'criteriaName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _criteriaEstimateSize,
  serialize: _criteriaSerialize,
  deserialize: _criteriaDeserialize,
  deserializeProp: _criteriaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _criteriaGetId,
  getLinks: _criteriaGetLinks,
  attach: _criteriaAttach,
  version: '3.0.5',
);

int _criteriaEstimateSize(
  Criteria object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.criteriaName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _criteriaSerialize(
  Criteria object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.criteriaId);
  writer.writeString(offsets[1], object.criteriaName);
  writer.writeBool(offsets[2], object.isActive);
}

Criteria _criteriaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Criteria(
    criteriaId: reader.readLong(offsets[0]),
    criteriaName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
  );
  return object;
}

P _criteriaDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _criteriaGetId(Criteria object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _criteriaGetLinks(Criteria object) {
  return [];
}

void _criteriaAttach(IsarCollection<dynamic> col, Id id, Criteria object) {}

extension CriteriaQueryWhereSort on QueryBuilder<Criteria, Criteria, QWhere> {
  QueryBuilder<Criteria, Criteria, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CriteriaQueryWhere on QueryBuilder<Criteria, Criteria, QWhereClause> {
  QueryBuilder<Criteria, Criteria, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Criteria, Criteria, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterWhereClause> idBetween(
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

extension CriteriaQueryFilter
    on QueryBuilder<Criteria, Criteria, QFilterCondition> {
  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'criteriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'criteriaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'criteriaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'criteriaName',
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition>
      criteriaNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'criteriaName',
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition>
      criteriaNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'criteriaName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition>
      criteriaNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'criteriaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> criteriaNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'criteriaName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition>
      criteriaNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criteriaName',
        value: '',
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition>
      criteriaNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'criteriaName',
        value: '',
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension CriteriaQueryObject
    on QueryBuilder<Criteria, Criteria, QFilterCondition> {}

extension CriteriaQueryLinks
    on QueryBuilder<Criteria, Criteria, QFilterCondition> {}

extension CriteriaQuerySortBy on QueryBuilder<Criteria, Criteria, QSortBy> {
  QueryBuilder<Criteria, Criteria, QAfterSortBy> sortByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.asc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> sortByCriteriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.desc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> sortByCriteriaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.asc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> sortByCriteriaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.desc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension CriteriaQuerySortThenBy
    on QueryBuilder<Criteria, Criteria, QSortThenBy> {
  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.asc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenByCriteriaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaId', Sort.desc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenByCriteriaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.asc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenByCriteriaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criteriaName', Sort.desc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Criteria, Criteria, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension CriteriaQueryWhereDistinct
    on QueryBuilder<Criteria, Criteria, QDistinct> {
  QueryBuilder<Criteria, Criteria, QDistinct> distinctByCriteriaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criteriaId');
    });
  }

  QueryBuilder<Criteria, Criteria, QDistinct> distinctByCriteriaName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criteriaName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Criteria, Criteria, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension CriteriaQueryProperty
    on QueryBuilder<Criteria, Criteria, QQueryProperty> {
  QueryBuilder<Criteria, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Criteria, int, QQueryOperations> criteriaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criteriaId');
    });
  }

  QueryBuilder<Criteria, String?, QQueryOperations> criteriaNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criteriaName');
    });
  }

  QueryBuilder<Criteria, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Criteria _$$_CriteriaFromJson(Map<String, dynamic> json) => _$_Criteria(
      criteriaId: json['CriteriaId'] as int,
      criteriaName: json['CriteriaName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_CriteriaToJson(_$_Criteria instance) =>
    <String, dynamic>{
      'CriteriaId': instance.criteriaId,
      'CriteriaName': instance.criteriaName,
      'IsActive': instance.isActive,
    };
