// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rte_species.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRteSpeciesCollection on Isar {
  IsarCollection<RteSpecies> get rteSpecies => this.collection();
}

const RteSpeciesSchema = CollectionSchema(
  name: r'RteSpecies',
  id: -7441854284661427981,
  properties: {
    r'campId': PropertySchema(
      id: 0,
      name: r'campId',
      type: IsarType.long,
    ),
    r'campName': PropertySchema(
      id: 1,
      name: r'campName',
      type: IsarType.string,
    ),
    r'carClosed': PropertySchema(
      id: 2,
      name: r'carClosed',
      type: IsarType.bool,
    ),
    r'carRaised': PropertySchema(
      id: 3,
      name: r'carRaised',
      type: IsarType.bool,
    ),
    r'commonName': PropertySchema(
      id: 4,
      name: r'commonName',
      type: IsarType.string,
    ),
    r'dateSpotted': PropertySchema(
      id: 5,
      name: r'dateSpotted',
      type: IsarType.string,
    ),
    r'generalComments': PropertySchema(
      id: 6,
      name: r'generalComments',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 7,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 8,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 9,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 10,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'location': PropertySchema(
      id: 11,
      name: r'location',
      type: IsarType.string,
    ),
    r'longitude': PropertySchema(
      id: 12,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'rteSpeciesId': PropertySchema(
      id: 13,
      name: r'rteSpeciesId',
      type: IsarType.long,
    ),
    r'scientificName': PropertySchema(
      id: 14,
      name: r'scientificName',
      type: IsarType.string,
    ),
    r'speciesRange': PropertySchema(
      id: 15,
      name: r'speciesRange',
      type: IsarType.string,
    ),
    r'speciesRangeId': PropertySchema(
      id: 16,
      name: r'speciesRangeId',
      type: IsarType.long,
    ),
    r'speciesType': PropertySchema(
      id: 17,
      name: r'speciesType',
      type: IsarType.string,
    ),
    r'speciesTypeId': PropertySchema(
      id: 18,
      name: r'speciesTypeId',
      type: IsarType.long,
    )
  },
  estimateSize: _rteSpeciesEstimateSize,
  serialize: _rteSpeciesSerialize,
  deserialize: _rteSpeciesDeserialize,
  deserializeProp: _rteSpeciesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _rteSpeciesGetId,
  getLinks: _rteSpeciesGetLinks,
  attach: _rteSpeciesAttach,
  version: '3.0.5',
);

int _rteSpeciesEstimateSize(
  RteSpecies object,
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
    final value = object.commonName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateSpotted;
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
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
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
    final value = object.speciesRange;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.speciesType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rteSpeciesSerialize(
  RteSpecies object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.campId);
  writer.writeString(offsets[1], object.campName);
  writer.writeBool(offsets[2], object.carClosed);
  writer.writeBool(offsets[3], object.carRaised);
  writer.writeString(offsets[4], object.commonName);
  writer.writeString(offsets[5], object.dateSpotted);
  writer.writeString(offsets[6], object.generalComments);
  writer.writeString(offsets[7], object.imagePath);
  writer.writeBool(offsets[8], object.isActive);
  writer.writeBool(offsets[9], object.isLocal);
  writer.writeDouble(offsets[10], object.latitude);
  writer.writeString(offsets[11], object.location);
  writer.writeDouble(offsets[12], object.longitude);
  writer.writeLong(offsets[13], object.rteSpeciesId);
  writer.writeString(offsets[14], object.scientificName);
  writer.writeString(offsets[15], object.speciesRange);
  writer.writeLong(offsets[16], object.speciesRangeId);
  writer.writeString(offsets[17], object.speciesType);
  writer.writeLong(offsets[18], object.speciesTypeId);
}

RteSpecies _rteSpeciesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RteSpecies(
    campId: reader.readLongOrNull(offsets[0]),
    campName: reader.readStringOrNull(offsets[1]),
    carClosed: reader.readBoolOrNull(offsets[2]),
    carRaised: reader.readBoolOrNull(offsets[3]),
    commonName: reader.readStringOrNull(offsets[4]),
    dateSpotted: reader.readStringOrNull(offsets[5]),
    generalComments: reader.readStringOrNull(offsets[6]),
    imagePath: reader.readStringOrNull(offsets[7]),
    isActive: reader.readBoolOrNull(offsets[8]),
    isLocal: reader.readBoolOrNull(offsets[9]),
    latitude: reader.readDoubleOrNull(offsets[10]),
    location: reader.readStringOrNull(offsets[11]),
    longitude: reader.readDoubleOrNull(offsets[12]),
    rteSpeciesId: reader.readLongOrNull(offsets[13]),
    scientificName: reader.readStringOrNull(offsets[14]),
    speciesRange: reader.readStringOrNull(offsets[15]),
    speciesRangeId: reader.readLongOrNull(offsets[16]),
    speciesType: reader.readStringOrNull(offsets[17]),
    speciesTypeId: reader.readLongOrNull(offsets[18]),
  );
  return object;
}

P _rteSpeciesDeserializeProp<P>(
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
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rteSpeciesGetId(RteSpecies object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rteSpeciesGetLinks(RteSpecies object) {
  return [];
}

void _rteSpeciesAttach(IsarCollection<dynamic> col, Id id, RteSpecies object) {}

extension RteSpeciesQueryWhereSort
    on QueryBuilder<RteSpecies, RteSpecies, QWhere> {
  QueryBuilder<RteSpecies, RteSpecies, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RteSpeciesQueryWhere
    on QueryBuilder<RteSpecies, RteSpecies, QWhereClause> {
  QueryBuilder<RteSpecies, RteSpecies, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterWhereClause> idBetween(
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

extension RteSpeciesQueryFilter
    on QueryBuilder<RteSpecies, RteSpecies, QFilterCondition> {
  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'campId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      campIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'campId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'campId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'campId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'campId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'campName',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      campNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'campName',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campNameEqualTo(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      campNameGreaterThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campNameLessThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campNameBetween(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      campNameStartsWith(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campNameEndsWith(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'campName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> campNameMatches(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      campNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      campNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'campName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      carClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      carClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> carClosedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      carRaisedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      carRaisedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> carRaisedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaised',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commonName',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commonName',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> commonNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> commonNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commonName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> commonNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commonName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      commonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commonName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateSpotted',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateSpotted',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateSpotted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateSpotted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateSpotted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateSpotted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateSpotted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateSpotted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateSpotted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateSpotted',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateSpotted',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      dateSpottedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateSpotted',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsEqualTo(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsGreaterThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsLessThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsBetween(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsStartsWith(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsEndsWith(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'generalComments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      generalCommentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> imagePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      imagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> imagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> imagePathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> imagePathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> isLocalEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> latitudeLessThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> locationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> longitudeEqualTo(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> longitudeLessThan(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition> longitudeBetween(
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      rteSpeciesIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rteSpeciesId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      rteSpeciesIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rteSpeciesId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      rteSpeciesIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rteSpeciesId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      rteSpeciesIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rteSpeciesId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      rteSpeciesIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rteSpeciesId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      rteSpeciesIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rteSpeciesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      scientificNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      scientificNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
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

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      scientificNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      scientificNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scientificName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      scientificNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      scientificNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesRange',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesRange',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesRange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesRange',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesRange',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesRange',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesRange',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesRangeId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesRangeId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesRangeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesRangeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesRangeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesRangeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesRangeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesType',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesType',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesType',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesType',
        value: '',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speciesTypeId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speciesTypeId',
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterFilterCondition>
      speciesTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RteSpeciesQueryObject
    on QueryBuilder<RteSpecies, RteSpecies, QFilterCondition> {}

extension RteSpeciesQueryLinks
    on QueryBuilder<RteSpecies, RteSpecies, QFilterCondition> {}

extension RteSpeciesQuerySortBy
    on QueryBuilder<RteSpecies, RteSpecies, QSortBy> {
  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCampId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCampIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCampName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCampNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCommonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByCommonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByDateSpotted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateSpotted', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByDateSpottedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateSpotted', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy>
      sortByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByRteSpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByRteSpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy>
      sortByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortBySpeciesRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRange', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortBySpeciesRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRange', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortBySpeciesRangeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRangeId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy>
      sortBySpeciesRangeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRangeId', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortBySpeciesType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesType', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortBySpeciesTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesType', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortBySpeciesTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesTypeId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> sortBySpeciesTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesTypeId', Sort.desc);
    });
  }
}

extension RteSpeciesQuerySortThenBy
    on QueryBuilder<RteSpecies, RteSpecies, QSortThenBy> {
  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCampId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCampIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCampName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCampNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCommonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByCommonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commonName', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByDateSpotted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateSpotted', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByDateSpottedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateSpotted', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy>
      thenByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByRteSpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByRteSpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rteSpeciesId', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy>
      thenByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenBySpeciesRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRange', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenBySpeciesRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRange', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenBySpeciesRangeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRangeId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy>
      thenBySpeciesRangeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesRangeId', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenBySpeciesType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesType', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenBySpeciesTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesType', Sort.desc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenBySpeciesTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesTypeId', Sort.asc);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QAfterSortBy> thenBySpeciesTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesTypeId', Sort.desc);
    });
  }
}

extension RteSpeciesQueryWhereDistinct
    on QueryBuilder<RteSpecies, RteSpecies, QDistinct> {
  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByCampId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campId');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByCampName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosed');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaised');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByCommonName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commonName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByDateSpotted(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateSpotted', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByGeneralComments(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generalComments',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByRteSpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rteSpeciesId');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctByScientificName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scientificName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctBySpeciesRange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesRange', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctBySpeciesRangeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesRangeId');
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctBySpeciesType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RteSpecies, RteSpecies, QDistinct> distinctBySpeciesTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesTypeId');
    });
  }
}

extension RteSpeciesQueryProperty
    on QueryBuilder<RteSpecies, RteSpecies, QQueryProperty> {
  QueryBuilder<RteSpecies, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RteSpecies, int?, QQueryOperations> campIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campId');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> campNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campName');
    });
  }

  QueryBuilder<RteSpecies, bool?, QQueryOperations> carClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosed');
    });
  }

  QueryBuilder<RteSpecies, bool?, QQueryOperations> carRaisedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaised');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> commonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commonName');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> dateSpottedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateSpotted');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations>
      generalCommentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generalComments');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<RteSpecies, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RteSpecies, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<RteSpecies, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<RteSpecies, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<RteSpecies, int?, QQueryOperations> rteSpeciesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rteSpeciesId');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> scientificNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scientificName');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> speciesRangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesRange');
    });
  }

  QueryBuilder<RteSpecies, int?, QQueryOperations> speciesRangeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesRangeId');
    });
  }

  QueryBuilder<RteSpecies, String?, QQueryOperations> speciesTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesType');
    });
  }

  QueryBuilder<RteSpecies, int?, QQueryOperations> speciesTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesTypeId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RteSpecies _$$_RteSpeciesFromJson(Map<String, dynamic> json) =>
    _$_RteSpecies(
      rteSpeciesId: json['RteSpeciesId'] as int?,
      speciesType: json['SpeciesType'] as String?,
      speciesTypeId: json['SpeciesTypeId'] as int?,
      commonName: json['CommonName'] as String?,
      scientificName: json['ScientificName'] as String?,
      speciesRange: json['SpeciesRange'] as String?,
      speciesRangeId: json['SpeciesRangeId'] as int?,
      campName: json['CampName'] as String?,
      campId: json['CampId'] as int?,
      dateSpotted: json['DateSpotted'] as String?,
      location: json['Location'] as String?,
      latitude: (json['Latitude'] as num?)?.toDouble(),
      longitude: (json['Longitude'] as num?)?.toDouble(),
      imagePath: json['ImagePath'] as String?,
      generalComments: json['GeneralComments'] as String?,
      carRaised: json['CarRaised'] as bool? ?? false,
      carClosed: json['CarClosed'] as bool? ?? false,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_RteSpeciesToJson(_$_RteSpecies instance) =>
    <String, dynamic>{
      'RteSpeciesId': instance.rteSpeciesId,
      'SpeciesType': instance.speciesType,
      'SpeciesTypeId': instance.speciesTypeId,
      'CommonName': instance.commonName,
      'ScientificName': instance.scientificName,
      'SpeciesRange': instance.speciesRange,
      'SpeciesRangeId': instance.speciesRangeId,
      'CampName': instance.campName,
      'CampId': instance.campId,
      'DateSpotted': instance.dateSpotted,
      'Location': instance.location,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'ImagePath': instance.imagePath,
      'GeneralComments': instance.generalComments,
      'CarRaised': instance.carRaised,
      'CarClosed': instance.carClosed,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
