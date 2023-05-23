// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_member_objective_answer.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const FarmMemberObjectiveAnswerSchema = Schema(
  name: r'FarmMemberObjectiveAnswer',
  id: 575134634865226438,
  properties: {
    r'farmId': PropertySchema(
      id: 0,
      name: r'farmId',
      type: IsarType.string,
    ),
    r'farmMemberObjectiveAnswerId': PropertySchema(
      id: 1,
      name: r'farmMemberObjectiveAnswerId',
      type: IsarType.string,
    ),
    r'farmMemberObjectiveAnswerNo': PropertySchema(
      id: 2,
      name: r'farmMemberObjectiveAnswerNo',
      type: IsarType.string,
    ),
    r'farmMemberObjectiveId': PropertySchema(
      id: 3,
      name: r'farmMemberObjectiveId',
      type: IsarType.long,
    ),
    r'farmObjectiveOptionId': PropertySchema(
      id: 4,
      name: r'farmObjectiveOptionId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 6,
      name: r'isMasterDataSynced',
      type: IsarType.bool,
    )
  },
  estimateSize: _farmMemberObjectiveAnswerEstimateSize,
  serialize: _farmMemberObjectiveAnswerSerialize,
  deserialize: _farmMemberObjectiveAnswerDeserialize,
  deserializeProp: _farmMemberObjectiveAnswerDeserializeProp,
);

int _farmMemberObjectiveAnswerEstimateSize(
  FarmMemberObjectiveAnswer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.farmId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.farmMemberObjectiveAnswerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.farmMemberObjectiveAnswerNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmMemberObjectiveAnswerSerialize(
  FarmMemberObjectiveAnswer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.farmId);
  writer.writeString(offsets[1], object.farmMemberObjectiveAnswerId);
  writer.writeString(offsets[2], object.farmMemberObjectiveAnswerNo);
  writer.writeLong(offsets[3], object.farmMemberObjectiveId);
  writer.writeLong(offsets[4], object.farmObjectiveOptionId);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeBool(offsets[6], object.isMasterDataSynced);
}

FarmMemberObjectiveAnswer _farmMemberObjectiveAnswerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmMemberObjectiveAnswer(
    farmId: reader.readStringOrNull(offsets[0]),
    farmMemberObjectiveAnswerId: reader.readStringOrNull(offsets[1]),
    farmMemberObjectiveAnswerNo: reader.readStringOrNull(offsets[2]),
    farmMemberObjectiveId: reader.readLongOrNull(offsets[3]),
    farmObjectiveOptionId: reader.readLongOrNull(offsets[4]),
    isActive: reader.readBoolOrNull(offsets[5]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[6]),
  );
  return object;
}

P _farmMemberObjectiveAnswerDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FarmMemberObjectiveAnswerQueryFilter on QueryBuilder<
    FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer, QFilterCondition> {
  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdEqualTo(
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

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdGreaterThan(
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

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdLessThan(
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

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdBetween(
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

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdStartsWith(
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

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdEndsWith(
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

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
          QAfterFilterCondition>
      farmIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
          QAfterFilterCondition>
      farmIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmMemberObjectiveAnswerId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmMemberObjectiveAnswerId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmMemberObjectiveAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmMemberObjectiveAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmMemberObjectiveAnswerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmMemberObjectiveAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmMemberObjectiveAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
          QAfterFilterCondition>
      farmMemberObjectiveAnswerIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmMemberObjectiveAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
          QAfterFilterCondition>
      farmMemberObjectiveAnswerIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmMemberObjectiveAnswerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveAnswerId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmMemberObjectiveAnswerId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmMemberObjectiveAnswerNo',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmMemberObjectiveAnswerNo',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmMemberObjectiveAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmMemberObjectiveAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmMemberObjectiveAnswerNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmMemberObjectiveAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmMemberObjectiveAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
          QAfterFilterCondition>
      farmMemberObjectiveAnswerNoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmMemberObjectiveAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
          QAfterFilterCondition>
      farmMemberObjectiveAnswerNoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmMemberObjectiveAnswerNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveAnswerNo',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveAnswerNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmMemberObjectiveAnswerNo',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmMemberObjectiveId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmMemberObjectiveId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberObjectiveId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmMemberObjectiveId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmMemberObjectiveId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmMemberObjectiveIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmMemberObjectiveId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmObjectiveOptionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmObjectiveOptionId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmObjectiveOptionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmObjectiveOptionId',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmObjectiveOptionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmObjectiveOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmObjectiveOptionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmObjectiveOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmObjectiveOptionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmObjectiveOptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> farmObjectiveOptionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmObjectiveOptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer,
      QAfterFilterCondition> isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }
}

extension FarmMemberObjectiveAnswerQueryObject on QueryBuilder<
    FarmMemberObjectiveAnswer, FarmMemberObjectiveAnswer, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmMemberObjectiveAnswer _$$_FarmMemberObjectiveAnswerFromJson(
        Map<String, dynamic> json) =>
    _$_FarmMemberObjectiveAnswer(
      farmMemberObjectiveAnswerId:
          json['FarmMemberObjectiveAnswerId'] as String?,
      farmMemberObjectiveAnswerNo:
          json['FarmMemberObjectiveAnswerNo'] as String?,
      farmMemberObjectiveId: json['FarmMemberObjectiveId'] as int?,
      farmObjectiveOptionId: json['FarmObjectiveOptionId'] as int?,
      farmId: json['FarmId'] as String?,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterdataSynced'] as bool?,
    );

Map<String, dynamic> _$$_FarmMemberObjectiveAnswerToJson(
        _$_FarmMemberObjectiveAnswer instance) =>
    <String, dynamic>{
      'FarmMemberObjectiveAnswerId': instance.farmMemberObjectiveAnswerId,
      'FarmMemberObjectiveAnswerNo': instance.farmMemberObjectiveAnswerNo,
      'FarmMemberObjectiveId': instance.farmMemberObjectiveId,
      'FarmObjectiveOptionId': instance.farmObjectiveOptionId,
      'FarmId': instance.farmId,
      'IsActive': instance.isActive,
      'IsMasterdataSynced': instance.isMasterDataSynced,
    };
