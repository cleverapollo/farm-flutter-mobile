// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stake_holder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetStakeHolderCollection on Isar {
  IsarCollection<StakeHolder> get stakeHolders => this.collection();
}

const StakeHolderSchema = CollectionSchema(
  name: r'StakeHolder',
  id: 7917265610314524713,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'contactName': PropertySchema(
      id: 1,
      name: r'contactName',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 2,
      name: r'email',
      type: IsarType.string,
    ),
    r'entityName': PropertySchema(
      id: 3,
      name: r'entityName',
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
    r'phoneNumber': PropertySchema(
      id: 6,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'stakeHolderId': PropertySchema(
      id: 7,
      name: r'stakeHolderId',
      type: IsarType.long,
    ),
    r'stakeHolderTypeId': PropertySchema(
      id: 8,
      name: r'stakeHolderTypeId',
      type: IsarType.long,
    )
  },
  estimateSize: _stakeHolderEstimateSize,
  serialize: _stakeHolderSerialize,
  deserialize: _stakeHolderDeserialize,
  deserializeProp: _stakeHolderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stakeHolderGetId,
  getLinks: _stakeHolderGetLinks,
  attach: _stakeHolderAttach,
  version: '3.0.5',
);

int _stakeHolderEstimateSize(
  StakeHolder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
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
  {
    final value = object.entityName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _stakeHolderSerialize(
  StakeHolder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.contactName);
  writer.writeString(offsets[2], object.email);
  writer.writeString(offsets[3], object.entityName);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeBool(offsets[5], object.isLocal);
  writer.writeString(offsets[6], object.phoneNumber);
  writer.writeLong(offsets[7], object.stakeHolderId);
  writer.writeLong(offsets[8], object.stakeHolderTypeId);
}

StakeHolder _stakeHolderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StakeHolder(
    address: reader.readStringOrNull(offsets[0]),
    contactName: reader.readStringOrNull(offsets[1]),
    email: reader.readStringOrNull(offsets[2]),
    entityName: reader.readStringOrNull(offsets[3]),
    isActive: reader.readBoolOrNull(offsets[4]),
    isLocal: reader.readBoolOrNull(offsets[5]),
    phoneNumber: reader.readStringOrNull(offsets[6]),
    stakeHolderId: reader.readLongOrNull(offsets[7]),
    stakeHolderTypeId: reader.readLongOrNull(offsets[8]),
  );
  return object;
}

P _stakeHolderDeserializeProp<P>(
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
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stakeHolderGetId(StakeHolder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stakeHolderGetLinks(StakeHolder object) {
  return [];
}

void _stakeHolderAttach(
    IsarCollection<dynamic> col, Id id, StakeHolder object) {}

extension StakeHolderQueryWhereSort
    on QueryBuilder<StakeHolder, StakeHolder, QWhere> {
  QueryBuilder<StakeHolder, StakeHolder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StakeHolderQueryWhere
    on QueryBuilder<StakeHolder, StakeHolder, QWhereClause> {
  QueryBuilder<StakeHolder, StakeHolder, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterWhereClause> idBetween(
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

extension StakeHolderQueryFilter
    on QueryBuilder<StakeHolder, StakeHolder, QFilterCondition> {
  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> addressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> addressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      contactNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contactName',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      contactNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contactName',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      contactNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      contactNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      contactNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactName',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      contactNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactName',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailEqualTo(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailLessThan(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailBetween(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailStartsWith(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailEndsWith(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'entityName',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'entityName',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityName',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      entityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityName',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition> isLocalEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeHolderId',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeHolderId',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stakeHolderId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stakeHolderId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stakeHolderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stakeHolderTypeId',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stakeHolderTypeId',
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
      stakeHolderTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stakeHolderTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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

  QueryBuilder<StakeHolder, StakeHolder, QAfterFilterCondition>
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
}

extension StakeHolderQueryObject
    on QueryBuilder<StakeHolder, StakeHolder, QFilterCondition> {}

extension StakeHolderQueryLinks
    on QueryBuilder<StakeHolder, StakeHolder, QFilterCondition> {}

extension StakeHolderQuerySortBy
    on QueryBuilder<StakeHolder, StakeHolder, QSortBy> {
  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByEntityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByEntityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> sortByStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy>
      sortByStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy>
      sortByStakeHolderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy>
      sortByStakeHolderTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.desc);
    });
  }
}

extension StakeHolderQuerySortThenBy
    on QueryBuilder<StakeHolder, StakeHolder, QSortThenBy> {
  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByContactName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByContactNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactName', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByEntityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByEntityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityName', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy> thenByStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy>
      thenByStakeHolderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderId', Sort.desc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy>
      thenByStakeHolderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.asc);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QAfterSortBy>
      thenByStakeHolderTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stakeHolderTypeId', Sort.desc);
    });
  }
}

extension StakeHolderQueryWhereDistinct
    on QueryBuilder<StakeHolder, StakeHolder, QDistinct> {
  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByContactName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByEntityName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct> distinctByStakeHolderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeHolderId');
    });
  }

  QueryBuilder<StakeHolder, StakeHolder, QDistinct>
      distinctByStakeHolderTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stakeHolderTypeId');
    });
  }
}

extension StakeHolderQueryProperty
    on QueryBuilder<StakeHolder, StakeHolder, QQueryProperty> {
  QueryBuilder<StakeHolder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StakeHolder, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<StakeHolder, String?, QQueryOperations> contactNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactName');
    });
  }

  QueryBuilder<StakeHolder, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<StakeHolder, String?, QQueryOperations> entityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityName');
    });
  }

  QueryBuilder<StakeHolder, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<StakeHolder, bool?, QQueryOperations> isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<StakeHolder, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<StakeHolder, int?, QQueryOperations> stakeHolderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeHolderId');
    });
  }

  QueryBuilder<StakeHolder, int?, QQueryOperations>
      stakeHolderTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stakeHolderTypeId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StakeHolder _$$_StakeHolderFromJson(Map<String, dynamic> json) =>
    _$_StakeHolder(
      stakeHolderId: json['StakeHolderId'] as int?,
      stakeHolderTypeId: json['StakeholderTypeId'] as int?,
      entityName: json['entityName'] as String?,
      contactName: json['contactName'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isActive: json['IsActive'] as bool?,
      isLocal: json['IsLocal'] as bool?,
    );

Map<String, dynamic> _$$_StakeHolderToJson(_$_StakeHolder instance) =>
    <String, dynamic>{
      'StakeHolderId': instance.stakeHolderId,
      'StakeholderTypeId': instance.stakeHolderTypeId,
      'entityName': instance.entityName,
      'contactName': instance.contactName,
      'email': instance.email,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
