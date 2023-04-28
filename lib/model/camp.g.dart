// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camp.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCampCollection on Isar {
  IsarCollection<Camp> get camps => this.collection();
}

const CampSchema = CollectionSchema(
  name: r'Camp',
  id: 7210242681835689340,
  properties: {
    r'actualYearOfHarvest': PropertySchema(
      id: 0,
      name: r'actualYearOfHarvest',
      type: IsarType.long,
    ),
    r'campName': PropertySchema(
      id: 1,
      name: r'campName',
      type: IsarType.string,
    ),
    r'campOrder': PropertySchema(
      id: 2,
      name: r'campOrder',
      type: IsarType.long,
    ),
    r'cattlePostHousing': PropertySchema(
      id: 3,
      name: r'cattlePostHousing',
      type: IsarType.double,
    ),
    r'convertedToGrassland': PropertySchema(
      id: 4,
      name: r'convertedToGrassland',
      type: IsarType.double,
    ),
    r'corridors': PropertySchema(
      id: 5,
      name: r'corridors',
      type: IsarType.double,
    ),
    r'createDT': PropertySchema(
      id: 6,
      name: r'createDT',
      type: IsarType.dateTime,
    ),
    r'cumulativeBiomass': PropertySchema(
      id: 7,
      name: r'cumulativeBiomass',
      type: IsarType.double,
    ),
    r'estimatedBiomass': PropertySchema(
      id: 8,
      name: r'estimatedBiomass',
      type: IsarType.double,
    ),
    r'estimatedBiomassRemoved': PropertySchema(
      id: 9,
      name: r'estimatedBiomassRemoved',
      type: IsarType.double,
    ),
    r'farmId': PropertySchema(
      id: 10,
      name: r'farmId',
      type: IsarType.string,
    ),
    r'infestationCategory1': PropertySchema(
      id: 11,
      name: r'infestationCategory1',
      type: IsarType.double,
    ),
    r'infestationCategory2': PropertySchema(
      id: 12,
      name: r'infestationCategory2',
      type: IsarType.double,
    ),
    r'infestationCategory3': PropertySchema(
      id: 13,
      name: r'infestationCategory3',
      type: IsarType.double,
    ),
    r'infestationCategory4': PropertySchema(
      id: 14,
      name: r'infestationCategory4',
      type: IsarType.double,
    ),
    r'infestationCategory5': PropertySchema(
      id: 15,
      name: r'infestationCategory5',
      type: IsarType.double,
    ),
    r'infestedWieghtedAverage': PropertySchema(
      id: 16,
      name: r'infestedWieghtedAverage',
      type: IsarType.double,
    ),
    r'isActive': PropertySchema(
      id: 17,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'plannedYearOfHarvest': PropertySchema(
      id: 18,
      name: r'plannedYearOfHarvest',
      type: IsarType.long,
    ),
    r'poachingAlleviationZone': PropertySchema(
      id: 19,
      name: r'poachingAlleviationZone',
      type: IsarType.double,
    ),
    r'protectedArea': PropertySchema(
      id: 20,
      name: r'protectedArea',
      type: IsarType.double,
    ),
    r'rangeLand': PropertySchema(
      id: 21,
      name: r'rangeLand',
      type: IsarType.double,
    ),
    r'roadAndFireBreaks': PropertySchema(
      id: 22,
      name: r'roadAndFireBreaks',
      type: IsarType.double,
    ),
    r'tonsOfCharcoalProduced': PropertySchema(
      id: 23,
      name: r'tonsOfCharcoalProduced',
      type: IsarType.double,
    ),
    r'totalArea': PropertySchema(
      id: 24,
      name: r'totalArea',
      type: IsarType.double,
    ),
    r'totalBiomass': PropertySchema(
      id: 25,
      name: r'totalBiomass',
      type: IsarType.double,
    ),
    r'totalRangeInfestation': PropertySchema(
      id: 26,
      name: r'totalRangeInfestation',
      type: IsarType.double,
    ),
    r'updateDT': PropertySchema(
      id: 27,
      name: r'updateDT',
      type: IsarType.dateTime,
    ),
    r'variance': PropertySchema(
      id: 28,
      name: r'variance',
      type: IsarType.double,
    )
  },
  estimateSize: _campEstimateSize,
  serialize: _campSerialize,
  deserialize: _campDeserialize,
  deserializeProp: _campDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _campGetId,
  getLinks: _campGetLinks,
  attach: _campAttach,
  version: '3.0.5',
);

int _campEstimateSize(
  Camp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.campName;
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
  return bytesCount;
}

void _campSerialize(
  Camp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.actualYearOfHarvest);
  writer.writeString(offsets[1], object.campName);
  writer.writeLong(offsets[2], object.campOrder);
  writer.writeDouble(offsets[3], object.cattlePostHousing);
  writer.writeDouble(offsets[4], object.convertedToGrassland);
  writer.writeDouble(offsets[5], object.corridors);
  writer.writeDateTime(offsets[6], object.createDT);
  writer.writeDouble(offsets[7], object.cumulativeBiomass);
  writer.writeDouble(offsets[8], object.estimatedBiomass);
  writer.writeDouble(offsets[9], object.estimatedBiomassRemoved);
  writer.writeString(offsets[10], object.farmId);
  writer.writeDouble(offsets[11], object.infestationCategory1);
  writer.writeDouble(offsets[12], object.infestationCategory2);
  writer.writeDouble(offsets[13], object.infestationCategory3);
  writer.writeDouble(offsets[14], object.infestationCategory4);
  writer.writeDouble(offsets[15], object.infestationCategory5);
  writer.writeDouble(offsets[16], object.infestedWieghtedAverage);
  writer.writeBool(offsets[17], object.isActive);
  writer.writeLong(offsets[18], object.plannedYearOfHarvest);
  writer.writeDouble(offsets[19], object.poachingAlleviationZone);
  writer.writeDouble(offsets[20], object.protectedArea);
  writer.writeDouble(offsets[21], object.rangeLand);
  writer.writeDouble(offsets[22], object.roadAndFireBreaks);
  writer.writeDouble(offsets[23], object.tonsOfCharcoalProduced);
  writer.writeDouble(offsets[24], object.totalArea);
  writer.writeDouble(offsets[25], object.totalBiomass);
  writer.writeDouble(offsets[26], object.totalRangeInfestation);
  writer.writeDateTime(offsets[27], object.updateDT);
  writer.writeDouble(offsets[28], object.variance);
}

Camp _campDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Camp();
  object.actualYearOfHarvest = reader.readLongOrNull(offsets[0]);
  object.campName = reader.readStringOrNull(offsets[1]);
  object.campOrder = reader.readLongOrNull(offsets[2]);
  object.cattlePostHousing = reader.readDoubleOrNull(offsets[3]);
  object.convertedToGrassland = reader.readDoubleOrNull(offsets[4]);
  object.corridors = reader.readDoubleOrNull(offsets[5]);
  object.createDT = reader.readDateTimeOrNull(offsets[6]);
  object.cumulativeBiomass = reader.readDoubleOrNull(offsets[7]);
  object.estimatedBiomass = reader.readDoubleOrNull(offsets[8]);
  object.estimatedBiomassRemoved = reader.readDoubleOrNull(offsets[9]);
  object.farmId = reader.readStringOrNull(offsets[10]);
  object.infestationCategory1 = reader.readDoubleOrNull(offsets[11]);
  object.infestationCategory2 = reader.readDoubleOrNull(offsets[12]);
  object.infestationCategory3 = reader.readDoubleOrNull(offsets[13]);
  object.infestationCategory4 = reader.readDoubleOrNull(offsets[14]);
  object.infestationCategory5 = reader.readDoubleOrNull(offsets[15]);
  object.infestedWieghtedAverage = reader.readDoubleOrNull(offsets[16]);
  object.isActive = reader.readBoolOrNull(offsets[17]);
  object.plannedYearOfHarvest = reader.readLongOrNull(offsets[18]);
  object.poachingAlleviationZone = reader.readDoubleOrNull(offsets[19]);
  object.protectedArea = reader.readDoubleOrNull(offsets[20]);
  object.rangeLand = reader.readDoubleOrNull(offsets[21]);
  object.roadAndFireBreaks = reader.readDoubleOrNull(offsets[22]);
  object.tonsOfCharcoalProduced = reader.readDoubleOrNull(offsets[23]);
  object.totalArea = reader.readDoubleOrNull(offsets[24]);
  object.totalBiomass = reader.readDoubleOrNull(offsets[25]);
  object.totalRangeInfestation = reader.readDoubleOrNull(offsets[26]);
  object.updateDT = reader.readDateTimeOrNull(offsets[27]);
  object.variance = reader.readDoubleOrNull(offsets[28]);
  return object;
}

P _campDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readBoolOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readDoubleOrNull(offset)) as P;
    case 26:
      return (reader.readDoubleOrNull(offset)) as P;
    case 27:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 28:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _campGetId(Camp object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _campGetLinks(Camp object) {
  return [];
}

void _campAttach(IsarCollection<dynamic> col, Id id, Camp object) {}

extension CampQueryWhereSort on QueryBuilder<Camp, Camp, QWhere> {
  QueryBuilder<Camp, Camp, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CampQueryWhere on QueryBuilder<Camp, Camp, QWhereClause> {
  QueryBuilder<Camp, Camp, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Camp, Camp, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Camp, Camp, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Camp, Camp, QAfterWhereClause> idBetween(
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

extension CampQueryFilter on QueryBuilder<Camp, Camp, QFilterCondition> {
  QueryBuilder<Camp, Camp, QAfterFilterCondition> actualYearOfHarvestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualYearOfHarvest',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      actualYearOfHarvestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualYearOfHarvest',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> actualYearOfHarvestEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualYearOfHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      actualYearOfHarvestGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualYearOfHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> actualYearOfHarvestLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualYearOfHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> actualYearOfHarvestBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualYearOfHarvest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'campName',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'campName',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'campName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'campName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'campName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'campName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'campName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'campName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'campName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campName',
        value: '',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'campName',
        value: '',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'campOrder',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'campOrder',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campOrderEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campOrderGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'campOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campOrderLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'campOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> campOrderBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'campOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cattlePostHousingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cattlePostHousing',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cattlePostHousingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cattlePostHousing',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cattlePostHousingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cattlePostHousing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cattlePostHousingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cattlePostHousing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cattlePostHousingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cattlePostHousing',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cattlePostHousingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cattlePostHousing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> convertedToGrasslandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'convertedToGrassland',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      convertedToGrasslandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'convertedToGrassland',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> convertedToGrasslandEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convertedToGrassland',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      convertedToGrasslandGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'convertedToGrassland',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> convertedToGrasslandLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'convertedToGrassland',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> convertedToGrasslandBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'convertedToGrassland',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> corridorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'corridors',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> corridorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'corridors',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> corridorsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'corridors',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> corridorsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'corridors',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> corridorsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'corridors',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> corridorsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'corridors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> createDTEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> createDTGreaterThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> createDTLessThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> createDTBetween(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cumulativeBiomassIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cumulativeBiomass',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cumulativeBiomassIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cumulativeBiomass',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cumulativeBiomassEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cumulativeBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cumulativeBiomassGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cumulativeBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cumulativeBiomassLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cumulativeBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> cumulativeBiomassBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cumulativeBiomass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> estimatedBiomassIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedBiomass',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> estimatedBiomassIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedBiomass',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> estimatedBiomassEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> estimatedBiomassGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> estimatedBiomassLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> estimatedBiomassBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedBiomass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      estimatedBiomassRemovedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedBiomassRemoved',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      estimatedBiomassRemovedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedBiomassRemoved',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      estimatedBiomassRemovedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedBiomassRemoved',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      estimatedBiomassRemovedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedBiomassRemoved',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      estimatedBiomassRemovedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedBiomassRemoved',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      estimatedBiomassRemovedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedBiomassRemoved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdEqualTo(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdGreaterThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdLessThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdBetween(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdStartsWith(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdEndsWith(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> farmIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'infestationCategory1',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'infestationCategory1',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory1EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infestationCategory1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory1GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infestationCategory1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory1LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infestationCategory1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory1Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infestationCategory1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'infestationCategory2',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'infestationCategory2',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory2EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infestationCategory2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory2GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infestationCategory2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory2LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infestationCategory2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory2Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infestationCategory2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'infestationCategory3',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'infestationCategory3',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory3EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infestationCategory3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory3GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infestationCategory3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory3LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infestationCategory3',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory3Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infestationCategory3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory4IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'infestationCategory4',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory4IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'infestationCategory4',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory4EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infestationCategory4',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory4GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infestationCategory4',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory4LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infestationCategory4',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory4Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infestationCategory4',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory5IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'infestationCategory5',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory5IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'infestationCategory5',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory5EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infestationCategory5',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestationCategory5GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infestationCategory5',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory5LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infestationCategory5',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> infestationCategory5Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infestationCategory5',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestedWieghtedAverageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'infestedWieghtedAverage',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestedWieghtedAverageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'infestedWieghtedAverage',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestedWieghtedAverageEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infestedWieghtedAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestedWieghtedAverageGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infestedWieghtedAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestedWieghtedAverageLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infestedWieghtedAverage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      infestedWieghtedAverageBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infestedWieghtedAverage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> plannedYearOfHarvestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedYearOfHarvest',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      plannedYearOfHarvestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedYearOfHarvest',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> plannedYearOfHarvestEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedYearOfHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      plannedYearOfHarvestGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedYearOfHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> plannedYearOfHarvestLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedYearOfHarvest',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> plannedYearOfHarvestBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedYearOfHarvest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      poachingAlleviationZoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'poachingAlleviationZone',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      poachingAlleviationZoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'poachingAlleviationZone',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      poachingAlleviationZoneEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poachingAlleviationZone',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      poachingAlleviationZoneGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poachingAlleviationZone',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      poachingAlleviationZoneLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poachingAlleviationZone',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      poachingAlleviationZoneBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poachingAlleviationZone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> protectedAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'protectedArea',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> protectedAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'protectedArea',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> protectedAreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protectedArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> protectedAreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protectedArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> protectedAreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protectedArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> protectedAreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protectedArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> rangeLandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rangeLand',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> rangeLandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rangeLand',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> rangeLandEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rangeLand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> rangeLandGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rangeLand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> rangeLandLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rangeLand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> rangeLandBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rangeLand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> roadAndFireBreaksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roadAndFireBreaks',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> roadAndFireBreaksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roadAndFireBreaks',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> roadAndFireBreaksEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roadAndFireBreaks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> roadAndFireBreaksGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roadAndFireBreaks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> roadAndFireBreaksLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roadAndFireBreaks',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> roadAndFireBreaksBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roadAndFireBreaks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      tonsOfCharcoalProducedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tonsOfCharcoalProduced',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      tonsOfCharcoalProducedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tonsOfCharcoalProduced',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> tonsOfCharcoalProducedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tonsOfCharcoalProduced',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      tonsOfCharcoalProducedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tonsOfCharcoalProduced',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      tonsOfCharcoalProducedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tonsOfCharcoalProduced',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> tonsOfCharcoalProducedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tonsOfCharcoalProduced',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalAreaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalArea',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalAreaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalArea',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalAreaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalAreaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalAreaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalArea',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalAreaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalArea',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalBiomassIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalBiomass',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalBiomassIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalBiomass',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalBiomassEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalBiomassGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalBiomassLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalBiomass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalBiomassBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalBiomass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      totalRangeInfestationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalRangeInfestation',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      totalRangeInfestationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalRangeInfestation',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalRangeInfestationEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRangeInfestation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition>
      totalRangeInfestationGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalRangeInfestation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalRangeInfestationLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalRangeInfestation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> totalRangeInfestationBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalRangeInfestation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> updateDTEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> updateDTGreaterThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> updateDTLessThan(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> updateDTBetween(
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

  QueryBuilder<Camp, Camp, QAfterFilterCondition> varianceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'variance',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> varianceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'variance',
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> varianceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'variance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> varianceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'variance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> varianceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'variance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Camp, Camp, QAfterFilterCondition> varianceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'variance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CampQueryObject on QueryBuilder<Camp, Camp, QFilterCondition> {}

extension CampQueryLinks on QueryBuilder<Camp, Camp, QFilterCondition> {}

extension CampQuerySortBy on QueryBuilder<Camp, Camp, QSortBy> {
  QueryBuilder<Camp, Camp, QAfterSortBy> sortByActualYearOfHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualYearOfHarvest', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByActualYearOfHarvestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualYearOfHarvest', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCampName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCampNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCampOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campOrder', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCampOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campOrder', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCattlePostHousing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cattlePostHousing', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCattlePostHousingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cattlePostHousing', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByConvertedToGrassland() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedToGrassland', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByConvertedToGrasslandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedToGrassland', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCorridors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corridors', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCorridorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corridors', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCumulativeBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cumulativeBiomass', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByCumulativeBiomassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cumulativeBiomass', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByEstimatedBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomass', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByEstimatedBiomassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomass', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByEstimatedBiomassRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomassRemoved', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByEstimatedBiomassRemovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomassRemoved', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory1', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory1', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory2', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory2', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory3', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory3', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory4', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory4', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory5', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestationCategory5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory5', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestedWieghtedAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestedWieghtedAverage', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByInfestedWieghtedAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestedWieghtedAverage', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByPlannedYearOfHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedYearOfHarvest', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByPlannedYearOfHarvestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedYearOfHarvest', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByPoachingAlleviationZone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poachingAlleviationZone', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByPoachingAlleviationZoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poachingAlleviationZone', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByProtectedArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedArea', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByProtectedAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedArea', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByRangeLand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeLand', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByRangeLandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeLand', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByRoadAndFireBreaks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roadAndFireBreaks', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByRoadAndFireBreaksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roadAndFireBreaks', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTonsOfCharcoalProduced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tonsOfCharcoalProduced', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTonsOfCharcoalProducedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tonsOfCharcoalProduced', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTotalArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalArea', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTotalAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalArea', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTotalBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBiomass', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTotalBiomassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBiomass', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTotalRangeInfestation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRangeInfestation', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByTotalRangeInfestationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRangeInfestation', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByVariance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variance', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> sortByVarianceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variance', Sort.desc);
    });
  }
}

extension CampQuerySortThenBy on QueryBuilder<Camp, Camp, QSortThenBy> {
  QueryBuilder<Camp, Camp, QAfterSortBy> thenByActualYearOfHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualYearOfHarvest', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByActualYearOfHarvestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualYearOfHarvest', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCampName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCampNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCampOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campOrder', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCampOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campOrder', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCattlePostHousing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cattlePostHousing', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCattlePostHousingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cattlePostHousing', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByConvertedToGrassland() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedToGrassland', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByConvertedToGrasslandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedToGrassland', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCorridors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corridors', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCorridorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corridors', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCumulativeBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cumulativeBiomass', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByCumulativeBiomassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cumulativeBiomass', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByEstimatedBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomass', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByEstimatedBiomassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomass', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByEstimatedBiomassRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomassRemoved', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByEstimatedBiomassRemovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedBiomassRemoved', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory1', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory1', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory2', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory2', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory3', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory3', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory4', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory4', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory5', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestationCategory5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestationCategory5', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestedWieghtedAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestedWieghtedAverage', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByInfestedWieghtedAverageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'infestedWieghtedAverage', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByPlannedYearOfHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedYearOfHarvest', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByPlannedYearOfHarvestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedYearOfHarvest', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByPoachingAlleviationZone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poachingAlleviationZone', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByPoachingAlleviationZoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poachingAlleviationZone', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByProtectedArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedArea', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByProtectedAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedArea', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByRangeLand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeLand', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByRangeLandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rangeLand', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByRoadAndFireBreaks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roadAndFireBreaks', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByRoadAndFireBreaksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roadAndFireBreaks', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTonsOfCharcoalProduced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tonsOfCharcoalProduced', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTonsOfCharcoalProducedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tonsOfCharcoalProduced', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTotalArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalArea', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTotalAreaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalArea', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTotalBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBiomass', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTotalBiomassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBiomass', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTotalRangeInfestation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRangeInfestation', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByTotalRangeInfestationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRangeInfestation', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByVariance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variance', Sort.asc);
    });
  }

  QueryBuilder<Camp, Camp, QAfterSortBy> thenByVarianceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'variance', Sort.desc);
    });
  }
}

extension CampQueryWhereDistinct on QueryBuilder<Camp, Camp, QDistinct> {
  QueryBuilder<Camp, Camp, QDistinct> distinctByActualYearOfHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualYearOfHarvest');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByCampName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByCampOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campOrder');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByCattlePostHousing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cattlePostHousing');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByConvertedToGrassland() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convertedToGrassland');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByCorridors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'corridors');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByCumulativeBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cumulativeBiomass');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByEstimatedBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedBiomass');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByEstimatedBiomassRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedBiomassRemoved');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByFarmId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByInfestationCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infestationCategory1');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByInfestationCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infestationCategory2');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByInfestationCategory3() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infestationCategory3');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByInfestationCategory4() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infestationCategory4');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByInfestationCategory5() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infestationCategory5');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByInfestedWieghtedAverage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'infestedWieghtedAverage');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByPlannedYearOfHarvest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedYearOfHarvest');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByPoachingAlleviationZone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poachingAlleviationZone');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByProtectedArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protectedArea');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByRangeLand() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rangeLand');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByRoadAndFireBreaks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roadAndFireBreaks');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByTonsOfCharcoalProduced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tonsOfCharcoalProduced');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByTotalArea() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalArea');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByTotalBiomass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalBiomass');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByTotalRangeInfestation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRangeInfestation');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT');
    });
  }

  QueryBuilder<Camp, Camp, QDistinct> distinctByVariance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'variance');
    });
  }
}

extension CampQueryProperty on QueryBuilder<Camp, Camp, QQueryProperty> {
  QueryBuilder<Camp, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Camp, int?, QQueryOperations> actualYearOfHarvestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualYearOfHarvest');
    });
  }

  QueryBuilder<Camp, String?, QQueryOperations> campNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campName');
    });
  }

  QueryBuilder<Camp, int?, QQueryOperations> campOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campOrder');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> cattlePostHousingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cattlePostHousing');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> convertedToGrasslandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convertedToGrassland');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> corridorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'corridors');
    });
  }

  QueryBuilder<Camp, DateTime?, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> cumulativeBiomassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cumulativeBiomass');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> estimatedBiomassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedBiomass');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations>
      estimatedBiomassRemovedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedBiomassRemoved');
    });
  }

  QueryBuilder<Camp, String?, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> infestationCategory1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infestationCategory1');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> infestationCategory2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infestationCategory2');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> infestationCategory3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infestationCategory3');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> infestationCategory4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infestationCategory4');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> infestationCategory5Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infestationCategory5');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations>
      infestedWieghtedAverageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infestedWieghtedAverage');
    });
  }

  QueryBuilder<Camp, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Camp, int?, QQueryOperations> plannedYearOfHarvestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedYearOfHarvest');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations>
      poachingAlleviationZoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poachingAlleviationZone');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> protectedAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protectedArea');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> rangeLandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rangeLand');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> roadAndFireBreaksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roadAndFireBreaks');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations>
      tonsOfCharcoalProducedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tonsOfCharcoalProduced');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> totalAreaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalArea');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> totalBiomassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalBiomass');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations>
      totalRangeInfestationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRangeInfestation');
    });
  }

  QueryBuilder<Camp, DateTime?, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }

  QueryBuilder<Camp, double?, QQueryOperations> varianceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'variance');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Camp _$CampFromJson(Map<String, dynamic> json) => Camp()
  ..campName = json['CampName'] as String?
  ..farmId = json['FarmId'] as String?
  ..protectedArea = (json['ProtectedArea'] as num?)?.toDouble()
  ..cattlePostHousing = (json['CattlePostHousing'] as num?)?.toDouble()
  ..corridors = (json['Corridors'] as num?)?.toDouble()
  ..roadAndFireBreaks = (json['RoadAndFireBreaks'] as num?)?.toDouble()
  ..poachingAlleviationZone =
      (json['PoachingAlleviationZone'] as num?)?.toDouble()
  ..convertedToGrassland = (json['ConvertedToGrassland'] as num?)?.toDouble()
  ..rangeLand = (json['RangeLand'] as num?)?.toDouble()
  ..totalArea = (json['TotalArea'] as num?)?.toDouble()
  ..infestationCategory1 = (json['InfestationCategory1'] as num?)?.toDouble()
  ..infestationCategory2 = (json['InfestationCategory2'] as num?)?.toDouble()
  ..infestationCategory3 = (json['InfestationCategory3'] as num?)?.toDouble()
  ..infestationCategory4 = (json['InfestationCategory4'] as num?)?.toDouble()
  ..infestationCategory5 = (json['InfestationCategory5'] as num?)?.toDouble()
  ..totalRangeInfestation = (json['TotalRangeInfestation'] as num?)?.toDouble()
  ..infestedWieghtedAverage =
      (json['InfestedWieghtedAverage'] as num?)?.toDouble()
  ..estimatedBiomass = (json['EstimatedBiomass'] as num?)?.toDouble()
  ..totalBiomass = (json['TotalBiomass'] as num?)?.toDouble()
  ..cumulativeBiomass = (json['CumulativeBiomass'] as num?)?.toDouble()
  ..plannedYearOfHarvest = json['PlannedYearOfHarvest'] as int?
  ..actualYearOfHarvest = json['ActualYearOfHarvest'] as int?
  ..tonsOfCharcoalProduced =
      (json['TonsOfCharcoalProduced'] as num?)?.toDouble()
  ..estimatedBiomassRemoved =
      (json['EstimatedBiomassRemoved'] as num?)?.toDouble()
  ..variance = (json['Variance'] as num?)?.toDouble()
  ..campOrder = json['CampOrder'] as int?
  ..isActive = json['IsActive'] as bool?
  ..createDT = json['CreateDT'] == null
      ? null
      : DateTime.parse(json['CreateDT'] as String)
  ..updateDT = json['UpdateDT'] == null
      ? null
      : DateTime.parse(json['UpdateDT'] as String);

Map<String, dynamic> _$CampToJson(Camp instance) => <String, dynamic>{
      'CampName': instance.campName,
      'FarmId': instance.farmId,
      'ProtectedArea': instance.protectedArea,
      'CattlePostHousing': instance.cattlePostHousing,
      'Corridors': instance.corridors,
      'RoadAndFireBreaks': instance.roadAndFireBreaks,
      'PoachingAlleviationZone': instance.poachingAlleviationZone,
      'ConvertedToGrassland': instance.convertedToGrassland,
      'RangeLand': instance.rangeLand,
      'TotalArea': instance.totalArea,
      'InfestationCategory1': instance.infestationCategory1,
      'InfestationCategory2': instance.infestationCategory2,
      'InfestationCategory3': instance.infestationCategory3,
      'InfestationCategory4': instance.infestationCategory4,
      'InfestationCategory5': instance.infestationCategory5,
      'TotalRangeInfestation': instance.totalRangeInfestation,
      'InfestedWieghtedAverage': instance.infestedWieghtedAverage,
      'EstimatedBiomass': instance.estimatedBiomass,
      'TotalBiomass': instance.totalBiomass,
      'CumulativeBiomass': instance.cumulativeBiomass,
      'PlannedYearOfHarvest': instance.plannedYearOfHarvest,
      'ActualYearOfHarvest': instance.actualYearOfHarvest,
      'TonsOfCharcoalProduced': instance.tonsOfCharcoalProduced,
      'EstimatedBiomassRemoved': instance.estimatedBiomassRemoved,
      'Variance': instance.variance,
      'CampOrder': instance.campOrder,
      'IsActive': instance.isActive,
      'CreateDT': instance.createDT?.toIso8601String(),
      'UpdateDT': instance.updateDT?.toIso8601String(),
    };
