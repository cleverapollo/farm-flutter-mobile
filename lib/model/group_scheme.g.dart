// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_scheme.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGroupSchemeCollection on Isar {
  IsarCollection<GroupScheme> get groupSchemes => this.collection();
}

const GroupSchemeSchema = CollectionSchema(
  name: r'GroupScheme',
  id: -2478322287753699112,
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
    r'groupSchemeManagerContactNo': PropertySchema(
      id: 2,
      name: r'groupSchemeManagerContactNo',
      type: IsarType.string,
    ),
    r'groupSchemeManagerEmail': PropertySchema(
      id: 3,
      name: r'groupSchemeManagerEmail',
      type: IsarType.string,
    ),
    r'groupSchemeManagerName': PropertySchema(
      id: 4,
      name: r'groupSchemeManagerName',
      type: IsarType.string,
    ),
    r'groupSchemeName': PropertySchema(
      id: 5,
      name: r'groupSchemeName',
      type: IsarType.string,
    ),
    r'groupSchemeRoleId': PropertySchema(
      id: 6,
      name: r'groupSchemeRoleId',
      type: IsarType.string,
    ),
    r'hiracId': PropertySchema(
      id: 7,
      name: r'hiracId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 8,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'updateDt': PropertySchema(
      id: 9,
      name: r'updateDt',
      type: IsarType.string,
    )
  },
  estimateSize: _groupSchemeEstimateSize,
  serialize: _groupSchemeSerialize,
  deserialize: _groupSchemeDeserialize,
  deserializeProp: _groupSchemeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _groupSchemeGetId,
  getLinks: _groupSchemeGetLinks,
  attach: _groupSchemeAttach,
  version: '3.0.5',
);

int _groupSchemeEstimateSize(
  GroupScheme object,
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
    final value = object.groupSchemeManagerContactNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupSchemeManagerEmail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupSchemeManagerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupSchemeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupSchemeRoleId;
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

void _groupSchemeSerialize(
  GroupScheme object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createDt);
  writer.writeLong(offsets[1], object.groupSchemeId);
  writer.writeString(offsets[2], object.groupSchemeManagerContactNo);
  writer.writeString(offsets[3], object.groupSchemeManagerEmail);
  writer.writeString(offsets[4], object.groupSchemeManagerName);
  writer.writeString(offsets[5], object.groupSchemeName);
  writer.writeString(offsets[6], object.groupSchemeRoleId);
  writer.writeLong(offsets[7], object.hiracId);
  writer.writeBool(offsets[8], object.isActive);
  writer.writeString(offsets[9], object.updateDt);
}

GroupScheme _groupSchemeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GroupScheme(
    createDt: reader.readStringOrNull(offsets[0]),
    groupSchemeId: reader.readLongOrNull(offsets[1]),
    groupSchemeManagerContactNo: reader.readStringOrNull(offsets[2]),
    groupSchemeManagerEmail: reader.readStringOrNull(offsets[3]),
    groupSchemeManagerName: reader.readStringOrNull(offsets[4]),
    groupSchemeName: reader.readStringOrNull(offsets[5]),
    groupSchemeRoleId: reader.readStringOrNull(offsets[6]),
    hiracId: reader.readLongOrNull(offsets[7]),
    isActive: reader.readBoolOrNull(offsets[8]),
    updateDt: reader.readStringOrNull(offsets[9]),
  );
  return object;
}

P _groupSchemeDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groupSchemeGetId(GroupScheme object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groupSchemeGetLinks(GroupScheme object) {
  return [];
}

void _groupSchemeAttach(
    IsarCollection<dynamic> col, Id id, GroupScheme object) {}

extension GroupSchemeQueryWhereSort
    on QueryBuilder<GroupScheme, GroupScheme, QWhere> {
  QueryBuilder<GroupScheme, GroupScheme, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroupSchemeQueryWhere
    on QueryBuilder<GroupScheme, GroupScheme, QWhereClause> {
  QueryBuilder<GroupScheme, GroupScheme, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterWhereClause> idBetween(
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

extension GroupSchemeQueryFilter
    on QueryBuilder<GroupScheme, GroupScheme, QFilterCondition> {
  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      createDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDt',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      createDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDt',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> createDtEqualTo(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> createDtBetween(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      createDtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> createDtMatches(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      createDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDt',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      createDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDt',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeManagerContactNo',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeManagerContactNo',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeManagerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeManagerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeManagerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeManagerContactNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupSchemeManagerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupSchemeManagerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupSchemeManagerContactNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupSchemeManagerContactNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeManagerContactNo',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerContactNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupSchemeManagerContactNo',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeManagerEmail',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeManagerEmail',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeManagerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeManagerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeManagerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeManagerEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupSchemeManagerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupSchemeManagerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupSchemeManagerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupSchemeManagerEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeManagerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupSchemeManagerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeManagerName',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeManagerName',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeManagerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeManagerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeManagerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeManagerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupSchemeManagerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupSchemeManagerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupSchemeManagerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupSchemeManagerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeManagerName',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeManagerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupSchemeManagerName',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeName',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeName',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupSchemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupSchemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupSchemeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupSchemeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeName',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupSchemeName',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeRoleId',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeRoleId',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeRoleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupSchemeRoleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupSchemeRoleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupSchemeRoleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupSchemeRoleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupSchemeRoleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupSchemeRoleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupSchemeRoleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeRoleId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      groupSchemeRoleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupSchemeRoleId',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      hiracIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hiracId',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      hiracIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hiracId',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> hiracIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hiracId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      hiracIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hiracId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> hiracIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hiracId',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> hiracIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hiracId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      updateDtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDt',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      updateDtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDt',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> updateDtEqualTo(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> updateDtBetween(
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
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

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      updateDtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDt',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition> updateDtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDt',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      updateDtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDt',
        value: '',
      ));
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterFilterCondition>
      updateDtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDt',
        value: '',
      ));
    });
  }
}

extension GroupSchemeQueryObject
    on QueryBuilder<GroupScheme, GroupScheme, QFilterCondition> {}

extension GroupSchemeQueryLinks
    on QueryBuilder<GroupScheme, GroupScheme, QFilterCondition> {}

extension GroupSchemeQuerySortBy
    on QueryBuilder<GroupScheme, GroupScheme, QSortBy> {
  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByCreateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByCreateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeManagerContactNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerContactNo', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeManagerContactNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerContactNo', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeManagerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerEmail', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeManagerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerEmail', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeManagerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerName', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeManagerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerName', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByGroupSchemeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeName', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeName', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeRoleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeRoleId', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      sortByGroupSchemeRoleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeRoleId', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByHiracId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hiracId', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByHiracIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hiracId', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByUpdateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> sortByUpdateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.desc);
    });
  }
}

extension GroupSchemeQuerySortThenBy
    on QueryBuilder<GroupScheme, GroupScheme, QSortThenBy> {
  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByCreateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByCreateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDt', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeManagerContactNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerContactNo', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeManagerContactNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerContactNo', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeManagerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerEmail', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeManagerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerEmail', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeManagerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerName', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeManagerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeManagerName', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByGroupSchemeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeName', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeName', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeRoleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeRoleId', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy>
      thenByGroupSchemeRoleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeRoleId', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByHiracId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hiracId', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByHiracIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hiracId', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByUpdateDt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.asc);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QAfterSortBy> thenByUpdateDtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDt', Sort.desc);
    });
  }
}

extension GroupSchemeQueryWhereDistinct
    on QueryBuilder<GroupScheme, GroupScheme, QDistinct> {
  QueryBuilder<GroupScheme, GroupScheme, QDistinct> distinctByCreateDt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct> distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct>
      distinctByGroupSchemeManagerContactNo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeManagerContactNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct>
      distinctByGroupSchemeManagerEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeManagerEmail',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct>
      distinctByGroupSchemeManagerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeManagerName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct> distinctByGroupSchemeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct> distinctByGroupSchemeRoleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeRoleId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct> distinctByHiracId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hiracId');
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<GroupScheme, GroupScheme, QDistinct> distinctByUpdateDt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDt', caseSensitive: caseSensitive);
    });
  }
}

extension GroupSchemeQueryProperty
    on QueryBuilder<GroupScheme, GroupScheme, QQueryProperty> {
  QueryBuilder<GroupScheme, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GroupScheme, String?, QQueryOperations> createDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDt');
    });
  }

  QueryBuilder<GroupScheme, int?, QQueryOperations> groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<GroupScheme, String?, QQueryOperations>
      groupSchemeManagerContactNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeManagerContactNo');
    });
  }

  QueryBuilder<GroupScheme, String?, QQueryOperations>
      groupSchemeManagerEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeManagerEmail');
    });
  }

  QueryBuilder<GroupScheme, String?, QQueryOperations>
      groupSchemeManagerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeManagerName');
    });
  }

  QueryBuilder<GroupScheme, String?, QQueryOperations>
      groupSchemeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeName');
    });
  }

  QueryBuilder<GroupScheme, String?, QQueryOperations>
      groupSchemeRoleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeRoleId');
    });
  }

  QueryBuilder<GroupScheme, int?, QQueryOperations> hiracIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hiracId');
    });
  }

  QueryBuilder<GroupScheme, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<GroupScheme, String?, QQueryOperations> updateDtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDt');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupScheme _$$_GroupSchemeFromJson(Map<String, dynamic> json) =>
    _$_GroupScheme(
      createDt: json['CreateDT'] as String?,
      groupSchemeId: json['GroupSchemeId'] as int?,
      groupSchemeManagerContactNo:
          json['GroupSchemeManagerContactNo'] as String?,
      groupSchemeManagerEmail: json['GroupSchemeManagerEmail'] as String?,
      groupSchemeManagerName: json['GroupSchemeManagerName'] as String?,
      groupSchemeName: json['GroupSchemeName'] as String?,
      groupSchemeRoleId: json['GroupSchemeRoleId'] as String?,
      hiracId: json['HiracId'] as int?,
      isActive: json['IsActive'] as bool?,
      updateDt: json['UpdateDT'] as String?,
    );

Map<String, dynamic> _$$_GroupSchemeToJson(_$_GroupScheme instance) =>
    <String, dynamic>{
      'CreateDT': instance.createDt,
      'GroupSchemeId': instance.groupSchemeId,
      'GroupSchemeManagerContactNo': instance.groupSchemeManagerContactNo,
      'GroupSchemeManagerEmail': instance.groupSchemeManagerEmail,
      'GroupSchemeManagerName': instance.groupSchemeManagerName,
      'GroupSchemeName': instance.groupSchemeName,
      'GroupSchemeRoleId': instance.groupSchemeRoleId,
      'HiracId': instance.hiracId,
      'IsActive': instance.isActive,
      'UpdateDT': instance.updateDt,
    };
