// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmCollection on Isar {
  IsarCollection<Farm> get farms => this.collection();
}

const FarmSchema = CollectionSchema(
  name: r'Farm',
  id: 7630401844282329995,
  properties: {
    r'canDelete': PropertySchema(
      id: 0,
      name: r'canDelete',
      type: IsarType.long,
    ),
    r'email': PropertySchema(
      id: 1,
      name: r'email',
      type: IsarType.string,
    ),
    r'farmId': PropertySchema(
      id: 2,
      name: r'farmId',
      type: IsarType.string,
    ),
    r'farmName': PropertySchema(
      id: 3,
      name: r'farmName',
      type: IsarType.string,
    ),
    r'farmSize': PropertySchema(
      id: 4,
      name: r'farmSize',
      type: IsarType.long,
    ),
    r'firstName': PropertySchema(
      id: 5,
      name: r'firstName',
      type: IsarType.string,
    ),
    r'groupSchemeId': PropertySchema(
      id: 6,
      name: r'groupSchemeId',
      type: IsarType.long,
    ),
    r'idNumber': PropertySchema(
      id: 7,
      name: r'idNumber',
      type: IsarType.string,
    ),
    r'improveAccessToFarmId': PropertySchema(
      id: 8,
      name: r'improveAccessToFarmId',
      type: IsarType.long,
    ),
    r'improveRangeLandId': PropertySchema(
      id: 9,
      name: r'improveRangeLandId',
      type: IsarType.long,
    ),
    r'inclusionDate': PropertySchema(
      id: 10,
      name: r'inclusionDate',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 11,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isChemicalsUsed': PropertySchema(
      id: 12,
      name: r'isChemicalsUsed',
      type: IsarType.bool,
    ),
    r'isCommunitiesNeighbouring': PropertySchema(
      id: 13,
      name: r'isCommunitiesNeighbouring',
      type: IsarType.bool,
    ),
    r'isEcosystemsServicesOffered': PropertySchema(
      id: 14,
      name: r'isEcosystemsServicesOffered',
      type: IsarType.bool,
    ),
    r'isGroupSchemeMember': PropertySchema(
      id: 15,
      name: r'isGroupSchemeMember',
      type: IsarType.bool,
    ),
    r'isHcvNeighbouring': PropertySchema(
      id: 16,
      name: r'isHcvNeighbouring',
      type: IsarType.bool,
    ),
    r'isIndigenousNeighbouring': PropertySchema(
      id: 17,
      name: r'isIndigenousNeighbouring',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 18,
      name: r'isLocal',
      type: IsarType.long,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 19,
      name: r'isMasterDataSynced',
      type: IsarType.long,
    ),
    r'isProspectMember': PropertySchema(
      id: 20,
      name: r'isProspectMember',
      type: IsarType.bool,
    ),
    r'isRiversOrStreamsNeighbouring': PropertySchema(
      id: 21,
      name: r'isRiversOrStreamsNeighbouring',
      type: IsarType.bool,
    ),
    r'isSlimfCompliant': PropertySchema(
      id: 22,
      name: r'isSlimfCompliant',
      type: IsarType.bool,
    ),
    r'lastName': PropertySchema(
      id: 23,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'latitude': PropertySchema(
      id: 24,
      name: r'latitude',
      type: IsarType.long,
    ),
    r'longitude': PropertySchema(
      id: 25,
      name: r'longitude',
      type: IsarType.long,
    ),
    r'manageResourcesSustainablyId': PropertySchema(
      id: 26,
      name: r'manageResourcesSustainablyId',
      type: IsarType.long,
    ),
    r'mobileNumber': PropertySchema(
      id: 27,
      name: r'mobileNumber',
      type: IsarType.string,
    ),
    r'objectiveAnswers': PropertySchema(
      id: 28,
      name: r'objectiveAnswers',
      type: IsarType.objectList,
      target: r'FarmMemberObjectiveAnswer',
    ),
    r'produceFscCertifiedCharcoalCostEffectivelyId': PropertySchema(
      id: 29,
      name: r'produceFscCertifiedCharcoalCostEffectivelyId',
      type: IsarType.long,
    ),
    r'propertyOwnershipTypeId': PropertySchema(
      id: 30,
      name: r'propertyOwnershipTypeId',
      type: IsarType.long,
    ),
    r'protectedRteDuringOperationId': PropertySchema(
      id: 31,
      name: r'protectedRteDuringOperationId',
      type: IsarType.long,
    ),
    r'province': PropertySchema(
      id: 32,
      name: r'province',
      type: IsarType.string,
    ),
    r'regionalManagerUnitId': PropertySchema(
      id: 33,
      name: r'regionalManagerUnitId',
      type: IsarType.long,
    ),
    r'restoreBushveldId': PropertySchema(
      id: 34,
      name: r'restoreBushveldId',
      type: IsarType.long,
    ),
    r'riskProfileAnswers': PropertySchema(
      id: 35,
      name: r'riskProfileAnswers',
      type: IsarType.objectList,
      target: r'FarmMemberRiskProfileAnswer',
    ),
    r'signatureDate': PropertySchema(
      id: 36,
      name: r'signatureDate',
      type: IsarType.string,
    ),
    r'signatureImage': PropertySchema(
      id: 37,
      name: r'signatureImage',
      type: IsarType.string,
    ),
    r'signaturePoints': PropertySchema(
      id: 38,
      name: r'signaturePoints',
      type: IsarType.string,
    ),
    r'streetName': PropertySchema(
      id: 39,
      name: r'streetName',
      type: IsarType.string,
    ),
    r'streetNumber': PropertySchema(
      id: 40,
      name: r'streetNumber',
      type: IsarType.long,
    ),
    r'town': PropertySchema(
      id: 41,
      name: r'town',
      type: IsarType.string,
    )
  },
  estimateSize: _farmEstimateSize,
  serialize: _farmSerialize,
  deserialize: _farmDeserialize,
  deserializeProp: _farmDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'FarmMemberObjectiveAnswer': FarmMemberObjectiveAnswerSchema,
    r'FarmMemberRiskProfileAnswer': FarmMemberRiskProfileAnswerSchema
  },
  getId: _farmGetId,
  getLinks: _farmGetLinks,
  attach: _farmAttach,
  version: '3.0.5',
);

int _farmEstimateSize(
  Farm object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.farmId.length * 3;
  {
    final value = object.farmName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.inclusionDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mobileNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.objectiveAnswers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FarmMemberObjectiveAnswer]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += FarmMemberObjectiveAnswerSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.province;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.riskProfileAnswers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[FarmMemberRiskProfileAnswer]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += FarmMemberRiskProfileAnswerSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.signatureDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.signatureImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.signaturePoints;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.streetName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.town;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmSerialize(
  Farm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.canDelete);
  writer.writeString(offsets[1], object.email);
  writer.writeString(offsets[2], object.farmId);
  writer.writeString(offsets[3], object.farmName);
  writer.writeLong(offsets[4], object.farmSize);
  writer.writeString(offsets[5], object.firstName);
  writer.writeLong(offsets[6], object.groupSchemeId);
  writer.writeString(offsets[7], object.idNumber);
  writer.writeLong(offsets[8], object.improveAccessToFarmId);
  writer.writeLong(offsets[9], object.improveRangeLandId);
  writer.writeString(offsets[10], object.inclusionDate);
  writer.writeBool(offsets[11], object.isActive);
  writer.writeBool(offsets[12], object.isChemicalsUsed);
  writer.writeBool(offsets[13], object.isCommunitiesNeighbouring);
  writer.writeBool(offsets[14], object.isEcosystemsServicesOffered);
  writer.writeBool(offsets[15], object.isGroupSchemeMember);
  writer.writeBool(offsets[16], object.isHcvNeighbouring);
  writer.writeBool(offsets[17], object.isIndigenousNeighbouring);
  writer.writeLong(offsets[18], object.isLocal);
  writer.writeLong(offsets[19], object.isMasterDataSynced);
  writer.writeBool(offsets[20], object.isProspectMember);
  writer.writeBool(offsets[21], object.isRiversOrStreamsNeighbouring);
  writer.writeBool(offsets[22], object.isSlimfCompliant);
  writer.writeString(offsets[23], object.lastName);
  writer.writeLong(offsets[24], object.latitude);
  writer.writeLong(offsets[25], object.longitude);
  writer.writeLong(offsets[26], object.manageResourcesSustainablyId);
  writer.writeString(offsets[27], object.mobileNumber);
  writer.writeObjectList<FarmMemberObjectiveAnswer>(
    offsets[28],
    allOffsets,
    FarmMemberObjectiveAnswerSchema.serialize,
    object.objectiveAnswers,
  );
  writer.writeLong(
      offsets[29], object.produceFscCertifiedCharcoalCostEffectivelyId);
  writer.writeLong(offsets[30], object.propertyOwnershipTypeId);
  writer.writeLong(offsets[31], object.protectedRteDuringOperationId);
  writer.writeString(offsets[32], object.province);
  writer.writeLong(offsets[33], object.regionalManagerUnitId);
  writer.writeLong(offsets[34], object.restoreBushveldId);
  writer.writeObjectList<FarmMemberRiskProfileAnswer>(
    offsets[35],
    allOffsets,
    FarmMemberRiskProfileAnswerSchema.serialize,
    object.riskProfileAnswers,
  );
  writer.writeString(offsets[36], object.signatureDate);
  writer.writeString(offsets[37], object.signatureImage);
  writer.writeString(offsets[38], object.signaturePoints);
  writer.writeString(offsets[39], object.streetName);
  writer.writeLong(offsets[40], object.streetNumber);
  writer.writeString(offsets[41], object.town);
}

Farm _farmDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Farm(
    canDelete: reader.readLongOrNull(offsets[0]),
    email: reader.readStringOrNull(offsets[1]),
    farmId: reader.readString(offsets[2]),
    farmName: reader.readStringOrNull(offsets[3]),
    farmSize: reader.readLongOrNull(offsets[4]),
    firstName: reader.readStringOrNull(offsets[5]),
    groupSchemeId: reader.readLongOrNull(offsets[6]),
    idNumber: reader.readStringOrNull(offsets[7]),
    improveAccessToFarmId: reader.readLongOrNull(offsets[8]),
    improveRangeLandId: reader.readLongOrNull(offsets[9]),
    inclusionDate: reader.readStringOrNull(offsets[10]),
    isActive: reader.readBoolOrNull(offsets[11]),
    isChemicalsUsed: reader.readBoolOrNull(offsets[12]),
    isCommunitiesNeighbouring: reader.readBoolOrNull(offsets[13]),
    isEcosystemsServicesOffered: reader.readBoolOrNull(offsets[14]),
    isGroupSchemeMember: reader.readBoolOrNull(offsets[15]),
    isHcvNeighbouring: reader.readBoolOrNull(offsets[16]),
    isIndigenousNeighbouring: reader.readBoolOrNull(offsets[17]),
    isLocal: reader.readLongOrNull(offsets[18]),
    isMasterDataSynced: reader.readLongOrNull(offsets[19]),
    isProspectMember: reader.readBoolOrNull(offsets[20]),
    isRiversOrStreamsNeighbouring: reader.readBoolOrNull(offsets[21]),
    isSlimfCompliant: reader.readBoolOrNull(offsets[22]),
    lastName: reader.readStringOrNull(offsets[23]),
    latitude: reader.readLongOrNull(offsets[24]),
    longitude: reader.readLongOrNull(offsets[25]),
    manageResourcesSustainablyId: reader.readLongOrNull(offsets[26]),
    mobileNumber: reader.readStringOrNull(offsets[27]),
    objectiveAnswers: reader.readObjectList<FarmMemberObjectiveAnswer>(
      offsets[28],
      FarmMemberObjectiveAnswerSchema.deserialize,
      allOffsets,
      FarmMemberObjectiveAnswer(),
    ),
    produceFscCertifiedCharcoalCostEffectivelyId:
        reader.readLongOrNull(offsets[29]),
    propertyOwnershipTypeId: reader.readLongOrNull(offsets[30]),
    protectedRteDuringOperationId: reader.readLongOrNull(offsets[31]),
    province: reader.readStringOrNull(offsets[32]),
    regionalManagerUnitId: reader.readLongOrNull(offsets[33]),
    restoreBushveldId: reader.readLongOrNull(offsets[34]),
    riskProfileAnswers: reader.readObjectList<FarmMemberRiskProfileAnswer>(
      offsets[35],
      FarmMemberRiskProfileAnswerSchema.deserialize,
      allOffsets,
      FarmMemberRiskProfileAnswer(),
    ),
    signatureDate: reader.readStringOrNull(offsets[36]),
    signatureImage: reader.readStringOrNull(offsets[37]),
    signaturePoints: reader.readStringOrNull(offsets[38]),
    streetName: reader.readStringOrNull(offsets[39]),
    streetNumber: reader.readLongOrNull(offsets[40]),
    town: reader.readStringOrNull(offsets[41]),
  );
  return object;
}

P _farmDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset)) as P;
    case 14:
      return (reader.readBoolOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readBoolOrNull(offset)) as P;
    case 17:
      return (reader.readBoolOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readBoolOrNull(offset)) as P;
    case 21:
      return (reader.readBoolOrNull(offset)) as P;
    case 22:
      return (reader.readBoolOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readObjectList<FarmMemberObjectiveAnswer>(
        offset,
        FarmMemberObjectiveAnswerSchema.deserialize,
        allOffsets,
        FarmMemberObjectiveAnswer(),
      )) as P;
    case 29:
      return (reader.readLongOrNull(offset)) as P;
    case 30:
      return (reader.readLongOrNull(offset)) as P;
    case 31:
      return (reader.readLongOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readLongOrNull(offset)) as P;
    case 34:
      return (reader.readLongOrNull(offset)) as P;
    case 35:
      return (reader.readObjectList<FarmMemberRiskProfileAnswer>(
        offset,
        FarmMemberRiskProfileAnswerSchema.deserialize,
        allOffsets,
        FarmMemberRiskProfileAnswer(),
      )) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
    case 38:
      return (reader.readStringOrNull(offset)) as P;
    case 39:
      return (reader.readStringOrNull(offset)) as P;
    case 40:
      return (reader.readLongOrNull(offset)) as P;
    case 41:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmGetId(Farm object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmGetLinks(Farm object) {
  return [];
}

void _farmAttach(IsarCollection<dynamic> col, Id id, Farm object) {}

extension FarmQueryWhereSort on QueryBuilder<Farm, Farm, QWhere> {
  QueryBuilder<Farm, Farm, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmQueryWhere on QueryBuilder<Farm, Farm, QWhereClause> {
  QueryBuilder<Farm, Farm, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Farm, Farm, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterWhereClause> idBetween(
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

extension FarmQueryFilter on QueryBuilder<Farm, Farm, QFilterCondition> {
  QueryBuilder<Farm, Farm, QAfterFilterCondition> canDeleteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'canDelete',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> canDeleteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'canDelete',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> canDeleteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> canDeleteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> canDeleteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canDelete',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> canDeleteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canDelete',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdEqualTo(
    String value, {
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdGreaterThan(
    String value, {
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdLessThan(
    String value, {
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdStartsWith(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdEndsWith(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmSize',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmSize',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmSize',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmSize',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmSize',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> farmSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> firstNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> groupSchemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> groupSchemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupSchemeId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> groupSchemeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupSchemeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> groupSchemeIdGreaterThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> groupSchemeIdLessThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> groupSchemeIdBetween(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idNumber',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> idNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      improveAccessToFarmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'improveAccessToFarmId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      improveAccessToFarmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'improveAccessToFarmId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveAccessToFarmIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'improveAccessToFarmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      improveAccessToFarmIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'improveAccessToFarmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveAccessToFarmIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'improveAccessToFarmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveAccessToFarmIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'improveAccessToFarmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveRangeLandIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'improveRangeLandId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      improveRangeLandIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'improveRangeLandId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveRangeLandIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'improveRangeLandId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveRangeLandIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'improveRangeLandId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveRangeLandIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'improveRangeLandId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> improveRangeLandIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'improveRangeLandId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inclusionDate',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inclusionDate',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inclusionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inclusionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inclusionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inclusionDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inclusionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inclusionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inclusionDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inclusionDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inclusionDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> inclusionDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inclusionDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isChemicalsUsedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isChemicalsUsed',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isChemicalsUsedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isChemicalsUsed',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isChemicalsUsedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isChemicalsUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isCommunitiesNeighbouringIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCommunitiesNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isCommunitiesNeighbouringIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCommunitiesNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isCommunitiesNeighbouringEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCommunitiesNeighbouring',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isEcosystemsServicesOfferedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEcosystemsServicesOffered',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isEcosystemsServicesOfferedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEcosystemsServicesOffered',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isEcosystemsServicesOfferedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEcosystemsServicesOffered',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isGroupSchemeMemberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isGroupSchemeMember',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isGroupSchemeMemberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isGroupSchemeMember',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isGroupSchemeMemberEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isGroupSchemeMember',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isHcvNeighbouringIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isHcvNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isHcvNeighbouringIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isHcvNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isHcvNeighbouringEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHcvNeighbouring',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isIndigenousNeighbouringIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isIndigenousNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isIndigenousNeighbouringIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isIndigenousNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isIndigenousNeighbouringEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isIndigenousNeighbouring',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isLocalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isLocalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isLocalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isLocalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isLocal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isMasterDataSyncedEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isMasterDataSyncedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isMasterDataSyncedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isMasterDataSyncedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isMasterDataSynced',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isProspectMemberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isProspectMember',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isProspectMemberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isProspectMember',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isProspectMemberEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isProspectMember',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isRiversOrStreamsNeighbouringIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isRiversOrStreamsNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isRiversOrStreamsNeighbouringIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isRiversOrStreamsNeighbouring',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      isRiversOrStreamsNeighbouringEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRiversOrStreamsNeighbouring',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isSlimfCompliantIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isSlimfCompliant',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isSlimfCompliantIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isSlimfCompliant',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> isSlimfCompliantEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSlimfCompliant',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> latitudeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> latitudeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> latitudeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> latitudeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> longitudeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> longitudeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> longitudeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> longitudeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      manageResourcesSustainablyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'manageResourcesSustainablyId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      manageResourcesSustainablyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'manageResourcesSustainablyId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      manageResourcesSustainablyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'manageResourcesSustainablyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      manageResourcesSustainablyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'manageResourcesSustainablyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      manageResourcesSustainablyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'manageResourcesSustainablyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      manageResourcesSustainablyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'manageResourcesSustainablyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mobileNumber',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mobileNumber',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobileNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mobileNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mobileNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mobileNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mobileNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mobileNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mobileNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mobileNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mobileNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> mobileNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mobileNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> objectiveAnswersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'objectiveAnswers',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> objectiveAnswersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'objectiveAnswers',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> objectiveAnswersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'objectiveAnswers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> objectiveAnswersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'objectiveAnswers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> objectiveAnswersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'objectiveAnswers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      objectiveAnswersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'objectiveAnswers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      objectiveAnswersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'objectiveAnswers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> objectiveAnswersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'objectiveAnswers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      produceFscCertifiedCharcoalCostEffectivelyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'produceFscCertifiedCharcoalCostEffectivelyId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      produceFscCertifiedCharcoalCostEffectivelyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'produceFscCertifiedCharcoalCostEffectivelyId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      produceFscCertifiedCharcoalCostEffectivelyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'produceFscCertifiedCharcoalCostEffectivelyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      produceFscCertifiedCharcoalCostEffectivelyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'produceFscCertifiedCharcoalCostEffectivelyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      produceFscCertifiedCharcoalCostEffectivelyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'produceFscCertifiedCharcoalCostEffectivelyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      produceFscCertifiedCharcoalCostEffectivelyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'produceFscCertifiedCharcoalCostEffectivelyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      propertyOwnershipTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'propertyOwnershipTypeId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      propertyOwnershipTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'propertyOwnershipTypeId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      propertyOwnershipTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'propertyOwnershipTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      propertyOwnershipTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'propertyOwnershipTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      propertyOwnershipTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'propertyOwnershipTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      propertyOwnershipTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'propertyOwnershipTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      protectedRteDuringOperationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'protectedRteDuringOperationId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      protectedRteDuringOperationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'protectedRteDuringOperationId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      protectedRteDuringOperationIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protectedRteDuringOperationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      protectedRteDuringOperationIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protectedRteDuringOperationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      protectedRteDuringOperationIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protectedRteDuringOperationId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      protectedRteDuringOperationIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protectedRteDuringOperationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'province',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'province',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'province',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'province',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> provinceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      regionalManagerUnitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      regionalManagerUnitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'regionalManagerUnitId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> regionalManagerUnitIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regionalManagerUnitId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> regionalManagerUnitIdLessThan(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> regionalManagerUnitIdBetween(
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

  QueryBuilder<Farm, Farm, QAfterFilterCondition> restoreBushveldIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'restoreBushveldId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> restoreBushveldIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'restoreBushveldId',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> restoreBushveldIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restoreBushveldId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> restoreBushveldIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restoreBushveldId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> restoreBushveldIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restoreBushveldId',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> restoreBushveldIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restoreBushveldId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> riskProfileAnswersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'riskProfileAnswers',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      riskProfileAnswersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'riskProfileAnswers',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      riskProfileAnswersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'riskProfileAnswers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> riskProfileAnswersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'riskProfileAnswers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      riskProfileAnswersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'riskProfileAnswers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      riskProfileAnswersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'riskProfileAnswers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      riskProfileAnswersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'riskProfileAnswers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition>
      riskProfileAnswersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'riskProfileAnswers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'signatureDate',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'signatureDate',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signatureDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signatureDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signatureDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signatureDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'signatureDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'signatureDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'signatureDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'signatureDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signatureDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'signatureDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'signatureImage',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'signatureImage',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signatureImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signatureImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signatureImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signatureImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'signatureImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'signatureImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'signatureImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'signatureImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signatureImage',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signatureImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'signatureImage',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'signaturePoints',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'signaturePoints',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signaturePoints',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signaturePoints',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signaturePoints',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signaturePoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'signaturePoints',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'signaturePoints',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'signaturePoints',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'signaturePoints',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signaturePoints',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> signaturePointsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'signaturePoints',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'streetName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'streetName',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'streetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'streetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'streetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'streetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streetName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'streetName',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'streetNumber',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'streetNumber',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNumberEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streetNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streetNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streetNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> streetNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streetNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'town',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'town',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'town',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'town',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'town',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'town',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'town',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'town',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'town',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'town',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'town',
        value: '',
      ));
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> townIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'town',
        value: '',
      ));
    });
  }
}

extension FarmQueryObject on QueryBuilder<Farm, Farm, QFilterCondition> {
  QueryBuilder<Farm, Farm, QAfterFilterCondition> objectiveAnswersElement(
      FilterQuery<FarmMemberObjectiveAnswer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'objectiveAnswers');
    });
  }

  QueryBuilder<Farm, Farm, QAfterFilterCondition> riskProfileAnswersElement(
      FilterQuery<FarmMemberRiskProfileAnswer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'riskProfileAnswers');
    });
  }
}

extension FarmQueryLinks on QueryBuilder<Farm, Farm, QFilterCondition> {}

extension FarmQuerySortBy on QueryBuilder<Farm, Farm, QSortBy> {
  QueryBuilder<Farm, Farm, QAfterSortBy> sortByCanDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByCanDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmSize', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFarmSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmSize', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByImproveAccessToFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveAccessToFarmId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByImproveAccessToFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveAccessToFarmId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByImproveRangeLandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveRangeLandId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByImproveRangeLandIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveRangeLandId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByInclusionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inclusionDate', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByInclusionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inclusionDate', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsChemicalsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChemicalsUsed', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsChemicalsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChemicalsUsed', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsCommunitiesNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommunitiesNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsCommunitiesNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommunitiesNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsEcosystemsServicesOffered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEcosystemsServicesOffered', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      sortByIsEcosystemsServicesOfferedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEcosystemsServicesOffered', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsGroupSchemeMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupSchemeMember', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsGroupSchemeMemberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupSchemeMember', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsHcvNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHcvNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsHcvNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHcvNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsIndigenousNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIndigenousNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsIndigenousNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIndigenousNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsProspectMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProspectMember', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsProspectMemberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProspectMember', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsRiversOrStreamsNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRiversOrStreamsNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      sortByIsRiversOrStreamsNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRiversOrStreamsNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsSlimfCompliant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlimfCompliant', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByIsSlimfCompliantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlimfCompliant', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByManageResourcesSustainablyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageResourcesSustainablyId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      sortByManageResourcesSustainablyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageResourcesSustainablyId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByMobileNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNumber', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByMobileNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNumber', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      sortByProduceFscCertifiedCharcoalCostEffectivelyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'produceFscCertifiedCharcoalCostEffectivelyId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      sortByProduceFscCertifiedCharcoalCostEffectivelyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'produceFscCertifiedCharcoalCostEffectivelyId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyOwnershipTypeId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByPropertyOwnershipTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyOwnershipTypeId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByProtectedRteDuringOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedRteDuringOperationId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      sortByProtectedRteDuringOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedRteDuringOperationId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByRestoreBushveldId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restoreBushveldId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByRestoreBushveldIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restoreBushveldId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortBySignatureDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureDate', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortBySignatureDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureDate', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortBySignatureImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureImage', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortBySignatureImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureImage', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortBySignaturePoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePoints', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortBySignaturePointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePoints', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByStreetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByStreetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByStreetNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetNumber', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByStreetNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetNumber', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByTown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'town', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> sortByTownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'town', Sort.desc);
    });
  }
}

extension FarmQuerySortThenBy on QueryBuilder<Farm, Farm, QSortThenBy> {
  QueryBuilder<Farm, Farm, QAfterSortBy> thenByCanDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByCanDeleteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDelete', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmSize', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFarmSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmSize', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFirstName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByFirstNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByGroupSchemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupSchemeId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNumber', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByImproveAccessToFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveAccessToFarmId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByImproveAccessToFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveAccessToFarmId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByImproveRangeLandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveRangeLandId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByImproveRangeLandIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'improveRangeLandId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByInclusionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inclusionDate', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByInclusionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inclusionDate', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsChemicalsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChemicalsUsed', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsChemicalsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isChemicalsUsed', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsCommunitiesNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommunitiesNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsCommunitiesNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommunitiesNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsEcosystemsServicesOffered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEcosystemsServicesOffered', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      thenByIsEcosystemsServicesOfferedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEcosystemsServicesOffered', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsGroupSchemeMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupSchemeMember', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsGroupSchemeMemberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isGroupSchemeMember', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsHcvNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHcvNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsHcvNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHcvNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsIndigenousNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIndigenousNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsIndigenousNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIndigenousNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsProspectMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProspectMember', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsProspectMemberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isProspectMember', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsRiversOrStreamsNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRiversOrStreamsNeighbouring', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      thenByIsRiversOrStreamsNeighbouringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRiversOrStreamsNeighbouring', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsSlimfCompliant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlimfCompliant', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByIsSlimfCompliantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlimfCompliant', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByManageResourcesSustainablyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageResourcesSustainablyId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      thenByManageResourcesSustainablyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'manageResourcesSustainablyId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByMobileNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNumber', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByMobileNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mobileNumber', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      thenByProduceFscCertifiedCharcoalCostEffectivelyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'produceFscCertifiedCharcoalCostEffectivelyId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      thenByProduceFscCertifiedCharcoalCostEffectivelyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
          r'produceFscCertifiedCharcoalCostEffectivelyId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyOwnershipTypeId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByPropertyOwnershipTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'propertyOwnershipTypeId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByProtectedRteDuringOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedRteDuringOperationId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy>
      thenByProtectedRteDuringOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protectedRteDuringOperationId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByRegionalManagerUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'regionalManagerUnitId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByRestoreBushveldId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restoreBushveldId', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByRestoreBushveldIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restoreBushveldId', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenBySignatureDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureDate', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenBySignatureDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureDate', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenBySignatureImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureImage', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenBySignatureImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signatureImage', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenBySignaturePoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePoints', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenBySignaturePointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePoints', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByStreetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetName', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByStreetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetName', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByStreetNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetNumber', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByStreetNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetNumber', Sort.desc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByTown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'town', Sort.asc);
    });
  }

  QueryBuilder<Farm, Farm, QAfterSortBy> thenByTownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'town', Sort.desc);
    });
  }
}

extension FarmQueryWhereDistinct on QueryBuilder<Farm, Farm, QDistinct> {
  QueryBuilder<Farm, Farm, QDistinct> distinctByCanDelete() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canDelete');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByFarmId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByFarmName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByFarmSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmSize');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByFirstName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByGroupSchemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupSchemeId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIdNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByImproveAccessToFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'improveAccessToFarmId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByImproveRangeLandId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'improveRangeLandId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByInclusionDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inclusionDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsChemicalsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isChemicalsUsed');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsCommunitiesNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCommunitiesNeighbouring');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsEcosystemsServicesOffered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEcosystemsServicesOffered');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsGroupSchemeMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isGroupSchemeMember');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsHcvNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHcvNeighbouring');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsIndigenousNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isIndigenousNeighbouring');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsProspectMember() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isProspectMember');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct>
      distinctByIsRiversOrStreamsNeighbouring() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRiversOrStreamsNeighbouring');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByIsSlimfCompliant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSlimfCompliant');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByManageResourcesSustainablyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'manageResourcesSustainablyId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByMobileNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mobileNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct>
      distinctByProduceFscCertifiedCharcoalCostEffectivelyId() {
    return QueryBuilder.apply(this, (query) {
      return query
          .addDistinctBy(r'produceFscCertifiedCharcoalCostEffectivelyId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByPropertyOwnershipTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'propertyOwnershipTypeId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct>
      distinctByProtectedRteDuringOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protectedRteDuringOperationId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByProvince(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'province', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByRegionalManagerUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByRestoreBushveldId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restoreBushveldId');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctBySignatureDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signatureDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctBySignatureImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signatureImage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctBySignaturePoints(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signaturePoints',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByStreetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByStreetNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streetNumber');
    });
  }

  QueryBuilder<Farm, Farm, QDistinct> distinctByTown(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'town', caseSensitive: caseSensitive);
    });
  }
}

extension FarmQueryProperty on QueryBuilder<Farm, Farm, QQueryProperty> {
  QueryBuilder<Farm, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> canDeleteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canDelete');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<Farm, String, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> farmNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmName');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> farmSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmSize');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> firstNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstName');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> groupSchemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupSchemeId');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> idNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idNumber');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> improveAccessToFarmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'improveAccessToFarmId');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> improveRangeLandIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'improveRangeLandId');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> inclusionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inclusionDate');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations> isChemicalsUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isChemicalsUsed');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations>
      isCommunitiesNeighbouringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCommunitiesNeighbouring');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations>
      isEcosystemsServicesOfferedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEcosystemsServicesOffered');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations> isGroupSchemeMemberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isGroupSchemeMember');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations> isHcvNeighbouringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHcvNeighbouring');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations>
      isIndigenousNeighbouringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isIndigenousNeighbouring');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations> isProspectMemberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isProspectMember');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations>
      isRiversOrStreamsNeighbouringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRiversOrStreamsNeighbouring');
    });
  }

  QueryBuilder<Farm, bool?, QQueryOperations> isSlimfCompliantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSlimfCompliant');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations>
      manageResourcesSustainablyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'manageResourcesSustainablyId');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> mobileNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mobileNumber');
    });
  }

  QueryBuilder<Farm, List<FarmMemberObjectiveAnswer>?, QQueryOperations>
      objectiveAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'objectiveAnswers');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations>
      produceFscCertifiedCharcoalCostEffectivelyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query
          .addPropertyName(r'produceFscCertifiedCharcoalCostEffectivelyId');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> propertyOwnershipTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'propertyOwnershipTypeId');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations>
      protectedRteDuringOperationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protectedRteDuringOperationId');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> provinceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'province');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> regionalManagerUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regionalManagerUnitId');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> restoreBushveldIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restoreBushveldId');
    });
  }

  QueryBuilder<Farm, List<FarmMemberRiskProfileAnswer>?, QQueryOperations>
      riskProfileAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'riskProfileAnswers');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> signatureDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signatureDate');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> signatureImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signatureImage');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> signaturePointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signaturePoints');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> streetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streetName');
    });
  }

  QueryBuilder<Farm, int?, QQueryOperations> streetNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streetNumber');
    });
  }

  QueryBuilder<Farm, String?, QQueryOperations> townProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'town');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Farm _$$_FarmFromJson(Map<String, dynamic> json) => _$_Farm(
      farmId: json['FarmId'] as String,
      farmName: json['FarmName'] as String?,
      groupSchemeId: json['GroupSchemeId'] as int?,
      regionalManagerUnitId: json['RegionalManagerUnitId'] as int?,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterDataSynced'] as int?,
      isSlimfCompliant: json['IsSlimfCompliant'] as bool?,
      propertyOwnershipTypeId: json['PropertyOwnershipTypeId'] as int?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      idNumber: json['IdNumber'] as String?,
      mobileNumber: json['MobileNumber'] as String?,
      email: json['Email'] as String?,
      isProspectMember: json['IsProspectMember'] as bool?,
      isGroupSchemeMember: json['IsGroupSchemeMember'] as bool?,
      latitude: json['Latitude'] as int?,
      longitude: json['Longitude'] as int?,
      streetName: json['StreetName'] as String?,
      streetNumber: json['StreetNumber'] as int?,
      province: json['Province'] as String?,
      town: json['Town'] as String?,
      farmSize: json['FarmSize'] as int?,
      inclusionDate: json['InclusionDate'] as String?,
      isCommunitiesNeighbouring: json['IsCommunitiesNeighbouring'] as bool?,
      isIndigenousNeighbouring: json['IsIndigenousNeighbouring'] as bool?,
      isHcvNeighbouring: json['IsHcvNeighbouring'] as bool?,
      isRiversOrStreamsNeighbouring:
          json['IsRiversOrStreamsNeighbouring'] as bool?,
      isChemicalsUsed: json['IsChemicalsUsed'] as bool?,
      isEcosystemsServicesOffered: json['IsEcosystemsServicesOffered'] as bool?,
      produceFscCertifiedCharcoalCostEffectivelyId:
          json['ProduceFscCertifiedCharcoalCostEffectivelyId'] as int?,
      improveRangeLandId: json['ImproveRangeLandId'] as int?,
      improveAccessToFarmId: json['ImproveAccessToFarmId'] as int?,
      restoreBushveldId: json['RestoreBushveldId'] as int?,
      protectedRteDuringOperationId:
          json['ProtectedRteDuringOperationId'] as int?,
      manageResourcesSustainablyId:
          json['ManageResourcesSustainablyId'] as int?,
      signaturePoints: json['SignaturePoints'] as String?,
      signatureImage: json['SignatureImage'] as String?,
      signatureDate: json['SignatureDate'] as String?,
      canDelete: json['CanDelete'] as int?,
      isLocal: json['IsLocal'] as int?,
      objectiveAnswers: (json['objectiveAnswers'] as List<dynamic>?)
          ?.map((e) =>
              FarmMemberObjectiveAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      riskProfileAnswers: (json['riskProfileAnswers'] as List<dynamic>?)
          ?.map((e) =>
              FarmMemberRiskProfileAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FarmToJson(_$_Farm instance) => <String, dynamic>{
      'FarmId': instance.farmId,
      'FarmName': instance.farmName,
      'GroupSchemeId': instance.groupSchemeId,
      'RegionalManagerUnitId': instance.regionalManagerUnitId,
      'IsActive': instance.isActive,
      'IsMasterDataSynced': instance.isMasterDataSynced,
      'IsSlimfCompliant': instance.isSlimfCompliant,
      'PropertyOwnershipTypeId': instance.propertyOwnershipTypeId,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'IdNumber': instance.idNumber,
      'MobileNumber': instance.mobileNumber,
      'Email': instance.email,
      'IsProspectMember': instance.isProspectMember,
      'IsGroupSchemeMember': instance.isGroupSchemeMember,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'StreetName': instance.streetName,
      'StreetNumber': instance.streetNumber,
      'Province': instance.province,
      'Town': instance.town,
      'FarmSize': instance.farmSize,
      'InclusionDate': instance.inclusionDate,
      'IsCommunitiesNeighbouring': instance.isCommunitiesNeighbouring,
      'IsIndigenousNeighbouring': instance.isIndigenousNeighbouring,
      'IsHcvNeighbouring': instance.isHcvNeighbouring,
      'IsRiversOrStreamsNeighbouring': instance.isRiversOrStreamsNeighbouring,
      'IsChemicalsUsed': instance.isChemicalsUsed,
      'IsEcosystemsServicesOffered': instance.isEcosystemsServicesOffered,
      'ProduceFscCertifiedCharcoalCostEffectivelyId':
          instance.produceFscCertifiedCharcoalCostEffectivelyId,
      'ImproveRangeLandId': instance.improveRangeLandId,
      'ImproveAccessToFarmId': instance.improveAccessToFarmId,
      'RestoreBushveldId': instance.restoreBushveldId,
      'ProtectedRteDuringOperationId': instance.protectedRteDuringOperationId,
      'ManageResourcesSustainablyId': instance.manageResourcesSustainablyId,
      'SignaturePoints': instance.signaturePoints,
      'SignatureImage': instance.signatureImage,
      'SignatureDate': instance.signatureDate,
      'CanDelete': instance.canDelete,
      'IsLocal': instance.isLocal,
      'objectiveAnswers':
          instance.objectiveAnswers?.map((e) => e.toJson()).toList(),
      'riskProfileAnswers':
          instance.riskProfileAnswers?.map((e) => e.toJson()).toList(),
    };
