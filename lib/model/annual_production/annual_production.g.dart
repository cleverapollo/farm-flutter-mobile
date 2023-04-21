// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_production.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAnnualProductionCollection on Isar {
  IsarCollection<AnnualProduction> get annualProductions => this.collection();
}

const AnnualProductionSchema = CollectionSchema(
  name: r'AnnualProduction',
  id: 8747745452346405596,
  properties: {
    r'annualProductionId': PropertySchema(
      id: 0,
      name: r'annualProductionId',
      type: IsarType.long,
    ),
    r'annualProductionName': PropertySchema(
      id: 1,
      name: r'annualProductionName',
      type: IsarType.string,
    ),
    r'biomassRemoved': PropertySchema(
      id: 2,
      name: r'biomassRemoved',
      type: IsarType.long,
    ),
    r'createDT': PropertySchema(
      id: 3,
      name: r'createDT',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 5,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'productionPerTeam': PropertySchema(
      id: 6,
      name: r'productionPerTeam',
      type: IsarType.long,
    ),
    r'productionPerWorker': PropertySchema(
      id: 7,
      name: r'productionPerWorker',
      type: IsarType.long,
    ),
    r'updateDT': PropertySchema(
      id: 8,
      name: r'updateDT',
      type: IsarType.string,
    ),
    r'workCycles': PropertySchema(
      id: 9,
      name: r'workCycles',
      type: IsarType.double,
    ),
    r'workers': PropertySchema(
      id: 10,
      name: r'workers',
      type: IsarType.long,
    )
  },
  estimateSize: _annualProductionEstimateSize,
  serialize: _annualProductionSerialize,
  deserialize: _annualProductionDeserialize,
  deserializeProp: _annualProductionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _annualProductionGetId,
  getLinks: _annualProductionGetLinks,
  attach: _annualProductionAttach,
  version: '3.0.5',
);

int _annualProductionEstimateSize(
  AnnualProduction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.annualProductionName;
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
    final value = object.updateDT;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _annualProductionSerialize(
  AnnualProduction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.annualProductionId);
  writer.writeString(offsets[1], object.annualProductionName);
  writer.writeLong(offsets[2], object.biomassRemoved);
  writer.writeString(offsets[3], object.createDT);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeBool(offsets[5], object.isLocal);
  writer.writeLong(offsets[6], object.productionPerTeam);
  writer.writeLong(offsets[7], object.productionPerWorker);
  writer.writeString(offsets[8], object.updateDT);
  writer.writeDouble(offsets[9], object.workCycles);
  writer.writeLong(offsets[10], object.workers);
}

AnnualProduction _annualProductionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnnualProduction(
    annualProductionId: reader.readLongOrNull(offsets[0]),
    annualProductionName: reader.readStringOrNull(offsets[1]),
    biomassRemoved: reader.readLongOrNull(offsets[2]),
    createDT: reader.readStringOrNull(offsets[3]),
    isActive: reader.readBoolOrNull(offsets[4]),
    isLocal: reader.readBoolOrNull(offsets[5]),
    productionPerTeam: reader.readLongOrNull(offsets[6]),
    productionPerWorker: reader.readLongOrNull(offsets[7]),
    updateDT: reader.readStringOrNull(offsets[8]),
    workCycles: reader.readDoubleOrNull(offsets[9]),
    workers: reader.readLongOrNull(offsets[10]),
  );
  return object;
}

P _annualProductionDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _annualProductionGetId(AnnualProduction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _annualProductionGetLinks(AnnualProduction object) {
  return [];
}

void _annualProductionAttach(
    IsarCollection<dynamic> col, Id id, AnnualProduction object) {}

extension AnnualProductionQueryWhereSort
    on QueryBuilder<AnnualProduction, AnnualProduction, QWhere> {
  QueryBuilder<AnnualProduction, AnnualProduction, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnnualProductionQueryWhere
    on QueryBuilder<AnnualProduction, AnnualProduction, QWhereClause> {
  QueryBuilder<AnnualProduction, AnnualProduction, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterWhereClause>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterWhereClause> idBetween(
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

extension AnnualProductionQueryFilter
    on QueryBuilder<AnnualProduction, AnnualProduction, QFilterCondition> {
  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'annualProductionId',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'annualProductionId',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualProductionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualProductionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualProductionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualProductionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'annualProductionName',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'annualProductionName',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualProductionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualProductionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualProductionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualProductionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'annualProductionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'annualProductionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'annualProductionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'annualProductionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualProductionName',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      annualProductionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'annualProductionName',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      biomassRemovedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'biomassRemoved',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      biomassRemovedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'biomassRemoved',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      biomassRemovedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'biomassRemoved',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      biomassRemovedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'biomassRemoved',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      biomassRemovedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'biomassRemoved',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      biomassRemovedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'biomassRemoved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      createDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      createDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      createDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      createDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerTeamIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productionPerTeam',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerTeamIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productionPerTeam',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerTeamEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productionPerTeam',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerTeamGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productionPerTeam',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerTeamLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productionPerTeam',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerTeamBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productionPerTeam',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerWorkerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productionPerWorker',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerWorkerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productionPerWorker',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerWorkerEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productionPerWorker',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerWorkerGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productionPerWorker',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerWorkerLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productionPerWorker',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      productionPerWorkerBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productionPerWorker',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
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

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      updateDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updateDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      updateDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updateDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      updateDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      updateDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updateDT',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workCyclesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workCycles',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workCyclesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workCycles',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workCyclesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workCycles',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workCyclesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workCycles',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workCyclesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workCycles',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workCyclesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workCycles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workers',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workers',
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workersEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workers',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workersGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workers',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workersLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workers',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterFilterCondition>
      workersBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AnnualProductionQueryObject
    on QueryBuilder<AnnualProduction, AnnualProduction, QFilterCondition> {}

extension AnnualProductionQueryLinks
    on QueryBuilder<AnnualProduction, AnnualProduction, QFilterCondition> {}

extension AnnualProductionQuerySortBy
    on QueryBuilder<AnnualProduction, AnnualProduction, QSortBy> {
  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByAnnualProductionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByAnnualProductionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByAnnualProductionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionName', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByAnnualProductionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionName', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByBiomassRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biomassRemoved', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByBiomassRemovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biomassRemoved', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByProductionPerTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerTeam', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByProductionPerTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerTeam', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByProductionPerWorker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerWorker', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByProductionPerWorkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerWorker', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByWorkCycles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workCycles', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByWorkCyclesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workCycles', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByWorkers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workers', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      sortByWorkersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workers', Sort.desc);
    });
  }
}

extension AnnualProductionQuerySortThenBy
    on QueryBuilder<AnnualProduction, AnnualProduction, QSortThenBy> {
  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByAnnualProductionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByAnnualProductionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByAnnualProductionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionName', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByAnnualProductionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionName', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByBiomassRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biomassRemoved', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByBiomassRemovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'biomassRemoved', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByProductionPerTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerTeam', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByProductionPerTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerTeam', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByProductionPerWorker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerWorker', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByProductionPerWorkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productionPerWorker', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByWorkCycles() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workCycles', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByWorkCyclesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workCycles', Sort.desc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByWorkers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workers', Sort.asc);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QAfterSortBy>
      thenByWorkersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workers', Sort.desc);
    });
  }
}

extension AnnualProductionQueryWhereDistinct
    on QueryBuilder<AnnualProduction, AnnualProduction, QDistinct> {
  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByAnnualProductionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualProductionId');
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByAnnualProductionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualProductionName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByBiomassRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'biomassRemoved');
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByCreateDT({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByProductionPerTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productionPerTeam');
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByProductionPerWorker() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productionPerWorker');
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByUpdateDT({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByWorkCycles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workCycles');
    });
  }

  QueryBuilder<AnnualProduction, AnnualProduction, QDistinct>
      distinctByWorkers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workers');
    });
  }
}

extension AnnualProductionQueryProperty
    on QueryBuilder<AnnualProduction, AnnualProduction, QQueryProperty> {
  QueryBuilder<AnnualProduction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnnualProduction, int?, QQueryOperations>
      annualProductionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualProductionId');
    });
  }

  QueryBuilder<AnnualProduction, String?, QQueryOperations>
      annualProductionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualProductionName');
    });
  }

  QueryBuilder<AnnualProduction, int?, QQueryOperations>
      biomassRemovedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'biomassRemoved');
    });
  }

  QueryBuilder<AnnualProduction, String?, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<AnnualProduction, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<AnnualProduction, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<AnnualProduction, int?, QQueryOperations>
      productionPerTeamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productionPerTeam');
    });
  }

  QueryBuilder<AnnualProduction, int?, QQueryOperations>
      productionPerWorkerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productionPerWorker');
    });
  }

  QueryBuilder<AnnualProduction, String?, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }

  QueryBuilder<AnnualProduction, double?, QQueryOperations>
      workCyclesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workCycles');
    });
  }

  QueryBuilder<AnnualProduction, int?, QQueryOperations> workersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workers');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnualProduction _$$_AnnualProductionFromJson(Map<String, dynamic> json) =>
    _$_AnnualProduction(
      annualProductionId: json['AnnualProductionId'] as int?,
      annualProductionName: json['AnnualProductionName'] as String?,
      workers: json['Workers'] as int?,
      productionPerWorker: json['ProductionPerWorker'] as int?,
      productionPerTeam: json['ProductionPerTeam'] as int?,
      biomassRemoved: json['BiomassRemoved'] as int?,
      workCycles: (json['WorkCycles'] as num?)?.toDouble(),
      createDT: json['CreateDT'] as String?,
      updateDT: json['UpdateDT'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AnnualProductionToJson(_$_AnnualProduction instance) =>
    <String, dynamic>{
      'AnnualProductionId': instance.annualProductionId,
      'AnnualProductionName': instance.annualProductionName,
      'Workers': instance.workers,
      'ProductionPerWorker': instance.productionPerWorker,
      'ProductionPerTeam': instance.productionPerTeam,
      'BiomassRemoved': instance.biomassRemoved,
      'WorkCycles': instance.workCycles,
      'CreateDT': instance.createDT,
      'UpdateDT': instance.updateDT,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
