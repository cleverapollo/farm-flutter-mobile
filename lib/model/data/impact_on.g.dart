// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'impact_on.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetImpactOnCollection on Isar {
  IsarCollection<ImpactOn> get impactOns => this.collection();
}

const ImpactOnSchema = CollectionSchema(
  name: r'ImpactOn',
  id: 4320162074527795726,
  properties: {
    r'impactOnId': PropertySchema(
      id: 0,
      name: r'impactOnId',
      type: IsarType.long,
    ),
    r'impactOnName': PropertySchema(
      id: 1,
      name: r'impactOnName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _impactOnEstimateSize,
  serialize: _impactOnSerialize,
  deserialize: _impactOnDeserialize,
  deserializeProp: _impactOnDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _impactOnGetId,
  getLinks: _impactOnGetLinks,
  attach: _impactOnAttach,
  version: '3.0.5',
);

int _impactOnEstimateSize(
  ImpactOn object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.impactOnName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _impactOnSerialize(
  ImpactOn object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.impactOnId);
  writer.writeString(offsets[1], object.impactOnName);
  writer.writeBool(offsets[2], object.isActive);
}

ImpactOn _impactOnDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ImpactOn(
    impactOnId: reader.readLong(offsets[0]),
    impactOnName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
  );
  return object;
}

P _impactOnDeserializeProp<P>(
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

Id _impactOnGetId(ImpactOn object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _impactOnGetLinks(ImpactOn object) {
  return [];
}

void _impactOnAttach(IsarCollection<dynamic> col, Id id, ImpactOn object) {}

extension ImpactOnQueryWhereSort on QueryBuilder<ImpactOn, ImpactOn, QWhere> {
  QueryBuilder<ImpactOn, ImpactOn, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ImpactOnQueryWhere on QueryBuilder<ImpactOn, ImpactOn, QWhereClause> {
  QueryBuilder<ImpactOn, ImpactOn, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ImpactOn, ImpactOn, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterWhereClause> idBetween(
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

extension ImpactOnQueryFilter
    on QueryBuilder<ImpactOn, ImpactOn, QFilterCondition> {
  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactOnId',
        value: value,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactOnId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition>
      impactOnNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'impactOnName',
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition>
      impactOnNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'impactOnName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition>
      impactOnNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'impactOnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> impactOnNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'impactOnName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition>
      impactOnNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition>
      impactOnNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'impactOnName',
        value: '',
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension ImpactOnQueryObject
    on QueryBuilder<ImpactOn, ImpactOn, QFilterCondition> {}

extension ImpactOnQueryLinks
    on QueryBuilder<ImpactOn, ImpactOn, QFilterCondition> {}

extension ImpactOnQuerySortBy on QueryBuilder<ImpactOn, ImpactOn, QSortBy> {
  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> sortByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> sortByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> sortByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> sortByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension ImpactOnQuerySortThenBy
    on QueryBuilder<ImpactOn, ImpactOn, QSortThenBy> {
  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.asc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenByImpactOnIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnId', Sort.desc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenByImpactOnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.asc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenByImpactOnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'impactOnName', Sort.desc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension ImpactOnQueryWhereDistinct
    on QueryBuilder<ImpactOn, ImpactOn, QDistinct> {
  QueryBuilder<ImpactOn, ImpactOn, QDistinct> distinctByImpactOnId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnId');
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QDistinct> distinctByImpactOnName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'impactOnName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ImpactOn, ImpactOn, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension ImpactOnQueryProperty
    on QueryBuilder<ImpactOn, ImpactOn, QQueryProperty> {
  QueryBuilder<ImpactOn, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ImpactOn, int, QQueryOperations> impactOnIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnId');
    });
  }

  QueryBuilder<ImpactOn, String?, QQueryOperations> impactOnNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'impactOnName');
    });
  }

  QueryBuilder<ImpactOn, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImpactOn _$$_ImpactOnFromJson(Map<String, dynamic> json) => _$_ImpactOn(
      impactOnId: json['ImpactOnId'] as int,
      impactOnName: json['ImpactOnName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ImpactOnToJson(_$_ImpactOn instance) =>
    <String, dynamic>{
      'ImpactOnId': instance.impactOnId,
      'ImpactOnName': instance.impactOnName,
      'IsActive': instance.isActive,
    };
