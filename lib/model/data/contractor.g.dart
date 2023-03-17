// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contractor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetContractorCollection on Isar {
  IsarCollection<Contractor> get contractors => this.collection();
}

const ContractorSchema = CollectionSchema(
  name: r'Contractor',
  id: 213870700840147031,
  properties: {
    r'companyId': PropertySchema(
      id: 0,
      name: r'companyId',
      type: IsarType.long,
    ),
    r'contractorId': PropertySchema(
      id: 1,
      name: r'contractorId',
      type: IsarType.long,
    ),
    r'contractorName': PropertySchema(
      id: 2,
      name: r'contractorName',
      type: IsarType.string,
    ),
    r'emailAddress': PropertySchema(
      id: 3,
      name: r'emailAddress',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 4,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'phoneNumber': PropertySchema(
      id: 5,
      name: r'phoneNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _contractorEstimateSize,
  serialize: _contractorSerialize,
  deserialize: _contractorDeserialize,
  deserializeProp: _contractorDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _contractorGetId,
  getLinks: _contractorGetLinks,
  attach: _contractorAttach,
  version: '3.0.5',
);

int _contractorEstimateSize(
  Contractor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contractorName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emailAddress;
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

void _contractorSerialize(
  Contractor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyId);
  writer.writeLong(offsets[1], object.contractorId);
  writer.writeString(offsets[2], object.contractorName);
  writer.writeString(offsets[3], object.emailAddress);
  writer.writeBool(offsets[4], object.isActive);
  writer.writeString(offsets[5], object.phoneNumber);
}

Contractor _contractorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Contractor(
    companyId: reader.readLongOrNull(offsets[0]),
    contractorId: reader.readLong(offsets[1]),
    contractorName: reader.readStringOrNull(offsets[2]),
    emailAddress: reader.readStringOrNull(offsets[3]),
    isActive: reader.readBoolOrNull(offsets[4]),
    phoneNumber: reader.readStringOrNull(offsets[5]),
  );
  return object;
}

P _contractorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _contractorGetId(Contractor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _contractorGetLinks(Contractor object) {
  return [];
}

void _contractorAttach(IsarCollection<dynamic> col, Id id, Contractor object) {}

extension ContractorQueryWhereSort
    on QueryBuilder<Contractor, Contractor, QWhere> {
  QueryBuilder<Contractor, Contractor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ContractorQueryWhere
    on QueryBuilder<Contractor, Contractor, QWhereClause> {
  QueryBuilder<Contractor, Contractor, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Contractor, Contractor, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterWhereClause> idBetween(
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

extension ContractorQueryFilter
    on QueryBuilder<Contractor, Contractor, QFilterCondition> {
  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      companyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      companyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyId',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> companyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      companyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> companyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> companyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractorId',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractorName',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractorName',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      contractorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractorName',
        value: '',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emailAddress',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emailAddress',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emailAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emailAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emailAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      emailAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emailAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
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

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }
}

extension ContractorQueryObject
    on QueryBuilder<Contractor, Contractor, QFilterCondition> {}

extension ContractorQueryLinks
    on QueryBuilder<Contractor, Contractor, QFilterCondition> {}

extension ContractorQuerySortBy
    on QueryBuilder<Contractor, Contractor, QSortBy> {
  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByContractorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy>
      sortByContractorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByEmailAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByEmailAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }
}

extension ContractorQuerySortThenBy
    on QueryBuilder<Contractor, Contractor, QSortThenBy> {
  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByContractorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorId', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByContractorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy>
      thenByContractorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorName', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByEmailAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByEmailAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emailAddress', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Contractor, Contractor, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }
}

extension ContractorQueryWhereDistinct
    on QueryBuilder<Contractor, Contractor, QDistinct> {
  QueryBuilder<Contractor, Contractor, QDistinct> distinctByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId');
    });
  }

  QueryBuilder<Contractor, Contractor, QDistinct> distinctByContractorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorId');
    });
  }

  QueryBuilder<Contractor, Contractor, QDistinct> distinctByContractorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contractor, Contractor, QDistinct> distinctByEmailAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emailAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contractor, Contractor, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Contractor, Contractor, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }
}

extension ContractorQueryProperty
    on QueryBuilder<Contractor, Contractor, QQueryProperty> {
  QueryBuilder<Contractor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Contractor, int?, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<Contractor, int, QQueryOperations> contractorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorId');
    });
  }

  QueryBuilder<Contractor, String?, QQueryOperations> contractorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorName');
    });
  }

  QueryBuilder<Contractor, String?, QQueryOperations> emailAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emailAddress');
    });
  }

  QueryBuilder<Contractor, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Contractor, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contractor _$$_ContractorFromJson(Map<String, dynamic> json) =>
    _$_Contractor(
      contractorId: json['ContractorId'] as int,
      companyId: json['CompanyId'] as int?,
      contractorName: json['ContractorName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      emailAddress: json['EmailAddress'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ContractorToJson(_$_Contractor instance) =>
    <String, dynamic>{
      'ContractorId': instance.contractorId,
      'CompanyId': instance.companyId,
      'ContractorName': instance.contractorName,
      'PhoneNumber': instance.phoneNumber,
      'EmailAddress': instance.emailAddress,
      'IsActive': instance.isActive,
    };
