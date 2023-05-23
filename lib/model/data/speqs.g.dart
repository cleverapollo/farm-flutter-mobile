// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speqs.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSpeqsCollection on Isar {
  IsarCollection<Speqs> get speqs => this.collection();
}

const SpeqsSchema = CollectionSchema(
  name: r'Speqs',
  id: -3848978791678002687,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'speqsId': PropertySchema(
      id: 1,
      name: r'speqsId',
      type: IsarType.long,
    ),
    r'speqsName': PropertySchema(
      id: 2,
      name: r'speqsName',
      type: IsarType.string,
    )
  },
  estimateSize: _speqsEstimateSize,
  serialize: _speqsSerialize,
  deserialize: _speqsDeserialize,
  deserializeProp: _speqsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _speqsGetId,
  getLinks: _speqsGetLinks,
  attach: _speqsAttach,
  version: '3.1.0',
);

int _speqsEstimateSize(
  Speqs object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.speqsName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _speqsSerialize(
  Speqs object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.speqsId);
  writer.writeString(offsets[2], object.speqsName);
}

Speqs _speqsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Speqs(
    isActive: reader.readBoolOrNull(offsets[0]),
    speqsId: reader.readLong(offsets[1]),
    speqsName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _speqsDeserializeProp<P>(
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

Id _speqsGetId(Speqs object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _speqsGetLinks(Speqs object) {
  return [];
}

void _speqsAttach(IsarCollection<dynamic> col, Id id, Speqs object) {}

extension SpeqsQueryWhereSort on QueryBuilder<Speqs, Speqs, QWhere> {
  QueryBuilder<Speqs, Speqs, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SpeqsQueryWhere on QueryBuilder<Speqs, Speqs, QWhereClause> {
  QueryBuilder<Speqs, Speqs, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Speqs, Speqs, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterWhereClause> idBetween(
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

extension SpeqsQueryFilter on QueryBuilder<Speqs, Speqs, QFilterCondition> {
  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speqsId',
        value: value,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speqsId',
        value: value,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speqsId',
        value: value,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speqsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speqsName',
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speqsName',
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speqsName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speqsName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speqsName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speqsName',
        value: '',
      ));
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterFilterCondition> speqsNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speqsName',
        value: '',
      ));
    });
  }
}

extension SpeqsQueryObject on QueryBuilder<Speqs, Speqs, QFilterCondition> {}

extension SpeqsQueryLinks on QueryBuilder<Speqs, Speqs, QFilterCondition> {}

extension SpeqsQuerySortBy on QueryBuilder<Speqs, Speqs, QSortBy> {
  QueryBuilder<Speqs, Speqs, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> sortBySpeqsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.asc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> sortBySpeqsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.desc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> sortBySpeqsName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.asc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> sortBySpeqsNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.desc);
    });
  }
}

extension SpeqsQuerySortThenBy on QueryBuilder<Speqs, Speqs, QSortThenBy> {
  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenBySpeqsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.asc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenBySpeqsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsId', Sort.desc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenBySpeqsName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.asc);
    });
  }

  QueryBuilder<Speqs, Speqs, QAfterSortBy> thenBySpeqsNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speqsName', Sort.desc);
    });
  }
}

extension SpeqsQueryWhereDistinct on QueryBuilder<Speqs, Speqs, QDistinct> {
  QueryBuilder<Speqs, Speqs, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Speqs, Speqs, QDistinct> distinctBySpeqsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speqsId');
    });
  }

  QueryBuilder<Speqs, Speqs, QDistinct> distinctBySpeqsName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speqsName', caseSensitive: caseSensitive);
    });
  }
}

extension SpeqsQueryProperty on QueryBuilder<Speqs, Speqs, QQueryProperty> {
  QueryBuilder<Speqs, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Speqs, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Speqs, int, QQueryOperations> speqsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speqsId');
    });
  }

  QueryBuilder<Speqs, String?, QQueryOperations> speqsNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speqsName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Speqs _$$_SpeqsFromJson(Map<String, dynamic> json) => _$_Speqs(
      speqsId: json['SPEQSId'] as int,
      speqsName: json['SPEQSName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_SpeqsToJson(_$_Speqs instance) => <String, dynamic>{
      'SPEQSId': instance.speqsId,
      'SPEQSName': instance.speqsName,
      'IsActive': instance.isActive,
    };
