// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_management.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFireManagementCollection on Isar {
  IsarCollection<FireManagement> get fireManagements => this.collection();
}

const FireManagementSchema = CollectionSchema(
  name: r'FireManagement',
  id: 7727530945574817236,
  properties: {
    r'areaBurnt': PropertySchema(
      id: 0,
      name: r'areaBurnt',
      type: IsarType.double,
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
    r'commercialAreaLoss': PropertySchema(
      id: 3,
      name: r'commercialAreaLoss',
      type: IsarType.double,
    ),
    r'dateDetected': PropertySchema(
      id: 4,
      name: r'dateDetected',
      type: IsarType.string,
    ),
    r'dateExtinguished': PropertySchema(
      id: 5,
      name: r'dateExtinguished',
      type: IsarType.string,
    ),
    r'fireCause': PropertySchema(
      id: 6,
      name: r'fireCause',
      type: IsarType.string,
    ),
    r'fireCauseId': PropertySchema(
      id: 7,
      name: r'fireCauseId',
      type: IsarType.long,
    ),
    r'fireManagementId': PropertySchema(
      id: 8,
      name: r'fireManagementId',
      type: IsarType.long,
    ),
    r'generalComments': PropertySchema(
      id: 9,
      name: r'generalComments',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 10,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 11,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 12,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 13,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 14,
      name: r'longitude',
      type: IsarType.double,
    )
  },
  estimateSize: _fireManagementEstimateSize,
  serialize: _fireManagementSerialize,
  deserialize: _fireManagementDeserialize,
  deserializeProp: _fireManagementDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _fireManagementGetId,
  getLinks: _fireManagementGetLinks,
  attach: _fireManagementAttach,
  version: '3.1.0',
);

int _fireManagementEstimateSize(
  FireManagement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dateDetected;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateExtinguished;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fireCause;
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
  return bytesCount;
}

void _fireManagementSerialize(
  FireManagement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.areaBurnt);
  writer.writeBool(offsets[1], object.carClosed);
  writer.writeBool(offsets[2], object.carRaised);
  writer.writeDouble(offsets[3], object.commercialAreaLoss);
  writer.writeString(offsets[4], object.dateDetected);
  writer.writeString(offsets[5], object.dateExtinguished);
  writer.writeString(offsets[6], object.fireCause);
  writer.writeLong(offsets[7], object.fireCauseId);
  writer.writeLong(offsets[8], object.fireManagementId);
  writer.writeString(offsets[9], object.generalComments);
  writer.writeString(offsets[10], object.imagePath);
  writer.writeBool(offsets[11], object.isActive);
  writer.writeBool(offsets[12], object.isLocal);
  writer.writeDouble(offsets[13], object.latitude);
  writer.writeDouble(offsets[14], object.longitude);
}

FireManagement _fireManagementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FireManagement(
    areaBurnt: reader.readDoubleOrNull(offsets[0]),
    carClosed: reader.readBoolOrNull(offsets[1]),
    carRaised: reader.readBoolOrNull(offsets[2]),
    commercialAreaLoss: reader.readDoubleOrNull(offsets[3]),
    dateDetected: reader.readStringOrNull(offsets[4]),
    dateExtinguished: reader.readStringOrNull(offsets[5]),
    fireCause: reader.readStringOrNull(offsets[6]),
    fireCauseId: reader.readLongOrNull(offsets[7]),
    fireManagementId: reader.readLongOrNull(offsets[8]),
    generalComments: reader.readStringOrNull(offsets[9]),
    imagePath: reader.readStringOrNull(offsets[10]),
    isActive: reader.readBoolOrNull(offsets[11]),
    isLocal: reader.readBoolOrNull(offsets[12]),
    latitude: reader.readDoubleOrNull(offsets[13]),
    longitude: reader.readDoubleOrNull(offsets[14]),
  );
  return object;
}

P _fireManagementDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fireManagementGetId(FireManagement object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fireManagementGetLinks(FireManagement object) {
  return [];
}

void _fireManagementAttach(
    IsarCollection<dynamic> col, Id id, FireManagement object) {}

extension FireManagementQueryWhereSort
    on QueryBuilder<FireManagement, FireManagement, QWhere> {
  QueryBuilder<FireManagement, FireManagement, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FireManagementQueryWhere
    on QueryBuilder<FireManagement, FireManagement, QWhereClause> {
  QueryBuilder<FireManagement, FireManagement, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FireManagement, FireManagement, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterWhereClause> idBetween(
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

extension FireManagementQueryFilter
    on QueryBuilder<FireManagement, FireManagement, QFilterCondition> {
  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      areaBurntIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'areaBurnt',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      areaBurntIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'areaBurnt',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      areaBurntEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaBurnt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      areaBurntGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'areaBurnt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      areaBurntLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'areaBurnt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      areaBurntBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'areaBurnt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      carClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      carClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      carClosedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      carRaisedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      carRaisedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      carRaisedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaised',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      commercialAreaLossIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commercialAreaLoss',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      commercialAreaLossIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commercialAreaLoss',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      commercialAreaLossEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commercialAreaLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      commercialAreaLossGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commercialAreaLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      commercialAreaLossLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commercialAreaLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      commercialAreaLossBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commercialAreaLoss',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateDetected',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateDetected',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateDetected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateDetected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateDetected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateDetected',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateDetected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateDetected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateDetected',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateDetected',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateDetected',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateDetectedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateDetected',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateExtinguished',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateExtinguished',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateExtinguished',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateExtinguished',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateExtinguished',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateExtinguished',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateExtinguished',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateExtinguished',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateExtinguished',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateExtinguished',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateExtinguished',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      dateExtinguishedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateExtinguished',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fireCause',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fireCause',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fireCause',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fireCause',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fireCause',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fireCause',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fireCause',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fireCause',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fireCause',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fireCause',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fireCause',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fireCause',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fireCauseId',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fireCauseId',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fireCauseId',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fireCauseId',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fireCauseId',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireCauseIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fireCauseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireManagementIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fireManagementId',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireManagementIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fireManagementId',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireManagementIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fireManagementId',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireManagementIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fireManagementId',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireManagementIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fireManagementId',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      fireManagementIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fireManagementId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      generalCommentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      generalCommentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      generalCommentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      generalCommentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'generalComments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      generalCommentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      generalCommentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imagePath',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathEqualTo(
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathLessThan(
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathBetween(
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathEndsWith(
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      latitudeEqualTo(
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      latitudeBetween(
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

  QueryBuilder<FireManagement, FireManagement, QAfterFilterCondition>
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

extension FireManagementQueryObject
    on QueryBuilder<FireManagement, FireManagement, QFilterCondition> {}

extension FireManagementQueryLinks
    on QueryBuilder<FireManagement, FireManagement, QFilterCondition> {}

extension FireManagementQuerySortBy
    on QueryBuilder<FireManagement, FireManagement, QSortBy> {
  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByAreaBurnt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaBurnt', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByAreaBurntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaBurnt', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByCommercialAreaLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commercialAreaLoss', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByCommercialAreaLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commercialAreaLoss', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByDateDetected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateDetected', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByDateDetectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateDetected', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByDateExtinguished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExtinguished', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByDateExtinguishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExtinguished', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByFireCause() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCause', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByFireCauseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCause', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByFireCauseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCauseId', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByFireCauseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCauseId', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByFireManagementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireManagementId', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByFireManagementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireManagementId', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension FireManagementQuerySortThenBy
    on QueryBuilder<FireManagement, FireManagement, QSortThenBy> {
  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByAreaBurnt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaBurnt', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByAreaBurntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaBurnt', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByCommercialAreaLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commercialAreaLoss', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByCommercialAreaLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commercialAreaLoss', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByDateDetected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateDetected', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByDateDetectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateDetected', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByDateExtinguished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExtinguished', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByDateExtinguishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateExtinguished', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByFireCause() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCause', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByFireCauseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCause', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByFireCauseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCauseId', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByFireCauseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireCauseId', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByFireManagementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireManagementId', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByFireManagementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fireManagementId', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QAfterSortBy>
      thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension FireManagementQueryWhereDistinct
    on QueryBuilder<FireManagement, FireManagement, QDistinct> {
  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByAreaBurnt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'areaBurnt');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosed');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaised');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByCommercialAreaLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commercialAreaLoss');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByDateDetected({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateDetected', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByDateExtinguished({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateExtinguished',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct> distinctByFireCause(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fireCause', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByFireCauseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fireCauseId');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByFireManagementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fireManagementId');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByGeneralComments({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generalComments',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct> distinctByImagePath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<FireManagement, FireManagement, QDistinct>
      distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }
}

extension FireManagementQueryProperty
    on QueryBuilder<FireManagement, FireManagement, QQueryProperty> {
  QueryBuilder<FireManagement, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FireManagement, double?, QQueryOperations> areaBurntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areaBurnt');
    });
  }

  QueryBuilder<FireManagement, bool?, QQueryOperations> carClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosed');
    });
  }

  QueryBuilder<FireManagement, bool?, QQueryOperations> carRaisedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaised');
    });
  }

  QueryBuilder<FireManagement, double?, QQueryOperations>
      commercialAreaLossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commercialAreaLoss');
    });
  }

  QueryBuilder<FireManagement, String?, QQueryOperations>
      dateDetectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateDetected');
    });
  }

  QueryBuilder<FireManagement, String?, QQueryOperations>
      dateExtinguishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateExtinguished');
    });
  }

  QueryBuilder<FireManagement, String?, QQueryOperations> fireCauseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fireCause');
    });
  }

  QueryBuilder<FireManagement, int?, QQueryOperations> fireCauseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fireCauseId');
    });
  }

  QueryBuilder<FireManagement, int?, QQueryOperations>
      fireManagementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fireManagementId');
    });
  }

  QueryBuilder<FireManagement, String?, QQueryOperations>
      generalCommentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generalComments');
    });
  }

  QueryBuilder<FireManagement, String?, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<FireManagement, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FireManagement, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<FireManagement, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<FireManagement, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FireManagement _$$_FireManagementFromJson(Map<String, dynamic> json) =>
    _$_FireManagement(
      fireManagementId: json['FireManagementId'] as int?,
      fireCause: json['FireCause'] as String?,
      fireCauseId: json['FireCauseId'] as int?,
      dateDetected: json['DateDetected'] as String?,
      dateExtinguished: json['DateExtinguished'] as String?,
      areaBurnt: (json['AreaBurnt'] as num?)?.toDouble(),
      commercialAreaLoss: (json['CommercialAreaLoss'] as num?)?.toDouble(),
      latitude: (json['Latitude'] as num?)?.toDouble(),
      longitude: (json['Longitude'] as num?)?.toDouble(),
      generalComments: json['GeneralComments'] as String?,
      imagePath: json['ImagePath'] as String?,
      carRaised: json['CarRaised'] as bool? ?? false,
      carClosed: json['CarClosed'] as bool? ?? false,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_FireManagementToJson(_$_FireManagement instance) =>
    <String, dynamic>{
      'FireManagementId': instance.fireManagementId,
      'FireCause': instance.fireCause,
      'FireCauseId': instance.fireCauseId,
      'DateDetected': instance.dateDetected,
      'DateExtinguished': instance.dateExtinguished,
      'AreaBurnt': instance.areaBurnt,
      'CommercialAreaLoss': instance.commercialAreaLoss,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'GeneralComments': instance.generalComments,
      'ImagePath': instance.imagePath,
      'CarRaised': instance.carRaised,
      'CarClosed': instance.carClosed,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
