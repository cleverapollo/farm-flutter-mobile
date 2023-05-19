// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rm_schedule.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRMScheduleCollection on Isar {
  IsarCollection<RMSchedule> get rMSchedules => this.collection();
}

const RMScheduleSchema = CollectionSchema(
  name: r'RMSchedule',
  id: 4077126120508155516,
  properties: {
    r'end': PropertySchema(
      id: 0,
      name: r'end',
      type: IsarType.string,
    ),
    r'farmId': PropertySchema(
      id: 1,
      name: r'farmId',
      type: IsarType.string,
    ),
    r'groupSchemeId': PropertySchema(
      id: 2,
      name: r'groupSchemeId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 4,
      name: r'isMasterDataSynced',
      type: IsarType.bool,
    ),
    r'scheduleActivityId': PropertySchema(
      id: 5,
      name: r'scheduleActivityId',
      type: IsarType.long,
    ),
    r'scheduleId': PropertySchema(
      id: 6,
      name: r'scheduleId',
      type: IsarType.string,
    ),
    r'start': PropertySchema(
      id: 7,
      name: r'start',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 8,
      name: r'userId',
      type: IsarType.string,
    ),
    r'venue': PropertySchema(
      id: 9,
      name: r'venue',
      type: IsarType.string,
    )
  },
  estimateSize: _rMScheduleEstimateSize,
  serialize: _rMScheduleSerialize,
  deserialize: _rMScheduleDeserialize,
  deserializeProp: _rMScheduleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _rMScheduleGetId,
  getLinks: _rMScheduleGetLinks,
  attach: _rMScheduleAttach,
  version: '3.0.5',
);

int _rMScheduleEstimateSize(
  RMSchedule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.end;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.farmId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.scheduleId.length * 3;
  {
    final value = object.start;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.venue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rMScheduleSerialize(
  RMSchedule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.end);
  writer.writeString(offsets[1], object.farmId);
  writer.writeLong(offsets[2], object.groupSchemeId);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeBool(offsets[4], object.isMasterDataSynced);
  writer.writeLong(offsets[5], object.scheduleActivityId);
  writer.writeString(offsets[6], object.scheduleId);
  writer.writeString(offsets[7], object.start);
  writer.writeString(offsets[8], object.userId);
  writer.writeString(offsets[9], object.venue);
}

RMSchedule _rMScheduleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RMSchedule(
    end: reader.readStringOrNull(offsets[0]),
    farmId: reader.readStringOrNull(offsets[1]),
    groupSchemeId: reader.readLongOrNull(offsets[2]),
    isActive: reader.readBoolOrNull(offsets[3]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[4]),
    scheduleActivityId: reader.readLongOrNull(offsets[5]),
    scheduleId: reader.readString(offsets[6]),
    start: reader.readStringOrNull(offsets[7]),
    userId: reader.readStringOrNull(offsets[8]),
    venue: reader.readStringOrNull(offsets[9]),
  );
  return object;
}

P _rMScheduleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rMScheduleGetId(RMSchedule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rMScheduleGetLinks(RMSchedule object) {
  return [];
}

void _rMScheduleAttach(IsarCollection<dynamic> col, Id id, RMSchedule object) {}

extension RMScheduleQueryWhereSort
    on QueryBuilder<RMSchedule, RMSchedule, QWhere> {
  QueryBuilder<RMSchedule, RMSchedule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RMScheduleQueryWhere
    on QueryBuilder<RMSchedule, RMSchedule, QWhereClause> {
  QueryBuilder<RMSchedule, RMSchedule, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RMSchedule, RMSchedule, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterWhereClause> idBetween(
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

extension RMScheduleQueryFilter
    on QueryBuilder<RMSchedule, RMSchedule, QFilterCondition> {
  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'end',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'end',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> endIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> farmIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      farmIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      groupSchemeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      groupSchemeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      groupSchemeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleActivityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scheduleActivityId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleActivityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scheduleActivityId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleActivityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleActivityIdGreaterThan(
    int? value, {
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

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleActivityIdLessThan(
    int? value, {
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

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleActivityIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> scheduleIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scheduleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scheduleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> scheduleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scheduleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scheduleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scheduleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scheduleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> scheduleIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scheduleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      scheduleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scheduleId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'start',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'start',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> startIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      startIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'venue',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'venue',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'venue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'venue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition> venueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venue',
        value: '',
      ));
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterFilterCondition>
      venueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'venue',
        value: '',
      ));
    });
  }
}

extension RMScheduleQueryObject
    on QueryBuilder<RMSchedule, RMSchedule, QFilterCondition> {}

extension RMScheduleQueryLinks
    on QueryBuilder<RMSchedule, RMSchedule, QFilterCondition> {}

extension RMScheduleQuerySortBy
    on QueryBuilder<RMSchedule, RMSchedule, QSortBy> {
  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      sortByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      sortByScheduleActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByScheduleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByScheduleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> sortByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension RMScheduleQuerySortThenBy
    on QueryBuilder<RMSchedule, RMSchedule, QSortThenBy> {
  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      thenByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy>
      thenByScheduleActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByScheduleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByScheduleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QAfterSortBy> thenByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension RMScheduleQueryWhereDistinct
    on QueryBuilder<RMSchedule, RMSchedule, QDistinct> {
  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByEnd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'end', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByFarmId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct>
      distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct>
      distinctByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleActivityId');
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByScheduleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByStart(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMSchedule, RMSchedule, QDistinct> distinctByVenue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'venue', caseSensitive: caseSensitive);
    });
  }
}

extension RMScheduleQueryProperty
    on QueryBuilder<RMSchedule, RMSchedule, QQueryProperty> {
  QueryBuilder<RMSchedule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RMSchedule, String?, QQueryOperations> endProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end');
    });
  }

  QueryBuilder<RMSchedule, String?, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<RMSchedule, int?, QQueryOperations> groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<RMSchedule, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RMSchedule, bool?, QQueryOperations>
      isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }

  QueryBuilder<RMSchedule, int?, QQueryOperations>
      scheduleActivityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleActivityId');
    });
  }

  QueryBuilder<RMSchedule, String, QQueryOperations> scheduleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleId');
    });
  }

  QueryBuilder<RMSchedule, String?, QQueryOperations> startProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start');
    });
  }

  QueryBuilder<RMSchedule, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<RMSchedule, String?, QQueryOperations> venueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'venue');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RMSchedule _$$_RMScheduleFromJson(Map<String, dynamic> json) =>
    _$_RMSchedule(
      scheduleId: json['ScheduleId'] as String,
      scheduleActivityId: json['ScheduleActivityId'] as int?,
      groupSchemeId: json['GroupSchemeId'] as int?,
      start: json['Start'] as String?,
      end: json['End'] as String?,
      farmId: json['FarmId'] as String?,
      userId: json['UserId'] as String?,
      venue: json['Venue'] as String?,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterDataSynced'] as bool?,
    );

Map<String, dynamic> _$$_RMScheduleToJson(_$_RMSchedule instance) =>
    <String, dynamic>{
      'ScheduleId': instance.scheduleId,
      'ScheduleActivityId': instance.scheduleActivityId,
      'GroupSchemeId': instance.groupSchemeId,
      'Start': instance.start,
      'End': instance.end,
      'FarmId': instance.farmId,
      'UserId': instance.userId,
      'Venue': instance.venue,
      'IsActive': instance.isActive,
      'IsMasterDataSynced': instance.isMasterDataSynced,
    };
