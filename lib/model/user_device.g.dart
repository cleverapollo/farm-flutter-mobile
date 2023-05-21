// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetUserDeviceCollection on Isar {
  IsarCollection<UserDevice> get userDevices => this.collection();
}

const UserDeviceSchema = CollectionSchema(
  name: r'UserDevice',
  id: -5730619805657865217,
  properties: {
    r'appName': PropertySchema(
      id: 0,
      name: r'appName',
      type: IsarType.string,
    ),
    r'appVersionNumber': PropertySchema(
      id: 1,
      name: r'appVersionNumber',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 2,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'deviceOS': PropertySchema(
      id: 3,
      name: r'deviceOS',
      type: IsarType.string,
    ),
    r'deviceVersion': PropertySchema(
      id: 4,
      name: r'deviceVersion',
      type: IsarType.string,
    ),
    r'userDeviceId': PropertySchema(
      id: 5,
      name: r'userDeviceId',
      type: IsarType.long,
    )
  },
  estimateSize: _userDeviceEstimateSize,
  serialize: _userDeviceSerialize,
  deserialize: _userDeviceDeserialize,
  deserializeProp: _userDeviceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userDeviceGetId,
  getLinks: _userDeviceGetLinks,
  attach: _userDeviceAttach,
  version: '3.0.5',
);

int _userDeviceEstimateSize(
  UserDevice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.appName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.appVersionNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deviceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deviceOS;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deviceVersion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userDeviceSerialize(
  UserDevice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.appName);
  writer.writeString(offsets[1], object.appVersionNumber);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeString(offsets[3], object.deviceOS);
  writer.writeString(offsets[4], object.deviceVersion);
  writer.writeLong(offsets[5], object.userDeviceId);
}

UserDevice _userDeviceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserDevice(
    appName: reader.readStringOrNull(offsets[0]),
    appVersionNumber: reader.readStringOrNull(offsets[1]),
    deviceId: reader.readStringOrNull(offsets[2]),
    deviceOS: reader.readStringOrNull(offsets[3]),
    deviceVersion: reader.readStringOrNull(offsets[4]),
    userDeviceId: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _userDeviceDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userDeviceGetId(UserDevice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userDeviceGetLinks(UserDevice object) {
  return [];
}

void _userDeviceAttach(IsarCollection<dynamic> col, Id id, UserDevice object) {}

extension UserDeviceQueryWhereSort
    on QueryBuilder<UserDevice, UserDevice, QWhere> {
  QueryBuilder<UserDevice, UserDevice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserDeviceQueryWhere
    on QueryBuilder<UserDevice, UserDevice, QWhereClause> {
  QueryBuilder<UserDevice, UserDevice, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserDevice, UserDevice, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterWhereClause> idBetween(
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

extension UserDeviceQueryFilter
    on QueryBuilder<UserDevice, UserDevice, QFilterCondition> {
  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appName',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appName',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> appNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appVersionNumber',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appVersionNumber',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appVersionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appVersionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appVersionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appVersionNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appVersionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appVersionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appVersionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appVersionNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appVersionNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      appVersionNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appVersionNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviceId',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviceId',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceOSIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviceOS',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceOSIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviceOS',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceOSEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceOS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceOSGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceOS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceOSLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceOS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceOSBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceOS',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceOSStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceOS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceOSEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceOS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceOSContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceOS',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> deviceOSMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceOS',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceOSIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceOS',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceOSIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceOS',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviceVersion',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviceVersion',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      deviceVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      userDeviceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userDeviceId',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      userDeviceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userDeviceId',
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      userDeviceIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userDeviceId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      userDeviceIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userDeviceId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      userDeviceIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userDeviceId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterFilterCondition>
      userDeviceIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userDeviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserDeviceQueryObject
    on QueryBuilder<UserDevice, UserDevice, QFilterCondition> {}

extension UserDeviceQueryLinks
    on QueryBuilder<UserDevice, UserDevice, QFilterCondition> {}

extension UserDeviceQuerySortBy
    on QueryBuilder<UserDevice, UserDevice, QSortBy> {
  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByAppVersionNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersionNumber', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy>
      sortByAppVersionNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersionNumber', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByDeviceOS() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceOS', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByDeviceOSDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceOS', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByDeviceVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceVersion', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByDeviceVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceVersion', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByUserDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDeviceId', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> sortByUserDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDeviceId', Sort.desc);
    });
  }
}

extension UserDeviceQuerySortThenBy
    on QueryBuilder<UserDevice, UserDevice, QSortThenBy> {
  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByAppName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByAppNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appName', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByAppVersionNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersionNumber', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy>
      thenByAppVersionNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appVersionNumber', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByDeviceOS() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceOS', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByDeviceOSDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceOS', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByDeviceVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceVersion', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByDeviceVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceVersion', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByUserDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDeviceId', Sort.asc);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QAfterSortBy> thenByUserDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userDeviceId', Sort.desc);
    });
  }
}

extension UserDeviceQueryWhereDistinct
    on QueryBuilder<UserDevice, UserDevice, QDistinct> {
  QueryBuilder<UserDevice, UserDevice, QDistinct> distinctByAppName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QDistinct> distinctByAppVersionNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appVersionNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QDistinct> distinctByDeviceOS(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceOS', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QDistinct> distinctByDeviceVersion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceVersion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserDevice, UserDevice, QDistinct> distinctByUserDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userDeviceId');
    });
  }
}

extension UserDeviceQueryProperty
    on QueryBuilder<UserDevice, UserDevice, QQueryProperty> {
  QueryBuilder<UserDevice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserDevice, String?, QQueryOperations> appNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appName');
    });
  }

  QueryBuilder<UserDevice, String?, QQueryOperations>
      appVersionNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appVersionNumber');
    });
  }

  QueryBuilder<UserDevice, String?, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<UserDevice, String?, QQueryOperations> deviceOSProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceOS');
    });
  }

  QueryBuilder<UserDevice, String?, QQueryOperations> deviceVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceVersion');
    });
  }

  QueryBuilder<UserDevice, int?, QQueryOperations> userDeviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userDeviceId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDevice _$$_UserDeviceFromJson(Map<String, dynamic> json) =>
    _$_UserDevice(
      userDeviceId: json['UserDeviceId'] as int?,
      deviceId: json['DeviceId'] as String?,
      deviceOS: json['DeviceOS'] as String?,
      deviceVersion: json['DeviceVersion'] as String?,
      appName: json['AppName'] as String?,
      appVersionNumber: json['AppVersionNumber'] as String?,
    );

Map<String, dynamic> _$$_UserDeviceToJson(_$_UserDevice instance) =>
    <String, dynamic>{
      'UserDeviceId': instance.userDeviceId,
      'DeviceId': instance.deviceId,
      'DeviceOS': instance.deviceOS,
      'DeviceVersion': instance.deviceVersion,
      'AppName': instance.appName,
      'AppVersionNumber': instance.appVersionNumber,
    };
