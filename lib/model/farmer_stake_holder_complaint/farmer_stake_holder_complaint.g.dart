// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_stake_holder_complaint.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFarmerStakeHolderComplaintCollection on Isar {
  IsarCollection<FarmerStakeHolderComplaint> get farmerStakeHolderComplaints =>
      this.collection();
}

const FarmerStakeHolderComplaintSchema = CollectionSchema(
  name: r'FarmerStakeHolderComplaint',
  id: 2609705468033147608,
  properties: {
    r'carClosed': PropertySchema(
      id: 0,
      name: r'carClosed',
      type: IsarType.bool,
    ),
    r'carRaised': PropertySchema(
      id: 1,
      name: r'carRaised',
      type: IsarType.bool,
    ),
    r'closureDetails': PropertySchema(
      id: 2,
      name: r'closureDetails',
      type: IsarType.string,
    ),
    r'complaintId': PropertySchema(
      id: 3,
      name: r'complaintId',
      type: IsarType.long,
    ),
    r'complaintName': PropertySchema(
      id: 4,
      name: r'complaintName',
      type: IsarType.string,
    ),
    r'dateClosed': PropertySchema(
      id: 5,
      name: r'dateClosed',
      type: IsarType.string,
    ),
    r'dateReceived': PropertySchema(
      id: 6,
      name: r'dateReceived',
      type: IsarType.string,
    ),
    r'farmerStakeHolderComplaintId': PropertySchema(
      id: 7,
      name: r'farmerStakeHolderComplaintId',
      type: IsarType.long,
    ),
    r'generalComments': PropertySchema(
      id: 8,
      name: r'generalComments',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 9,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isLocal': PropertySchema(
      id: 10,
      name: r'isLocal',
      type: IsarType.bool,
    ),
    r'issueRaised': PropertySchema(
      id: 11,
      name: r'issueRaised',
      type: IsarType.string,
    )
  },
  estimateSize: _farmerStakeHolderComplaintEstimateSize,
  serialize: _farmerStakeHolderComplaintSerialize,
  deserialize: _farmerStakeHolderComplaintDeserialize,
  deserializeProp: _farmerStakeHolderComplaintDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _farmerStakeHolderComplaintGetId,
  getLinks: _farmerStakeHolderComplaintGetLinks,
  attach: _farmerStakeHolderComplaintAttach,
  version: '3.0.5',
);

int _farmerStakeHolderComplaintEstimateSize(
  FarmerStakeHolderComplaint object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.closureDetails;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.complaintName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateClosed;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dateReceived;
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
    final value = object.issueRaised;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _farmerStakeHolderComplaintSerialize(
  FarmerStakeHolderComplaint object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.carClosed);
  writer.writeBool(offsets[1], object.carRaised);
  writer.writeString(offsets[2], object.closureDetails);
  writer.writeLong(offsets[3], object.complaintId);
  writer.writeString(offsets[4], object.complaintName);
  writer.writeString(offsets[5], object.dateClosed);
  writer.writeString(offsets[6], object.dateReceived);
  writer.writeLong(offsets[7], object.farmerStakeHolderComplaintId);
  writer.writeString(offsets[8], object.generalComments);
  writer.writeBool(offsets[9], object.isActive);
  writer.writeBool(offsets[10], object.isLocal);
  writer.writeString(offsets[11], object.issueRaised);
}

FarmerStakeHolderComplaint _farmerStakeHolderComplaintDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FarmerStakeHolderComplaint(
    carClosed: reader.readBoolOrNull(offsets[0]),
    carRaised: reader.readBoolOrNull(offsets[1]),
    closureDetails: reader.readStringOrNull(offsets[2]),
    complaintId: reader.readLongOrNull(offsets[3]),
    complaintName: reader.readStringOrNull(offsets[4]),
    dateClosed: reader.readStringOrNull(offsets[5]),
    dateReceived: reader.readStringOrNull(offsets[6]),
    farmerStakeHolderComplaintId: reader.readLongOrNull(offsets[7]),
    generalComments: reader.readStringOrNull(offsets[8]),
    isActive: reader.readBoolOrNull(offsets[9]),
    isLocal: reader.readBoolOrNull(offsets[10]),
    issueRaised: reader.readStringOrNull(offsets[11]),
  );
  return object;
}

P _farmerStakeHolderComplaintDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _farmerStakeHolderComplaintGetId(FarmerStakeHolderComplaint object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _farmerStakeHolderComplaintGetLinks(
    FarmerStakeHolderComplaint object) {
  return [];
}

void _farmerStakeHolderComplaintAttach(
    IsarCollection<dynamic> col, Id id, FarmerStakeHolderComplaint object) {}

extension FarmerStakeHolderComplaintQueryWhereSort on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QWhere> {
  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FarmerStakeHolderComplaintQueryWhere on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QWhereClause> {
  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterWhereClause> idBetween(
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

extension FarmerStakeHolderComplaintQueryFilter on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QFilterCondition> {
  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> carClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> carClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosed',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> carClosedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosed',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> carRaisedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> carRaisedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaised',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> carRaisedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaised',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closureDetails',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closureDetails',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closureDetails',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      closureDetailsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'closureDetails',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      closureDetailsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'closureDetails',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closureDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> closureDetailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'closureDetails',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complaintId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complaintId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complaintId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'complaintId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'complaintId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'complaintId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'complaintName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'complaintName',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complaintName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'complaintName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'complaintName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'complaintName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'complaintName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'complaintName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      complaintNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'complaintName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      complaintNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'complaintName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'complaintName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> complaintNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'complaintName',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateClosed',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateClosed',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateClosed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      dateClosedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateClosed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      dateClosedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateClosed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateClosed',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateClosedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateClosed',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateReceived',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateReceived',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateReceived',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      dateReceivedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dateReceived',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      dateReceivedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dateReceived',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateReceived',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> dateReceivedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dateReceived',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> farmerStakeHolderComplaintIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmerStakeHolderComplaintId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> farmerStakeHolderComplaintIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmerStakeHolderComplaintId',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> farmerStakeHolderComplaintIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmerStakeHolderComplaintId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> farmerStakeHolderComplaintIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmerStakeHolderComplaintId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> farmerStakeHolderComplaintIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmerStakeHolderComplaintId',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> farmerStakeHolderComplaintIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmerStakeHolderComplaintId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generalComments',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsEqualTo(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsGreaterThan(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsLessThan(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsBetween(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsStartsWith(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsEndsWith(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      generalCommentsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'generalComments',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      generalCommentsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'generalComments',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> generalCommentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'generalComments',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'issueRaised',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'issueRaised',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueRaised',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueRaised',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueRaised',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueRaised',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'issueRaised',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'issueRaised',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      issueRaisedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'issueRaised',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
          QAfterFilterCondition>
      issueRaisedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'issueRaised',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueRaised',
        value: '',
      ));
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterFilterCondition> issueRaisedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'issueRaised',
        value: '',
      ));
    });
  }
}

extension FarmerStakeHolderComplaintQueryObject on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QFilterCondition> {}

extension FarmerStakeHolderComplaintQueryLinks on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QFilterCondition> {}

extension FarmerStakeHolderComplaintQuerySortBy on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QSortBy> {
  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByClosureDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByClosureDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByComplaintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByComplaintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByComplaintName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByComplaintNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByDateClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByDateClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByDateReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByDateReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByFarmerStakeHolderComplaintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderComplaintId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByFarmerStakeHolderComplaintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderComplaintId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByIssueRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueRaised', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> sortByIssueRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueRaised', Sort.desc);
    });
  }
}

extension FarmerStakeHolderComplaintQuerySortThenBy on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QSortThenBy> {
  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByCarClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosed', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByCarRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaised', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByClosureDetails() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByClosureDetailsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closureDetails', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByComplaintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByComplaintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByComplaintName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintName', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByComplaintNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'complaintName', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByDateClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByDateClosedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateClosed', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByDateReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByDateReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateReceived', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByFarmerStakeHolderComplaintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderComplaintId', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByFarmerStakeHolderComplaintIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmerStakeHolderComplaintId', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByGeneralComments() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByGeneralCommentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalComments', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByIssueRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueRaised', Sort.asc);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QAfterSortBy> thenByIssueRaisedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueRaised', Sort.desc);
    });
  }
}

extension FarmerStakeHolderComplaintQueryWhereDistinct on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QDistinct> {
  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByCarClosed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosed');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByCarRaised() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaised');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByClosureDetails({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closureDetails',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByComplaintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complaintId');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByComplaintName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'complaintName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByDateClosed({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateClosed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByDateReceived({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateReceived', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByFarmerStakeHolderComplaintId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmerStakeHolderComplaintId');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByGeneralComments({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generalComments',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, FarmerStakeHolderComplaint,
      QDistinct> distinctByIssueRaised({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueRaised', caseSensitive: caseSensitive);
    });
  }
}

extension FarmerStakeHolderComplaintQueryProperty on QueryBuilder<
    FarmerStakeHolderComplaint, FarmerStakeHolderComplaint, QQueryProperty> {
  QueryBuilder<FarmerStakeHolderComplaint, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, bool?, QQueryOperations>
      carClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosed');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, bool?, QQueryOperations>
      carRaisedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaised');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, String?, QQueryOperations>
      closureDetailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closureDetails');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, int?, QQueryOperations>
      complaintIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complaintId');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, String?, QQueryOperations>
      complaintNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'complaintName');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, String?, QQueryOperations>
      dateClosedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateClosed');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, String?, QQueryOperations>
      dateReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateReceived');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, int?, QQueryOperations>
      farmerStakeHolderComplaintIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmerStakeHolderComplaintId');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, String?, QQueryOperations>
      generalCommentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generalComments');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, bool?, QQueryOperations>
      isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<FarmerStakeHolderComplaint, String?, QQueryOperations>
      issueRaisedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueRaised');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmerStakeHolderComplaint _$$_FarmerStakeHolderComplaintFromJson(
        Map<String, dynamic> json) =>
    _$_FarmerStakeHolderComplaint(
      farmerStakeHolderComplaintId:
          json['FarmerStakeHolderComplaintId'] as int?,
      complaintId: json['ComplaintId'] as int?,
      complaintName: json['ComplaintName'] as String?,
      issueRaised: json['IssueRaised'] as String?,
      closureDetails: json['ClosureDetails'] as String?,
      generalComments: json['GeneralComments'] as String?,
      dateReceived: json['DateReceived'] as String?,
      dateClosed: json['DateClosed'] as String?,
      carRaised: json['CarRaised'] as bool? ?? false,
      carClosed: json['CarClosed'] as bool? ?? false,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_FarmerStakeHolderComplaintToJson(
        _$_FarmerStakeHolderComplaint instance) =>
    <String, dynamic>{
      'FarmerStakeHolderComplaintId': instance.farmerStakeHolderComplaintId,
      'ComplaintId': instance.complaintId,
      'ComplaintName': instance.complaintName,
      'IssueRaised': instance.issueRaised,
      'ClosureDetails': instance.closureDetails,
      'GeneralComments': instance.generalComments,
      'DateReceived': instance.dateReceived,
      'DateClosed': instance.dateClosed,
      'CarRaised': instance.carRaised,
      'CarClosed': instance.carClosed,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
