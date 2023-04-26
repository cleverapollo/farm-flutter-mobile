// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_stake_holder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmerStakeHolderCollection on Isar {
  IsarCollection<FarmerStakeHolder> get farmerStakeHolders => this.collection();
}

const FarmerStakeHolderSchema = CollectionSchema(
  name: r'FarmerStakeHolder',
  id: -2239912109689933227,
  properties: {
    r'createDT': PropertySchema(
      id: 0,
      name: r'createDT',
      type: IsarType.string,
    ),
    r'farmId': PropertySchema(
      id: 1,
      name: r'farmId',
      type: IsarType.long,
    ),
    r'farmerStakeHolderId': PropertySchema(
      id: 2,
      name: r'farmerStakeHolderId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 4,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'jobTitle': PropertySchema(
      id: 5,
      name: r'jobTitle',
      type: IsarType.string,
    ),
    r'stakeHolderName': PropertySchema(
      id: 6,
      name: r'stakeHolderName',
      type: IsarType.string,
    ),
    r'stakeholderId': PropertySchema(
      id: 7,
      name: r'stakeholderId',
      type: IsarType.long,
    ),
    r'updateDT': PropertySchema(
      id: 8,
      name: r'updateDT',
      type: IsarType.string,
    )
  },
  estimateSize: _farmerStakeHolderEstimateSize,
  serialize: _farmerStakeHolderSerialize,
  deserialize: _farmerStakeHolderDeserialize,
  deserializeProp: _farmerStakeHolderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmerStakeHolderGetId,
  getLinks: _farmerStakeHolderGetLinks,
  attach: _farmerStakeHolderAttach,
  version: '3.0.5',
);

int _farmerStakeHolderEstimateSize(
  FarmerStakeHolder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.createDT;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.jobTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stakeHolderName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updateDT;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmerStakeHolderSerialize(
  FarmerStakeHolder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createDT);
  writer.writeLong(offsets[1], object.farmId);
  writer.writeLong(offsets[2], object.farmerStakeHolderId);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeBool(offsets[4], object.isLocal);
  writer.writeString(offsets[5], object.jobTitle);
  writer.writeString(offsets[6], object.stakeHolderName);
  writer.writeLong(offsets[7], object.stakeholderId);
  writer.writeString(offsets[8], object.updateDT);
}

FarmerStakeHolder _farmerStakeHolderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmerStakeHolder(
    createDT: reader.readStringOrNull(offsets[0]),
    farmId: reader.readLongOrNull(offsets[1]),
    farmerStakeHolderId: reader.readLongOrNull(offsets[2]),
    isActive: reader.readBoolOrNull(offsets[3]),
    isLocal: reader.readBoolOrNull(offsets[4]),
    jobTitle: reader.readStringOrNull(offsets[5]),
    stakeHolderName: reader.readStringOrNull(offsets[6]),
    stakeholderId: reader.readLongOrNull(offsets[7]),
    updateDT: reader.readStringOrNull(offsets[8]),
  );
  return object;
}

P _farmerStakeHolderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmerStakeHolderGetId(FarmerStakeHolder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmerStakeHolderGetLinks(
    FarmerStakeHolder object) {
  return [];
}

void _farmerStakeHolderAttach(
    IsarCollection<dynamic> col, Id id, FarmerStakeHolder object) {}

extension FarmerStakeHolderQueryWhereSort
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QWhere> {
  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmerStakeHolderQueryWhere
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QWhereClause> {
  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterWhereClause>
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

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterWhereClause>
      idBetween(
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

extension FarmerStakeHolderQueryFilter
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QFilterCondition> {
  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      createDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmerStakeHolderId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmerStakeHolderId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmerStakeHolderId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmerStakeHolderId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmerStakeHolderId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmerStakeHolderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
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

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
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

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
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

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobTitle',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobTitle',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeHolderName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeHolderName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeHolderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakeHolderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakeHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeholderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeholderId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeholderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeholderId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeholderIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeholderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeholderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      stakeholderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeholderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      updateDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDT',
        value: '',
      ));
    });
  }
}

extension FarmerStakeHolderQueryObject
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QFilterCondition> {}

extension FarmerStakeHolderQueryLinks
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QFilterCondition> {}

extension FarmerStakeHolderQuerySortBy
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QSortBy> {
  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByFarmerStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByFarmerStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByJobTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByJobTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByStakeHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByStakeHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }
}

extension FarmerStakeHolderQuerySortThenBy
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QSortThenBy> {
  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFarmerStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFarmerStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByJobTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByJobTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByStakeHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByStakeHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }
}

extension FarmerStakeHolderQueryWhereDistinct
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct> {
  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByCreateDT({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId');
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByFarmerStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmerStakeHolderId');
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByJobTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByStakeHolderName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeHolderName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderId');
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByUpdateDT({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT', caseSensitive: caseSensitive);
    });
  }
}

extension FarmerStakeHolderQueryProperty
    on QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QQueryProperty> {
  QueryBuilder<FarmerStakeHolder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<FarmerStakeHolder, int?, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<FarmerStakeHolder, int?, QQueryOperations>
      farmerStakeHolderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmerStakeHolderId');
    });
  }

  QueryBuilder<FarmerStakeHolder, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FarmerStakeHolder, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      jobTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobTitle');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      stakeHolderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeHolderName');
    });
  }

  QueryBuilder<FarmerStakeHolder, int?, QQueryOperations>
      stakeholderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderId');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmerStakeHolder _$$_FarmerStakeHolderFromJson(Map<String, dynamic> json) =>
    _$_FarmerStakeHolder(
      farmerStakeHolderId: json['FarmerStakeHolderId'] as int?,
      farmId: json['FarmId'] as int?,
      stakeholderId: json['StakeholderId'] as int?,
      createDT: json['CreateDT'] as String?,
      updateDT: json['UpdateDT'] as String?,
      jobTitle: json['JobTitle'] as String?,
      stakeHolderName: json['FarmerStakeHolderName'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_FarmerStakeHolderToJson(
        _$_FarmerStakeHolder instance) =>
    <String, dynamic>{
      'FarmerStakeHolderId': instance.farmerStakeHolderId,
      'FarmId': instance.farmId,
      'StakeholderId': instance.stakeholderId,
      'CreateDT': instance.createDT,
      'UpdateDT': instance.updateDT,
      'JobTitle': instance.jobTitle,
      'FarmerStakeHolderName': instance.stakeHolderName,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
