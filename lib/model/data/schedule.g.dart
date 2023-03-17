// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetScheduleCollection on Isar {
  IsarCollection<Schedule> get schedules => this.collection();
}

const ScheduleSchema = CollectionSchema(
  name: r'Schedule',
  id: 6369058706800408146,
  properties: {
    r'candidate': PropertySchema(
      id: 0,
      name: r'candidate',
      type: IsarType.string,
    ),
    r'certificate': PropertySchema(
      id: 1,
      name: r'certificate',
      type: IsarType.string,
    ),
    r'companyId': PropertySchema(
      id: 2,
      name: r'companyId',
      type: IsarType.long,
    ),
    r'companyName': PropertySchema(
      id: 3,
      name: r'companyName',
      type: IsarType.string,
    ),
    r'contactPerson': PropertySchema(
      id: 4,
      name: r'contactPerson',
      type: IsarType.string,
    ),
    r'contractorId': PropertySchema(
      id: 5,
      name: r'contractorId',
      type: IsarType.long,
    ),
    r'contractorName': PropertySchema(
      id: 6,
      name: r'contractorName',
      type: IsarType.string,
    ),
    r'courseId': PropertySchema(
      id: 7,
      name: r'courseId',
      type: IsarType.long,
    ),
    r'courseName': PropertySchema(
      id: 8,
      name: r'courseName',
      type: IsarType.string,
    ),
    r'destinationCompanyId': PropertySchema(
      id: 9,
      name: r'destinationCompanyId',
      type: IsarType.long,
    ),
    r'destinationCompanyName': PropertySchema(
      id: 10,
      name: r'destinationCompanyName',
      type: IsarType.string,
    ),
    r'end': PropertySchema(
      id: 11,
      name: r'end',
      type: IsarType.string,
    ),
    r'intOfAttendees': PropertySchema(
      id: 12,
      name: r'intOfAttendees',
      type: IsarType.long,
    ),
    r'invoice': PropertySchema(
      id: 13,
      name: r'invoice',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 14,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'plantationId': PropertySchema(
      id: 15,
      name: r'plantationId',
      type: IsarType.long,
    ),
    r'plantationName': PropertySchema(
      id: 16,
      name: r'plantationName',
      type: IsarType.string,
    ),
    r'potentialCompany': PropertySchema(
      id: 17,
      name: r'potentialCompany',
      type: IsarType.string,
    ),
    r'scheduleActivityId': PropertySchema(
      id: 18,
      name: r'scheduleActivityId',
      type: IsarType.long,
    ),
    r'scheduleActivityName': PropertySchema(
      id: 19,
      name: r'scheduleActivityName',
      type: IsarType.string,
    ),
    r'scheduleId': PropertySchema(
      id: 20,
      name: r'scheduleId',
      type: IsarType.string,
    ),
    r'start': PropertySchema(
      id: 21,
      name: r'start',
      type: IsarType.string,
    ),
    r'trainingProviderId': PropertySchema(
      id: 22,
      name: r'trainingProviderId',
      type: IsarType.long,
    ),
    r'trainingProviderName': PropertySchema(
      id: 23,
      name: r'trainingProviderName',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 24,
      name: r'userId',
      type: IsarType.long,
    ),
    r'venue': PropertySchema(
      id: 25,
      name: r'venue',
      type: IsarType.string,
    )
  },
  estimateSize: _scheduleEstimateSize,
  serialize: _scheduleSerialize,
  deserialize: _scheduleDeserialize,
  deserializeProp: _scheduleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _scheduleGetId,
  getLinks: _scheduleGetLinks,
  attach: _scheduleAttach,
  version: '3.0.5',
);

int _scheduleEstimateSize(
  Schedule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.candidate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.certificate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.companyName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactPerson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contractorName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.courseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.destinationCompanyName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.end;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.invoice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.plantationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.potentialCompany;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scheduleActivityName;
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
    final value = object.trainingProviderName;
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

void _scheduleSerialize(
  Schedule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.candidate);
  writer.writeString(offsets[1], object.certificate);
  writer.writeLong(offsets[2], object.companyId);
  writer.writeString(offsets[3], object.companyName);
  writer.writeString(offsets[4], object.contactPerson);
  writer.writeLong(offsets[5], object.contractorId);
  writer.writeString(offsets[6], object.contractorName);
  writer.writeLong(offsets[7], object.courseId);
  writer.writeString(offsets[8], object.courseName);
  writer.writeLong(offsets[9], object.destinationCompanyId);
  writer.writeString(offsets[10], object.destinationCompanyName);
  writer.writeString(offsets[11], object.end);
  writer.writeLong(offsets[12], object.intOfAttendees);
  writer.writeString(offsets[13], object.invoice);
  writer.writeBool(offsets[14], object.isActive);
  writer.writeLong(offsets[15], object.plantationId);
  writer.writeString(offsets[16], object.plantationName);
  writer.writeString(offsets[17], object.potentialCompany);
  writer.writeLong(offsets[18], object.scheduleActivityId);
  writer.writeString(offsets[19], object.scheduleActivityName);
  writer.writeString(offsets[20], object.scheduleId);
  writer.writeString(offsets[21], object.start);
  writer.writeLong(offsets[22], object.trainingProviderId);
  writer.writeString(offsets[23], object.trainingProviderName);
  writer.writeLong(offsets[24], object.userId);
  writer.writeString(offsets[25], object.venue);
}

Schedule _scheduleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Schedule(
    candidate: reader.readStringOrNull(offsets[0]),
    certificate: reader.readStringOrNull(offsets[1]),
    companyId: reader.readLongOrNull(offsets[2]),
    companyName: reader.readStringOrNull(offsets[3]),
    contactPerson: reader.readStringOrNull(offsets[4]),
    contractorId: reader.readLongOrNull(offsets[5]),
    contractorName: reader.readStringOrNull(offsets[6]),
    courseId: reader.readLongOrNull(offsets[7]),
    courseName: reader.readStringOrNull(offsets[8]),
    destinationCompanyId: reader.readLongOrNull(offsets[9]),
    destinationCompanyName: reader.readStringOrNull(offsets[10]),
    end: reader.readStringOrNull(offsets[11]),
    intOfAttendees: reader.readLongOrNull(offsets[12]),
    invoice: reader.readStringOrNull(offsets[13]),
    isActive: reader.readBoolOrNull(offsets[14]),
    plantationId: reader.readLongOrNull(offsets[15]),
    plantationName: reader.readStringOrNull(offsets[16]),
    potentialCompany: reader.readStringOrNull(offsets[17]),
    scheduleActivityId: reader.readLongOrNull(offsets[18]),
    scheduleActivityName: reader.readStringOrNull(offsets[19]),
    scheduleId: reader.readString(offsets[20]),
    start: reader.readStringOrNull(offsets[21]),
    trainingProviderId: reader.readLongOrNull(offsets[22]),
    trainingProviderName: reader.readStringOrNull(offsets[23]),
    userId: reader.readLongOrNull(offsets[24]),
    venue: reader.readStringOrNull(offsets[25]),
  );
  return object;
}

P _scheduleDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readBoolOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scheduleGetId(Schedule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scheduleGetLinks(Schedule object) {
  return [];
}

void _scheduleAttach(IsarCollection<dynamic> col, Id id, Schedule object) {}

extension ScheduleQueryWhereSort on QueryBuilder<Schedule, Schedule, QWhere> {
  QueryBuilder<Schedule, Schedule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduleQueryWhere on QueryBuilder<Schedule, Schedule, QWhereClause> {
  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idBetween(
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

extension ScheduleQueryFilter
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {
  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'candidate',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'candidate',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'candidate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'candidate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'candidate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'candidate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'candidate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'candidate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'candidate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'candidate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> candidateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'candidate',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      candidateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'candidate',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'certificate',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      certificateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'certificate',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certificate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      certificateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'certificate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'certificate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'certificate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'certificate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'certificate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'certificate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'certificate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> certificateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'certificate',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      certificateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'certificate',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyIdGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyIdLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyIdBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      companyNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      companyNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'companyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> companyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      companyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contactPersonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactPerson',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contactPersonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactPerson',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contactPersonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contactPersonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contactPersonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contactPersonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactPerson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contactPersonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contactPersonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contactPersonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contactPersonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactPerson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contactPersonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPerson',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contactPersonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactPerson',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contractorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractorId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractorId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contractorIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorIdGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contractorIdLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contractorIdBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractorName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractorName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contractorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contractorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> contractorNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      contractorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courseId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'courseName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      courseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'courseName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'courseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'courseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courseName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      courseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'courseName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destinationCompanyId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destinationCompanyId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationCompanyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationCompanyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationCompanyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationCompanyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destinationCompanyName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destinationCompanyName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationCompanyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationCompanyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationCompanyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationCompanyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destinationCompanyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destinationCompanyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destinationCompanyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destinationCompanyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationCompanyName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      destinationCompanyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destinationCompanyName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endStartsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endEndsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endContains(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endMatches(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'end',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      intOfAttendeesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intOfAttendees',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      intOfAttendeesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intOfAttendees',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> intOfAttendeesEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intOfAttendees',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      intOfAttendeesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intOfAttendees',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      intOfAttendeesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intOfAttendees',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> intOfAttendeesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intOfAttendees',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoice',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoice',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> invoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> plantationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plantationId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plantationId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> plantationIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plantationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> plantationIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plantationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> plantationIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plantationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plantationName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plantationName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> plantationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> plantationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plantationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> plantationNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plantationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      plantationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plantationName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'potentialCompany',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'potentialCompany',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'potentialCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'potentialCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'potentialCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'potentialCompany',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'potentialCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'potentialCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'potentialCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'potentialCompany',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'potentialCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      potentialCompanyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'potentialCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scheduleActivityId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scheduleActivityId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleActivityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scheduleActivityName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scheduleActivityName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scheduleActivityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scheduleActivityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleActivityName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleActivityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scheduleActivityName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdStartsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdEndsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scheduleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdMatches(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> scheduleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scheduleId',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      scheduleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scheduleId',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startStartsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startEndsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startContains(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startMatches(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'start',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trainingProviderId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trainingProviderId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingProviderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainingProviderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainingProviderId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainingProviderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trainingProviderName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trainingProviderName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainingProviderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trainingProviderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingProviderName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      trainingProviderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trainingProviderName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'venue',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'venue',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueStartsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueEndsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueContains(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueMatches(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venue',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> venueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'venue',
        value: '',
      ));
    });
  }
}

extension ScheduleQueryObject
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {}

extension ScheduleQueryLinks
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {}

extension ScheduleQuerySortBy on QueryBuilder<Schedule, Schedule, QSortBy> {
  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCandidate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCandidateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCertificate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCertificateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByContactPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByContactPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByContractorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByContractorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCourseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCourseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByCourseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByDestinationCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      sortByDestinationCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      sortByDestinationCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      sortByDestinationCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByIntOfAttendees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intOfAttendees', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByIntOfAttendeesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intOfAttendees', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPlantationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPlantationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPlantationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPotentialCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialCompany', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPotentialCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialCompany', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      sortByScheduleActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByScheduleActivityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      sortByScheduleActivityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByScheduleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByScheduleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByTrainingProviderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      sortByTrainingProviderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByTrainingProviderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      sortByTrainingProviderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension ScheduleQuerySortThenBy
    on QueryBuilder<Schedule, Schedule, QSortThenBy> {
  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCandidate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCandidateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'candidate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCertificate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCertificateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'certificate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByContactPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByContactPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPerson', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByContractorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByContractorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCourseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCourseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByCourseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByDestinationCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      thenByDestinationCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      thenByDestinationCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      thenByDestinationCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationCompanyName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIntOfAttendees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intOfAttendees', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIntOfAttendeesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intOfAttendees', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoice', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPlantationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPlantationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPlantationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPotentialCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialCompany', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPotentialCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'potentialCompany', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      thenByScheduleActivityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByScheduleActivityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      thenByScheduleActivityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleActivityName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByScheduleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByScheduleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scheduleId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByTrainingProviderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      thenByTrainingProviderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByTrainingProviderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy>
      thenByTrainingProviderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension ScheduleQueryWhereDistinct
    on QueryBuilder<Schedule, Schedule, QDistinct> {
  QueryBuilder<Schedule, Schedule, QDistinct> distinctByCandidate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'candidate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByCertificate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'certificate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByCompanyName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByContactPerson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactPerson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByContractorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByCourseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByCourseName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByDestinationCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationCompanyId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByDestinationCompanyName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationCompanyName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByEnd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'end', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByIntOfAttendees() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intOfAttendees');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByInvoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantationId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByPlantationName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantationName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByPotentialCompany(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'potentialCompany',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByScheduleActivityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleActivityId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByScheduleActivityName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleActivityName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByScheduleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scheduleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByStart(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByTrainingProviderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainingProviderId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByTrainingProviderName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainingProviderName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByVenue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'venue', caseSensitive: caseSensitive);
    });
  }
}

extension ScheduleQueryProperty
    on QueryBuilder<Schedule, Schedule, QQueryProperty> {
  QueryBuilder<Schedule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> candidateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'candidate');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> certificateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'certificate');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> companyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyName');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> contactPersonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactPerson');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> contractorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> contractorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorName');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> courseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> courseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseName');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations>
      destinationCompanyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationCompanyId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations>
      destinationCompanyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationCompanyName');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> endProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> intOfAttendeesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intOfAttendees');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> invoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoice');
    });
  }

  QueryBuilder<Schedule, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> plantationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantationId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> plantationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantationName');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> potentialCompanyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'potentialCompany');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> scheduleActivityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleActivityId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations>
      scheduleActivityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleActivityName');
    });
  }

  QueryBuilder<Schedule, String, QQueryOperations> scheduleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scheduleId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> startProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> trainingProviderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainingProviderId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations>
      trainingProviderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainingProviderName');
    });
  }

  QueryBuilder<Schedule, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> venueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'venue');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      scheduleId: json['ScheduleId'] as String,
      start: json['Start'] as String?,
      end: json['End'] as String?,
      userId: json['UserId'] as int?,
      companyId: json['CompanyId'] as int?,
      destinationCompanyId: json['DestinationCompanyId'] as int?,
      scheduleActivityId: json['ScheduleActivityId'] as int?,
      contractorId: json['ContractorId'] as int?,
      courseId: json['CourseId'] as int?,
      trainingProviderId: json['TrainingProviderId'] as int?,
      plantationId: json['PlantationId'] as int?,
      venue: json['Venue'] as String?,
      invoice: json['Invoice'] as String?,
      candidate: json['Candidate'] as String?,
      certificate: json['Certificate'] as String?,
      contactPerson: json['ContactPerson'] as String?,
      intOfAttendees: json['intOfAttendees'] as int?,
      isActive: json['IsActive'] as bool?,
      companyName: json['CompanyName'] as String?,
      destinationCompanyName: json['DestinationCompanyName'] as String?,
      scheduleActivityName: json['ScheduleActivityName'] as String?,
      contractorName: json['ContractorName'] as String?,
      courseName: json['CourseName'] as String?,
      trainingProviderName: json['TrainingProviderName'] as String?,
      plantationName: json['PlantationName'] as String?,
      potentialCompany: json['PotentialCompany'] as String?,
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'ScheduleId': instance.scheduleId,
      'Start': instance.start,
      'End': instance.end,
      'UserId': instance.userId,
      'CompanyId': instance.companyId,
      'DestinationCompanyId': instance.destinationCompanyId,
      'ScheduleActivityId': instance.scheduleActivityId,
      'ContractorId': instance.contractorId,
      'CourseId': instance.courseId,
      'TrainingProviderId': instance.trainingProviderId,
      'PlantationId': instance.plantationId,
      'Venue': instance.venue,
      'Invoice': instance.invoice,
      'Candidate': instance.candidate,
      'Certificate': instance.certificate,
      'ContactPerson': instance.contactPerson,
      'intOfAttendees': instance.intOfAttendees,
      'IsActive': instance.isActive,
      'CompanyName': instance.companyName,
      'DestinationCompanyName': instance.destinationCompanyName,
      'ScheduleActivityName': instance.scheduleActivityName,
      'ContractorName': instance.contractorName,
      'CourseName': instance.courseName,
      'TrainingProviderName': instance.trainingProviderName,
      'PlantationName': instance.plantationName,
      'PotentialCompany': instance.potentialCompany,
    };
