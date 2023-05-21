// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_manager_unit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetResourceManagerUnitCollection on Isar {
  IsarCollection<ResourceManagerUnit> get resourceManagerUnits =>
      this.collection();
}

const ResourceManagerUnitSchema = CollectionSchema(
  name: r'ResourceManagerUnit',
  id: 8573658359774088435,
  properties: {
    r'createDt': PropertySchema(
      id: 0,
      name: r'createDt',
      type: IsarType.string,
    ),
    r'groupSchemeId': PropertySchema(
      id: 1,
      name: r'groupSchemeId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'managerContactNo': PropertySchema(
      id: 3,
      name: r'managerContactNo',
      type: IsarType.string,
    ),
    r'managerEmail': PropertySchema(
      id: 4,
      name: r'managerEmail',
      type: IsarType.string,
    ),
    r'managerName': PropertySchema(
      id: 5,
      name: r'managerName',
      type: IsarType.string,
    ),
    r'noOfRegionalManagers': PropertySchema(
      id: 6,
      name: r'noOfRegionalManagers',
      type: IsarType.long,
    ),
    r'regionalManagerUnitId': PropertySchema(
      id: 7,
      name: r'regionalManagerUnitId',
      type: IsarType.long,
    ),
    r'regionalManagerUnitName': PropertySchema(
      id: 8,
      name: r'regionalManagerUnitName',
      type: IsarType.string,
    ),
    r'updateDt': PropertySchema(
      id: 9,
      name: r'updateDt',
      type: IsarType.string,
    )
  },
  estimateSize: _resourceManagerUnitEstimateSize,
  serialize: _resourceManagerUnitSerialize,
  deserialize: _resourceManagerUnitDeserialize,
  deserializeProp: _resourceManagerUnitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _resourceManagerUnitGetId,
  getLinks: _resourceManagerUnitGetLinks,
  attach: _resourceManagerUnitAttach,
  version: '3.0.5',
);

int _resourceManagerUnitEstimateSize(
  ResourceManagerUnit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.createDt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.managerContactNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.managerEmail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.managerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.regionalManagerUnitName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.updateDt;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _resourceManagerUnitSerialize(
  ResourceManagerUnit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createDt);
  writer.writeLong(offsets[1], object.groupSchemeId);
  writer.writeBool(offsets[2], object.isActive);
  writer.writeString(offsets[3], object.managerContactNo);
  writer.writeString(offsets[4], object.managerEmail);
  writer.writeString(offsets[5], object.managerName);
  writer.writeLong(offsets[6], object.noOfRegionalManagers);
  writer.writeLong(offsets[7], object.regionalManagerUnitId);
  writer.writeString(offsets[8], object.regionalManagerUnitName);
  writer.writeString(offsets[9], object.updateDt);
}

ResourceManagerUnit _resourceManagerUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ResourceManagerUnit(
    createDt: reader.readStringOrNull(offsets[0]),
    groupSchemeId: reader.readLongOrNull(offsets[1]),
    isActive: reader.readBoolOrNull(offsets[2]),
    managerContactNo: reader.readStringOrNull(offsets[3]),
    managerEmail: reader.readStringOrNull(offsets[4]),
    managerName: reader.readStringOrNull(offsets[5]),
    noOfRegionalManagers: reader.readLongOrNull(offsets[6]),
    regionalManagerUnitId: reader.readLongOrNull(offsets[7]),
    regionalManagerUnitName: reader.readStringOrNull(offsets[8]),
    updateDt: reader.readStringOrNull(offsets[9]),
  );
  return object;
}

P _resourceManagerUnitDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _resourceManagerUnitGetId(ResourceManagerUnit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _resourceManagerUnitGetLinks(
    ResourceManagerUnit object) {
  return [];
}

void _resourceManagerUnitAttach(
    IsarCollection<dynamic> col, Id id, ResourceManagerUnit object) {}

extension ResourceManagerUnitQueryWhereSort
    on QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QWhere> {
  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ResourceManagerUnitQueryWhere
    on QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QWhereClause> {
  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterWhereClause>
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterWhereClause>
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

extension ResourceManagerUnitQueryFilter on QueryBuilder<ResourceManagerUnit,
    ResourceManagerUnit, QFilterCondition> {
  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDt',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDt',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtEqualTo(
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtGreaterThan(
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtLessThan(
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtBetween(
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtStartsWith(
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtEndsWith(
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDt',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      createDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDt',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      groupSchemeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      groupSchemeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      groupSchemeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
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

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'managerContactNo',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'managerContactNo',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'managerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'managerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'managerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'managerContactNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'managerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'managerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'managerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'managerContactNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'managerContactNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerContactNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'managerContactNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'managerEmail',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'managerEmail',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'managerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'managerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'managerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'managerEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'managerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'managerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'managerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'managerEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'managerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'managerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'managerName',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'managerName',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'managerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'managerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'managerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'managerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'managerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'managerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'managerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'managerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'managerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      managerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'managerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      noOfRegionalManagersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noOfRegionalManagers',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      noOfRegionalManagersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noOfRegionalManagers',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      noOfRegionalManagersEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noOfRegionalManagers',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      noOfRegionalManagersGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noOfRegionalManagers',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      noOfRegionalManagersLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noOfRegionalManagers',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      noOfRegionalManagersBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noOfRegionalManagers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regionalManagerUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionalManagerUnitName',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionalManagerUnitName',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regionalManagerUnitName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'regionalManagerUnitName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'regionalManagerUnitName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      regionalManagerUnitNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'regionalManagerUnitName',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDt',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDt',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updateDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updateDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDt',
        value: '',
      ));
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterFilterCondition>
      updateDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDt',
        value: '',
      ));
    });
  }
}

extension ResourceManagerUnitQueryObject on QueryBuilder<ResourceManagerUnit,
    ResourceManagerUnit, QFilterCondition> {}

extension ResourceManagerUnitQueryLinks on QueryBuilder<ResourceManagerUnit,
    ResourceManagerUnit, QFilterCondition> {}

extension ResourceManagerUnitQuerySortBy
    on QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QSortBy> {
  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByCreateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByCreateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByManagerContactNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerContactNo', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByManagerContactNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerContactNo', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByManagerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerEmail', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByManagerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerEmail', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByManagerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerName', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByManagerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerName', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByNoOfRegionalManagers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfRegionalManagers', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByNoOfRegionalManagersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfRegionalManagers', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByRegionalManagerUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByUpdateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      sortByUpdateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.desc);
    });
  }
}

extension ResourceManagerUnitQuerySortThenBy
    on QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QSortThenBy> {
  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByCreateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByCreateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByManagerContactNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerContactNo', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByManagerContactNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerContactNo', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByManagerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerEmail', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByManagerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerEmail', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByManagerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerName', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByManagerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'managerName', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByNoOfRegionalManagers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfRegionalManagers', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByNoOfRegionalManagersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noOfRegionalManagers', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByRegionalManagerUnitNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitName', Sort.desc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByUpdateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.asc);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QAfterSortBy>
      thenByUpdateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.desc);
    });
  }
}

extension ResourceManagerUnitQueryWhereDistinct
    on QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct> {
  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByCreateDt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByManagerContactNo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'managerContactNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByManagerEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'managerEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByManagerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'managerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByNoOfRegionalManagers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noOfRegionalManagers');
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByRegionalManagerUnitName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QDistinct>
      distinctByUpdateDt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDt', caseSensitive: caseSensitive);
    });
  }
}

extension ResourceManagerUnitQueryProperty
    on QueryBuilder<ResourceManagerUnit, ResourceManagerUnit, QQueryProperty> {
  QueryBuilder<ResourceManagerUnit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ResourceManagerUnit, String?, QQueryOperations>
      createDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDt');
    });
  }

  QueryBuilder<ResourceManagerUnit, int?, QQueryOperations>
      groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<ResourceManagerUnit, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<ResourceManagerUnit, String?, QQueryOperations>
      managerContactNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'managerContactNo');
    });
  }

  QueryBuilder<ResourceManagerUnit, String?, QQueryOperations>
      managerEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'managerEmail');
    });
  }

  QueryBuilder<ResourceManagerUnit, String?, QQueryOperations>
      managerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'managerName');
    });
  }

  QueryBuilder<ResourceManagerUnit, int?, QQueryOperations>
      noOfRegionalManagersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noOfRegionalManagers');
    });
  }

  QueryBuilder<ResourceManagerUnit, int?, QQueryOperations>
      regionalManagerUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<ResourceManagerUnit, String?, QQueryOperations>
      regionalManagerUnitNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitName');
    });
  }

  QueryBuilder<ResourceManagerUnit, String?, QQueryOperations>
      updateDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDt');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResourceManagerUnit _$$_ResourceManagerUnitFromJson(
        Map<String, dynamic> json) =>
    _$_ResourceManagerUnit(
      createDt: json['CreateDT'] as String?,
      groupSchemeId: json['GroupschemeId'] as int?,
      isActive: json['IsActive'] as bool?,
      managerContactNo: json['ManagerContactNo'] as String?,
      managerEmail: json['ManagerEmail'] as String?,
      managerName: json['ManagerName'] as String?,
      noOfRegionalManagers: json['NoOfRegionalManagers'] as int?,
      regionalManagerUnitId: json['RegionalManagerUnitId'] as int?,
      regionalManagerUnitName: json['RegionalManagerUnitName'] as String?,
      updateDt: json['UpdateDT'] as String?,
    );

Map<String, dynamic> _$$_ResourceManagerUnitToJson(
        _$_ResourceManagerUnit instance) =>
    <String, dynamic>{
      'CreateDT': instance.createDt,
      'GroupschemeId': instance.groupSchemeId,
      'IsActive': instance.isActive,
      'ManagerContactNo': instance.managerContactNo,
      'ManagerEmail': instance.managerEmail,
      'ManagerName': instance.managerName,
      'NoOfRegionalManagers': instance.noOfRegionalManagers,
      'RegionalManagerUnitId': instance.regionalManagerUnitId,
      'RegionalManagerUnitName': instance.regionalManagerUnitName,
      'UpdateDT': instance.updateDt,
    };
