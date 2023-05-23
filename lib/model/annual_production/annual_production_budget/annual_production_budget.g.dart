// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_production_budget.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnnualProductionBudgetCollection on Isar {
  IsarCollection<AnnualProductionBudget> get annualProductionBudgets =>
      this.collection();
}

const AnnualProductionBudgetSchema = CollectionSchema(
  name: r'AnnualProductionBudget',
  id: 1508496524320624237,
  properties: {
    r'annualBudgetId': PropertySchema(
      id: 0,
      name: r'annualBudgetId',
      type: IsarType.long,
    ),
    r'annualBudgetName': PropertySchema(
      id: 1,
      name: r'annualBudgetName',
      type: IsarType.string,
    ),
    r'annualProductionId': PropertySchema(
      id: 2,
      name: r'annualProductionId',
      type: IsarType.long,
    ),
    r'balanceAmount': PropertySchema(
      id: 3,
      name: r'balanceAmount',
      type: IsarType.double,
    ),
    r'createDT': PropertySchema(
      id: 4,
      name: r'createDT',
      type: IsarType.string,
    ),
    r'expenseAmount': PropertySchema(
      id: 5,
      name: r'expenseAmount',
      type: IsarType.double,
    ),
    r'farmId': PropertySchema(
      id: 6,
      name: r'farmId',
      type: IsarType.long,
    ),
    r'incomeAmount': PropertySchema(
      id: 7,
      name: r'incomeAmount',
      type: IsarType.double,
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
    r'transactionBudgetName': PropertySchema(
      id: 10,
      name: r'transactionBudgetName',
      type: IsarType.string,
    ),
    r'transactionBudgetYear': PropertySchema(
      id: 11,
      name: r'transactionBudgetYear',
      type: IsarType.long,
    ),
    r'year': PropertySchema(
      id: 12,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _annualProductionBudgetEstimateSize,
  serialize: _annualProductionBudgetSerialize,
  deserialize: _annualProductionBudgetDeserialize,
  deserializeProp: _annualProductionBudgetDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _annualProductionBudgetGetId,
  getLinks: _annualProductionBudgetGetLinks,
  attach: _annualProductionBudgetAttach,
  version: '3.1.0',
);

int _annualProductionBudgetEstimateSize(
  AnnualProductionBudget object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.annualBudgetName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createDT;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transactionBudgetName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _annualProductionBudgetSerialize(
  AnnualProductionBudget object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.annualBudgetId);
  writer.writeString(offsets[1], object.annualBudgetName);
  writer.writeLong(offsets[2], object.annualProductionId);
  writer.writeDouble(offsets[3], object.balanceAmount);
  writer.writeString(offsets[4], object.createDT);
  writer.writeDouble(offsets[5], object.expenseAmount);
  writer.writeLong(offsets[6], object.farmId);
  writer.writeDouble(offsets[7], object.incomeAmount);
  writer.writeBool(offsets[8], object.isActive);
  writer.writeBool(offsets[9], object.isLocal);
  writer.writeString(offsets[10], object.transactionBudgetName);
  writer.writeLong(offsets[11], object.transactionBudgetYear);
  writer.writeLong(offsets[12], object.year);
}

AnnualProductionBudget _annualProductionBudgetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnnualProductionBudget(
    annualBudgetId: reader.readLongOrNull(offsets[0]),
    annualBudgetName: reader.readStringOrNull(offsets[1]),
    annualProductionId: reader.readLongOrNull(offsets[2]),
    balanceAmount: reader.readDoubleOrNull(offsets[3]),
    createDT: reader.readStringOrNull(offsets[4]),
    expenseAmount: reader.readDoubleOrNull(offsets[5]),
    farmId: reader.readLongOrNull(offsets[6]),
    incomeAmount: reader.readDoubleOrNull(offsets[7]),
    isActive: reader.readBoolOrNull(offsets[8]),
    isLocal: reader.readBoolOrNull(offsets[9]),
    transactionBudgetName: reader.readStringOrNull(offsets[10]),
    transactionBudgetYear: reader.readLongOrNull(offsets[11]),
    year: reader.readLongOrNull(offsets[12]),
  );
  return object;
}

P _annualProductionBudgetDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _annualProductionBudgetGetId(AnnualProductionBudget object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _annualProductionBudgetGetLinks(
    AnnualProductionBudget object) {
  return [];
}

void _annualProductionBudgetAttach(
    IsarCollection<dynamic> col, Id id, AnnualProductionBudget object) {}

extension AnnualProductionBudgetQueryWhereSort
    on QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QWhere> {
  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnnualProductionBudgetQueryWhere on QueryBuilder<
    AnnualProductionBudget, AnnualProductionBudget, QWhereClause> {
  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
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

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
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

extension AnnualProductionBudgetQueryFilter on QueryBuilder<
    AnnualProductionBudget, AnnualProductionBudget, QFilterCondition> {
  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'annualBudgetId',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'annualBudgetId',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualBudgetId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualBudgetId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualBudgetId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualBudgetId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'annualBudgetName',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'annualBudgetName',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualBudgetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'annualBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'annualBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
          QAfterFilterCondition>
      annualBudgetNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'annualBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
          QAfterFilterCondition>
      annualBudgetNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'annualBudgetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualBudgetName',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualBudgetNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'annualBudgetName',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualProductionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'annualProductionId',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualProductionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'annualProductionId',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualProductionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualProductionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualProductionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualProductionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualProductionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualProductionId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> annualProductionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualProductionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> balanceAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceAmount',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> balanceAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceAmount',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> balanceAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> balanceAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> balanceAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> balanceAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
          QAfterFilterCondition>
      createDTContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createDT',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
          QAfterFilterCondition>
      createDTMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createDT',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> createDTIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createDT',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> expenseAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> expenseAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> expenseAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> expenseAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> expenseAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> expenseAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> farmIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> farmIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> farmIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> farmIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'farmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
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

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
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

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
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

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> incomeAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'incomeAmount',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> incomeAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'incomeAmount',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> incomeAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incomeAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> incomeAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incomeAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> incomeAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incomeAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> incomeAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incomeAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> isLocalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> isLocalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLocal',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> isLocalEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocal',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionBudgetName',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionBudgetName',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionBudgetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
          QAfterFilterCondition>
      transactionBudgetNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionBudgetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
          QAfterFilterCondition>
      transactionBudgetNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionBudgetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionBudgetName',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionBudgetName',
        value: '',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetYearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionBudgetYear',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetYearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionBudgetYear',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetYearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionBudgetYear',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetYearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionBudgetYear',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetYearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionBudgetYear',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> transactionBudgetYearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionBudgetYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> yearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget,
      QAfterFilterCondition> yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AnnualProductionBudgetQueryObject on QueryBuilder<
    AnnualProductionBudget, AnnualProductionBudget, QFilterCondition> {}

extension AnnualProductionBudgetQueryLinks on QueryBuilder<
    AnnualProductionBudget, AnnualProductionBudget, QFilterCondition> {}

extension AnnualProductionBudgetQuerySortBy
    on QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QSortBy> {
  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByAnnualBudgetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByAnnualBudgetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByAnnualBudgetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetName', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByAnnualBudgetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetName', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByAnnualProductionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByAnnualProductionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByBalanceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAmount', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByBalanceAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAmount', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByExpenseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByIncomeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeAmount', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByIncomeAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeAmount', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByTransactionBudgetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetName', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByTransactionBudgetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetName', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByTransactionBudgetYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetYear', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByTransactionBudgetYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetYear', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension AnnualProductionBudgetQuerySortThenBy on QueryBuilder<
    AnnualProductionBudget, AnnualProductionBudget, QSortThenBy> {
  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByAnnualBudgetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByAnnualBudgetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByAnnualBudgetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetName', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByAnnualBudgetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualBudgetName', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByAnnualProductionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByAnnualProductionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualProductionId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByBalanceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAmount', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByBalanceAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAmount', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByExpenseAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expenseAmount', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByIncomeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeAmount', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByIncomeAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'incomeAmount', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByIsLocalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocal', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByTransactionBudgetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetName', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByTransactionBudgetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetName', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByTransactionBudgetYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetYear', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByTransactionBudgetYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionBudgetYear', Sort.desc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QAfterSortBy>
      thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension AnnualProductionBudgetQueryWhereDistinct
    on QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct> {
  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByAnnualBudgetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualBudgetId');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByAnnualBudgetName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualBudgetName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByAnnualProductionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualProductionId');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByBalanceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceAmount');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByCreateDT({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByExpenseAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expenseAmount');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByIncomeAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'incomeAmount');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByIsLocal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocal');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByTransactionBudgetName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionBudgetName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByTransactionBudgetYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionBudgetYear');
    });
  }

  QueryBuilder<AnnualProductionBudget, AnnualProductionBudget, QDistinct>
      distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension AnnualProductionBudgetQueryProperty on QueryBuilder<
    AnnualProductionBudget, AnnualProductionBudget, QQueryProperty> {
  QueryBuilder<AnnualProductionBudget, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnnualProductionBudget, int?, QQueryOperations>
      annualBudgetIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualBudgetId');
    });
  }

  QueryBuilder<AnnualProductionBudget, String?, QQueryOperations>
      annualBudgetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualBudgetName');
    });
  }

  QueryBuilder<AnnualProductionBudget, int?, QQueryOperations>
      annualProductionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualProductionId');
    });
  }

  QueryBuilder<AnnualProductionBudget, double?, QQueryOperations>
      balanceAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceAmount');
    });
  }

  QueryBuilder<AnnualProductionBudget, String?, QQueryOperations>
      createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<AnnualProductionBudget, double?, QQueryOperations>
      expenseAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenseAmount');
    });
  }

  QueryBuilder<AnnualProductionBudget, int?, QQueryOperations>
      farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<AnnualProductionBudget, double?, QQueryOperations>
      incomeAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'incomeAmount');
    });
  }

  QueryBuilder<AnnualProductionBudget, bool?, QQueryOperations>
      isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<AnnualProductionBudget, bool?, QQueryOperations>
      isLocalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocal');
    });
  }

  QueryBuilder<AnnualProductionBudget, String?, QQueryOperations>
      transactionBudgetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionBudgetName');
    });
  }

  QueryBuilder<AnnualProductionBudget, int?, QQueryOperations>
      transactionBudgetYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionBudgetYear');
    });
  }

  QueryBuilder<AnnualProductionBudget, int?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnnualProductionBudget _$$_AnnualProductionBudgetFromJson(
        Map<String, dynamic> json) =>
    _$_AnnualProductionBudget(
      farmId: json['FarmId'] as int?,
      annualBudgetId: json['AnnualBudgetId'] as int?,
      annualBudgetName: json['AnnualBudgetName'] as String?,
      annualProductionId: json['AnnualProductionId'] as int?,
      year: json['Year'] as int?,
      incomeAmount: (json['IncomeAmount'] as num?)?.toDouble(),
      expenseAmount: (json['ExpenseAmount'] as num?)?.toDouble(),
      balanceAmount: (json['BalanceAmount'] as num?)?.toDouble(),
      transactionBudgetName: json['TransactionBudgetName'] as String?,
      transactionBudgetYear: json['TransactionBudgetYear'] as int?,
      createDT: json['CreateDT'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
      isLocal: json['IsLocal'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AnnualProductionBudgetToJson(
        _$_AnnualProductionBudget instance) =>
    <String, dynamic>{
      'FarmId': instance.farmId,
      'AnnualBudgetId': instance.annualBudgetId,
      'AnnualBudgetName': instance.annualBudgetName,
      'AnnualProductionId': instance.annualProductionId,
      'Year': instance.year,
      'IncomeAmount': instance.incomeAmount,
      'ExpenseAmount': instance.expenseAmount,
      'BalanceAmount': instance.balanceAmount,
      'TransactionBudgetName': instance.transactionBudgetName,
      'TransactionBudgetYear': instance.transactionBudgetYear,
      'CreateDT': instance.createDT,
      'IsActive': instance.isActive,
      'IsLocal': instance.isLocal,
    };
