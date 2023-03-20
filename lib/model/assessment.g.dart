// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAssessmentCollection on Isar {
  IsarCollection<Assessment> get assessments => this.collection();
}

const AssessmentSchema = CollectionSchema(
  name: r'Assessment',
  id: -7365692047566751431,
  properties: {
    r'assessmentId': PropertySchema(
      id: 0,
      name: r'assessmentId',
      type: IsarType.long,
    ),
    r'companyId': PropertySchema(
      id: 1,
      name: r'companyId',
      type: IsarType.long,
    ),
    r'contractorId': PropertySchema(
      id: 2,
      name: r'contractorId',
      type: IsarType.long,
    ),
    r'contractorName': PropertySchema(
      id: 3,
      name: r'contractorName',
      type: IsarType.string,
    ),
    r'createDT': PropertySchema(
      id: 4,
      name: r'createDT',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'jobCategoryId': PropertySchema(
      id: 6,
      name: r'jobCategoryId',
      type: IsarType.long,
    ),
    r'jobCategoryName': PropertySchema(
      id: 7,
      name: r'jobCategoryName',
      type: IsarType.string,
    ),
    r'jobDescriptionId': PropertySchema(
      id: 8,
      name: r'jobDescriptionId',
      type: IsarType.long,
    ),
    r'jobDescriptionName': PropertySchema(
      id: 9,
      name: r'jobDescriptionName',
      type: IsarType.string,
    ),
    r'lat': PropertySchema(
      id: 10,
      name: r'lat',
      type: IsarType.string,
    ),
    r'locationName': PropertySchema(
      id: 11,
      name: r'locationName',
      type: IsarType.string,
    ),
    r'long': PropertySchema(
      id: 12,
      name: r'long',
      type: IsarType.string,
    ),
    r'plantationId': PropertySchema(
      id: 13,
      name: r'plantationId',
      type: IsarType.long,
    ),
    r'plantationName': PropertySchema(
      id: 14,
      name: r'plantationName',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 15,
      name: r'status',
      type: IsarType.long,
    ),
    r'teamId': PropertySchema(
      id: 16,
      name: r'teamId',
      type: IsarType.long,
    ),
    r'teamName': PropertySchema(
      id: 17,
      name: r'teamName',
      type: IsarType.string,
    ),
    r'updateDT': PropertySchema(
      id: 18,
      name: r'updateDT',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 19,
      name: r'userId',
      type: IsarType.long,
    ),
    r'workerId': PropertySchema(
      id: 20,
      name: r'workerId',
      type: IsarType.string,
    ),
    r'workerName': PropertySchema(
      id: 21,
      name: r'workerName',
      type: IsarType.string,
    )
  },
  estimateSize: _assessmentEstimateSize,
  serialize: _assessmentSerialize,
  deserialize: _assessmentDeserialize,
  deserializeProp: _assessmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _assessmentGetId,
  getLinks: _assessmentGetLinks,
  attach: _assessmentAttach,
  version: '3.0.5',
);

int _assessmentEstimateSize(
  Assessment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contractorName;
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
    final value = object.jobCategoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.jobDescriptionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lat;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.long;
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
    final value = object.teamName;
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
  {
    final value = object.workerId;
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

void _assessmentSerialize(
  Assessment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.assessmentId);
  writer.writeLong(offsets[1], object.companyId);
  writer.writeLong(offsets[2], object.contractorId);
  writer.writeString(offsets[3], object.contractorName);
  writer.writeString(offsets[4], object.createDT);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeLong(offsets[6], object.jobCategoryId);
  writer.writeString(offsets[7], object.jobCategoryName);
  writer.writeLong(offsets[8], object.jobDescriptionId);
  writer.writeString(offsets[9], object.jobDescriptionName);
  writer.writeString(offsets[10], object.lat);
  writer.writeString(offsets[11], object.locationName);
  writer.writeString(offsets[12], object.long);
  writer.writeLong(offsets[13], object.plantationId);
  writer.writeString(offsets[14], object.plantationName);
  writer.writeLong(offsets[15], object.status);
  writer.writeLong(offsets[16], object.teamId);
  writer.writeString(offsets[17], object.teamName);
  writer.writeString(offsets[18], object.updateDT);
  writer.writeLong(offsets[19], object.userId);
  writer.writeString(offsets[20], object.workerId);
  writer.writeString(offsets[21], object.workerName);
}

Assessment _assessmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Assessment(
    assessmentId: reader.readLongOrNull(offsets[0]),
    companyId: reader.readLongOrNull(offsets[1]),
    contractorId: reader.readLongOrNull(offsets[2]),
    contractorName: reader.readStringOrNull(offsets[3]),
    createDT: reader.readStringOrNull(offsets[4]),
    isActive: reader.readBoolOrNull(offsets[5]),
    jobCategoryId: reader.readLongOrNull(offsets[6]),
    jobCategoryName: reader.readStringOrNull(offsets[7]),
    jobDescriptionId: reader.readLongOrNull(offsets[8]),
    jobDescriptionName: reader.readStringOrNull(offsets[9]),
    lat: reader.readStringOrNull(offsets[10]),
    locationName: reader.readStringOrNull(offsets[11]),
    long: reader.readStringOrNull(offsets[12]),
    plantationId: reader.readLongOrNull(offsets[13]),
    plantationName: reader.readStringOrNull(offsets[14]),
    status: reader.readLongOrNull(offsets[15]),
    teamId: reader.readLongOrNull(offsets[16]),
    teamName: reader.readStringOrNull(offsets[17]),
    updateDT: reader.readStringOrNull(offsets[18]),
    userId: reader.readLongOrNull(offsets[19]),
    workerId: reader.readStringOrNull(offsets[20]),
    workerName: reader.readStringOrNull(offsets[21]),
  );
  return object;
}

P _assessmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _assessmentGetId(Assessment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _assessmentGetLinks(Assessment object) {
  return [];
}

void _assessmentAttach(IsarCollection<dynamic> col, Id id, Assessment object) {}

extension AssessmentQueryWhereSort
    on QueryBuilder<Assessment, Assessment, QWhere> {
  QueryBuilder<Assessment, Assessment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AssessmentQueryWhere
    on QueryBuilder<Assessment, Assessment, QWhereClause> {
  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterWhereClause> idBetween(
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

extension AssessmentQueryFilter
    on QueryBuilder<Assessment, Assessment, QFilterCondition> {
  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assessmentId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assessmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      assessmentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assessmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      companyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      companyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> companyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      companyIdGreaterThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> companyIdLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> companyIdBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractorId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractorId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorIdLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorIdBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractorName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractorName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameEqualTo(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      contractorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> createDTEqualTo(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> createDTLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> createDTBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> createDTEndsWith(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> createDTContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> createDTMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      createDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      createDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobCategoryId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobCategoryId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobCategoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobCategoryName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobCategoryName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobCategoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobCategoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobCategoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobCategoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescriptionId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescriptionId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescriptionName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescriptionName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobDescriptionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobDescriptionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      jobDescriptionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobDescriptionName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> latIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lat',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      locationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'long',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'long',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'long',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'long',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'long',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'long',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'long',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'long',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'long',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'long',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'long',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> longIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'long',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plantationId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plantationId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationIdLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationIdBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plantationName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plantationName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameEqualTo(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plantationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plantationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantationName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      plantationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plantationName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> statusEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> statusGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> statusLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> statusBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teamId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      teamIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teamId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teamId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teamId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teamId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'teamName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      teamNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'teamName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      teamNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teamName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teamName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teamName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      teamNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teamName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teamName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teamName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> teamNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teamName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      teamNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      teamNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teamName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> updateDTEqualTo(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> updateDTLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> updateDTBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> updateDTEndsWith(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> updateDTContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> updateDTMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      updateDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      updateDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> userIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerId',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerIdEqualTo(
    String? value, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerIdGreaterThan(
    String? value, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerIdLessThan(
    String? value, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerIdStartsWith(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerIdEndsWith(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerIdContains(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerIdMatches(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerId',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workerId',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workerName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workerName',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerNameEqualTo(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerNameBetween(
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
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

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition> workerNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workerName',
        value: '',
      ));
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterFilterCondition>
      workerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workerName',
        value: '',
      ));
    });
  }
}

extension AssessmentQueryObject
    on QueryBuilder<Assessment, Assessment, QFilterCondition> {}

extension AssessmentQueryLinks
    on QueryBuilder<Assessment, Assessment, QFilterCondition> {}

extension AssessmentQuerySortBy
    on QueryBuilder<Assessment, Assessment, QSortBy> {
  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByContractorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByContractorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByJobCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByJobCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByJobDescriptionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByJobDescriptionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'long', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'long', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByPlantationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByPlantationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      sortByPlantationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByTeamName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByTeamNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByWorkerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> sortByWorkerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.desc);
    });
  }
}

extension AssessmentQuerySortThenBy
    on QueryBuilder<Assessment, Assessment, QSortThenBy> {
  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByAssessmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessmentId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByContractorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByContractorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByJobCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByJobCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByJobDescriptionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByJobDescriptionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByLong() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'long', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByLongDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'long', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByPlantationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByPlantationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy>
      thenByPlantationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantationName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByTeamName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByTeamNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamName', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByWorkerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByWorkerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerId', Sort.desc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByWorkerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.asc);
    });
  }

  QueryBuilder<Assessment, Assessment, QAfterSortBy> thenByWorkerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workerName', Sort.desc);
    });
  }
}

extension AssessmentQueryWhereDistinct
    on QueryBuilder<Assessment, Assessment, QDistinct> {
  QueryBuilder<Assessment, Assessment, QDistinct> distinctByAssessmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessmentId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByContractorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByCreateDT(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobCategoryId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByJobCategoryName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobCategoryName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescriptionId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByJobDescriptionName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescriptionName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByLat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByLocationName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByLong(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'long', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByPlantationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantationId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByPlantationName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantationName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teamId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByTeamName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teamName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByUpdateDT(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByWorkerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Assessment, Assessment, QDistinct> distinctByWorkerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workerName', caseSensitive: caseSensitive);
    });
  }
}

extension AssessmentQueryProperty
    on QueryBuilder<Assessment, Assessment, QQueryProperty> {
  QueryBuilder<Assessment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> assessmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessmentId');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> contractorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorId');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> contractorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorName');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<Assessment, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> jobCategoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobCategoryId');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations>
      jobCategoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobCategoryName');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> jobDescriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescriptionId');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations>
      jobDescriptionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescriptionName');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> locationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationName');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> longProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'long');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> plantationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantationId');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> plantationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantationName');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> teamIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teamId');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> teamNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teamName');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }

  QueryBuilder<Assessment, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> workerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerId');
    });
  }

  QueryBuilder<Assessment, String?, QQueryOperations> workerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workerName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Assessment _$$_AssessmentFromJson(Map<String, dynamic> json) =>
    _$_Assessment(
      assessmentId: json['AssessmentId'] as int?,
      companyId: json['CompanyId'] as int?,
      userId: json['UserId'] as int?,
      jobCategoryId: json['JobCategoryId'] as int?,
      jobDescriptionId: json['JobDescriptionId'] as int?,
      plantationId: json['PlantationId'] as int?,
      contractorId: json['ContractorId'] as int?,
      teamId: json['TeamId'] as int?,
      workerId: json['WorkerId'] as String?,
      lat: json['Lat'] as String?,
      long: json['Long'] as String?,
      locationName: json['LocationName'] as String?,
      jobCategoryName: json['JobCategoryName'] as String?,
      jobDescriptionName: json['JobDescriptionName'] as String?,
      plantationName: json['PlantationName'] as String?,
      contractorName: json['ContractorName'] as String?,
      teamName: json['TeamName'] as String?,
      workerName: json['WorkerName'] as String?,
      status: json['Status'] as int?,
      isActive: json['IsActive'] as bool?,
      createDT: json['CreateDT'] as String?,
      updateDT: json['UpdateDT'] as String?,
    );

Map<String, dynamic> _$$_AssessmentToJson(_$_Assessment instance) =>
    <String, dynamic>{
      'AssessmentId': instance.assessmentId,
      'CompanyId': instance.companyId,
      'UserId': instance.userId,
      'JobCategoryId': instance.jobCategoryId,
      'JobDescriptionId': instance.jobDescriptionId,
      'PlantationId': instance.plantationId,
      'ContractorId': instance.contractorId,
      'TeamId': instance.teamId,
      'WorkerId': instance.workerId,
      'Lat': instance.lat,
      'Long': instance.long,
      'LocationName': instance.locationName,
      'JobCategoryName': instance.jobCategoryName,
      'JobDescriptionName': instance.jobDescriptionName,
      'PlantationName': instance.plantationName,
      'ContractorName': instance.contractorName,
      'TeamName': instance.teamName,
      'WorkerName': instance.workerName,
      'Status': instance.status,
      'IsActive': instance.isActive,
      'CreateDT': instance.createDT,
      'UpdateDT': instance.updateDT,
    };
