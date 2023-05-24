// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_worker.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmerWorkerCollection on Isar {
  IsarCollection<FarmerWorker> get farmerWorkers => this.collection();
}

const FarmerWorkerSchema = CollectionSchema(
  name: r'FarmerWorker',
  id: -316636052558112931,
  properties: {
    r'avatarFileName': PropertySchema(
      id: 0,
      name: r'avatarFileName',
      type: IsarType.string,
    ),
    r'canDelete': PropertySchema(
      id: 1,
      name: r'canDelete',
      type: IsarType.long,
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
    r'firstName': PropertySchema(
      id: 5,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 6,
      name: r'gender',
      type: IsarType.long,
    ),
    r'idNumber': PropertySchema(
      id: 7,
      name: r'idNumber',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 8,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 9,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'jobDescription': PropertySchema(
      id: 10,
      name: r'jobDescription',
      type: IsarType.longList,
    ),
    r'jobTitle': PropertySchema(
      id: 11,
      name: r'jobTitle',
      type: IsarType.string,
    ),
    r'lastName': PropertySchema(
      id: 12,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'nationality': PropertySchema(
      id: 13,
      name: r'nationality',
      type: IsarType.string,
    ),
    r'normalisedPhotoURL': PropertySchema(
      id: 14,
      name: r'normalisedPhotoURL',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 15,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'photo': PropertySchema(
      id: 16,
      name: r'photo',
      type: IsarType.string,
    ),
    r'photoURL': PropertySchema(
      id: 17,
      name: r'photoURL',
      type: IsarType.string,
    ),
    r'updateDT': PropertySchema(
      id: 18,
      name: r'updateDT',
      type: IsarType.string,
    ),
    r'workerId': PropertySchema(
      id: 19,
      name: r'workerId',
      type: IsarType.long,
    )
  },
  estimateSize: _farmerWorkerEstimateSize,
  serialize: _farmerWorkerSerialize,
  deserialize: _farmerWorkerDeserialize,
  deserializeProp: _farmerWorkerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmerWorkerGetId,
  getLinks: _farmerWorkerGetLinks,
  attach: _farmerWorkerAttach,
  version: '3.0.5',
);

int _farmerWorkerEstimateSize(
  FarmerWorker object,
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
    final value = object.normalisedPhotoURL;
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
    final value = object.photo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.photoURL;
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

void _farmerWorkerSerialize(
  FarmerWorker object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatarFileName);
  writer.writeLong(offsets[1], object.canDelete);
  writer.writeString(offsets[2], object.createDT);
  writer.writeString(offsets[3], object.dateOfBirth);
  writer.writeLong(offsets[4], object.farmId);
  writer.writeString(offsets[5], object.firstName);
  writer.writeLong(offsets[6], object.gender);
  writer.writeLong(offsets[7], object.idNumber);
  writer.writeBool(offsets[8], object.isActive);
  writer.writeBool(offsets[9], object.isLocal);
  writer.writeLongList(offsets[10], object.jobDescription);
  writer.writeString(offsets[11], object.jobTitle);
  writer.writeString(offsets[12], object.lastName);
  writer.writeString(offsets[13], object.nationality);
  writer.writeString(offsets[14], object.normalisedPhotoURL);
  writer.writeString(offsets[15], object.phoneNumber);
  writer.writeString(offsets[16], object.photo);
  writer.writeString(offsets[17], object.photoURL);
  writer.writeString(offsets[18], object.updateDT);
  writer.writeLong(offsets[19], object.workerId);
}

FarmerWorker _farmerWorkerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmerWorker(
    avatarFileName: reader.readStringOrNull(offsets[0]),
    canDelete: reader.readLongOrNull(offsets[1]),
    createDT: reader.readStringOrNull(offsets[2]),
    dateOfBirth: reader.readStringOrNull(offsets[3]),
    farmId: reader.readLongOrNull(offsets[4]),
    firstName: reader.readStringOrNull(offsets[5]),
    gender: reader.readLongOrNull(offsets[6]),
    idNumber: reader.readLongOrNull(offsets[7]),
    isActive: reader.readBoolOrNull(offsets[8]),
    isLocal: reader.readBoolOrNull(offsets[9]),
    jobDescription: reader.readLongList(offsets[10]),
    jobTitle: reader.readStringOrNull(offsets[11]),
    lastName: reader.readStringOrNull(offsets[12]),
    nationality: reader.readStringOrNull(offsets[13]),
    normalisedPhotoURL: reader.readStringOrNull(offsets[14]),
    phoneNumber: reader.readStringOrNull(offsets[15]),
    photo: reader.readStringOrNull(offsets[16]),
    photoURL: reader.readStringOrNull(offsets[17]),
    updateDT: reader.readStringOrNull(offsets[18]),
    workerId: reader.readLongOrNull(offsets[19]),
  );
  return object;
}

P _farmerWorkerDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readLongList(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmerWorkerGetId(FarmerWorker object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmerWorkerGetLinks(FarmerWorker object) {
  return [];
}

void _farmerWorkerAttach(
    IsarCollection<dynamic> col, Id id, FarmerWorker object) {}

extension FarmerWorkerQueryWhereSort
    on QueryBuilder<FarmerWorker, FarmerWorker, QWhere> {
  QueryBuilder<FarmerWorker, FarmerWorker, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmerWorkerQueryWhere
    on QueryBuilder<FarmerWorker, FarmerWorker, QWhereClause> {
  QueryBuilder<FarmerWorker, FarmerWorker, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterWhereClause> idBetween(
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

extension FarmerWorkerQueryFilter
    on QueryBuilder<FarmerWorker, FarmerWorker, QFilterCondition> {
  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      avatarFileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarFileName',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      avatarFileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarFileName',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      avatarFileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarFileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      avatarFileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarFileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      avatarFileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarFileName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      avatarFileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarFileName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      canDeleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'canDelete',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      canDeleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'canDelete',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      canDeleteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      canDeleteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      canDeleteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      canDeleteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canDelete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      createDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      createDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      createDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      createDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      dateOfBirthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      dateOfBirthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateOfBirth',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      dateOfBirthContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateOfBirth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      dateOfBirthMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateOfBirth',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      dateOfBirthIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfBirth',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      dateOfBirthIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateOfBirth',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> farmIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> farmIdBetween(
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      firstNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      firstNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> genderEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> genderBetween(
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      idNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      idNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      idNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescription',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescription',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobDescriptionElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescription',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobTitle',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobTitle',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      jobTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      lastNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      lastNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      nationalityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nationality',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      nationalityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nationality',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      nationalityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      nationalityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      nationalityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      nationalityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationality',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'normalisedPhotoURL',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'normalisedPhotoURL',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'normalisedPhotoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'normalisedPhotoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'normalisedPhotoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'normalisedPhotoURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'normalisedPhotoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'normalisedPhotoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'normalisedPhotoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'normalisedPhotoURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'normalisedPhotoURL',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      normalisedPhotoURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'normalisedPhotoURL',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photo',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photo',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> photoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> photoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> photoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> photoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> photoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition> photoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photo',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photo',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoURL',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoURL',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoURL',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      photoURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoURL',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
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

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      updateDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      updateDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      updateDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      updateDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      workerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      workerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      workerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      workerIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workerId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      workerIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workerId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterFilterCondition>
      workerIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FarmerWorkerQueryObject
    on QueryBuilder<FarmerWorker, FarmerWorker, QFilterCondition> {}

extension FarmerWorkerQueryLinks
    on QueryBuilder<FarmerWorker, FarmerWorker, QFilterCondition> {}

extension FarmerWorkerQuerySortBy
    on QueryBuilder<FarmerWorker, FarmerWorker, QSortBy> {
  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      sortByAvatarFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      sortByAvatarFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByCanDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByCanDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      sortByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByJobTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByJobTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByNationality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      sortByNationalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      sortByNormalisedPhotoURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalisedPhotoURL', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      sortByNormalisedPhotoURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalisedPhotoURL', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByPhotoURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoURL', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByPhotoURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoURL', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> sortByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }
}

extension FarmerWorkerQuerySortThenBy
    on QueryBuilder<FarmerWorker, FarmerWorker, QSortThenBy> {
  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      thenByAvatarFileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      thenByAvatarFileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarFileName', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByCanDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByCanDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByDateOfBirth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      thenByDateOfBirthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfBirth', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByJobTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByJobTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByNationality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      thenByNationalityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationality', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      thenByNormalisedPhotoURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalisedPhotoURL', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      thenByNormalisedPhotoURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'normalisedPhotoURL', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy>
      thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByPhoto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByPhotoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photo', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByPhotoURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoURL', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByPhotoURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoURL', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QAfterSortBy> thenByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }
}

extension FarmerWorkerQueryWhereDistinct
    on QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> {
  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByAvatarFileName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarFileName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByCanDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canDelete');
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByCreateDT(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByDateOfBirth(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfBirth', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId');
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender');
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idNumber');
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct>
      distinctByJobDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescription');
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByJobTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByNationality(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct>
      distinctByNormalisedPhotoURL({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'normalisedPhotoURL',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByPhoto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByPhotoURL(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoURL', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByUpdateDT(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerWorker, FarmerWorker, QDistinct> distinctByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerId');
    });
  }
}

extension FarmerWorkerQueryProperty
    on QueryBuilder<FarmerWorker, FarmerWorker, QQueryProperty> {
  QueryBuilder<FarmerWorker, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations>
      avatarFileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarFileName');
    });
  }

  QueryBuilder<FarmerWorker, int?, QQueryOperations> canDeleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canDelete');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> dateOfBirthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfBirth');
    });
  }

  QueryBuilder<FarmerWorker, int?, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<FarmerWorker, int?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<FarmerWorker, int?, QQueryOperations> idNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idNumber');
    });
  }

  QueryBuilder<FarmerWorker, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FarmerWorker, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<FarmerWorker, List<int>?, QQueryOperations>
      jobDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescription');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> jobTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobTitle');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> nationalityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationality');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations>
      normalisedPhotoURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'normalisedPhotoURL');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> photoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photo');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> photoURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoURL');
    });
  }

  QueryBuilder<FarmerWorker, String?, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }

  QueryBuilder<FarmerWorker, int?, QQueryOperations> workerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmerWorker _$$_FarmerWorkerFromJson(Map<String, dynamic> json) =>
    _$_FarmerWorker(
      workerId: json['WorkerId'] as int?,
      farmId: json['FarmId'] as int?,
      jobTitle: json['JobTitle'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      dateOfBirth: json['DateOfBirth'] as String?,
      idNumber: json['IdNumber'] as int?,
      jobDescription: (json['JobDescription'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const <int>[],
      phoneNumber: json['PhoneNumber'] as String?,
      nationality: json['Nationality'] as String?,
      gender: json['Gender'] as int?,
      canDelete: json['CanDelete'] as int?,
      photo: json['Photo'] as String?,
      normalisedPhotoURL: json['NormalisedPhotoURL'] as String?,
      photoURL: json['PhotoURL'] as String?,
      avatarFileName: json['AvatarFileName'] as String?,
      createDT: json['CreateDT'] as String?,
      updateDT: json['UpdateDT'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_FarmerWorkerToJson(_$_FarmerWorker instance) =>
    <String, dynamic>{
      'WorkerId': instance.workerId,
      'FarmId': instance.farmId,
      'JobTitle': instance.jobTitle,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'DateOfBirth': instance.dateOfBirth,
      'IdNumber': instance.idNumber,
      'JobDescription': instance.jobDescription,
      'PhoneNumber': instance.phoneNumber,
      'Nationality': instance.nationality,
      'Gender': instance.gender,
      'CanDelete': instance.canDelete,
      'Photo': instance.photo,
      'NormalisedPhotoURL': instance.normalisedPhotoURL,
      'PhotoURL': instance.photoURL,
      'AvatarFileName': instance.avatarFileName,
      'CreateDT': instance.createDT,
      'UpdateDT': instance.updateDT,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
