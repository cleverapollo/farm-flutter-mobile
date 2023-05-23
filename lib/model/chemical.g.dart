// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chemical.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChemicalCollection on Isar {
  IsarCollection<Chemical> get chemicals => this.collection();
}

const ChemicalSchema = CollectionSchema(
  name: r'Chemical',
  id: -3455160655491003666,
  properties: {
    r'balance': PropertySchema(
      id: 0,
      name: r'balance',
      type: IsarType.double,
    ),
    r'campId': PropertySchema(
      id: 1,
      name: r'campId',
      type: IsarType.long,
    ),
    r'campName': PropertySchema(
      id: 2,
      name: r'campName',
      type: IsarType.string,
    ),
    r'carClosedDate': PropertySchema(
      id: 3,
      name: r'carClosedDate',
      type: IsarType.dateTime,
    ),
    r'carRaisedDate': PropertySchema(
      id: 4,
      name: r'carRaisedDate',
      type: IsarType.dateTime,
    ),
    r'chemicalApplicationMethod': PropertySchema(
      id: 5,
      name: r'chemicalApplicationMethod',
      type: IsarType.string,
    ),
    r'chemicalApplicationMethodId': PropertySchema(
      id: 6,
      name: r'chemicalApplicationMethodId',
      type: IsarType.long,
    ),
    r'chemicalNo': PropertySchema(
      id: 7,
      name: r'chemicalNo',
      type: IsarType.string,
    ),
    r'chemicalType': PropertySchema(
      id: 8,
      name: r'chemicalType',
      type: IsarType.string,
    ),
    r'chemicalTypeId': PropertySchema(
      id: 9,
      name: r'chemicalTypeId',
      type: IsarType.long,
    ),
    r'comment': PropertySchema(
      id: 10,
      name: r'comment',
      type: IsarType.string,
    ),
    r'createDT': PropertySchema(
      id: 11,
      name: r'createDT',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 12,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'farmId': PropertySchema(
      id: 13,
      name: r'farmId',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 14,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'issued': PropertySchema(
      id: 15,
      name: r'issued',
      type: IsarType.double,
    ),
    r'mixture': PropertySchema(
      id: 16,
      name: r'mixture',
      type: IsarType.string,
    ),
    r'openingStock': PropertySchema(
      id: 17,
      name: r'openingStock',
      type: IsarType.double,
    ),
    r'totalRows': PropertySchema(
      id: 18,
      name: r'totalRows',
      type: IsarType.long,
    ),
    r'updateDT': PropertySchema(
      id: 19,
      name: r'updateDT',
      type: IsarType.dateTime,
    ),
    r'usagePerHa': PropertySchema(
      id: 20,
      name: r'usagePerHa',
      type: IsarType.double,
    )
  },
  estimateSize: _chemicalEstimateSize,
  serialize: _chemicalSerialize,
  deserialize: _chemicalDeserialize,
  deserializeProp: _chemicalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chemicalGetId,
  getLinks: _chemicalGetLinks,
  attach: _chemicalAttach,
  version: '3.1.0',
);

int _chemicalEstimateSize(
  Chemical object,
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
    final value = object.chemicalApplicationMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.chemicalNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.chemicalType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mixture;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _chemicalSerialize(
  Chemical object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.balance);
  writer.writeLong(offsets[1], object.campId);
  writer.writeString(offsets[2], object.campName);
  writer.writeDateTime(offsets[3], object.carClosedDate);
  writer.writeDateTime(offsets[4], object.carRaisedDate);
  writer.writeString(offsets[5], object.chemicalApplicationMethod);
  writer.writeLong(offsets[6], object.chemicalApplicationMethodId);
  writer.writeString(offsets[7], object.chemicalNo);
  writer.writeString(offsets[8], object.chemicalType);
  writer.writeLong(offsets[9], object.chemicalTypeId);
  writer.writeString(offsets[10], object.comment);
  writer.writeDateTime(offsets[11], object.createDT);
  writer.writeDateTime(offsets[12], object.date);
  writer.writeLong(offsets[13], object.farmId);
  writer.writeBool(offsets[14], object.isActive);
  writer.writeDouble(offsets[15], object.issued);
  writer.writeString(offsets[16], object.mixture);
  writer.writeDouble(offsets[17], object.openingStock);
  writer.writeLong(offsets[18], object.totalRows);
  writer.writeDateTime(offsets[19], object.updateDT);
  writer.writeDouble(offsets[20], object.usagePerHa);
}

Chemical _chemicalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Chemical(
    balance: reader.readDoubleOrNull(offsets[0]),
    campId: reader.readLongOrNull(offsets[1]),
    carClosedDate: reader.readDateTimeOrNull(offsets[3]),
    carRaisedDate: reader.readDateTimeOrNull(offsets[4]),
    chemicalApplicationMethodId: reader.readLongOrNull(offsets[6]),
    chemicalNo: reader.readStringOrNull(offsets[7]),
    chemicalTypeId: reader.readLongOrNull(offsets[9]),
    comment: reader.readStringOrNull(offsets[10]),
    createDT: reader.readDateTimeOrNull(offsets[11]),
    date: reader.readDateTimeOrNull(offsets[12]),
    farmId: reader.readLongOrNull(offsets[13]),
    isActive: reader.readBoolOrNull(offsets[14]),
    issued: reader.readDoubleOrNull(offsets[15]),
    mixture: reader.readStringOrNull(offsets[16]),
    openingStock: reader.readDoubleOrNull(offsets[17]),
    totalRows: reader.readLongOrNull(offsets[18]),
    updateDT: reader.readDateTimeOrNull(offsets[19]),
    usagePerHa: reader.readDoubleOrNull(offsets[20]),
  );
  object.campName = reader.readStringOrNull(offsets[2]);
  object.chemicalApplicationMethod = reader.readStringOrNull(offsets[5]);
  object.chemicalType = reader.readStringOrNull(offsets[8]);
  return object;
}

P _chemicalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readBoolOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chemicalGetId(Chemical object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chemicalGetLinks(Chemical object) {
  return [];
}

void _chemicalAttach(IsarCollection<dynamic> col, Id id, Chemical object) {}

extension ChemicalQueryWhereSort on QueryBuilder<Chemical, Chemical, QWhere> {
  QueryBuilder<Chemical, Chemical, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChemicalQueryWhere on QueryBuilder<Chemical, Chemical, QWhereClause> {
  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterWhereClause> idBetween(
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

extension ChemicalQueryFilter
    on QueryBuilder<Chemical, Chemical, QFilterCondition> {
  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> balanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> balanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> balanceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> balanceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> balanceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> balanceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'campId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'campId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campIdGreaterThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campIdLessThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campIdBetween(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'campName',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'campName',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameEqualTo(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameGreaterThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameLessThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameBetween(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameStartsWith(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameEndsWith(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameContains(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameMatches(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'campName',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> campNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'campName',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      carClosedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosedDate',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      carClosedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosedDate',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> carClosedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      carClosedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carClosedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> carClosedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carClosedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> carClosedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carClosedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      carRaisedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaisedDate',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      carRaisedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaisedDate',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> carRaisedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaisedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      carRaisedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carRaisedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> carRaisedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carRaisedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> carRaisedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carRaisedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chemicalApplicationMethod',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chemicalApplicationMethod',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalApplicationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chemicalApplicationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chemicalApplicationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chemicalApplicationMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chemicalApplicationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chemicalApplicationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chemicalApplicationMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chemicalApplicationMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalApplicationMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chemicalApplicationMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chemicalApplicationMethodId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chemicalApplicationMethodId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalApplicationMethodId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chemicalApplicationMethodId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chemicalApplicationMethodId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalApplicationMethodIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chemicalApplicationMethodId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chemicalNo',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chemicalNo',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chemicalNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chemicalNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chemicalNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chemicalNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chemicalNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chemicalNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chemicalNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chemicalNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chemicalType',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chemicalType',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chemicalType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chemicalType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chemicalType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chemicalType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chemicalType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chemicalType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chemicalType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalType',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chemicalType',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chemicalTypeId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chemicalTypeId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemicalTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chemicalTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      chemicalTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chemicalTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> chemicalTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chemicalTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> createDTEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> createDTGreaterThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> createDTLessThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> createDTBetween(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> farmIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> farmIdGreaterThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> farmIdLessThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> farmIdBetween(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> issuedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'issued',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> issuedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'issued',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> issuedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issued',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> issuedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issued',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> issuedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issued',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> issuedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issued',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mixture',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mixture',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mixture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mixture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mixture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mixture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mixture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mixture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mixture',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mixture',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mixture',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> mixtureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mixture',
        value: '',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> openingStockIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openingStock',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      openingStockIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openingStock',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> openingStockEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openingStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      openingStockGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openingStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> openingStockLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openingStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> openingStockBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openingStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> totalRowsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalRows',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> totalRowsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalRows',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> totalRowsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalRows',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> totalRowsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalRows',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> totalRowsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalRows',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> totalRowsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalRows',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> updateDTEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> updateDTGreaterThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> updateDTLessThan(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> updateDTBetween(
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

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> usagePerHaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usagePerHa',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition>
      usagePerHaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usagePerHa',
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> usagePerHaEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usagePerHa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> usagePerHaGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usagePerHa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> usagePerHaLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usagePerHa',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterFilterCondition> usagePerHaBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usagePerHa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ChemicalQueryObject
    on QueryBuilder<Chemical, Chemical, QFilterCondition> {}

extension ChemicalQueryLinks
    on QueryBuilder<Chemical, Chemical, QFilterCondition> {}

extension ChemicalQuerySortBy on QueryBuilder<Chemical, Chemical, QSortBy> {
  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCampId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCampIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCampName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCampNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCarClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCarRaisedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      sortByChemicalApplicationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethod', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      sortByChemicalApplicationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethod', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      sortByChemicalApplicationMethodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethodId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      sortByChemicalApplicationMethodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethodId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalNo', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalNo', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalType', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalType', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalTypeId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByChemicalTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalTypeId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByIssued() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issued', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByIssuedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issued', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByMixture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mixture', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByMixtureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mixture', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByOpeningStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingStock', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByOpeningStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingStock', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByTotalRows() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRows', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByTotalRowsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRows', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByUsagePerHa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usagePerHa', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> sortByUsagePerHaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usagePerHa', Sort.desc);
    });
  }
}

extension ChemicalQuerySortThenBy
    on QueryBuilder<Chemical, Chemical, QSortThenBy> {
  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCampId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCampIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCampName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCampNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'campName', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCarClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCarRaisedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      thenByChemicalApplicationMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethod', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      thenByChemicalApplicationMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethod', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      thenByChemicalApplicationMethodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethodId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy>
      thenByChemicalApplicationMethodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalApplicationMethodId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalNo', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalNo', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalType', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalType', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalTypeId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByChemicalTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chemicalTypeId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByIssued() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issued', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByIssuedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issued', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByMixture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mixture', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByMixtureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mixture', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByOpeningStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingStock', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByOpeningStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openingStock', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByTotalRows() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRows', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByTotalRowsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRows', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByUsagePerHa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usagePerHa', Sort.asc);
    });
  }

  QueryBuilder<Chemical, Chemical, QAfterSortBy> thenByUsagePerHaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usagePerHa', Sort.desc);
    });
  }
}

extension ChemicalQueryWhereDistinct
    on QueryBuilder<Chemical, Chemical, QDistinct> {
  QueryBuilder<Chemical, Chemical, QDistinct> distinctByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balance');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByCampId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campId');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByCampName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'campName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosedDate');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaisedDate');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct>
      distinctByChemicalApplicationMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chemicalApplicationMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct>
      distinctByChemicalApplicationMethodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chemicalApplicationMethodId');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByChemicalNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chemicalNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByChemicalType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chemicalType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByChemicalTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chemicalTypeId');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByIssued() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issued');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByMixture(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mixture', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByOpeningStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openingStock');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByTotalRows() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRows');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT');
    });
  }

  QueryBuilder<Chemical, Chemical, QDistinct> distinctByUsagePerHa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usagePerHa');
    });
  }
}

extension ChemicalQueryProperty
    on QueryBuilder<Chemical, Chemical, QQueryProperty> {
  QueryBuilder<Chemical, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Chemical, double?, QQueryOperations> balanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balance');
    });
  }

  QueryBuilder<Chemical, int?, QQueryOperations> campIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campId');
    });
  }

  QueryBuilder<Chemical, String?, QQueryOperations> campNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'campName');
    });
  }

  QueryBuilder<Chemical, DateTime?, QQueryOperations> carClosedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosedDate');
    });
  }

  QueryBuilder<Chemical, DateTime?, QQueryOperations> carRaisedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaisedDate');
    });
  }

  QueryBuilder<Chemical, String?, QQueryOperations>
      chemicalApplicationMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chemicalApplicationMethod');
    });
  }

  QueryBuilder<Chemical, int?, QQueryOperations>
      chemicalApplicationMethodIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chemicalApplicationMethodId');
    });
  }

  QueryBuilder<Chemical, String?, QQueryOperations> chemicalNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chemicalNo');
    });
  }

  QueryBuilder<Chemical, String?, QQueryOperations> chemicalTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chemicalType');
    });
  }

  QueryBuilder<Chemical, int?, QQueryOperations> chemicalTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chemicalTypeId');
    });
  }

  QueryBuilder<Chemical, String?, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<Chemical, DateTime?, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<Chemical, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Chemical, int?, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<Chemical, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Chemical, double?, QQueryOperations> issuedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issued');
    });
  }

  QueryBuilder<Chemical, String?, QQueryOperations> mixtureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mixture');
    });
  }

  QueryBuilder<Chemical, double?, QQueryOperations> openingStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openingStock');
    });
  }

  QueryBuilder<Chemical, int?, QQueryOperations> totalRowsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRows');
    });
  }

  QueryBuilder<Chemical, DateTime?, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }

  QueryBuilder<Chemical, double?, QQueryOperations> usagePerHaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usagePerHa');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chemical _$ChemicalFromJson(Map<String, dynamic> json) => Chemical(
      totalRows: json['TotalRows'] as int?,
      chemicalNo: json['chemicalNo'] as String?,
      farmId: JsonConverterUtil.toLong(json['FarmId']),
      chemicalTypeId: json['ChemicalTypeId'] as int?,
      chemicalApplicationMethodId: json['ChemicalApplicationMethodId'] as int?,
      campId: JsonConverterUtil.toLong(json['CampId']),
      date:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
      openingStock: (json['OpeningStock'] as num?)?.toDouble(),
      issued: (json['Issued'] as num?)?.toDouble(),
      balance: (json['Balance'] as num?)?.toDouble(),
      mixture: json['Mixture'] as String?,
      usagePerHa: (json['UsagePerHa'] as num?)?.toDouble(),
      comment: json['Comment'] as String?,
      carRaisedDate: json['CarRaisedDate'] == null
          ? null
          : DateTime.parse(json['CarRaisedDate'] as String),
      carClosedDate: json['CarClosedDate'] == null
          ? null
          : DateTime.parse(json['CarClosedDate'] as String),
      createDT: json['CreateDT'] == null
          ? null
          : DateTime.parse(json['CreateDT'] as String),
      updateDT: json['UpdateDT'] == null
          ? null
          : DateTime.parse(json['UpdateDT'] as String),
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$ChemicalToJson(Chemical instance) => <String, dynamic>{
      'TotalRows': instance.totalRows,
      'chemicalNo': instance.chemicalNo,
      'FarmId': instance.farmId,
      'ChemicalTypeId': instance.chemicalTypeId,
      'ChemicalApplicationMethodId': instance.chemicalApplicationMethodId,
      'CampId': instance.campId,
      'Date': instance.date?.toIso8601String(),
      'OpeningStock': instance.openingStock,
      'Issued': instance.issued,
      'Balance': instance.balance,
      'Mixture': instance.mixture,
      'UsagePerHa': instance.usagePerHa,
      'Comment': instance.comment,
      'CarRaisedDate': instance.carRaisedDate?.toIso8601String(),
      'CarClosedDate': instance.carClosedDate?.toIso8601String(),
      'CreateDT': instance.createDT?.toIso8601String(),
      'UpdateDT': instance.updateDT?.toIso8601String(),
      'IsActive': instance.isActive,
    };
