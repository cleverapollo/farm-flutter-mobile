// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rm_stake_holder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetRMStakeHolderCollection on Isar {
  IsarCollection<RMStakeHolder> get rMStakeHolders => this.collection();
}

const RMStakeHolderSchema = CollectionSchema(
  name: r'RMStakeHolder',
  id: 4018219248881145400,
  properties: {
    r'address1': PropertySchema(
      id: 0,
      name: r'address1',
      type: IsarType.string,
    ),
    r'address2': PropertySchema(
      id: 1,
      name: r'address2',
      type: IsarType.string,
    ),
    r'cell': PropertySchema(
      id: 2,
      name: r'cell',
      type: IsarType.string,
    ),
    r'contactName': PropertySchema(
      id: 3,
      name: r'contactName',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 4,
      name: r'email',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isMasterDataSynced': PropertySchema(
      id: 6,
      name: r'isMasterDataSynced',
      type: IsarType.bool,
    ),
    r'stakeHolderId': PropertySchema(
      id: 7,
      name: r'stakeHolderId',
      type: IsarType.string,
    ),
    r'stakeHolderName': PropertySchema(
      id: 8,
      name: r'stakeHolderName',
      type: IsarType.string,
    ),
    r'stakeHolderTypeId': PropertySchema(
      id: 9,
      name: r'stakeHolderTypeId',
      type: IsarType.long,
    ),
    r'tel': PropertySchema(
      id: 10,
      name: r'tel',
      type: IsarType.string,
    )
  },
  estimateSize: _rMStakeHolderEstimateSize,
  serialize: _rMStakeHolderSerialize,
  deserialize: _rMStakeHolderDeserialize,
  deserializeProp: _rMStakeHolderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _rMStakeHolderGetId,
  getLinks: _rMStakeHolderGetLinks,
  attach: _rMStakeHolderAttach,
  version: '3.0.5',
);

int _rMStakeHolderEstimateSize(
  RMStakeHolder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.address2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cell;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contactName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.stakeHolderId.length * 3;
  {
    final value = object.stakeHolderName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rMStakeHolderSerialize(
  RMStakeHolder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address1);
  writer.writeString(offsets[1], object.address2);
  writer.writeString(offsets[2], object.cell);
  writer.writeString(offsets[3], object.contactName);
  writer.writeString(offsets[4], object.email);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeBool(offsets[6], object.isMasterDataSynced);
  writer.writeString(offsets[7], object.stakeHolderId);
  writer.writeString(offsets[8], object.stakeHolderName);
  writer.writeLong(offsets[9], object.stakeHolderTypeId);
  writer.writeString(offsets[10], object.tel);
}

RMStakeHolder _rMStakeHolderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RMStakeHolder(
    address1: reader.readStringOrNull(offsets[0]),
    address2: reader.readStringOrNull(offsets[1]),
    cell: reader.readStringOrNull(offsets[2]),
    contactName: reader.readStringOrNull(offsets[3]),
    email: reader.readStringOrNull(offsets[4]),
    isActive: reader.readBoolOrNull(offsets[5]),
    isMasterDataSynced: reader.readBoolOrNull(offsets[6]),
    stakeHolderId: reader.readString(offsets[7]),
    stakeHolderName: reader.readStringOrNull(offsets[8]),
    stakeHolderTypeId: reader.readLongOrNull(offsets[9]),
    tel: reader.readStringOrNull(offsets[10]),
  );
  return object;
}

P _rMStakeHolderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rMStakeHolderGetId(RMStakeHolder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rMStakeHolderGetLinks(RMStakeHolder object) {
  return [];
}

void _rMStakeHolderAttach(
    IsarCollection<dynamic> col, Id id, RMStakeHolder object) {}

extension RMStakeHolderQueryWhereSort
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QWhere> {
  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RMStakeHolderQueryWhere
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QWhereClause> {
  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterWhereClause> idBetween(
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

extension RMStakeHolderQueryFilter
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QFilterCondition> {
  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address1',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address1',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address1',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address1',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address2',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address2',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address2',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      address2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address2',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cell',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cell',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> cellEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cell',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cell',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cell',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> cellBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cell',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cell',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cell',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cell',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> cellMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cell',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cell',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      cellIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cell',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactName',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactName',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactName',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      contactNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactName',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailEqualTo(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailGreaterThan(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailLessThan(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailBetween(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailStartsWith(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailEndsWith(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      isMasterDataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      isMasterDataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterDataSynced',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      isMasterDataSyncedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterDataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeHolderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakeHolderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakeHolderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakeHolderId',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeHolderName',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeHolderName',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeHolderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stakeHolderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stakeHolderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stakeHolderName',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeHolderTypeId',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeHolderTypeId',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeHolderTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeHolderTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeHolderTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      telIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tel',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      telIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tel',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> telEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      telGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> telLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> telBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      telStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> telEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> telContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition> telMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      telIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tel',
        value: '',
      ));
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterFilterCondition>
      telIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tel',
        value: '',
      ));
    });
  }
}

extension RMStakeHolderQueryObject
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QFilterCondition> {}

extension RMStakeHolderQueryLinks
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QFilterCondition> {}

extension RMStakeHolderQuerySortBy
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QSortBy> {
  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByAddress1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByAddress1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByAddress2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByAddress2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByCell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cell', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByCellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cell', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByStakeHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByStakeHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByStakeHolderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      sortByStakeHolderTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByTel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tel', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> sortByTelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tel', Sort.desc);
    });
  }
}

extension RMStakeHolderQuerySortThenBy
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QSortThenBy> {
  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByAddress1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByAddress1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByAddress2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByAddress2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByCell() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cell', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByCellDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cell', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByIsMasterDataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterDataSynced', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByStakeHolderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByStakeHolderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderName', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByStakeHolderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy>
      thenByStakeHolderTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.desc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByTel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tel', Sort.asc);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QAfterSortBy> thenByTelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tel', Sort.desc);
    });
  }
}

extension RMStakeHolderQueryWhereDistinct
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> {
  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByAddress1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByAddress2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByCell(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cell', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByContactName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct>
      distinctByIsMasterDataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterDataSynced');
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByStakeHolderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeHolderId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct>
      distinctByStakeHolderName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeHolderName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct>
      distinctByStakeHolderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeHolderTypeId');
    });
  }

  QueryBuilder<RMStakeHolder, RMStakeHolder, QDistinct> distinctByTel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tel', caseSensitive: caseSensitive);
    });
  }
}

extension RMStakeHolderQueryProperty
    on QueryBuilder<RMStakeHolder, RMStakeHolder, QQueryProperty> {
  QueryBuilder<RMStakeHolder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RMStakeHolder, String?, QQueryOperations> address1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address1');
    });
  }

  QueryBuilder<RMStakeHolder, String?, QQueryOperations> address2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address2');
    });
  }

  QueryBuilder<RMStakeHolder, String?, QQueryOperations> cellProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cell');
    });
  }

  QueryBuilder<RMStakeHolder, String?, QQueryOperations> contactNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactName');
    });
  }

  QueryBuilder<RMStakeHolder, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<RMStakeHolder, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RMStakeHolder, bool?, QQueryOperations>
      isMasterDataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterDataSynced');
    });
  }

  QueryBuilder<RMStakeHolder, String, QQueryOperations>
      stakeHolderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeHolderId');
    });
  }

  QueryBuilder<RMStakeHolder, String?, QQueryOperations>
      stakeHolderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeHolderName');
    });
  }

  QueryBuilder<RMStakeHolder, int?, QQueryOperations>
      stakeHolderTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeHolderTypeId');
    });
  }

  QueryBuilder<RMStakeHolder, String?, QQueryOperations> telProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tel');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RMStakeHolder _$$_RMStakeHolderFromJson(Map<String, dynamic> json) =>
    _$_RMStakeHolder(
      stakeHolderId: json['StakeholderId'] as String,
      stakeHolderName: json['StakeholderName'] as String?,
      stakeHolderTypeId: json['StakeholderTypeId'] as int?,
      address1: json['Address1'] as String?,
      address2: json['Address2'] as String?,
      contactName: json['ContactName'] as String?,
      email: json['Email'] as String?,
      tel: json['Tel'] as String?,
      cell: json['Cell'] as String?,
      isActive: json['IsActive'] as bool?,
      isMasterDataSynced: json['IsMasterDataSynced'] as bool?,
    );

Map<String, dynamic> _$$_RMStakeHolderToJson(_$_RMStakeHolder instance) =>
    <String, dynamic>{
      'StakeholderId': instance.stakeHolderId,
      'StakeholderName': instance.stakeHolderName,
      'StakeholderTypeId': instance.stakeHolderTypeId,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'ContactName': instance.contactName,
      'Email': instance.email,
      'Tel': instance.tel,
      'Cell': instance.cell,
      'IsActive': instance.isActive,
      'IsMasterDataSynced': instance.isMasterDataSynced,
    };
