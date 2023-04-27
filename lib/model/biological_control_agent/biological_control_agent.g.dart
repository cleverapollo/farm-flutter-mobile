// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biological_control_agent.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBiologicalControlAgentCollection on Isar {
  IsarCollection<BiologicalControlAgent> get biologicalControlAgents =>
      this.collection();
}

const BiologicalControlAgentSchema = CollectionSchema(
  name: r'BiologicalControlAgent',
  id: -3348005074736607699,
  properties: {
    r'biologicalControlAgentId': PropertySchema(
      id: 0,
      name: r'biologicalControlAgentId',
      type: IsarType.long,
    ),
    r'carClosed': PropertySchema(
      id: 1,
      name: r'carClosed',
      type: IsarType.bool,
    ),
    r'carRaised': PropertySchema(
      id: 2,
      name: r'carRaised',
      type: IsarType.bool,
    ),
    r'controlAgentId': PropertySchema(
      id: 3,
      name: r'controlAgentId',
      type: IsarType.string,
    ),
    r'countryOrigin': PropertySchema(
      id: 4,
      name: r'countryOrigin',
      type: IsarType.string,
    ),
    r'dateReleased': PropertySchema(
      id: 5,
      name: r'dateReleased',
      type: IsarType.string,
    ),
    r'descriptionMonitoringRequirements': PropertySchema(
      id: 6,
      name: r'descriptionMonitoringRequirements',
      type: IsarType.string,
    ),
    r'descriptionMonitoringRequirementsId': PropertySchema(
      id: 7,
      name: r'descriptionMonitoringRequirementsId',
      type: IsarType.long,
    ),
    r'generalComments': PropertySchema(
      id: 8,
      name: r'generalComments',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 9,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 10,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'nameControlAgent': PropertySchema(
      id: 11,
      name: r'nameControlAgent',
      type: IsarType.string,
    ),
    r'reasonBioAgent': PropertySchema(
      id: 12,
      name: r'reasonBioAgent',
      type: IsarType.string,
    ),
    r'scientificName': PropertySchema(
      id: 13,
      name: r'scientificName',
      type: IsarType.string,
    ),
    r'stakeholderId': PropertySchema(
      id: 14,
      name: r'stakeholderId',
      type: IsarType.long,
    ),
    r'stakeholderName': PropertySchema(
      id: 15,
      name: r'stakeholderName',
      type: IsarType.string,
    )
  },
  estimateSize: _biologicalControlAgentEstimateSize,
  serialize: _biologicalControlAgentSerialize,
  deserialize: _biologicalControlAgentDeserialize,
  deserializeProp: _biologicalControlAgentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _biologicalControlAgentGetId,
  getLinks: _biologicalControlAgentGetLinks,
  attach: _biologicalControlAgentAttach,
  version: '3.0.5',
);

int _biologicalControlAgentEstimateSize(
  BiologicalControlAgent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.controlAgentId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.countryOrigin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateReleased;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.descriptionMonitoringRequirements;
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
    final value = object.nameControlAgent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reasonBioAgent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scientificName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stakeholderName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _biologicalControlAgentSerialize(
  BiologicalControlAgent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.biologicalControlAgentId);
  writer.writeBool(offsets[1], object.carClosed);
  writer.writeBool(offsets[2], object.carRaised);
  writer.writeString(offsets[3], object.controlAgentId);
  writer.writeString(offsets[4], object.countryOrigin);
  writer.writeString(offsets[5], object.dateReleased);
  writer.writeString(offsets[6], object.descriptionMonitoringRequirements);
  writer.writeLong(offsets[7], object.descriptionMonitoringRequirementsId);
  writer.writeString(offsets[8], object.generalComments);
  writer.writeBool(offsets[9], object.isActive);
  writer.writeBool(offsets[10], object.isLocal);
  writer.writeString(offsets[11], object.nameControlAgent);
  writer.writeString(offsets[12], object.reasonBioAgent);
  writer.writeString(offsets[13], object.scientificName);
  writer.writeLong(offsets[14], object.stakeholderId);
  writer.writeString(offsets[15], object.stakeholderName);
}

BiologicalControlAgent _biologicalControlAgentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BiologicalControlAgent(
    biologicalControlAgentId: reader.readLongOrNull(offsets[0]),
    carClosed: reader.readBoolOrNull(offsets[1]),
    carRaised: reader.readBoolOrNull(offsets[2]),
    controlAgentId: reader.readStringOrNull(offsets[3]),
    countryOrigin: reader.readStringOrNull(offsets[4]),
    dateReleased: reader.readStringOrNull(offsets[5]),
    descriptionMonitoringRequirements: reader.readStringOrNull(offsets[6]),
    descriptionMonitoringRequirementsId: reader.readLongOrNull(offsets[7]),
    generalComments: reader.readStringOrNull(offsets[8]),
    isActive: reader.readBoolOrNull(offsets[9]),
    isLocal: reader.readBoolOrNull(offsets[10]),
    nameControlAgent: reader.readStringOrNull(offsets[11]),
    reasonBioAgent: reader.readStringOrNull(offsets[12]),
    scientificName: reader.readStringOrNull(offsets[13]),
    stakeholderId: reader.readLongOrNull(offsets[14]),
    stakeholderName: reader.readStringOrNull(offsets[15]),
  );
  return object;
}

P _biologicalControlAgentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _biologicalControlAgentGetId(BiologicalControlAgent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _biologicalControlAgentGetLinks(
    BiologicalControlAgent object) {
  return [];
}

void _biologicalControlAgentAttach(
    IsarCollection<dynamic> col, Id id, BiologicalControlAgent object) {}

extension BiologicalControlAgentQueryWhereSort
    on QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QWhere> {
  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BiologicalControlAgentQueryWhere on QueryBuilder<
    BiologicalControlAgent, BiologicalControlAgent, QWhereClause> {
  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterWhereClause> idBetween(
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

extension BiologicalControlAgentQueryFilter on QueryBuilder<
    BiologicalControlAgent, BiologicalControlAgent, QFilterCondition> {
  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> biologicalControlAgentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'biologicalControlAgentId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> biologicalControlAgentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'biologicalControlAgentId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> biologicalControlAgentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'biologicalControlAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> biologicalControlAgentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'biologicalControlAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> biologicalControlAgentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'biologicalControlAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> biologicalControlAgentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'biologicalControlAgentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> carClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> carClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> carClosedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> carRaisedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> carRaisedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> carRaisedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaised',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'controlAgentId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'controlAgentId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'controlAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'controlAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'controlAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'controlAgentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'controlAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'controlAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      controlAgentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'controlAgentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      controlAgentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'controlAgentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'controlAgentId',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> controlAgentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'controlAgentId',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countryOrigin',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countryOrigin',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryOrigin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countryOrigin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countryOrigin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countryOrigin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'countryOrigin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'countryOrigin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      countryOriginContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'countryOrigin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      countryOriginMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'countryOrigin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryOrigin',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> countryOriginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'countryOrigin',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateReleased',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateReleased',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReleased',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateReleased',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateReleased',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateReleased',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateReleased',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateReleased',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      dateReleasedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateReleased',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      dateReleasedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateReleased',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReleased',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> dateReleasedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateReleased',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptionMonitoringRequirements',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptionMonitoringRequirements',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionMonitoringRequirements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptionMonitoringRequirements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptionMonitoringRequirements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptionMonitoringRequirements',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descriptionMonitoringRequirements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descriptionMonitoringRequirements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      descriptionMonitoringRequirementsContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descriptionMonitoringRequirements',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      descriptionMonitoringRequirementsMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descriptionMonitoringRequirements',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionMonitoringRequirements',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descriptionMonitoringRequirements',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descriptionMonitoringRequirementsId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descriptionMonitoringRequirementsId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      descriptionMonitoringRequirementsIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionMonitoringRequirementsId',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptionMonitoringRequirementsId',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptionMonitoringRequirementsId',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> descriptionMonitoringRequirementsIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptionMonitoringRequirementsId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsEqualTo(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsGreaterThan(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsLessThan(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsBetween(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsStartsWith(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsEndsWith(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      generalCommentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      generalCommentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'generalComments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> generalCommentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameControlAgent',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameControlAgent',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameControlAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameControlAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameControlAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameControlAgent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameControlAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameControlAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      nameControlAgentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameControlAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      nameControlAgentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameControlAgent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameControlAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> nameControlAgentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameControlAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reasonBioAgent',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reasonBioAgent',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonBioAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reasonBioAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reasonBioAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reasonBioAgent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reasonBioAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reasonBioAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      reasonBioAgentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasonBioAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      reasonBioAgentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasonBioAgent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonBioAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> reasonBioAgentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasonBioAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scientificName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      scientificNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      scientificNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scientificName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> scientificNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeholderId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeholderId',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderId',
        value: value,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderIdGreaterThan(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderIdLessThan(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderIdBetween(
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

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeholderName',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeholderName',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeholderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      stakeholderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakeholderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
          QAfterFilterCondition>
      stakeholderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakeholderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeholderName',
        value: '',
      ));
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent,
      QAfterFilterCondition> stakeholderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakeholderName',
        value: '',
      ));
    });
  }
}

extension BiologicalControlAgentQueryObject on QueryBuilder<
    BiologicalControlAgent, BiologicalControlAgent, QFilterCondition> {}

extension BiologicalControlAgentQueryLinks on QueryBuilder<
    BiologicalControlAgent, BiologicalControlAgent, QFilterCondition> {}

extension BiologicalControlAgentQuerySortBy
    on QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QSortBy> {
  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByBiologicalControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biologicalControlAgentId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByBiologicalControlAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biologicalControlAgentId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByControlAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByCountryOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByCountryOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByDateReleasedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByDescriptionMonitoringRequirements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirements', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByDescriptionMonitoringRequirementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirements', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByDescriptionMonitoringRequirementsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirementsId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByDescriptionMonitoringRequirementsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirementsId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByNameControlAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByNameControlAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByReasonBioAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByReasonBioAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByStakeholderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      sortByStakeholderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.desc);
    });
  }
}

extension BiologicalControlAgentQuerySortThenBy on QueryBuilder<
    BiologicalControlAgent, BiologicalControlAgent, QSortThenBy> {
  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByBiologicalControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biologicalControlAgentId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByBiologicalControlAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biologicalControlAgentId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByControlAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByCountryOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByCountryOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByDateReleased() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByDateReleasedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReleased', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByDescriptionMonitoringRequirements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirements', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByDescriptionMonitoringRequirementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirements', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByDescriptionMonitoringRequirementsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirementsId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByDescriptionMonitoringRequirementsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionMonitoringRequirementsId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByNameControlAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByNameControlAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByReasonBioAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByReasonBioAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByStakeholderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderId', Sort.desc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByStakeholderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.asc);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QAfterSortBy>
      thenByStakeholderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeholderName', Sort.desc);
    });
  }
}

extension BiologicalControlAgentQueryWhereDistinct
    on QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct> {
  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByBiologicalControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'biologicalControlAgentId');
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosed');
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaised');
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByControlAgentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'controlAgentId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByCountryOrigin({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countryOrigin',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByDateReleased({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateReleased', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByDescriptionMonitoringRequirements({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descriptionMonitoringRequirements',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByDescriptionMonitoringRequirementsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descriptionMonitoringRequirementsId');
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByGeneralComments({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generalComments',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByNameControlAgent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameControlAgent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByReasonBioAgent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasonBioAgent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByScientificName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scientificName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByStakeholderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderId');
    });
  }

  QueryBuilder<BiologicalControlAgent, BiologicalControlAgent, QDistinct>
      distinctByStakeholderName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeholderName',
          caseSensitive: caseSensitive);
    });
  }
}

extension BiologicalControlAgentQueryProperty on QueryBuilder<
    BiologicalControlAgent, BiologicalControlAgent, QQueryProperty> {
  QueryBuilder<BiologicalControlAgent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BiologicalControlAgent, int?, QQueryOperations>
      biologicalControlAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'biologicalControlAgentId');
    });
  }

  QueryBuilder<BiologicalControlAgent, bool?, QQueryOperations>
      carClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosed');
    });
  }

  QueryBuilder<BiologicalControlAgent, bool?, QQueryOperations>
      carRaisedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaised');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      controlAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'controlAgentId');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      countryOriginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countryOrigin');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      dateReleasedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateReleased');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      descriptionMonitoringRequirementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionMonitoringRequirements');
    });
  }

  QueryBuilder<BiologicalControlAgent, int?, QQueryOperations>
      descriptionMonitoringRequirementsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionMonitoringRequirementsId');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      generalCommentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generalComments');
    });
  }

  QueryBuilder<BiologicalControlAgent, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<BiologicalControlAgent, bool?, QQueryOperations>
      isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      nameControlAgentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameControlAgent');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      reasonBioAgentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasonBioAgent');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      scientificNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scientificName');
    });
  }

  QueryBuilder<BiologicalControlAgent, int?, QQueryOperations>
      stakeholderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderId');
    });
  }

  QueryBuilder<BiologicalControlAgent, String?, QQueryOperations>
      stakeholderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeholderName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BiologicalControlAgent _$$_BiologicalControlAgentFromJson(
        Map<String, dynamic> json) =>
    _$_BiologicalControlAgent(
      biologicalControlAgentId: json['BiologicalControlAgentsId'] as int?,
      nameControlAgent: json['NameControlAgent'] as String?,
      controlAgentId: json['ControlAgentId'] as String?,
      scientificName: json['ScientificName'] as String?,
      countryOrigin: json['CountryOrigin'] as String?,
      reasonBioAgent: json['ReasonBioAgent'] as String?,
      dateReleased: json['DateReleased'] as String?,
      stakeholderName: json['StakeholderName'] as String?,
      stakeholderId: json['StakeholderId'] as int?,
      descriptionMonitoringRequirements:
          json['DescriptionMonitoringRequirements'] as String?,
      descriptionMonitoringRequirementsId:
          json['DescriptionMonitoringRequirementsId'] as int?,
      generalComments: json['GeneralComments'] as String?,
      carRaised: json['CarRaised'] as bool? ?? false,
      carClosed: json['CarClosed'] as bool? ?? false,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_BiologicalControlAgentToJson(
        _$_BiologicalControlAgent instance) =>
    <String, dynamic>{
      'BiologicalControlAgentsId': instance.biologicalControlAgentId,
      'NameControlAgent': instance.nameControlAgent,
      'ControlAgentId': instance.controlAgentId,
      'ScientificName': instance.scientificName,
      'CountryOrigin': instance.countryOrigin,
      'ReasonBioAgent': instance.reasonBioAgent,
      'DateReleased': instance.dateReleased,
      'StakeholderName': instance.stakeholderName,
      'StakeholderId': instance.stakeholderId,
      'DescriptionMonitoringRequirements':
          instance.descriptionMonitoringRequirements,
      'DescriptionMonitoringRequirementsId':
          instance.descriptionMonitoringRequirementsId,
      'GeneralComments': instance.generalComments,
      'CarRaised': instance.carRaised,
      'CarClosed': instance.carClosed,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
