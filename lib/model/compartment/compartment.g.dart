// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compartment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCompartmentCollection on Isar {
  IsarCollection<Compartment> get compartments => this.collection();
}

const CompartmentSchema = CollectionSchema(
  name: r'Compartment',
  id: -2504452513762761647,
  properties: {
    r'areaTypeId': PropertySchema(
      id: 0,
      name: r'areaTypeId',
      type: IsarType.string,
    ),
    r'compartmentId': PropertySchema(
      id: 1,
      name: r'compartmentId',
      type: IsarType.long,
    ),
    r'compartmentName': PropertySchema(
      id: 2,
      name: r'compartmentName',
      type: IsarType.string,
    ),
    r'effectiveArea': PropertySchema(
      id: 3,
      name: r'effectiveArea',
      type: IsarType.double,
    ),
    r'espacement': PropertySchema(
      id: 4,
      name: r'espacement',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'jsonLocations': PropertySchema(
      id: 6,
      name: r'jsonLocations',
      type: IsarType.string,
    ),
    r'plannedPlantDT': PropertySchema(
      id: 7,
      name: r'plannedPlantDT',
      type: IsarType.string,
    ),
    r'polygonArea': PropertySchema(
      id: 8,
      name: r'polygonArea',
      type: IsarType.double,
    ),
    r'productGroupTemplateId': PropertySchema(
      id: 9,
      name: r'productGroupTemplateId',
      type: IsarType.string,
    ),
    r'productGroupTemplateName': PropertySchema(
      id: 10,
      name: r'productGroupTemplateName',
      type: IsarType.string,
    ),
    r'rotationNumber': PropertySchema(
      id: 11,
      name: r'rotationNumber',
      type: IsarType.double,
    ),
    r'speciesGroupTemplateId': PropertySchema(
      id: 12,
      name: r'speciesGroupTemplateId',
      type: IsarType.string,
    ),
    r'speciesGroupTemplateName': PropertySchema(
      id: 13,
      name: r'speciesGroupTemplateName',
      type: IsarType.string,
    ),
    r'stockingPercentage': PropertySchema(
      id: 14,
      name: r'stockingPercentage',
      type: IsarType.double,
    ),
    r'survival': PropertySchema(
      id: 15,
      name: r'survival',
      type: IsarType.double,
    ),
    r'unitNumber': PropertySchema(
      id: 16,
      name: r'unitNumber',
      type: IsarType.string,
    ),
    r'utilMAI': PropertySchema(
      id: 17,
      name: r'utilMAI',
      type: IsarType.double,
    )
  },
  estimateSize: _compartmentEstimateSize,
  serialize: _compartmentSerialize,
  deserialize: _compartmentDeserialize,
  deserializeProp: _compartmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _compartmentGetId,
  getLinks: _compartmentGetLinks,
  attach: _compartmentAttach,
  version: '3.0.5',
);

int _compartmentEstimateSize(
  Compartment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.areaTypeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.compartmentName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.espacement;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.jsonLocations;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.plannedPlantDT;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productGroupTemplateId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productGroupTemplateName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.speciesGroupTemplateId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.speciesGroupTemplateName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unitNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _compartmentSerialize(
  Compartment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.areaTypeId);
  writer.writeLong(offsets[1], object.compartmentId);
  writer.writeString(offsets[2], object.compartmentName);
  writer.writeDouble(offsets[3], object.effectiveArea);
  writer.writeString(offsets[4], object.espacement);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeString(offsets[6], object.jsonLocations);
  writer.writeString(offsets[7], object.plannedPlantDT);
  writer.writeDouble(offsets[8], object.polygonArea);
  writer.writeString(offsets[9], object.productGroupTemplateId);
  writer.writeString(offsets[10], object.productGroupTemplateName);
  writer.writeDouble(offsets[11], object.rotationNumber);
  writer.writeString(offsets[12], object.speciesGroupTemplateId);
  writer.writeString(offsets[13], object.speciesGroupTemplateName);
  writer.writeDouble(offsets[14], object.stockingPercentage);
  writer.writeDouble(offsets[15], object.survival);
  writer.writeString(offsets[16], object.unitNumber);
  writer.writeDouble(offsets[17], object.utilMAI);
}

Compartment _compartmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Compartment(
    areaTypeId: reader.readStringOrNull(offsets[0]),
    compartmentId: reader.readLongOrNull(offsets[1]),
    compartmentName: reader.readStringOrNull(offsets[2]),
    effectiveArea: reader.readDoubleOrNull(offsets[3]),
    espacement: reader.readStringOrNull(offsets[4]),
    isActive: reader.readBoolOrNull(offsets[5]),
    jsonLocations: reader.readStringOrNull(offsets[6]),
    plannedPlantDT: reader.readStringOrNull(offsets[7]),
    polygonArea: reader.readDoubleOrNull(offsets[8]),
    productGroupTemplateId: reader.readStringOrNull(offsets[9]),
    productGroupTemplateName: reader.readStringOrNull(offsets[10]),
    rotationNumber: reader.readDoubleOrNull(offsets[11]),
    speciesGroupTemplateId: reader.readStringOrNull(offsets[12]),
    speciesGroupTemplateName: reader.readStringOrNull(offsets[13]),
    stockingPercentage: reader.readDoubleOrNull(offsets[14]),
    survival: reader.readDoubleOrNull(offsets[15]),
    unitNumber: reader.readStringOrNull(offsets[16]),
    utilMAI: reader.readDoubleOrNull(offsets[17]),
  );
  return object;
}

P _compartmentDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _compartmentGetId(Compartment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _compartmentGetLinks(Compartment object) {
  return [];
}

void _compartmentAttach(
    IsarCollection<dynamic> col, Id id, Compartment object) {}

extension CompartmentQueryWhereSort
    on QueryBuilder<Compartment, Compartment, QWhere> {
  QueryBuilder<Compartment, Compartment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompartmentQueryWhere
    on QueryBuilder<Compartment, Compartment, QWhereClause> {
  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idBetween(
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

extension CompartmentQueryFilter
    on QueryBuilder<Compartment, Compartment, QFilterCondition> {
  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'areaTypeId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'areaTypeId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'areaTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'areaTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'areaTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'areaTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'areaTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'areaTypeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'areaTypeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      areaTypeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'areaTypeId',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compartmentId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compartmentId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compartmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compartmentName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compartmentName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compartmentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'compartmentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'compartmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      effectiveAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'effectiveArea',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      effectiveAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'effectiveArea',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      effectiveAreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      effectiveAreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      effectiveAreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      effectiveAreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'espacement',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'espacement',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'espacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'espacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'espacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'espacement',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'espacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'espacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'espacement',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'espacement',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'espacement',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      espacementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'espacement',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jsonLocations',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jsonLocations',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jsonLocations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jsonLocations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jsonLocations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jsonLocations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jsonLocations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jsonLocations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jsonLocations',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jsonLocations',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jsonLocations',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      jsonLocationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jsonLocations',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedPlantDT',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedPlantDT',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedPlantDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedPlantDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedPlantDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedPlantDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plannedPlantDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plannedPlantDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plannedPlantDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plannedPlantDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedPlantDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plannedPlantDT',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      polygonAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'polygonArea',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      polygonAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'polygonArea',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      polygonAreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'polygonArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      polygonAreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'polygonArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      polygonAreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'polygonArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      polygonAreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'polygonArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productGroupTemplateId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productGroupTemplateId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productGroupTemplateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productGroupTemplateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroupTemplateId',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productGroupTemplateId',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productGroupTemplateName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productGroupTemplateName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productGroupTemplateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productGroupTemplateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroupTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupTemplateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productGroupTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rotationNumber',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rotationNumber',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationNumberEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rotationNumber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationNumberGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rotationNumber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationNumberLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rotationNumber',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationNumberBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rotationNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesGroupTemplateId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesGroupTemplateId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesGroupTemplateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesGroupTemplateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesGroupTemplateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroupTemplateId',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesGroupTemplateId',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesGroupTemplateName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesGroupTemplateName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesGroupTemplateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesGroupTemplateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesGroupTemplateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroupTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupTemplateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesGroupTemplateName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      stockingPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stockingPercentage',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      stockingPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stockingPercentage',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      stockingPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockingPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      stockingPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockingPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      stockingPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockingPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      stockingPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockingPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'survival',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'survival',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> survivalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'survival',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'survival',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'survival',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> survivalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'survival',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitNumber',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitNumber',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      utilMAIIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'utilMAI',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      utilMAIIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'utilMAI',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> utilMAIEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'utilMAI',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      utilMAIGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'utilMAI',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> utilMAILessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'utilMAI',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> utilMAIBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'utilMAI',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CompartmentQueryObject
    on QueryBuilder<Compartment, Compartment, QFilterCondition> {}

extension CompartmentQueryLinks
    on QueryBuilder<Compartment, Compartment, QFilterCondition> {}

extension CompartmentQuerySortBy
    on QueryBuilder<Compartment, Compartment, QSortBy> {
  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByAreaTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaTypeId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByAreaTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaTypeId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByCompartmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByCompartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByCompartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByEffectiveArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveArea', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByEffectiveAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveArea', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByEspacement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'espacement', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByEspacementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'espacement', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByJsonLocations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonLocations', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByJsonLocationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonLocations', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByPlannedPlantDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDT', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByPlannedPlantDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDT', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByPolygonArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polygonArea', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByPolygonAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polygonArea', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByRotationNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotationNumber', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByRotationNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotationNumber', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByStockingPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockingPercentage', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByStockingPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockingPercentage', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortBySurvival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survival', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortBySurvivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survival', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByUnitNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitNumber', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByUnitNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitNumber', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByUtilMAI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilMAI', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByUtilMAIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilMAI', Sort.desc);
    });
  }
}

extension CompartmentQuerySortThenBy
    on QueryBuilder<Compartment, Compartment, QSortThenBy> {
  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByAreaTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaTypeId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByAreaTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaTypeId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByCompartmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByCompartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByCompartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByEffectiveArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveArea', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByEffectiveAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveArea', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByEspacement() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'espacement', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByEspacementDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'espacement', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByJsonLocations() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonLocations', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByJsonLocationsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jsonLocations', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByPlannedPlantDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDT', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByPlannedPlantDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDT', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByPolygonArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polygonArea', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByPolygonAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'polygonArea', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupTemplateName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByRotationNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotationNumber', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByRotationNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotationNumber', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupTemplateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupTemplateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupTemplateName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByStockingPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockingPercentage', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByStockingPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockingPercentage', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenBySurvival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survival', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenBySurvivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survival', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByUnitNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitNumber', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByUnitNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitNumber', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByUtilMAI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilMAI', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByUtilMAIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'utilMAI', Sort.desc);
    });
  }
}

extension CompartmentQueryWhereDistinct
    on QueryBuilder<Compartment, Compartment, QDistinct> {
  QueryBuilder<Compartment, Compartment, QDistinct> distinctByAreaTypeId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'areaTypeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compartmentId');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByCompartmentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compartmentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByEffectiveArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveArea');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByEspacement(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'espacement', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByJsonLocations(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jsonLocations',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByPlannedPlantDT(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedPlantDT',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByPolygonArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'polygonArea');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct>
      distinctByProductGroupTemplateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productGroupTemplateId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct>
      distinctByProductGroupTemplateName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productGroupTemplateName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByRotationNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rotationNumber');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct>
      distinctBySpeciesGroupTemplateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesGroupTemplateId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct>
      distinctBySpeciesGroupTemplateName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesGroupTemplateName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct>
      distinctByStockingPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockingPercentage');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctBySurvival() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'survival');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByUnitNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByUtilMAI() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'utilMAI');
    });
  }
}

extension CompartmentQueryProperty
    on QueryBuilder<Compartment, Compartment, QQueryProperty> {
  QueryBuilder<Compartment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> areaTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areaTypeId');
    });
  }

  QueryBuilder<Compartment, int?, QQueryOperations> compartmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compartmentId');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      compartmentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compartmentName');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations> effectiveAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveArea');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> espacementProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'espacement');
    });
  }

  QueryBuilder<Compartment, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> jsonLocationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jsonLocations');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      plannedPlantDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedPlantDT');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations> polygonAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'polygonArea');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      productGroupTemplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productGroupTemplateId');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      productGroupTemplateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productGroupTemplateName');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations>
      rotationNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rotationNumber');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      speciesGroupTemplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesGroupTemplateId');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      speciesGroupTemplateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesGroupTemplateName');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations>
      stockingPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockingPercentage');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations> survivalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'survival');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> unitNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitNumber');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations> utilMAIProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'utilMAI');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Compartment _$$_CompartmentFromJson(Map<String, dynamic> json) =>
    _$_Compartment(
      compartmentId: json['CompartmentId'] as int?,
      compartmentName: json['CompartmentName'] as String?,
      areaTypeId: json['AreaTypeId'] as String?,
      productGroupTemplateId: json['ProductGroupTemplateId'] as String?,
      productGroupTemplateName: json['ProductGroupTemplateName'] as String?,
      speciesGroupTemplateId: json['SpeciesGroupTemplateId'] as String?,
      speciesGroupTemplateName: json['SpeciesGroupTemplateName'] as String?,
      polygonArea: (json['PolygonArea'] as num?)?.toDouble(),
      unitNumber: json['UnitNumber'] as String?,
      effectiveArea: (json['EffectiveArea'] as num?)?.toDouble(),
      espacement: json['Espacement'] as String?,
      plannedPlantDT: json['PlannedPlantDT'] as String?,
      survival: (json['Survival'] as num?)?.toDouble(),
      stockingPercentage: (json['StockingPercentage'] as num?)?.toDouble(),
      rotationNumber: (json['RotationNumber'] as num?)?.toDouble(),
      utilMAI: (json['UtilMAI'] as num?)?.toDouble(),
      jsonLocations: json['Locations'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_CompartmentToJson(_$_Compartment instance) =>
    <String, dynamic>{
      'CompartmentId': instance.compartmentId,
      'CompartmentName': instance.compartmentName,
      'AreaTypeId': instance.areaTypeId,
      'ProductGroupTemplateId': instance.productGroupTemplateId,
      'ProductGroupTemplateName': instance.productGroupTemplateName,
      'SpeciesGroupTemplateId': instance.speciesGroupTemplateId,
      'SpeciesGroupTemplateName': instance.speciesGroupTemplateName,
      'PolygonArea': instance.polygonArea,
      'UnitNumber': instance.unitNumber,
      'EffectiveArea': instance.effectiveArea,
      'Espacement': instance.espacement,
      'PlannedPlantDT': instance.plannedPlantDT,
      'Survival': instance.survival,
      'StockingPercentage': instance.stockingPercentage,
      'RotationNumber': instance.rotationNumber,
      'UtilMAI': instance.utilMAI,
      'Locations': instance.jsonLocations,
      'IsActive': instance.isActive,
    };

_$_GeoLocation _$$_GeoLocationFromJson(Map<String, dynamic> json) =>
    _$_GeoLocation(
      latitude: (json['Latitude'] as num?)?.toDouble(),
      longitude: (json['Longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_GeoLocationToJson(_$_GeoLocation instance) =>
    <String, dynamic>{
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
    };
