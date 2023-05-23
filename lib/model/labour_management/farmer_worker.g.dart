// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_stake_holder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFarmerStakeHolderCollection on Isar {
  IsarCollection<FarmerStakeHolder> get farmerStakeHolders => this.collection();
}

const FarmerStakeHolderSchema = CollectionSchema(
  name: r'FarmerStakeHolder',
  id: -2239912109689933227,
  properties: {
    r'avatarFileName': PropertySchema(
      id: 0,
      name: r'avatarFileName',
      type: IsarType.string,
    ),
    r'avatarFilePath': PropertySchema(
      id: 1,
      name: r'avatarFilePath',
      type: IsarType.string,
    ),
    r'createDT': PropertySchema(
      id: 2,
      name: r'createDT',
      type: IsarType.string,
    ),
    r'dateOfBirth': PropertySchema(
      id: 3,
      name: r'dateOfBirth',
      type: IsarType.string,
    ),
    r'farmId': PropertySchema(
      id: 4,
      name: r'farmId',
      type: IsarType.long,
    ),
    r'farmerStakeHolderId': PropertySchema(
      id: 5,
      name: r'farmerStakeHolderId',
      type: IsarType.long,
    ),
    r'farmerStakeHolderName': PropertySchema(
      id: 6,
      name: r'farmerStakeHolderName',
      type: IsarType.string,
    ),
    r'firstName': PropertySchema(
      id: 7,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 8,
      name: r'gender',
      type: IsarType.long,
    ),
    r'idNumber': PropertySchema(
      id: 9,
      name: r'idNumber',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 10,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 11,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'jobDescription': PropertySchema(
      id: 12,
      name: r'jobDescription',
      type: IsarType.longList,
    ),
    r'jobTitle': PropertySchema(
      id: 13,
      name: r'jobTitle',
      type: IsarType.string,
    ),
    r'lastName': PropertySchema(
      id: 14,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'nationality': PropertySchema(
      id: 15,
      name: r'nationality',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 16,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'stakeholderId': PropertySchema(
      id: 17,
      name: r'stakeholderId',
      type: IsarType.long,
    ),
    r'updateDT': PropertySchema(
      id: 18,
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
  version: '3.1.0',
);

int _farmerStakeHolderEstimateSize(
  FarmerStakeHolder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarFileName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.avatarFilePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createDT;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateOfBirth;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.farmerStakeHolderName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.jobDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.jobTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nationality;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phoneNumber;
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
  writer.writeString(offsets[0], object.avatarFileName);
  writer.writeString(offsets[1], object.avatarFilePath);
  writer.writeString(offsets[2], object.createDT);
  writer.writeString(offsets[3], object.dateOfBirth);
  writer.writeLong(offsets[4], object.farmId);
  writer.writeLong(offsets[5], object.farmerStakeHolderId);
  writer.writeString(offsets[6], object.farmerStakeHolderName);
  writer.writeString(offsets[7], object.firstName);
  writer.writeLong(offsets[8], object.gender);
  writer.writeLong(offsets[9], object.idNumber);
  writer.writeBool(offsets[10], object.isActive);
  writer.writeBool(offsets[11], object.isLocal);
  writer.writeLongList(offsets[12], object.jobDescription);
  writer.writeString(offsets[13], object.jobTitle);
  writer.writeString(offsets[14], object.lastName);
  writer.writeString(offsets[15], object.nationality);
  writer.writeString(offsets[16], object.phoneNumber);
  writer.writeLong(offsets[17], object.stakeholderId);
  writer.writeString(offsets[18], object.updateDT);
}

FarmerStakeHolder _farmerStakeHolderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmerStakeHolder(
    avatarFileName: reader.readStringOrNull(offsets[0]),
    avatarFilePath: reader.readStringOrNull(offsets[1]),
    createDT: reader.readStringOrNull(offsets[2]),
    dateOfBirth: reader.readStringOrNull(offsets[3]),
    farmId: reader.readLongOrNull(offsets[4]),
    farmerStakeHolderId: reader.readLongOrNull(offsets[5]),
    farmerStakeHolderName: reader.readStringOrNull(offsets[6]),
    firstName: reader.readStringOrNull(offsets[7]),
    gender: reader.readLongOrNull(offsets[8]),
    idNumber: reader.readLongOrNull(offsets[9]),
    isActive: reader.readBoolOrNull(offsets[10]),
    isLocal: reader.readBoolOrNull(offsets[11]),
    jobDescription: reader.readLongList(offsets[12]),
    jobTitle: reader.readStringOrNull(offsets[13]),
    lastName: reader.readStringOrNull(offsets[14]),
    nationality: reader.readStringOrNull(offsets[15]),
    phoneNumber: reader.readStringOrNull(offsets[16]),
    stakeholderId: reader.readLongOrNull(offsets[17]),
    updateDT: reader.readStringOrNull(offsets[18]),
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
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    case 12:
      return (reader.readLongList(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
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
      avatarFileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarFileName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarFileName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarFileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarFileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarFileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarFileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarFileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarFileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarFileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarFileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarFileName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarFileName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarFilePath',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarFilePath',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarFilePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarFilePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarFilePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarFilePath',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      avatarFilePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarFilePath',
        value: '',
      ));
    });
  }

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
      dateOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfBirth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateOfBirth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateOfBirth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateOfBirth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateOfBirth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateOfBirth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateOfBirth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateOfBirth',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfBirth',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      dateOfBirthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateOfBirth',
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
      farmerStakeHolderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmerStakeHolderName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmerStakeHolderName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmerStakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmerStakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmerStakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmerStakeHolderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmerStakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmerStakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmerStakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmerStakeHolderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmerStakeHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      farmerStakeHolderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmerStakeHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      genderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      genderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      genderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      genderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
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
      idNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      idNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      idNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      idNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      idNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      idNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idNumber',
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
      jobDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescription',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescription',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescription',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobDescription',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobDescription',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobDescription',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobDescription',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobDescription',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobDescription',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobDescription',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      jobDescriptionLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'jobDescription',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
      lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nationality',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nationality',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      nationalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
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
      sortByAvatarFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByAvatarFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByAvatarFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFilePath', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByAvatarFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFilePath', Sort.desc);
    });
  }

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
      sortByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
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
      sortByFarmerStakeHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByFarmerStakeHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
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
      sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByNationality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByNationalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
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
      thenByAvatarFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByAvatarFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByAvatarFilePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFilePath', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByAvatarFilePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFilePath', Sort.desc);
    });
  }

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
      thenByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
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

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFarmerStakeHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFarmerStakeHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
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
      thenByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
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
      thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByNationality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByNationalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QAfterSortBy>
      thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
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
      distinctByAvatarFileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarFileName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByAvatarFilePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarFilePath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByCreateDT({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByDateOfBirth({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfBirth', caseSensitive: caseSensitive);
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
      distinctByFarmerStakeHolderName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmerStakeHolderName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByFirstName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender');
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idNumber');
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
      distinctByJobDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescription');
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByJobTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByLastName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByNationality({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolder, FarmerStakeHolder, QDistinct>
      distinctByPhoneNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
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
      avatarFileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarFileName');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      avatarFilePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarFilePath');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      dateOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfBirth');
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

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      farmerStakeHolderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmerStakeHolderName');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<FarmerStakeHolder, int?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<FarmerStakeHolder, int?, QQueryOperations> idNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idNumber');
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

  QueryBuilder<FarmerStakeHolder, List<int>?, QQueryOperations>
      jobDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescription');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      jobTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobTitle');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      nationalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationality');
    });
  }

  QueryBuilder<FarmerStakeHolder, String?, QQueryOperations>
      phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
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
      farmerStakeHolderName: json['FarmerStakeHolderName'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      dateOfBirth: json['DateOfBirth'] as String?,
      idNumber: json['IdNumber'] as int?,
      phoneNumber: json['PhoneNumber'] as String?,
      nationality: json['Nationality'] as String?,
      gender: json['Gender'] as int?,
      avatarFilePath: json['AvatarFilePath'] as String?,
      avatarFileName: json['AvatarFileName'] as String?,
      jobDescription: (json['JobDescription'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const <int>[],
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
      'FarmerStakeHolderName': instance.farmerStakeHolderName,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'DateOfBirth': instance.dateOfBirth,
      'IdNumber': instance.idNumber,
      'PhoneNumber': instance.phoneNumber,
      'Nationality': instance.nationality,
      'Gender': instance.gender,
      'AvatarFilePath': instance.avatarFilePath,
      'AvatarFileName': instance.avatarFileName,
      'JobDescription': instance.jobDescription,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
