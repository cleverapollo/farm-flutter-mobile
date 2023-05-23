// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asi.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAsiCollection on Isar {
  IsarCollection<Asi> get asis => this.collection();
}

const AsiSchema = CollectionSchema(
  name: r'Asi',
  id: -4173833888866702502,
  properties: {
    r'asiRegisterId': PropertySchema(
      id: 0,
      name: r'asiRegisterId',
      type: IsarType.string,
    ),
    r'asiRegisterNo': PropertySchema(
      id: 1,
      name: r'asiRegisterNo',
      type: IsarType.string,
    ),
    r'asiTypeId': PropertySchema(
      id: 2,
      name: r'asiTypeId',
      type: IsarType.long,
    ),
    r'asiTypeName': PropertySchema(
      id: 3,
      name: r'asiTypeName',
      type: IsarType.string,
    ),
    r'carClosedDate': PropertySchema(
      id: 4,
      name: r'carClosedDate',
      type: IsarType.string,
    ),
    r'carRaisedDate': PropertySchema(
      id: 5,
      name: r'carRaisedDate',
      type: IsarType.string,
    ),
    r'comment': PropertySchema(
      id: 6,
      name: r'comment',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 7,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'farmId': PropertySchema(
      id: 8,
      name: r'farmId',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 9,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isMasterdataSynced': PropertySchema(
      id: 10,
      name: r'isMasterdataSynced',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 11,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 12,
      name: r'longitude',
      type: IsarType.double,
    )
  },
  estimateSize: _asiEstimateSize,
  serialize: _asiSerialize,
  deserialize: _asiDeserialize,
  deserializeProp: _asiDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _asiGetId,
  getLinks: _asiGetLinks,
  attach: _asiAttach,
  version: '3.1.0',
);

int _asiEstimateSize(
  Asi object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.asiRegisterId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.asiRegisterNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.asiTypeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.carClosedDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.carRaisedDate;
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
    final value = object.farmId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _asiSerialize(
  Asi object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.asiRegisterId);
  writer.writeString(offsets[1], object.asiRegisterNo);
  writer.writeLong(offsets[2], object.asiTypeId);
  writer.writeString(offsets[3], object.asiTypeName);
  writer.writeString(offsets[4], object.carClosedDate);
  writer.writeString(offsets[5], object.carRaisedDate);
  writer.writeString(offsets[6], object.comment);
  writer.writeDateTime(offsets[7], object.date);
  writer.writeString(offsets[8], object.farmId);
  writer.writeBool(offsets[9], object.isActive);
  writer.writeBool(offsets[10], object.isMasterdataSynced);
  writer.writeDouble(offsets[11], object.latitude);
  writer.writeDouble(offsets[12], object.longitude);
}

Asi _asiDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Asi(
    asiRegisterId: reader.readStringOrNull(offsets[0]),
    asiRegisterNo: reader.readStringOrNull(offsets[1]),
    asiTypeId: reader.readLongOrNull(offsets[2]),
    asiTypeName: reader.readStringOrNull(offsets[3]),
    carClosedDate: reader.readStringOrNull(offsets[4]),
    carRaisedDate: reader.readStringOrNull(offsets[5]),
    comment: reader.readStringOrNull(offsets[6]),
    date: reader.readDateTimeOrNull(offsets[7]),
    farmId: reader.readStringOrNull(offsets[8]),
    isActive: reader.readBoolOrNull(offsets[9]),
    isMasterdataSynced: reader.readBoolOrNull(offsets[10]),
    latitude: reader.readDoubleOrNull(offsets[11]),
    longitude: reader.readDoubleOrNull(offsets[12]),
  );
  return object;
}

P _asiDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _asiGetId(Asi object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _asiGetLinks(Asi object) {
  return [];
}

void _asiAttach(IsarCollection<dynamic> col, Id id, Asi object) {}

extension AsiQueryWhereSort on QueryBuilder<Asi, Asi, QWhere> {
  QueryBuilder<Asi, Asi, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AsiQueryWhere on QueryBuilder<Asi, Asi, QWhereClause> {
  QueryBuilder<Asi, Asi, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Asi, Asi, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Asi, Asi, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Asi, Asi, QAfterWhereClause> idBetween(
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

extension AsiQueryFilter on QueryBuilder<Asi, Asi, QFilterCondition> {
  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'asiRegisterId',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'asiRegisterId',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asiRegisterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'asiRegisterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'asiRegisterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'asiRegisterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'asiRegisterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'asiRegisterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'asiRegisterId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'asiRegisterId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asiRegisterId',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'asiRegisterId',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'asiRegisterNo',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'asiRegisterNo',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asiRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'asiRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'asiRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'asiRegisterNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'asiRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'asiRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'asiRegisterNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'asiRegisterNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asiRegisterNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiRegisterNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'asiRegisterNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'asiTypeId',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'asiTypeId',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asiTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'asiTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'asiTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'asiTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'asiTypeName',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'asiTypeName',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asiTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'asiTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'asiTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'asiTypeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'asiTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'asiTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'asiTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'asiTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'asiTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> asiTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'asiTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carClosedDate',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carClosedDate',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carClosedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carClosedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carClosedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'carClosedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'carClosedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'carClosedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'carClosedDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carClosedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carClosedDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'carClosedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carRaisedDate',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carRaisedDate',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaisedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carRaisedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carRaisedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carRaisedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'carRaisedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'carRaisedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'carRaisedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'carRaisedDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carRaisedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> carRaisedDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'carRaisedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentEqualTo(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentGreaterThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentLessThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentBetween(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentStartsWith(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentEndsWith(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> dateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'farmId',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdEqualTo(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdGreaterThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdLessThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdBetween(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdStartsWith(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdEndsWith(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'farmId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'farmId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> farmIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'farmId',
        value: '',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> isMasterdataSyncedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isMasterdataSynced',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> isMasterdataSyncedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isMasterdataSynced',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> isMasterdataSyncedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMasterdataSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> latitudeGreaterThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> latitudeLessThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Asi, Asi, QAfterFilterCondition> longitudeEqualTo(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> longitudeGreaterThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> longitudeLessThan(
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

  QueryBuilder<Asi, Asi, QAfterFilterCondition> longitudeBetween(
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

extension AsiQueryObject on QueryBuilder<Asi, Asi, QFilterCondition> {}

extension AsiQueryLinks on QueryBuilder<Asi, Asi, QFilterCondition> {}

extension AsiQuerySortBy on QueryBuilder<Asi, Asi, QSortBy> {
  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiRegisterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterId', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiRegisterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterId', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiRegisterNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterNo', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiRegisterNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterNo', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeId', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeId', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeName', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByAsiTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeName', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByCarClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByCarRaisedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByIsMasterdataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterdataSynced', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByIsMasterdataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterdataSynced', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension AsiQuerySortThenBy on QueryBuilder<Asi, Asi, QSortThenBy> {
  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiRegisterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterId', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiRegisterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterId', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiRegisterNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterNo', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiRegisterNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiRegisterNo', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeId', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeId', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeName', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByAsiTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asiTypeName', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByCarClosedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByCarClosedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carClosedDate', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByCarRaisedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByCarRaisedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carRaisedDate', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByFarmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByFarmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'farmId', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByIsMasterdataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterdataSynced', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByIsMasterdataSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMasterdataSynced', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Asi, Asi, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension AsiQueryWhereDistinct on QueryBuilder<Asi, Asi, QDistinct> {
  QueryBuilder<Asi, Asi, QDistinct> distinctByAsiRegisterId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'asiRegisterId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByAsiRegisterNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'asiRegisterNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByAsiTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'asiTypeId');
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByAsiTypeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'asiTypeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByCarClosedDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carClosedDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByCarRaisedDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carRaisedDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByFarmId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'farmId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByIsMasterdataSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMasterdataSynced');
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<Asi, Asi, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }
}

extension AsiQueryProperty on QueryBuilder<Asi, Asi, QQueryProperty> {
  QueryBuilder<Asi, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Asi, String?, QQueryOperations> asiRegisterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'asiRegisterId');
    });
  }

  QueryBuilder<Asi, String?, QQueryOperations> asiRegisterNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'asiRegisterNo');
    });
  }

  QueryBuilder<Asi, int?, QQueryOperations> asiTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'asiTypeId');
    });
  }

  QueryBuilder<Asi, String?, QQueryOperations> asiTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'asiTypeName');
    });
  }

  QueryBuilder<Asi, String?, QQueryOperations> carClosedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carClosedDate');
    });
  }

  QueryBuilder<Asi, String?, QQueryOperations> carRaisedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carRaisedDate');
    });
  }

  QueryBuilder<Asi, String?, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<Asi, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Asi, String?, QQueryOperations> farmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'farmId');
    });
  }

  QueryBuilder<Asi, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Asi, bool?, QQueryOperations> isMasterdataSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMasterdataSynced');
    });
  }

  QueryBuilder<Asi, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Asi, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Asi _$$_AsiFromJson(Map<String, dynamic> json) => _$_Asi(
      asiRegisterNo: json['AsiRegisterNo'] as String?,
      farmId: json['FarmId'] as String?,
      asiRegisterId: json['AsiRegisterId'] as String?,
      asiTypeId: json['AsiTypeId'] as int?,
      latitude: (json['Latitude'] as num?)?.toDouble(),
      longitude: (json['Longitude'] as num?)?.toDouble(),
      date:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
      comment: json['Comment'] as String?,
      carRaisedDate: json['CarRaisedDate'] as String?,
      carClosedDate: json['CarClosedDate'] as String?,
      isActive: json['IsActive'] as bool?,
      isMasterdataSynced: json['IsMasterdataSynced'] as bool?,
      asiTypeName: json['AsiTypeName'] as String?,
    );

Map<String, dynamic> _$$_AsiToJson(_$_Asi instance) => <String, dynamic>{
      'AsiRegisterNo': instance.asiRegisterNo,
      'FarmId': instance.farmId,
      'AsiRegisterId': instance.asiRegisterId,
      'AsiTypeId': instance.asiTypeId,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'Date': instance.date?.toIso8601String(),
      'Comment': instance.comment,
      'CarRaisedDate': instance.carRaisedDate,
      'CarClosedDate': instance.carClosedDate,
      'IsActive': instance.isActive,
      'IsMasterdataSynced': instance.isMasterdataSynced,
      'AsiTypeName': instance.asiTypeName,
    };
