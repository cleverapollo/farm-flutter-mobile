// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetWorkerCollection on Isar {
  IsarCollection<Worker> get workers => this.collection();
}

const WorkerSchema = CollectionSchema(
  name: r'Worker',
  id: -853966281259446822,
  properties: {
    r'companyId': PropertySchema(
      id: 0,
      name: r'companyId',
      type: IsarType.long,
    ),
    r'contactNumber': PropertySchema(
      id: 1,
      name: r'contactNumber',
      type: IsarType.string,
    ),
    r'contractorId': PropertySchema(
      id: 2,
      name: r'contractorId',
      type: IsarType.long,
    ),
    r'createDt': PropertySchema(
      id: 3,
      name: r'createDt',
      type: IsarType.string,
    ),
    r'disabilityId': PropertySchema(
      id: 4,
      name: r'disabilityId',
      type: IsarType.long,
    ),
    r'dob': PropertySchema(
      id: 5,
      name: r'dob',
      type: IsarType.string,
    ),
    r'driverExpiryDt': PropertySchema(
      id: 6,
      name: r'driverExpiryDt',
      type: IsarType.string,
    ),
    r'driverint': PropertySchema(
      id: 7,
      name: r'driverint',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 8,
      name: r'email',
      type: IsarType.string,
    ),
    r'firstName': PropertySchema(
      id: 9,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 10,
      name: r'gender',
      type: IsarType.string,
    ),
    r'genderId': PropertySchema(
      id: 11,
      name: r'genderId',
      type: IsarType.long,
    ),
    r'idNumber': PropertySchema(
      id: 12,
      name: r'idNumber',
      type: IsarType.string,
    ),
    r'idint': PropertySchema(
      id: 13,
      name: r'idint',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 14,
      name: r'image',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 15,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 16,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'jobDescriptionId': PropertySchema(
      id: 17,
      name: r'jobDescriptionId',
      type: IsarType.long,
    ),
    r'municipalityId': PropertySchema(
      id: 18,
      name: r'municipalityId',
      type: IsarType.long,
    ),
    r'notes': PropertySchema(
      id: 19,
      name: r'notes',
      type: IsarType.string,
    ),
    r'pdpExpiryDt': PropertySchema(
      id: 20,
      name: r'pdpExpiryDt',
      type: IsarType.string,
    ),
    r'pdpint': PropertySchema(
      id: 21,
      name: r'pdpint',
      type: IsarType.string,
    ),
    r'phoneint': PropertySchema(
      id: 22,
      name: r'phoneint',
      type: IsarType.string,
    ),
    r'provinceId': PropertySchema(
      id: 23,
      name: r'provinceId',
      type: IsarType.long,
    ),
    r'raceId': PropertySchema(
      id: 24,
      name: r'raceId',
      type: IsarType.long,
    ),
    r'surname': PropertySchema(
      id: 25,
      name: r'surname',
      type: IsarType.string,
    ),
    r'upStringDt': PropertySchema(
      id: 26,
      name: r'upStringDt',
      type: IsarType.string,
    ),
    r'workerId': PropertySchema(
      id: 27,
      name: r'workerId',
      type: IsarType.string,
    )
  },
  estimateSize: _workerEstimateSize,
  serialize: _workerSerialize,
  deserialize: _workerDeserialize,
  deserializeProp: _workerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workerGetId,
  getLinks: _workerGetLinks,
  attach: _workerAttach,
  version: '3.0.5',
);

int _workerEstimateSize(
  Worker object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contactNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createDt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dob;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driverExpiryDt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driverint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
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
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pdpExpiryDt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pdpint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phoneint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.upStringDt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.workerId.length * 3;
  return bytesCount;
}

void _workerSerialize(
  Worker object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyId);
  writer.writeString(offsets[1], object.contactNumber);
  writer.writeLong(offsets[2], object.contractorId);
  writer.writeString(offsets[3], object.createDt);
  writer.writeLong(offsets[4], object.disabilityId);
  writer.writeString(offsets[5], object.dob);
  writer.writeString(offsets[6], object.driverExpiryDt);
  writer.writeString(offsets[7], object.driverint);
  writer.writeString(offsets[8], object.email);
  writer.writeString(offsets[9], object.firstName);
  writer.writeString(offsets[10], object.gender);
  writer.writeLong(offsets[11], object.genderId);
  writer.writeString(offsets[12], object.idNumber);
  writer.writeString(offsets[13], object.idint);
  writer.writeString(offsets[14], object.image);
  writer.writeBool(offsets[15], object.isActive);
  writer.writeBool(offsets[16], object.isLocal);
  writer.writeLong(offsets[17], object.jobDescriptionId);
  writer.writeLong(offsets[18], object.municipalityId);
  writer.writeString(offsets[19], object.notes);
  writer.writeString(offsets[20], object.pdpExpiryDt);
  writer.writeString(offsets[21], object.pdpint);
  writer.writeString(offsets[22], object.phoneint);
  writer.writeLong(offsets[23], object.provinceId);
  writer.writeLong(offsets[24], object.raceId);
  writer.writeString(offsets[25], object.surname);
  writer.writeString(offsets[26], object.upStringDt);
  writer.writeString(offsets[27], object.workerId);
}

Worker _workerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Worker(
    companyId: reader.readLongOrNull(offsets[0]),
    contactNumber: reader.readStringOrNull(offsets[1]),
    contractorId: reader.readLongOrNull(offsets[2]),
    createDt: reader.readStringOrNull(offsets[3]),
    disabilityId: reader.readLongOrNull(offsets[4]),
    dob: reader.readStringOrNull(offsets[5]),
    driverExpiryDt: reader.readStringOrNull(offsets[6]),
    driverint: reader.readStringOrNull(offsets[7]),
    email: reader.readStringOrNull(offsets[8]),
    firstName: reader.readStringOrNull(offsets[9]),
    gender: reader.readStringOrNull(offsets[10]),
    genderId: reader.readLongOrNull(offsets[11]),
    idNumber: reader.readStringOrNull(offsets[12]),
    idint: reader.readStringOrNull(offsets[13]),
    image: reader.readStringOrNull(offsets[14]),
    isActive: reader.readBoolOrNull(offsets[15]),
    isLocal: reader.readBoolOrNull(offsets[16]),
    jobDescriptionId: reader.readLongOrNull(offsets[17]),
    municipalityId: reader.readLongOrNull(offsets[18]),
    notes: reader.readStringOrNull(offsets[19]),
    pdpExpiryDt: reader.readStringOrNull(offsets[20]),
    pdpint: reader.readStringOrNull(offsets[21]),
    phoneint: reader.readStringOrNull(offsets[22]),
    provinceId: reader.readLongOrNull(offsets[23]),
    raceId: reader.readLongOrNull(offsets[24]),
    surname: reader.readStringOrNull(offsets[25]),
    upStringDt: reader.readStringOrNull(offsets[26]),
    workerId: reader.readString(offsets[27]),
  );
  return object;
}

P _workerDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readBoolOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workerGetId(Worker object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workerGetLinks(Worker object) {
  return [];
}

void _workerAttach(IsarCollection<dynamic> col, Id id, Worker object) {}

extension WorkerQueryWhereSort on QueryBuilder<Worker, Worker, QWhere> {
  QueryBuilder<Worker, Worker, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkerQueryWhere on QueryBuilder<Worker, Worker, QWhereClause> {
  QueryBuilder<Worker, Worker, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Worker, Worker, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Worker, Worker, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Worker, Worker, QAfterWhereClause> idBetween(
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

extension WorkerQueryFilter on QueryBuilder<Worker, Worker, QFilterCondition> {
  QueryBuilder<Worker, Worker, QAfterFilterCondition> companyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> companyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> companyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> companyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> companyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> companyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactNumber',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactNumber',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contactNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition>
      contactNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contractorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractorId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contractorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractorId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contractorIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contractorIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contractorIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> contractorIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> createDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> disabilityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'disabilityId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> disabilityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'disabilityId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> disabilityIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disabilityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> disabilityIdGreaterThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> disabilityIdLessThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> disabilityIdBetween(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dob',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dob',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dob',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dob',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dob',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dob',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> dobIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dob',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverExpiryDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition>
      driverExpiryDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverExpiryDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverExpiryDt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverExpiryDt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverExpiryDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverExpiryDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition>
      driverExpiryDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverExpiryDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> driverintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameEqualTo(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameGreaterThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameLessThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameBetween(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameStartsWith(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameEndsWith(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genderId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genderId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> genderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> idintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> isLocalEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> jobDescriptionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescriptionId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition>
      jobDescriptionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescriptionId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> jobDescriptionIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition>
      jobDescriptionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> jobDescriptionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> jobDescriptionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobDescriptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> municipalityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'municipalityId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition>
      municipalityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'municipalityId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> municipalityIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'municipalityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> municipalityIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'municipalityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> municipalityIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'municipalityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> municipalityIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'municipalityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdpExpiryDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdpExpiryDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdpExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdpExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdpExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdpExpiryDt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdpExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdpExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdpExpiryDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdpExpiryDt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdpExpiryDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpExpiryDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdpExpiryDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdpint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdpint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdpint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdpint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdpint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdpint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdpint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdpint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdpint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdpint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdpint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> pdpintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdpint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneint',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> phoneintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneint',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> provinceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'provinceId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> provinceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'provinceId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> provinceIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'provinceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> provinceIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'provinceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> provinceIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'provinceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> provinceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'provinceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> raceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'raceId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> raceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'raceId',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> raceIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'raceId',
        value: value,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> raceIdGreaterThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> raceIdLessThan(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> raceIdBetween(
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

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surname',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surname',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surname',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> surnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surname',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'upStringDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'upStringDt',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upStringDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'upStringDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'upStringDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'upStringDt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'upStringDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'upStringDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'upStringDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'upStringDt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'upStringDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> upStringDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'upStringDt',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerId',
        value: '',
      ));
    });
  }

  QueryBuilder<Worker, Worker, QAfterFilterCondition> workerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workerId',
        value: '',
      ));
    });
  }
}

extension WorkerQueryObject on QueryBuilder<Worker, Worker, QFilterCondition> {}

extension WorkerQueryLinks on QueryBuilder<Worker, Worker, QFilterCondition> {}

extension WorkerQuerySortBy on QueryBuilder<Worker, Worker, QSortBy> {
  QueryBuilder<Worker, Worker, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByContactNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByContactNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByCreateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByCreateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDisabilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDisabilityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDriverExpiryDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverExpiryDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDriverExpiryDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverExpiryDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDriverint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByDriverintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByGenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByGenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIdint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIdintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByMunicipalityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByMunicipalityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByPdpExpiryDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpExpiryDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByPdpExpiryDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpExpiryDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByPdpint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByPdpintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByPhoneint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByPhoneintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByProvinceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByProvinceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByRaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByRaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortBySurname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surname', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortBySurnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surname', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByUpStringDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upStringDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByUpStringDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upStringDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> sortByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }
}

extension WorkerQuerySortThenBy on QueryBuilder<Worker, Worker, QSortThenBy> {
  QueryBuilder<Worker, Worker, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByContactNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByContactNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactNumber', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByCreateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByCreateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDisabilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDisabilityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabilityId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDriverExpiryDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverExpiryDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDriverExpiryDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverExpiryDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDriverint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByDriverintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByGenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByGenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genderId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIdint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIdintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByMunicipalityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByMunicipalityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'municipalityId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByPdpExpiryDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpExpiryDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByPdpExpiryDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpExpiryDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByPdpint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByPdpintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdpint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByPhoneint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneint', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByPhoneintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneint', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByProvinceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByProvinceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'provinceId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByRaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByRaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'raceId', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenBySurname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surname', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenBySurnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surname', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByUpStringDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upStringDt', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByUpStringDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'upStringDt', Sort.desc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<Worker, Worker, QAfterSortBy> thenByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }
}

extension WorkerQueryWhereDistinct on QueryBuilder<Worker, Worker, QDistinct> {
  QueryBuilder<Worker, Worker, QDistinct> distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByContactNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByCreateDt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByDisabilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disabilityId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByDob(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dob', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByDriverExpiryDt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverExpiryDt',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByDriverint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByGenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genderId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByIdNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByIdint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescriptionId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByMunicipalityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'municipalityId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByPdpExpiryDt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdpExpiryDt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByPdpint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdpint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByPhoneint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByProvinceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'provinceId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByRaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'raceId');
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctBySurname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByUpStringDt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'upStringDt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Worker, Worker, QDistinct> distinctByWorkerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerId', caseSensitive: caseSensitive);
    });
  }
}

extension WorkerQueryProperty on QueryBuilder<Worker, Worker, QQueryProperty> {
  QueryBuilder<Worker, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> contactNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactNumber');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> contractorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorId');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> createDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDt');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> disabilityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disabilityId');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> dobProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dob');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> driverExpiryDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverExpiryDt');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> driverintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverint');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> genderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genderId');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> idNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idNumber');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> idintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idint');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<Worker, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Worker, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> jobDescriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescriptionId');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> municipalityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'municipalityId');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> pdpExpiryDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdpExpiryDt');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> pdpintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdpint');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> phoneintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneint');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> provinceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'provinceId');
    });
  }

  QueryBuilder<Worker, int?, QQueryOperations> raceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'raceId');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> surnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surname');
    });
  }

  QueryBuilder<Worker, String?, QQueryOperations> upStringDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'upStringDt');
    });
  }

  QueryBuilder<Worker, String, QQueryOperations> workerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Worker _$$_WorkerFromJson(Map<String, dynamic> json) => _$_Worker(
      workerId: json['WorkerId'] as String,
      firstName: json['FirstName'] as String?,
      surname: json['Surname'] as String?,
      idNumber: json['IdNumber'] as String?,
      companyId: json['CompanyId'] as int?,
      contractorId: json['ContractorId'] as int?,
      idint: json['Idint'] as String?,
      jobDescriptionId: json['JobDescriptionId'] as int?,
      dob: json['DOB'] as String?,
      contactNumber: json['ContactNumber'] as String?,
      phoneint: json['Phoneint'] as String?,
      email: json['Email'] as String?,
      municipalityId: json['MunicipalityId'] as int?,
      provinceId: json['ProvinceId'] as int?,
      gender: json['Gender'] as String?,
      image: json['Image'] as String?,
      notes: json['Notes'] as String?,
      raceId: json['RaceId'] as int?,
      genderId: json['GenderId'] as int?,
      disabilityId: json['DisabilityId'] as int?,
      driverint: json['Driverint'] as String?,
      driverExpiryDt: json['DriverExpiryDT'] as String?,
      pdpint: json['Pdpint'] as String?,
      pdpExpiryDt: json['PdpExpiryDT'] as String?,
      createDt: json['CreateDT'] as String?,
      upStringDt: json['UpStringDT'] as String?,
      isLocal: json['IsLocal'] as bool?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_WorkerToJson(_$_Worker instance) => <String, dynamic>{
      'WorkerId': instance.workerId,
      'FirstName': instance.firstName,
      'Surname': instance.surname,
      'IdNumber': instance.idNumber,
      'CompanyId': instance.companyId,
      'ContractorId': instance.contractorId,
      'Idint': instance.idint,
      'JobDescriptionId': instance.jobDescriptionId,
      'DOB': instance.dob,
      'ContactNumber': instance.contactNumber,
      'Phoneint': instance.phoneint,
      'Email': instance.email,
      'MunicipalityId': instance.municipalityId,
      'ProvinceId': instance.provinceId,
      'Gender': instance.gender,
      'Image': instance.image,
      'Notes': instance.notes,
      'RaceId': instance.raceId,
      'GenderId': instance.genderId,
      'DisabilityId': instance.disabilityId,
      'Driverint': instance.driverint,
      'DriverExpiryDT': instance.driverExpiryDt,
      'Pdpint': instance.pdpint,
      'PdpExpiryDT': instance.pdpExpiryDt,
      'CreateDT': instance.createDt,
      'UpStringDT': instance.upStringDt,
      'IsLocal': instance.isLocal,
      'IsActive': instance.isActive,
    };
