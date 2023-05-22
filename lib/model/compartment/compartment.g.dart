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
    r'compartmentId': PropertySchema(
      id: 0,
      name: r'compartmentId',
      type: IsarType.long,
    ),
    r'compartmentName': PropertySchema(
      id: 1,
      name: r'compartmentName',
      type: IsarType.string,
    ),
    r'effectiveArea': PropertySchema(
      id: 2,
      name: r'effectiveArea',
      type: IsarType.double,
    ),
    r'espacement': PropertySchema(
      id: 3,
      name: r'espacement',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'mai': PropertySchema(
      id: 5,
      name: r'mai',
      type: IsarType.string,
    ),
    r'plannedPlantDate': PropertySchema(
      id: 6,
      name: r'plannedPlantDate',
      type: IsarType.string,
    ),
    r'polygonArea': PropertySchema(
      id: 7,
      name: r'polygonArea',
      type: IsarType.double,
    ),
    r'productGroup': PropertySchema(
      id: 8,
      name: r'productGroup',
      type: IsarType.double,
    ),
    r'rotation': PropertySchema(
      id: 9,
      name: r'rotation',
      type: IsarType.string,
    ),
    r'speciesGroup': PropertySchema(
      id: 10,
      name: r'speciesGroup',
      type: IsarType.double,
    ),
    r'stockingPercentage': PropertySchema(
      id: 11,
      name: r'stockingPercentage',
      type: IsarType.double,
    ),
    r'survivalPercentage': PropertySchema(
      id: 12,
      name: r'survivalPercentage',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 13,
      name: r'unit',
      type: IsarType.string,
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
    final value = object.mai;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.plannedPlantDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rotation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unit;
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
  writer.writeLong(offsets[0], object.compartmentId);
  writer.writeString(offsets[1], object.compartmentName);
  writer.writeDouble(offsets[2], object.effectiveArea);
  writer.writeString(offsets[3], object.espacement);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeString(offsets[5], object.mai);
  writer.writeString(offsets[6], object.plannedPlantDate);
  writer.writeDouble(offsets[7], object.polygonArea);
  writer.writeDouble(offsets[8], object.productGroup);
  writer.writeString(offsets[9], object.rotation);
  writer.writeDouble(offsets[10], object.speciesGroup);
  writer.writeDouble(offsets[11], object.stockingPercentage);
  writer.writeDouble(offsets[12], object.survivalPercentage);
  writer.writeString(offsets[13], object.unit);
}

Compartment _compartmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Compartment(
    compartmentId: reader.readLongOrNull(offsets[0]),
    compartmentName: reader.readStringOrNull(offsets[1]),
    effectiveArea: reader.readDoubleOrNull(offsets[2]),
    espacement: reader.readStringOrNull(offsets[3]),
    isActive: reader.readBool(offsets[4]),
    mai: reader.readStringOrNull(offsets[5]),
    plannedPlantDate: reader.readStringOrNull(offsets[6]),
    polygonArea: reader.readDoubleOrNull(offsets[7]),
    productGroup: reader.readDoubleOrNull(offsets[8]),
    rotation: reader.readStringOrNull(offsets[9]),
    speciesGroup: reader.readDoubleOrNull(offsets[10]),
    stockingPercentage: reader.readDoubleOrNull(offsets[11]),
    survivalPercentage: reader.readDoubleOrNull(offsets[12]),
    unit: reader.readStringOrNull(offsets[13]),
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
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
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

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mai',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mai',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mai',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mai',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mai',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mai',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mai',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mai',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mai',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mai',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> maiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mai',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      maiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mai',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedPlantDate',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedPlantDate',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedPlantDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedPlantDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedPlantDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedPlantDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plannedPlantDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plannedPlantDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plannedPlantDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plannedPlantDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedPlantDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      plannedPlantDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plannedPlantDate',
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
      productGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productGroup',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productGroup',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroup',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productGroup',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productGroup',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productGroup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rotation',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rotation',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> rotationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rotation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rotation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rotation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> rotationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rotation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rotation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rotation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rotation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> rotationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rotation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rotation',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      rotationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rotation',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesGroup',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesGroup',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroup',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesGroup',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesGroup',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesGroup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
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
      survivalPercentageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'survivalPercentage',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalPercentageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'survivalPercentage',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalPercentageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'survivalPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalPercentageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'survivalPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalPercentageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'survivalPercentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      survivalPercentageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'survivalPercentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByMai() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mai', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByMaiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mai', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByPlannedPlantDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDate', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByPlannedPlantDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDate', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByProductGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroup', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroup', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByRotation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByRotationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortBySpeciesGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroup', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroup', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySurvivalPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survivalPercentage', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySurvivalPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survivalPercentage', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension CompartmentQuerySortThenBy
    on QueryBuilder<Compartment, Compartment, QSortThenBy> {
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByMai() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mai', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByMaiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mai', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByPlannedPlantDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDate', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByPlannedPlantDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedPlantDate', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByProductGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroup', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroup', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByRotation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByRotationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenBySpeciesGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroup', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroup', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySurvivalPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survivalPercentage', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySurvivalPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survivalPercentage', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension CompartmentQueryWhereDistinct
    on QueryBuilder<Compartment, Compartment, QDistinct> {
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

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByMai(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mai', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByPlannedPlantDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedPlantDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByPolygonArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'polygonArea');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByProductGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productGroup');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByRotation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rotation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctBySpeciesGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesGroup');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct>
      distinctByStockingPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockingPercentage');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct>
      distinctBySurvivalPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'survivalPercentage');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
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

  QueryBuilder<Compartment, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> maiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mai');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      plannedPlantDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedPlantDate');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations> polygonAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'polygonArea');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations> productGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productGroup');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> rotationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rotation');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations> speciesGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesGroup');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations>
      stockingPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockingPercentage');
    });
  }

  QueryBuilder<Compartment, double?, QQueryOperations>
      survivalPercentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'survivalPercentage');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
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
      productGroup: (json['ProductGroup'] as num?)?.toDouble(),
      speciesGroup: (json['SpeciesGroup'] as num?)?.toDouble(),
      polygonArea: (json['PolygonArea'] as num?)?.toDouble(),
      unit: json['Unit'] as String?,
      effectiveArea: (json['EffectiveArea'] as num?)?.toDouble(),
      espacement: json['Espacement'] as String?,
      plannedPlantDate: json['PlannedPlantDate'] as String?,
      survivalPercentage: (json['SurvivalPercentage'] as num?)?.toDouble(),
      stockingPercentage: (json['StockingPercentage'] as num?)?.toDouble(),
      rotation: json['Rotation'] as String?,
      mai: json['MAI'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$_CompartmentToJson(_$_Compartment instance) =>
    <String, dynamic>{
      'CompartmentId': instance.compartmentId,
      'CompartmentName': instance.compartmentName,
      'ProductGroup': instance.productGroup,
      'SpeciesGroup': instance.speciesGroup,
      'PolygonArea': instance.polygonArea,
      'Unit': instance.unit,
      'EffectiveArea': instance.effectiveArea,
      'Espacement': instance.espacement,
      'PlannedPlantDate': instance.plannedPlantDate,
      'SurvivalPercentage': instance.survivalPercentage,
      'StockingPercentage': instance.stockingPercentage,
      'Rotation': instance.rotation,
      'MAI': instance.mai,
      'IsActive': instance.isActive,
    };
