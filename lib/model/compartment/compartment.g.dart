// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compartment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

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
    r'locations': PropertySchema(
      id: 5,
      name: r'locations',
      type: IsarType.objectList,
      target: r'GeoLocation',
    ),
    r'mai': PropertySchema(
      id: 6,
      name: r'mai',
      type: IsarType.string,
    ),
    r'plannedPlantDate': PropertySchema(
      id: 7,
      name: r'plannedPlantDate',
      type: IsarType.string,
    ),
    r'polygonArea': PropertySchema(
      id: 8,
      name: r'polygonArea',
      type: IsarType.double,
    ),
    r'productGroupId': PropertySchema(
      id: 9,
      name: r'productGroupId',
      type: IsarType.long,
    ),
    r'productGroupName': PropertySchema(
      id: 10,
      name: r'productGroupName',
      type: IsarType.string,
    ),
    r'rotation': PropertySchema(
      id: 11,
      name: r'rotation',
      type: IsarType.string,
    ),
    r'speciesGroupId': PropertySchema(
      id: 12,
      name: r'speciesGroupId',
      type: IsarType.long,
    ),
    r'speciesGroupName': PropertySchema(
      id: 13,
      name: r'speciesGroupName',
      type: IsarType.string,
    ),
    r'stockingPercentage': PropertySchema(
      id: 14,
      name: r'stockingPercentage',
      type: IsarType.double,
    ),
    r'survivalPercentage': PropertySchema(
      id: 15,
      name: r'survivalPercentage',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 16,
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
  embeddedSchemas: {r'GeoLocation': GeoLocationSchema},
  getId: _compartmentGetId,
  getLinks: _compartmentGetLinks,
  attach: _compartmentAttach,
  version: '3.1.0',
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
    final list = object.locations;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[GeoLocation]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              GeoLocationSchema.estimateSize(value, offsets, allOffsets);
        }
      }
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
    final value = object.productGroupName;
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
    final value = object.speciesGroupName;
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
  writer.writeObjectList<GeoLocation>(
    offsets[5],
    allOffsets,
    GeoLocationSchema.serialize,
    object.locations,
  );
  writer.writeString(offsets[6], object.mai);
  writer.writeString(offsets[7], object.plannedPlantDate);
  writer.writeDouble(offsets[8], object.polygonArea);
  writer.writeLong(offsets[9], object.productGroupId);
  writer.writeString(offsets[10], object.productGroupName);
  writer.writeString(offsets[11], object.rotation);
  writer.writeLong(offsets[12], object.speciesGroupId);
  writer.writeString(offsets[13], object.speciesGroupName);
  writer.writeDouble(offsets[14], object.stockingPercentage);
  writer.writeDouble(offsets[15], object.survivalPercentage);
  writer.writeString(offsets[16], object.unit);
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
    isActive: reader.readBoolOrNull(offsets[4]),
    locations: reader.readObjectList<GeoLocation>(
      offsets[5],
      GeoLocationSchema.deserialize,
      allOffsets,
      GeoLocation(),
    ),
    mai: reader.readStringOrNull(offsets[6]),
    plannedPlantDate: reader.readStringOrNull(offsets[7]),
    polygonArea: reader.readDoubleOrNull(offsets[8]),
    productGroupId: reader.readLongOrNull(offsets[9]),
    productGroupName: reader.readStringOrNull(offsets[10]),
    rotation: reader.readStringOrNull(offsets[11]),
    speciesGroupId: reader.readLongOrNull(offsets[12]),
    speciesGroupName: reader.readStringOrNull(offsets[13]),
    stockingPercentage: reader.readDoubleOrNull(offsets[14]),
    survivalPercentage: reader.readDoubleOrNull(offsets[15]),
    unit: reader.readStringOrNull(offsets[16]),
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
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<GeoLocation>(
        offset,
        GeoLocationSchema.deserialize,
        allOffsets,
        GeoLocation(),
      )) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
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
      locationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locations',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locations',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'locations',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
      productGroupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productGroupId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productGroupId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productGroupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productGroupName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productGroupName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productGroupName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productGroupName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productGroupName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      productGroupNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productGroupName',
        value: '',
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
      speciesGroupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesGroupId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesGroupId',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesGroupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesGroupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesGroupName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesGroupName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesGroupName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesGroupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesGroupName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesGroupName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      speciesGroupNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesGroupName',
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
    on QueryBuilder<Compartment, Compartment, QFilterCondition> {
  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      locationsElement(FilterQuery<GeoLocation> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'locations');
    });
  }
}

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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByProductGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByProductGroupNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupName', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortBySpeciesGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortBySpeciesGroupNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupName', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByProductGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByProductGroupNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productGroupName', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenBySpeciesGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenBySpeciesGroupNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesGroupName', Sort.desc);
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

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByProductGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productGroupId');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByProductGroupName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productGroupName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByRotation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rotation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctBySpeciesGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesGroupId');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctBySpeciesGroupName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesGroupName',
          caseSensitive: caseSensitive);
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

  QueryBuilder<Compartment, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Compartment, List<GeoLocation>?, QQueryOperations>
      locationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locations');
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

  QueryBuilder<Compartment, int?, QQueryOperations> productGroupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productGroupId');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      productGroupNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productGroupName');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations> rotationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rotation');
    });
  }

  QueryBuilder<Compartment, int?, QQueryOperations> speciesGroupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesGroupId');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      speciesGroupNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesGroupName');
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
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GeoLocationSchema = Schema(
  name: r'GeoLocation',
  id: 4422903911306842414,
  properties: {
    r'latitude': PropertySchema(
      id: 0,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 1,
      name: r'longitude',
      type: IsarType.double,
    )
  },
  estimateSize: _geoLocationEstimateSize,
  serialize: _geoLocationSerialize,
  deserialize: _geoLocationDeserialize,
  deserializeProp: _geoLocationDeserializeProp,
);

int _geoLocationEstimateSize(
  GeoLocation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _geoLocationSerialize(
  GeoLocation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.latitude);
  writer.writeDouble(offsets[1], object.longitude);
}

GeoLocation _geoLocationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeoLocation(
    latitude: reader.readDoubleOrNull(offsets[0]),
    longitude: reader.readDoubleOrNull(offsets[1]),
  );
  return object;
}

P _geoLocationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GeoLocationQueryFilter
    on QueryBuilder<GeoLocation, GeoLocation, QFilterCondition> {
  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition> latitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      latitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      latitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition> latitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      longitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      longitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      longitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoLocation, GeoLocation, QAfterFilterCondition>
      longitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension GeoLocationQueryObject
    on QueryBuilder<GeoLocation, GeoLocation, QFilterCondition> {}
