// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_member_risk_profile_answer.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const FarmMemberRiskProfileAnswerSchema = Schema(
  name: r'FarmMemberRiskProfileAnswer',
  id: -4493405569530205366,
  properties: {
    r'answer': PropertySchema(
      id: 0,
      name: r'answer',
      type: IsarType.bool,
    ),
    r'farmId': PropertySchema(
      id: 1,
      name: r'farmId',
      type: IsarType.string,
    ),
    r'farmMemberRiskProfileAnswerId': PropertySchema(
      id: 2,
      name: r'farmMemberRiskProfileAnswerId',
      type: IsarType.string,
    ),
    r'farmMemberRiskProfileAnswerNo': PropertySchema(
      id: 3,
      name: r'farmMemberRiskProfileAnswerNo',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 5,
      name: r'isMasterDataSynced',
      type: IsarType.bool,
    ),
    r'riskProfileQuestionId': PropertySchema(
      id: 6,
      name: r'riskProfileQuestionId',
      type: IsarType.long,
    )
  },
  estimateSize: _farmMemberRiskProfileAnswerEstimateSize,
  serialize: _farmMemberRiskProfileAnswerSerialize,
  deserialize: _farmMemberRiskProfileAnswerDeserialize,
  deserializeProp: _farmMemberRiskProfileAnswerDeserializeProp,
);

int _farmMemberRiskProfileAnswerEstimateSize(
  FarmMemberRiskProfileAnswer object,
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
    final value = object.farmMemberRiskProfileAnswerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.farmMemberRiskProfileAnswerNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmMemberRiskProfileAnswerSerialize(
  FarmMemberRiskProfileAnswer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.answer);
  writer.writeString(offsets[1], object.farmId);
  writer.writeString(offsets[2], object.farmMemberRiskProfileAnswerId);
  writer.writeString(offsets[3], object.farmMemberRiskProfileAnswerNo);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeBool(offsets[5], object.isMasterDataSynced);
  writer.writeLong(offsets[6], object.riskProfileQuestionId);
}

FarmMemberRiskProfileAnswer _farmMemberRiskProfileAnswerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmMemberRiskProfileAnswer(
    answer: reader.readBoolOrNull(offsets[0]),
    farmId: reader.readStringOrNull(offsets[1]),
    farmMemberRiskProfileAnswerId: reader.readStringOrNull(offsets[2]),
    farmMemberRiskProfileAnswerNo: reader.readStringOrNull(offsets[3]),
    isActive: reader.readBoolOrNull(offsets[4]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[5]),
    riskProfileQuestionId: reader.readLongOrNull(offsets[6]),
  );
  return object;
}

P _farmMemberRiskProfileAnswerDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FarmMemberRiskProfileAnswerQueryFilter on QueryBuilder<
    FarmMemberRiskProfileAnswer,
    FarmMemberRiskProfileAnswer,
    QFilterCondition> {
  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> answerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> answerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> answerEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
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

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmMemberRiskProfileAnswerId',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmMemberRiskProfileAnswerId',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberRiskProfileAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmMemberRiskProfileAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmMemberRiskProfileAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmMemberRiskProfileAnswerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmMemberRiskProfileAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmMemberRiskProfileAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
          QAfterFilterCondition>
      farmMemberRiskProfileAnswerIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmMemberRiskProfileAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
          QAfterFilterCondition>
      farmMemberRiskProfileAnswerIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmMemberRiskProfileAnswerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberRiskProfileAnswerId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmMemberRiskProfileAnswerId',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmMemberRiskProfileAnswerNo',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmMemberRiskProfileAnswerNo',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberRiskProfileAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmMemberRiskProfileAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmMemberRiskProfileAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmMemberRiskProfileAnswerNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmMemberRiskProfileAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmMemberRiskProfileAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
          QAfterFilterCondition>
      farmMemberRiskProfileAnswerNoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmMemberRiskProfileAnswerNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
          QAfterFilterCondition>
      farmMemberRiskProfileAnswerNoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmMemberRiskProfileAnswerNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmMemberRiskProfileAnswerNo',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> farmMemberRiskProfileAnswerNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmMemberRiskProfileAnswerNo',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> riskProfileQuestionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'riskProfileQuestionId',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> riskProfileQuestionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'riskProfileQuestionId',
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> riskProfileQuestionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riskProfileQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> riskProfileQuestionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'riskProfileQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> riskProfileQuestionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'riskProfileQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmMemberRiskProfileAnswer, FarmMemberRiskProfileAnswer,
      QAfterFilterCondition> riskProfileQuestionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'riskProfileQuestionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FarmMemberRiskProfileAnswerQueryObject on QueryBuilder<
    FarmMemberRiskProfileAnswer,
    FarmMemberRiskProfileAnswer,
    QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmMemberRiskProfileAnswer _$$_FarmMemberRiskProfileAnswerFromJson(
        Map<String, dynamic> json) =>
    _$_FarmMemberRiskProfileAnswer(
      farmMemberRiskProfileAnswerId:
          json['FarmMemberRiskProfileAnswerId'] as String?,
      farmMemberRiskProfileAnswerNo:
          json['FarmMemberRiskProfileAnswerNo'] as String?,
      riskProfileQuestionId: json['RiskProfileQuestionId'] as int?,
      answer: json['Answer'] as bool?,
      farmId: json['FarmId'] as String?,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterdataSynced'] as bool?,
    );

Map<String, dynamic> _$$_FarmMemberRiskProfileAnswerToJson(
        _$_FarmMemberRiskProfileAnswer instance) =>
    <String, dynamic>{
      'FarmMemberRiskProfileAnswerId': instance.farmMemberRiskProfileAnswerId,
      'FarmMemberRiskProfileAnswerNo': instance.farmMemberRiskProfileAnswerNo,
      'RiskProfileQuestionId': instance.riskProfileQuestionId,
      'Answer': instance.answer,
      'FarmId': instance.farmId,
      'IsActive': instance.isActive,
      'IsMasterdataSynced': instance.isMasterDataSynced,
    };
