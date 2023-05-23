// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accident_and_incident.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAccidentAndIncidentCollection on Isar {
  IsarCollection<AccidentAndIncident> get accidentAndIncidents =>
      this.collection();
}

const AccidentAndIncidentSchema = CollectionSchema(
  name: r'AccidentAndIncident',
  id: 6117467353798760930,
  properties: {
    r'accidentAndIncidentRegisterNo': PropertySchema(
      id: 0,
      name: r'accidentAndIncidentRegisterNo',
      type: IsarType.string,
    ),
    r'carClosedDate': PropertySchema(
      id: 1,
      name: r'carClosedDate',
      type: IsarType.dateTime,
    ),
    r'carRaisedDate': PropertySchema(
      id: 2,
      name: r'carRaisedDate',
      type: IsarType.dateTime,
    ),
    r'comment': PropertySchema(
      id: 3,
      name: r'comment',
      type: IsarType.string,
    ),
    r'createDT': PropertySchema(
      id: 4,
      name: r'createDT',
      type: IsarType.dateTime,
    ),
    r'dateOfIncident': PropertySchema(
      id: 5,
      name: r'dateOfIncident',
      type: IsarType.dateTime,
    ),
    r'dateRecieved': PropertySchema(
      id: 6,
      name: r'dateRecieved',
      type: IsarType.dateTime,
    ),
    r'dateResumeWork': PropertySchema(
      id: 7,
      name: r'dateResumeWork',
      type: IsarType.dateTime,
    ),
    r'farmId': PropertySchema(
      id: 8,
      name: r'farmId',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 9,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'jobDescription': PropertySchema(
      id: 10,
      name: r'jobDescription',
      type: IsarType.string,
    ),
    r'jobDescriptionId': PropertySchema(
      id: 11,
      name: r'jobDescriptionId',
      type: IsarType.long,
    ),
    r'natureOfInjury': PropertySchema(
      id: 12,
      name: r'natureOfInjury',
      type: IsarType.string,
    ),
    r'natureOfInjuryId': PropertySchema(
      id: 13,
      name: r'natureOfInjuryId',
      type: IsarType.long,
    ),
    r'updateDT': PropertySchema(
      id: 14,
      name: r'updateDT',
      type: IsarType.dateTime,
    ),
    r'workerDisabled': PropertySchema(
      id: 15,
      name: r'workerDisabled',
      type: IsarType.bool,
    ),
    r'workerId': PropertySchema(
      id: 16,
      name: r'workerId',
      type: IsarType.long,
    ),
    r'workerName': PropertySchema(
      id: 17,
      name: r'workerName',
      type: IsarType.string,
    )
  },
  estimateSize: _accidentAndIncidentEstimateSize,
  serialize: _accidentAndIncidentSerialize,
  deserialize: _accidentAndIncidentDeserialize,
  deserializeProp: _accidentAndIncidentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _accidentAndIncidentGetId,
  getLinks: _accidentAndIncidentGetLinks,
  attach: _accidentAndIncidentAttach,
  version: '3.1.0',
);

int _accidentAndIncidentEstimateSize(
  AccidentAndIncident object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accidentAndIncidentRegisterNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.comment;
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
  {
    final value = object.jobDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.natureOfInjury;
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

void _accidentAndIncidentSerialize(
  AccidentAndIncident object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accidentAndIncidentRegisterNo);
  writer.writeDateTime(offsets[1], object.carClosedDate);
  writer.writeDateTime(offsets[2], object.carRaisedDate);
  writer.writeString(offsets[3], object.comment);
  writer.writeDateTime(offsets[4], object.createDT);
  writer.writeDateTime(offsets[5], object.dateOfIncident);
  writer.writeDateTime(offsets[6], object.dateRecieved);
  writer.writeDateTime(offsets[7], object.dateResumeWork);
  writer.writeString(offsets[8], object.farmId);
  writer.writeBool(offsets[9], object.isActive);
  writer.writeString(offsets[10], object.jobDescription);
  writer.writeLong(offsets[11], object.jobDescriptionId);
  writer.writeString(offsets[12], object.natureOfInjury);
  writer.writeLong(offsets[13], object.natureOfInjuryId);
  writer.writeDateTime(offsets[14], object.updateDT);
  writer.writeBool(offsets[15], object.workerDisabled);
  writer.writeLong(offsets[16], object.workerId);
  writer.writeString(offsets[17], object.workerName);
}

AccidentAndIncident _accidentAndIncidentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AccidentAndIncident(
    accidentAndIncidentRegisterNo: reader.readStringOrNull(offsets[0]),
    carClosedDate: reader.readDateTimeOrNull(offsets[1]),
    carRaisedDate: reader.readDateTimeOrNull(offsets[2]),
    comment: reader.readStringOrNull(offsets[3]),
    createDT: reader.readDateTimeOrNull(offsets[4]),
    dateOfIncident: reader.readDateTimeOrNull(offsets[5]),
    dateRecieved: reader.readDateTimeOrNull(offsets[6]),
    dateResumeWork: reader.readDateTimeOrNull(offsets[7]),
    farmId: reader.readStringOrNull(offsets[8]),
    isActive: reader.readBoolOrNull(offsets[9]),
    jobDescription: reader.readStringOrNull(offsets[10]),
    jobDescriptionId: reader.readLongOrNull(offsets[11]),
    natureOfInjury: reader.readStringOrNull(offsets[12]),
    natureOfInjuryId: reader.readLongOrNull(offsets[13]),
    updateDT: reader.readDateTimeOrNull(offsets[14]),
    workerDisabled: reader.readBoolOrNull(offsets[15]),
    workerId: reader.readLongOrNull(offsets[16]),
    workerName: reader.readStringOrNull(offsets[17]),
  );
  return object;
}

P _accidentAndIncidentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _accidentAndIncidentGetId(AccidentAndIncident object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _accidentAndIncidentGetLinks(
    AccidentAndIncident object) {
  return [];
}

void _accidentAndIncidentAttach(
    IsarCollection<dynamic> col, Id id, AccidentAndIncident object) {}

extension AccidentAndIncidentQueryWhereSort
    on QueryBuilder<AccidentAndIncident, AccidentAndIncident, QWhere> {
  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AccidentAndIncidentQueryWhere
    on QueryBuilder<AccidentAndIncident, AccidentAndIncident, QWhereClause> {
  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterWhereClause>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterWhereClause>
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

extension AccidentAndIncidentQueryFilter on QueryBuilder<AccidentAndIncident,
    AccidentAndIncident, QFilterCondition> {
  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accidentAndIncidentRegisterNo',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accidentAndIncidentRegisterNo',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accidentAndIncidentRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accidentAndIncidentRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accidentAndIncidentRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accidentAndIncidentRegisterNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accidentAndIncidentRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accidentAndIncidentRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accidentAndIncidentRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accidentAndIncidentRegisterNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accidentAndIncidentRegisterNo',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      accidentAndIncidentRegisterNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accidentAndIncidentRegisterNo',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carClosedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosedDate',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carClosedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosedDate',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carClosedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carClosedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carClosedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carClosedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carClosedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carClosedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carClosedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carRaisedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaisedDate',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carRaisedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaisedDate',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carRaisedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaisedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carRaisedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carRaisedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carRaisedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carRaisedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      carRaisedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carRaisedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      createDTEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      createDTGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      createDTLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      createDTBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateOfIncidentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateOfIncident',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateOfIncidentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateOfIncident',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateOfIncidentEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateOfIncident',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateOfIncidentGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateOfIncident',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateOfIncidentLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateOfIncident',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateOfIncidentBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateOfIncident',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateRecievedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateRecieved',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateRecievedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateRecieved',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateRecievedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateRecieved',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateRecievedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateRecieved',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateRecievedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateRecieved',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateRecievedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateRecieved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateResumeWorkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateResumeWork',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateResumeWorkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateResumeWork',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateResumeWorkEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateResumeWork',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateResumeWorkGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateResumeWork',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateResumeWorkLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateResumeWork',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      dateResumeWorkBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateResumeWork',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdEqualTo(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdGreaterThan(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdLessThan(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdBetween(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdStartsWith(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdEndsWith(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      farmIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescription',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescription',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescriptionId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescriptionId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIdLessThan(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      jobDescriptionIdBetween(
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'natureOfInjury',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'natureOfInjury',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'natureOfInjury',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'natureOfInjury',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'natureOfInjury',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'natureOfInjury',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'natureOfInjury',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'natureOfInjury',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'natureOfInjury',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'natureOfInjury',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'natureOfInjury',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'natureOfInjury',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'natureOfInjuryId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'natureOfInjuryId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'natureOfInjuryId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'natureOfInjuryId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'natureOfInjuryId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      natureOfInjuryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'natureOfInjuryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      updateDTEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      updateDTGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      updateDTLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      updateDTBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerDisabledIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerDisabled',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerDisabledIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerDisabled',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerDisabledEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerDisabled',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerName',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerName',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
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

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerName',
        value: '',
      ));
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterFilterCondition>
      workerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workerName',
        value: '',
      ));
    });
  }
}

extension AccidentAndIncidentQueryObject on QueryBuilder<AccidentAndIncident,
    AccidentAndIncident, QFilterCondition> {}

extension AccidentAndIncidentQueryLinks on QueryBuilder<AccidentAndIncident,
    AccidentAndIncident, QFilterCondition> {}

extension AccidentAndIncidentQuerySortBy
    on QueryBuilder<AccidentAndIncident, AccidentAndIncident, QSortBy> {
  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByAccidentAndIncidentRegisterNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentAndIncidentRegisterNo', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByAccidentAndIncidentRegisterNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentAndIncidentRegisterNo', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByCarClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByCarRaisedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByDateOfIncident() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfIncident', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByDateOfIncidentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfIncident', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByDateRecieved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecieved', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByDateRecievedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecieved', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByDateResumeWork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateResumeWork', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByDateResumeWorkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateResumeWork', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByJobDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescription', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByJobDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescription', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByNatureOfInjury() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjury', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByNatureOfInjuryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjury', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByNatureOfInjuryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjuryId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByNatureOfInjuryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjuryId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByWorkerDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerDisabled', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByWorkerDisabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerDisabled', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByWorkerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      sortByWorkerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.desc);
    });
  }
}

extension AccidentAndIncidentQuerySortThenBy
    on QueryBuilder<AccidentAndIncident, AccidentAndIncident, QSortThenBy> {
  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByAccidentAndIncidentRegisterNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentAndIncidentRegisterNo', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByAccidentAndIncidentRegisterNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentAndIncidentRegisterNo', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByCarClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByCarRaisedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByDateOfIncident() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfIncident', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByDateOfIncidentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateOfIncident', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByDateRecieved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecieved', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByDateRecievedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateRecieved', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByDateResumeWork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateResumeWork', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByDateResumeWorkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateResumeWork', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByJobDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescription', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByJobDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescription', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByNatureOfInjury() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjury', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByNatureOfInjuryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjury', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByNatureOfInjuryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjuryId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByNatureOfInjuryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'natureOfInjuryId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByWorkerDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerDisabled', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByWorkerDisabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerDisabled', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByWorkerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.asc);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QAfterSortBy>
      thenByWorkerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.desc);
    });
  }
}

extension AccidentAndIncidentQueryWhereDistinct
    on QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct> {
  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByAccidentAndIncidentRegisterNo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accidentAndIncidentRegisterNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosedDate');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaisedDate');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByComment({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByDateOfIncident() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateOfIncident');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByDateRecieved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateRecieved');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByDateResumeWork() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateResumeWork');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByFarmId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByJobDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescriptionId');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByNatureOfInjury({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'natureOfInjury',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByNatureOfInjuryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'natureOfInjuryId');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByWorkerDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerDisabled');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerId');
    });
  }

  QueryBuilder<AccidentAndIncident, AccidentAndIncident, QDistinct>
      distinctByWorkerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerName', caseSensitive: caseSensitive);
    });
  }
}

extension AccidentAndIncidentQueryProperty
    on QueryBuilder<AccidentAndIncident, AccidentAndIncident, QQueryProperty> {
  QueryBuilder<AccidentAndIncident, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AccidentAndIncident, String?, QQueryOperations>
      accidentAndIncidentRegisterNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accidentAndIncidentRegisterNo');
    });
  }

  QueryBuilder<AccidentAndIncident, DateTime?, QQueryOperations>
      carClosedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosedDate');
    });
  }

  QueryBuilder<AccidentAndIncident, DateTime?, QQueryOperations>
      carRaisedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaisedDate');
    });
  }

  QueryBuilder<AccidentAndIncident, String?, QQueryOperations>
      commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<AccidentAndIncident, DateTime?, QQueryOperations>
      createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<AccidentAndIncident, DateTime?, QQueryOperations>
      dateOfIncidentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateOfIncident');
    });
  }

  QueryBuilder<AccidentAndIncident, DateTime?, QQueryOperations>
      dateRecievedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateRecieved');
    });
  }

  QueryBuilder<AccidentAndIncident, DateTime?, QQueryOperations>
      dateResumeWorkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateResumeWork');
    });
  }

  QueryBuilder<AccidentAndIncident, String?, QQueryOperations>
      farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<AccidentAndIncident, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<AccidentAndIncident, String?, QQueryOperations>
      jobDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescription');
    });
  }

  QueryBuilder<AccidentAndIncident, int?, QQueryOperations>
      jobDescriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescriptionId');
    });
  }

  QueryBuilder<AccidentAndIncident, String?, QQueryOperations>
      natureOfInjuryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'natureOfInjury');
    });
  }

  QueryBuilder<AccidentAndIncident, int?, QQueryOperations>
      natureOfInjuryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'natureOfInjuryId');
    });
  }

  QueryBuilder<AccidentAndIncident, DateTime?, QQueryOperations>
      updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }

  QueryBuilder<AccidentAndIncident, bool?, QQueryOperations>
      workerDisabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerDisabled');
    });
  }

  QueryBuilder<AccidentAndIncident, int?, QQueryOperations> workerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerId');
    });
  }

  QueryBuilder<AccidentAndIncident, String?, QQueryOperations>
      workerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccidentAndIncident _$$_AccidentAndIncidentFromJson(
        Map<String, dynamic> json) =>
    _$_AccidentAndIncident(
      accidentAndIncidentRegisterNo:
          json['AccidentAndIncidentRegisterNo'] as String?,
      farmId: json['FarmId'] as String?,
      workerId: json['WorkerId'] as int?,
      natureOfInjuryId: json['NatureOfInjuryId'] as int?,
      dateRecieved: json['DateRecieved'] == null
          ? null
          : DateTime.parse(json['DateRecieved'] as String),
      dateOfIncident: json['DateOfIncident'] == null
          ? null
          : DateTime.parse(json['DateOfIncident'] as String),
      dateResumeWork: json['DateResumeWork'] == null
          ? null
          : DateTime.parse(json['DateResumeWork'] as String),
      workerDisabled: json['WorkerDisabled'] as bool?,
      jobDescriptionId: json['JobDescriptionId'] as int?,
      comment: json['Comment'] as String?,
      carRaisedDate: json['CarRaisedDate'] == null
          ? null
          : DateTime.parse(json['CarRaisedDate'] as String),
      carClosedDate: json['CarClosedDate'] == null
          ? null
          : DateTime.parse(json['CarClosedDate'] as String),
      createDT: json['CreateDT'] == null
          ? null
          : DateTime.parse(json['CreateDT'] as String),
      updateDT: json['UpdateDT'] == null
          ? null
          : DateTime.parse(json['UpdateDT'] as String),
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_AccidentAndIncidentToJson(
        _$_AccidentAndIncident instance) =>
    <String, dynamic>{
      'AccidentAndIncidentRegisterNo': instance.accidentAndIncidentRegisterNo,
      'FarmId': instance.farmId,
      'WorkerId': instance.workerId,
      'NatureOfInjuryId': instance.natureOfInjuryId,
      'DateRecieved': instance.dateRecieved?.toIso8601String(),
      'DateOfIncident': instance.dateOfIncident?.toIso8601String(),
      'DateResumeWork': instance.dateResumeWork?.toIso8601String(),
      'WorkerDisabled': instance.workerDisabled,
      'JobDescriptionId': instance.jobDescriptionId,
      'Comment': instance.comment,
      'CarRaisedDate': instance.carRaisedDate?.toIso8601String(),
      'CarClosedDate': instance.carClosedDate?.toIso8601String(),
      'CreateDT': instance.createDT?.toIso8601String(),
      'UpdateDT': instance.updateDT?.toIso8601String(),
      'IsActive': instance.isActive,
    };
