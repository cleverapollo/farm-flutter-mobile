// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_activity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScheduleActivityCollection on Isar {
  IsarCollection<ScheduleActivity> get scheduleActivitys => this.collection();
}

const ScheduleActivitySchema = CollectionSchema(
  name: r'ScheduleActivity',
  id: -357507474696397343,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'scheduleActivityId': PropertySchema(
      id: 1,
      name: r'scheduleActivityId',
      type: IsarType.long,
    ),
    r'scheduleActivityName': PropertySchema(
      id: 2,
      name: r'scheduleActivityName',
      type: IsarType.string,
    )
  },
  estimateSize: _scheduleActivityEstimateSize,
  serialize: _scheduleActivitySerialize,
  deserialize: _scheduleActivityDeserialize,
  deserializeProp: _scheduleActivityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _scheduleActivityGetId,
  getLinks: _scheduleActivityGetLinks,
  attach: _scheduleActivityAttach,
  version: '3.1.0',
);

int _scheduleActivityEstimateSize(
  ScheduleActivity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.scheduleActivityName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _scheduleActivitySerialize(
  ScheduleActivity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.scheduleActivityId);
  writer.writeString(offsets[2], object.scheduleActivityName);
}

ScheduleActivity _scheduleActivityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScheduleActivity(
    isActive: reader.readBoolOrNull(offsets[0]),
    scheduleActivityId: reader.readLong(offsets[1]),
    scheduleActivityName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _scheduleActivityDeserializeProp<P>(
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

Id _scheduleActivityGetId(ScheduleActivity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scheduleActivityGetLinks(ScheduleActivity object) {
  return [];
}

void _scheduleActivityAttach(
    IsarCollection<dynamic> col, Id id, ScheduleActivity object) {}

extension ScheduleActivityQueryWhereSort
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QWhere> {
  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduleActivityQueryWhere
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QWhereClause> {
  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterWhereClause> idBetween(
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

extension ScheduleActivityQueryFilter
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QFilterCondition> {
  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduleActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduleActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduleActivityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scheduleActivityName',
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scheduleActivityName',
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleActivityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduleActivityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduleActivityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduleActivityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scheduleActivityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scheduleActivityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scheduleActivityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scheduleActivityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleActivityName',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterFilterCondition>
      scheduleActivityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scheduleActivityName',
        value: '',
      ));
    });
  }
}

extension ScheduleActivityQueryObject
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QFilterCondition> {}

extension ScheduleActivityQueryLinks
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QFilterCondition> {}

extension ScheduleActivityQuerySortBy
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QSortBy> {
  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      sortByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.asc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      sortByScheduleActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.desc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      sortByScheduleActivityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.asc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      sortByScheduleActivityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.desc);
    });
  }
}

extension ScheduleActivityQuerySortThenBy
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QSortThenBy> {
  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      thenByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.asc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      thenByScheduleActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.desc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      thenByScheduleActivityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.asc);
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QAfterSortBy>
      thenByScheduleActivityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.desc);
    });
  }
}

extension ScheduleActivityQueryWhereDistinct
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QDistinct> {
  QueryBuilder<ScheduleActivity, ScheduleActivity, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QDistinct>
      distinctByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleActivityId');
    });
  }

  QueryBuilder<ScheduleActivity, ScheduleActivity, QDistinct>
      distinctByScheduleActivityName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleActivityName',
          caseSensitive: caseSensitive);
    });
  }
}

extension ScheduleActivityQueryProperty
    on QueryBuilder<ScheduleActivity, ScheduleActivity, QQueryProperty> {
  QueryBuilder<ScheduleActivity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScheduleActivity, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<ScheduleActivity, int, QQueryOperations>
      scheduleActivityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleActivityId');
    });
  }

  QueryBuilder<ScheduleActivity, String?, QQueryOperations>
      scheduleActivityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleActivityName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleActivity _$$_ScheduleActivityFromJson(Map<String, dynamic> json) =>
    _$_ScheduleActivity(
      scheduleActivityId: json['ScheduleActivityId'] as int,
      scheduleActivityName: json['ScheduleActivityName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ScheduleActivityToJson(_$_ScheduleActivity instance) =>
    <String, dynamic>{
      'ScheduleActivityId': instance.scheduleActivityId,
      'ScheduleActivityName': instance.scheduleActivityName,
      'IsActive': instance.isActive,
    };
