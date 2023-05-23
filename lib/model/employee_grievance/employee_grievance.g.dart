// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_grievance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEmployeeGrievanceCollection on Isar {
  IsarCollection<EmployeeGrievance> get employeeGrievances => this.collection();
}

const EmployeeGrievanceSchema = CollectionSchema(
  name: r'EmployeeGrievance',
  id: 9095182830066519410,
  properties: {
    r'actionTaken': PropertySchema(
      id: 0,
      name: r'actionTaken',
      type: IsarType.string,
    ),
    r'allocatedTo': PropertySchema(
      id: 1,
      name: r'allocatedTo',
      type: IsarType.string,
    ),
    r'allocatedToId': PropertySchema(
      id: 2,
      name: r'allocatedToId',
      type: IsarType.long,
    ),
    r'carClosed': PropertySchema(
      id: 3,
      name: r'carClosed',
      type: IsarType.bool,
    ),
    r'carRaised': PropertySchema(
      id: 4,
      name: r'carRaised',
      type: IsarType.bool,
    ),
    r'closureDetails': PropertySchema(
      id: 5,
      name: r'closureDetails',
      type: IsarType.string,
    ),
    r'dateClosed': PropertySchema(
      id: 6,
      name: r'dateClosed',
      type: IsarType.string,
    ),
    r'dateReceived': PropertySchema(
      id: 7,
      name: r'dateReceived',
      type: IsarType.string,
    ),
    r'employeeGrievanceId': PropertySchema(
      id: 8,
      name: r'employeeGrievanceId',
      type: IsarType.long,
    ),
    r'generalComments': PropertySchema(
      id: 9,
      name: r'generalComments',
      type: IsarType.string,
    ),
    r'grievanceIssue': PropertySchema(
      id: 10,
      name: r'grievanceIssue',
      type: IsarType.string,
    ),
    r'grievanceIssueId': PropertySchema(
      id: 11,
      name: r'grievanceIssueId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 12,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 13,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'workerId': PropertySchema(
      id: 14,
      name: r'workerId',
      type: IsarType.long,
    ),
    r'workerName': PropertySchema(
      id: 15,
      name: r'workerName',
      type: IsarType.string,
    )
  },
  estimateSize: _employeeGrievanceEstimateSize,
  serialize: _employeeGrievanceSerialize,
  deserialize: _employeeGrievanceDeserialize,
  deserializeProp: _employeeGrievanceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _employeeGrievanceGetId,
  getLinks: _employeeGrievanceGetLinks,
  attach: _employeeGrievanceAttach,
  version: '3.1.0',
);

int _employeeGrievanceEstimateSize(
  EmployeeGrievance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.actionTaken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.allocatedTo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.closureDetails;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateClosed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateReceived;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.generalComments;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.grievanceIssue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.workerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _employeeGrievanceSerialize(
  EmployeeGrievance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actionTaken);
  writer.writeString(offsets[1], object.allocatedTo);
  writer.writeLong(offsets[2], object.allocatedToId);
  writer.writeBool(offsets[3], object.carClosed);
  writer.writeBool(offsets[4], object.carRaised);
  writer.writeString(offsets[5], object.closureDetails);
  writer.writeString(offsets[6], object.dateClosed);
  writer.writeString(offsets[7], object.dateReceived);
  writer.writeLong(offsets[8], object.employeeGrievanceId);
  writer.writeString(offsets[9], object.generalComments);
  writer.writeString(offsets[10], object.grievanceIssue);
  writer.writeLong(offsets[11], object.grievanceIssueId);
  writer.writeBool(offsets[12], object.isActive);
  writer.writeBool(offsets[13], object.isLocal);
  writer.writeLong(offsets[14], object.workerId);
  writer.writeString(offsets[15], object.workerName);
}

EmployeeGrievance _employeeGrievanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmployeeGrievance(
    actionTaken: reader.readStringOrNull(offsets[0]),
    allocatedTo: reader.readStringOrNull(offsets[1]),
    allocatedToId: reader.readLongOrNull(offsets[2]),
    carClosed: reader.readBoolOrNull(offsets[3]),
    carRaised: reader.readBoolOrNull(offsets[4]),
    closureDetails: reader.readStringOrNull(offsets[5]),
    dateClosed: reader.readStringOrNull(offsets[6]),
    dateReceived: reader.readStringOrNull(offsets[7]),
    employeeGrievanceId: reader.readLongOrNull(offsets[8]),
    generalComments: reader.readStringOrNull(offsets[9]),
    grievanceIssue: reader.readStringOrNull(offsets[10]),
    grievanceIssueId: reader.readLongOrNull(offsets[11]),
    isActive: reader.readBoolOrNull(offsets[12]),
    isLocal: reader.readBoolOrNull(offsets[13]),
    workerId: reader.readLongOrNull(offsets[14]),
    workerName: reader.readStringOrNull(offsets[15]),
  );
  return object;
}

P _employeeGrievanceDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _employeeGrievanceGetId(EmployeeGrievance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _employeeGrievanceGetLinks(
    EmployeeGrievance object) {
  return [];
}

void _employeeGrievanceAttach(
    IsarCollection<dynamic> col, Id id, EmployeeGrievance object) {}

extension EmployeeGrievanceQueryWhereSort
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QWhere> {
  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EmployeeGrievanceQueryWhere
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QWhereClause> {
  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterWhereClause>
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

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterWhereClause>
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

extension EmployeeGrievanceQueryFilter
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QFilterCondition> {
  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actionTaken',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actionTaken',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actionTaken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actionTaken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actionTaken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actionTaken',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      actionTakenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actionTaken',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'allocatedTo',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'allocatedTo',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allocatedTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allocatedTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allocatedTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allocatedTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allocatedTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allocatedTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allocatedTo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allocatedTo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allocatedTo',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allocatedTo',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'allocatedToId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'allocatedToId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allocatedToId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allocatedToId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allocatedToId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      allocatedToIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allocatedToId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      carClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      carClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      carClosedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      carRaisedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      carRaisedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      carRaisedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaised',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closureDetails',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closureDetails',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closureDetails',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closureDetails',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closureDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      closureDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closureDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateClosed',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateClosed',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateClosed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateClosed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateClosed',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateClosedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateClosed',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateReceived',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateReceived',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateReceived',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateReceived',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReceived',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      dateReceivedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateReceived',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      employeeGrievanceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'employeeGrievanceId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      employeeGrievanceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'employeeGrievanceId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      employeeGrievanceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeGrievanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      employeeGrievanceIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeGrievanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      employeeGrievanceIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeGrievanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      employeeGrievanceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeGrievanceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generalComments',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'generalComments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      generalCommentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grievanceIssue',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grievanceIssue',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grievanceIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grievanceIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grievanceIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grievanceIssue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grievanceIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grievanceIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grievanceIssue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grievanceIssue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grievanceIssue',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grievanceIssue',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grievanceIssueId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grievanceIssueId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grievanceIssueId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grievanceIssueId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grievanceIssueId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      grievanceIssueIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grievanceIssueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
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

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
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

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
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

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerId',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
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

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
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

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
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

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerName',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerName',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerName',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterFilterCondition>
      workerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workerName',
        value: '',
      ));
    });
  }
}

extension EmployeeGrievanceQueryObject
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QFilterCondition> {}

extension EmployeeGrievanceQueryLinks
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QFilterCondition> {}

extension EmployeeGrievanceQuerySortBy
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QSortBy> {
  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByActionTaken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByActionTakenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByAllocatedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedTo', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByAllocatedToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedTo', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByAllocatedToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedToId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByAllocatedToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedToId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByClosureDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByClosureDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByDateClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByDateClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByDateReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByDateReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByEmployeeGrievanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeGrievanceId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByEmployeeGrievanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeGrievanceId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByGrievanceIssue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssue', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByGrievanceIssueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssue', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByGrievanceIssueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssueId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByGrievanceIssueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssueId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByWorkerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      sortByWorkerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.desc);
    });
  }
}

extension EmployeeGrievanceQuerySortThenBy
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QSortThenBy> {
  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByActionTaken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByActionTakenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actionTaken', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByAllocatedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedTo', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByAllocatedToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedTo', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByAllocatedToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedToId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByAllocatedToIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allocatedToId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByClosureDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByClosureDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByDateClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByDateClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByDateReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByDateReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByEmployeeGrievanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeGrievanceId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByEmployeeGrievanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeGrievanceId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByGrievanceIssue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssue', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByGrievanceIssueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssue', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByGrievanceIssueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssueId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByGrievanceIssueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grievanceIssueId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByWorkerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.asc);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QAfterSortBy>
      thenByWorkerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.desc);
    });
  }
}

extension EmployeeGrievanceQueryWhereDistinct
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct> {
  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByActionTaken({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actionTaken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByAllocatedTo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allocatedTo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByAllocatedToId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allocatedToId');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosed');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaised');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByClosureDetails({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closureDetails',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByDateClosed({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateClosed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByDateReceived({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateReceived', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByEmployeeGrievanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeGrievanceId');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByGeneralComments({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generalComments',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByGrievanceIssue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grievanceIssue',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByGrievanceIssueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grievanceIssueId');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerId');
    });
  }

  QueryBuilder<EmployeeGrievance, EmployeeGrievance, QDistinct>
      distinctByWorkerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerName', caseSensitive: caseSensitive);
    });
  }
}

extension EmployeeGrievanceQueryProperty
    on QueryBuilder<EmployeeGrievance, EmployeeGrievance, QQueryProperty> {
  QueryBuilder<EmployeeGrievance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      actionTakenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actionTaken');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      allocatedToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allocatedTo');
    });
  }

  QueryBuilder<EmployeeGrievance, int?, QQueryOperations>
      allocatedToIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allocatedToId');
    });
  }

  QueryBuilder<EmployeeGrievance, bool?, QQueryOperations> carClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosed');
    });
  }

  QueryBuilder<EmployeeGrievance, bool?, QQueryOperations> carRaisedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaised');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      closureDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closureDetails');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      dateClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateClosed');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      dateReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateReceived');
    });
  }

  QueryBuilder<EmployeeGrievance, int?, QQueryOperations>
      employeeGrievanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeGrievanceId');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      generalCommentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generalComments');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      grievanceIssueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grievanceIssue');
    });
  }

  QueryBuilder<EmployeeGrievance, int?, QQueryOperations>
      grievanceIssueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grievanceIssueId');
    });
  }

  QueryBuilder<EmployeeGrievance, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<EmployeeGrievance, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<EmployeeGrievance, int?, QQueryOperations> workerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerId');
    });
  }

  QueryBuilder<EmployeeGrievance, String?, QQueryOperations>
      workerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeGrievance _$$_EmployeeGrievanceFromJson(Map<String, dynamic> json) =>
    _$_EmployeeGrievance(
      employeeGrievanceId: json['EmployeeGrievanceId'] as int?,
      workerName: json['WorkerName'] as String?,
      workerId: json['WorkerId'] as int?,
      grievanceIssue: json['GrievanceIssue'] as String?,
      grievanceIssueId: json['GrievanceIssueId'] as int?,
      allocatedTo: json['AllocatedTo'] as String?,
      allocatedToId: json['AllocatedToId'] as int?,
      closureDetails: json['ClosureDetails'] as String?,
      actionTaken: json['ActionTaken'] as String?,
      generalComments: json['GeneralComments'] as String?,
      dateReceived: json['DateReceived'] as String?,
      dateClosed: json['DateClosed'] as String?,
      carRaised: json['CarRaised'] as bool? ?? false,
      carClosed: json['CarClosed'] as bool? ?? false,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_EmployeeGrievanceToJson(
        _$_EmployeeGrievance instance) =>
    <String, dynamic>{
      'EmployeeGrievanceId': instance.employeeGrievanceId,
      'WorkerName': instance.workerName,
      'WorkerId': instance.workerId,
      'GrievanceIssue': instance.grievanceIssue,
      'GrievanceIssueId': instance.grievanceIssueId,
      'AllocatedTo': instance.allocatedTo,
      'AllocatedToId': instance.allocatedToId,
      'ClosureDetails': instance.closureDetails,
      'ActionTaken': instance.actionTaken,
      'GeneralComments': instance.generalComments,
      'DateReceived': instance.dateReceived,
      'DateClosed': instance.dateClosed,
      'CarRaised': instance.carRaised,
      'CarClosed': instance.carClosed,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
