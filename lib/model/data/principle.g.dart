// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principle.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrincipleCollection on Isar {
  IsarCollection<Principle> get principles => this.collection();
}

const PrincipleSchema = CollectionSchema(
  name: r'Principle',
  id: -720002980481469888,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'principleDescription': PropertySchema(
      id: 1,
      name: r'principleDescription',
      type: IsarType.string,
    ),
    r'principleId': PropertySchema(
      id: 2,
      name: r'principleId',
      type: IsarType.long,
    ),
    r'principleName': PropertySchema(
      id: 3,
      name: r'principleName',
      type: IsarType.string,
    )
  },
  estimateSize: _principleEstimateSize,
  serialize: _principleSerialize,
  deserialize: _principleDeserialize,
  deserializeProp: _principleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _principleGetId,
  getLinks: _principleGetLinks,
  attach: _principleAttach,
  version: '3.1.0',
);

int _principleEstimateSize(
  Principle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.principleDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.principleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _principleSerialize(
  Principle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeString(offsets[1], object.principleDescription);
  writer.writeLong(offsets[2], object.principleId);
  writer.writeString(offsets[3], object.principleName);
}

Principle _principleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Principle(
    isActive: reader.readBoolOrNull(offsets[0]),
    principleDescription: reader.readStringOrNull(offsets[1]),
    principleId: reader.readLong(offsets[2]),
    principleName: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _principleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _principleGetId(Principle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _principleGetLinks(Principle object) {
  return [];
}

void _principleAttach(IsarCollection<dynamic> col, Id id, Principle object) {}

extension PrincipleQueryWhereSort
    on QueryBuilder<Principle, Principle, QWhere> {
  QueryBuilder<Principle, Principle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PrincipleQueryWhere
    on QueryBuilder<Principle, Principle, QWhereClause> {
  QueryBuilder<Principle, Principle, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Principle, Principle, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Principle, Principle, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Principle, Principle, QAfterWhereClause> idBetween(
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

extension PrincipleQueryFilter
    on QueryBuilder<Principle, Principle, QFilterCondition> {
  QueryBuilder<Principle, Principle, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Principle, Principle, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Principle, Principle, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Principle, Principle, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'principleDescription',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'principleDescription',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'principleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'principleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'principleDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'principleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'principleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'principleDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'principleDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'principleDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition> principleIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleId',
        value: value,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'principleId',
        value: value,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition> principleIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'principleId',
        value: value,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition> principleIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'principleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'principleName',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'principleName',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'principleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'principleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'principleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'principleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Principle, Principle, QAfterFilterCondition>
      principleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'principleName',
        value: '',
      ));
    });
  }
}

extension PrincipleQueryObject
    on QueryBuilder<Principle, Principle, QFilterCondition> {}

extension PrincipleQueryLinks
    on QueryBuilder<Principle, Principle, QFilterCondition> {}

extension PrincipleQuerySortBy on QueryBuilder<Principle, Principle, QSortBy> {
  QueryBuilder<Principle, Principle, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy>
      sortByPrincipleDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleDescription', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy>
      sortByPrincipleDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleDescription', Sort.desc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> sortByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> sortByPrincipleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.desc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> sortByPrincipleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> sortByPrincipleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.desc);
    });
  }
}

extension PrincipleQuerySortThenBy
    on QueryBuilder<Principle, Principle, QSortThenBy> {
  QueryBuilder<Principle, Principle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy>
      thenByPrincipleDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleDescription', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy>
      thenByPrincipleDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleDescription', Sort.desc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> thenByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> thenByPrincipleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleId', Sort.desc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> thenByPrincipleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.asc);
    });
  }

  QueryBuilder<Principle, Principle, QAfterSortBy> thenByPrincipleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'principleName', Sort.desc);
    });
  }
}

extension PrincipleQueryWhereDistinct
    on QueryBuilder<Principle, Principle, QDistinct> {
  QueryBuilder<Principle, Principle, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Principle, Principle, QDistinct> distinctByPrincipleDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principleDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Principle, Principle, QDistinct> distinctByPrincipleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principleId');
    });
  }

  QueryBuilder<Principle, Principle, QDistinct> distinctByPrincipleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'principleName',
          caseSensitive: caseSensitive);
    });
  }
}

extension PrincipleQueryProperty
    on QueryBuilder<Principle, Principle, QQueryProperty> {
  QueryBuilder<Principle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Principle, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Principle, String?, QQueryOperations>
      principleDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principleDescription');
    });
  }

  QueryBuilder<Principle, int, QQueryOperations> principleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principleId');
    });
  }

  QueryBuilder<Principle, String?, QQueryOperations> principleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'principleName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Principle _$$_PrincipleFromJson(Map<String, dynamic> json) => _$_Principle(
      principleId: json['PrincipleId'] as int,
      principleName: json['PrincipleName'] as String?,
      principleDescription: json['PrincipleDescription'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_PrincipleToJson(_$_Principle instance) =>
    <String, dynamic>{
      'PrincipleId': instance.principleId,
      'PrincipleName': instance.principleName,
      'PrincipleDescription': instance.principleDescription,
      'IsActive': instance.isActive,
    };
