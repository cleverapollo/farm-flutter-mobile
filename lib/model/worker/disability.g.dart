// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disability.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDisabilityCollection on Isar {
  IsarCollection<Disability> get disabilitys => this.collection();
}

const DisabilitySchema = CollectionSchema(
  name: r'Disability',
  id: 3649854216079533986,
  properties: {
    r'disabilityId': PropertySchema(
      id: 0,
      name: r'disabilityId',
      type: IsarType.long,
    ),
    r'disabilityName': PropertySchema(
      id: 1,
      name: r'disabilityName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _disabilityEstimateSize,
  serialize: _disabilitySerialize,
  deserialize: _disabilityDeserialize,
  deserializeProp: _disabilityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _disabilityGetId,
  getLinks: _disabilityGetLinks,
  attach: _disabilityAttach,
  version: '3.0.5',
);

int _disabilityEstimateSize(
  Disability object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.disabilityName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _disabilitySerialize(
  Disability object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.disabilityId);
  writer.writeString(offsets[1], object.disabilityName);
  writer.writeBool(offsets[2], object.isActive);
}

Disability _disabilityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Disability(
    disabilityId: reader.readLongOrNull(offsets[0]),
    disabilityName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBool(offsets[2]),
  );
  return object;
}

P _disabilityDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _disabilityGetId(Disability object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _disabilityGetLinks(Disability object) {
  return [];
}

void _disabilityAttach(IsarCollection<dynamic> col, Id id, Disability object) {}

extension DisabilityQueryWhereSort
    on QueryBuilder<Disability, Disability, QWhere> {
  QueryBuilder<Disability, Disability, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DisabilityQueryWhere
    on QueryBuilder<Disability, Disability, QWhereClause> {
  QueryBuilder<Disability, Disability, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Disability, Disability, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Disability, Disability, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Disability, Disability, QAfterWhereClause> idBetween(
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

extension DisabilityQueryFilter
    on QueryBuilder<Disability, Disability, QFilterCondition> {
  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'disabilityId',
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'disabilityId',
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disabilityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'disabilityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'disabilityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'disabilityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'disabilityName',
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'disabilityName',
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disabilityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'disabilityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'disabilityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'disabilityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'disabilityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'disabilityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'disabilityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'disabilityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disabilityName',
        value: '',
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition>
      disabilityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'disabilityName',
        value: '',
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Disability, Disability, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Disability, Disability, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Disability, Disability, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Disability, Disability, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension DisabilityQueryObject
    on QueryBuilder<Disability, Disability, QFilterCondition> {}

extension DisabilityQueryLinks
    on QueryBuilder<Disability, Disability, QFilterCondition> {}

extension DisabilityQuerySortBy
    on QueryBuilder<Disability, Disability, QSortBy> {
  QueryBuilder<Disability, Disability, QAfterSortBy> sortByDisabilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.asc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> sortByDisabilityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.desc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> sortByDisabilityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityName', Sort.asc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy>
      sortByDisabilityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityName', Sort.desc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension DisabilityQuerySortThenBy
    on QueryBuilder<Disability, Disability, QSortThenBy> {
  QueryBuilder<Disability, Disability, QAfterSortBy> thenByDisabilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.asc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> thenByDisabilityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.desc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> thenByDisabilityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityName', Sort.asc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy>
      thenByDisabilityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityName', Sort.desc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Disability, Disability, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension DisabilityQueryWhereDistinct
    on QueryBuilder<Disability, Disability, QDistinct> {
  QueryBuilder<Disability, Disability, QDistinct> distinctByDisabilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disabilityId');
    });
  }

  QueryBuilder<Disability, Disability, QDistinct> distinctByDisabilityName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disabilityName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Disability, Disability, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension DisabilityQueryProperty
    on QueryBuilder<Disability, Disability, QQueryProperty> {
  QueryBuilder<Disability, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Disability, int?, QQueryOperations> disabilityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disabilityId');
    });
  }

  QueryBuilder<Disability, String?, QQueryOperations> disabilityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disabilityName');
    });
  }

  QueryBuilder<Disability, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Disability _$$_DisabilityFromJson(Map<String, dynamic> json) =>
    _$_Disability(
      disabilityId: json['DisabilityId'] as int?,
      disabilityName: json['DisabilityName'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$_DisabilityToJson(_$_Disability instance) =>
    <String, dynamic>{
      'DisabilityId': instance.disabilityId,
      'DisabilityName': instance.disabilityName,
      'IsActive': instance.isActive,
    };
