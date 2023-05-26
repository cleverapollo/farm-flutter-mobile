// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRaceCollection on Isar {
  IsarCollection<Race> get races => this.collection();
}

const RaceSchema = CollectionSchema(
  name: r'Race',
  id: -4536738099917500352,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'raceId': PropertySchema(
      id: 1,
      name: r'raceId',
      type: IsarType.long,
    ),
    r'raceName': PropertySchema(
      id: 2,
      name: r'raceName',
      type: IsarType.string,
    )
  },
  estimateSize: _raceEstimateSize,
  serialize: _raceSerialize,
  deserialize: _raceDeserialize,
  deserializeProp: _raceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _raceGetId,
  getLinks: _raceGetLinks,
  attach: _raceAttach,
  version: '3.0.5',
);

int _raceEstimateSize(
  Race object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.raceName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _raceSerialize(
  Race object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.raceId);
  writer.writeString(offsets[2], object.raceName);
}

Race _raceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Race(
    isActive: reader.readBool(offsets[0]),
    raceId: reader.readLongOrNull(offsets[1]),
    raceName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _raceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _raceGetId(Race object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _raceGetLinks(Race object) {
  return [];
}

void _raceAttach(IsarCollection<dynamic> col, Id id, Race object) {}

extension RaceQueryWhereSort on QueryBuilder<Race, Race, QWhere> {
  QueryBuilder<Race, Race, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RaceQueryWhere on QueryBuilder<Race, Race, QWhereClause> {
  QueryBuilder<Race, Race, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Race, Race, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Race, Race, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Race, Race, QAfterWhereClause> idBetween(
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

extension RaceQueryFilter on QueryBuilder<Race, Race, QFilterCondition> {
  QueryBuilder<Race, Race, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Race, Race, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Race, Race, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Race, Race, QAfterFilterCondition> isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'raceId',
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'raceId',
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'raceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'raceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'raceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'raceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'raceName',
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'raceName',
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'raceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'raceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'raceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'raceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'raceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'raceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'raceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'raceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'raceName',
        value: '',
      ));
    });
  }

  QueryBuilder<Race, Race, QAfterFilterCondition> raceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'raceName',
        value: '',
      ));
    });
  }
}

extension RaceQueryObject on QueryBuilder<Race, Race, QFilterCondition> {}

extension RaceQueryLinks on QueryBuilder<Race, Race, QFilterCondition> {}

extension RaceQuerySortBy on QueryBuilder<Race, Race, QSortBy> {
  QueryBuilder<Race, Race, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> sortByRaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.asc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> sortByRaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.desc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> sortByRaceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceName', Sort.asc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> sortByRaceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceName', Sort.desc);
    });
  }
}

extension RaceQuerySortThenBy on QueryBuilder<Race, Race, QSortThenBy> {
  QueryBuilder<Race, Race, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> thenByRaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.asc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> thenByRaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.desc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> thenByRaceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceName', Sort.asc);
    });
  }

  QueryBuilder<Race, Race, QAfterSortBy> thenByRaceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceName', Sort.desc);
    });
  }
}

extension RaceQueryWhereDistinct on QueryBuilder<Race, Race, QDistinct> {
  QueryBuilder<Race, Race, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Race, Race, QDistinct> distinctByRaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'raceId');
    });
  }

  QueryBuilder<Race, Race, QDistinct> distinctByRaceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'raceName', caseSensitive: caseSensitive);
    });
  }
}

extension RaceQueryProperty on QueryBuilder<Race, Race, QQueryProperty> {
  QueryBuilder<Race, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Race, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Race, int?, QQueryOperations> raceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'raceId');
    });
  }

  QueryBuilder<Race, String?, QQueryOperations> raceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'raceName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Race _$$_RaceFromJson(Map<String, dynamic> json) => _$_Race(
      raceId: json['RaceId'] as int?,
      raceName: json['RaceName'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$_RaceToJson(_$_Race instance) => <String, dynamic>{
      'RaceId': instance.raceId,
      'RaceName': instance.raceName,
      'IsActive': instance.isActive,
    };
