// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_agent.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetControlAgentCollection on Isar {
  IsarCollection<ControlAgent> get controlAgents => this.collection();
}

const ControlAgentSchema = CollectionSchema(
  name: r'ControlAgent',
  id: 4982056025542747886,
  properties: {
    r'controlAgentId': PropertySchema(
      id: 0,
      name: r'controlAgentId',
      type: IsarType.long,
    ),
    r'countryOrigin': PropertySchema(
      id: 1,
      name: r'countryOrigin',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 3,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'nameControlAgent': PropertySchema(
      id: 4,
      name: r'nameControlAgent',
      type: IsarType.string,
    ),
    r'reasonBioAgent': PropertySchema(
      id: 5,
      name: r'reasonBioAgent',
      type: IsarType.string,
    ),
    r'scientificName': PropertySchema(
      id: 6,
      name: r'scientificName',
      type: IsarType.string,
    )
  },
  estimateSize: _controlAgentEstimateSize,
  serialize: _controlAgentSerialize,
  deserialize: _controlAgentDeserialize,
  deserializeProp: _controlAgentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _controlAgentGetId,
  getLinks: _controlAgentGetLinks,
  attach: _controlAgentAttach,
  version: '3.0.5',
);

int _controlAgentEstimateSize(
  ControlAgent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.countryOrigin;
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
  return bytesCount;
}

void _controlAgentSerialize(
  ControlAgent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.controlAgentId);
  writer.writeString(offsets[1], object.countryOrigin);
  writer.writeBool(offsets[2], object.isActive);
  writer.writeBool(offsets[3], object.isLocal);
  writer.writeString(offsets[4], object.nameControlAgent);
  writer.writeString(offsets[5], object.reasonBioAgent);
  writer.writeString(offsets[6], object.scientificName);
}

ControlAgent _controlAgentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ControlAgent(
    controlAgentId: reader.readLongOrNull(offsets[0]),
    countryOrigin: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
    isLocal: reader.readBoolOrNull(offsets[3]),
    nameControlAgent: reader.readStringOrNull(offsets[4]),
    reasonBioAgent: reader.readStringOrNull(offsets[5]),
    scientificName: reader.readStringOrNull(offsets[6]),
  );
  return object;
}

P _controlAgentDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _controlAgentGetId(ControlAgent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _controlAgentGetLinks(ControlAgent object) {
  return [];
}

void _controlAgentAttach(
    IsarCollection<dynamic> col, Id id, ControlAgent object) {}

extension ControlAgentQueryWhereSort
    on QueryBuilder<ControlAgent, ControlAgent, QWhere> {
  QueryBuilder<ControlAgent, ControlAgent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ControlAgentQueryWhere
    on QueryBuilder<ControlAgent, ControlAgent, QWhereClause> {
  QueryBuilder<ControlAgent, ControlAgent, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterWhereClause> idBetween(
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

extension ControlAgentQueryFilter
    on QueryBuilder<ControlAgent, ControlAgent, QFilterCondition> {
  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      controlAgentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'controlAgentId',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      controlAgentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'controlAgentId',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      controlAgentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'controlAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      controlAgentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'controlAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      controlAgentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'controlAgentId',
        value: value,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      controlAgentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'controlAgentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countryOrigin',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countryOrigin',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginEqualTo(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginGreaterThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginLessThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginBetween(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginStartsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginEndsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'countryOrigin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'countryOrigin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countryOrigin',
        value: '',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      countryOriginIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'countryOrigin',
        value: '',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameControlAgent',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameControlAgent',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentEqualTo(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentGreaterThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentLessThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentBetween(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentStartsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentEndsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameControlAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameControlAgent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameControlAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      nameControlAgentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameControlAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reasonBioAgent',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reasonBioAgent',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentEqualTo(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentGreaterThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentLessThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentBetween(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentStartsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentEndsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reasonBioAgent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reasonBioAgent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reasonBioAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      reasonBioAgentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reasonBioAgent',
        value: '',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameEqualTo(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameGreaterThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameLessThan(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameBetween(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameStartsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameEndsWith(
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

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scientificName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterFilterCondition>
      scientificNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scientificName',
        value: '',
      ));
    });
  }
}

extension ControlAgentQueryObject
    on QueryBuilder<ControlAgent, ControlAgent, QFilterCondition> {}

extension ControlAgentQueryLinks
    on QueryBuilder<ControlAgent, ControlAgent, QFilterCondition> {}

extension ControlAgentQuerySortBy
    on QueryBuilder<ControlAgent, ControlAgent, QSortBy> {
  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByControlAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> sortByCountryOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByCountryOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByNameControlAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByNameControlAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByReasonBioAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByReasonBioAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      sortByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }
}

extension ControlAgentQuerySortThenBy
    on QueryBuilder<ControlAgent, ControlAgent, QSortThenBy> {
  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByControlAgentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'controlAgentId', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> thenByCountryOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByCountryOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryOrigin', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByNameControlAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByNameControlAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameControlAgent', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByReasonBioAgent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByReasonBioAgentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reasonBioAgent', Sort.desc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QAfterSortBy>
      thenByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }
}

extension ControlAgentQueryWhereDistinct
    on QueryBuilder<ControlAgent, ControlAgent, QDistinct> {
  QueryBuilder<ControlAgent, ControlAgent, QDistinct>
      distinctByControlAgentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'controlAgentId');
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QDistinct> distinctByCountryOrigin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countryOrigin',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QDistinct>
      distinctByNameControlAgent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameControlAgent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QDistinct> distinctByReasonBioAgent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reasonBioAgent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ControlAgent, ControlAgent, QDistinct> distinctByScientificName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scientificName',
          caseSensitive: caseSensitive);
    });
  }
}

extension ControlAgentQueryProperty
    on QueryBuilder<ControlAgent, ControlAgent, QQueryProperty> {
  QueryBuilder<ControlAgent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ControlAgent, int?, QQueryOperations> controlAgentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'controlAgentId');
    });
  }

  QueryBuilder<ControlAgent, String?, QQueryOperations>
      countryOriginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countryOrigin');
    });
  }

  QueryBuilder<ControlAgent, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<ControlAgent, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<ControlAgent, String?, QQueryOperations>
      nameControlAgentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameControlAgent');
    });
  }

  QueryBuilder<ControlAgent, String?, QQueryOperations>
      reasonBioAgentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reasonBioAgent');
    });
  }

  QueryBuilder<ControlAgent, String?, QQueryOperations>
      scientificNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scientificName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ControlAgent _$$_ControlAgentFromJson(Map<String, dynamic> json) =>
    _$_ControlAgent(
      controlAgentId: json['ControlAgentId'] as int?,
      nameControlAgent: json['NameControlAgent'] as String?,
      scientificName: json['ScientificName'] as String?,
      countryOrigin: json['CountryOrigin'] as String?,
      reasonBioAgent: json['ReasonBioAgent'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_ControlAgentToJson(_$_ControlAgent instance) =>
    <String, dynamic>{
      'ControlAgentId': instance.controlAgentId,
      'NameControlAgent': instance.nameControlAgent,
      'ScientificName': instance.scientificName,
      'CountryOrigin': instance.countryOrigin,
      'ReasonBioAgent': instance.reasonBioAgent,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
