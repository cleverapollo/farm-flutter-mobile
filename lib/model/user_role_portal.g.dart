// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_portal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetUserRolePortalCollection on Isar {
  IsarCollection<UserRolePortal> get userRolePortals => this.collection();
}

const UserRolePortalSchema = CollectionSchema(
  name: r'UserRolePortal',
  id: 1117771089366947367,
  properties: {
    r'portalId': PropertySchema(
      id: 0,
      name: r'portalId',
      type: IsarType.long,
    ),
    r'portalName': PropertySchema(
      id: 1,
      name: r'portalName',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 2,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _userRolePortalEstimateSize,
  serialize: _userRolePortalSerialize,
  deserialize: _userRolePortalDeserialize,
  deserializeProp: _userRolePortalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userRolePortalGetId,
  getLinks: _userRolePortalGetLinks,
  attach: _userRolePortalAttach,
  version: '3.0.5',
);

int _userRolePortalEstimateSize(
  UserRolePortal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.portalName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userRolePortalSerialize(
  UserRolePortal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.portalId);
  writer.writeString(offsets[1], object.portalName);
  writer.writeLong(offsets[2], object.userId);
}

UserRolePortal _userRolePortalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserRolePortal(
    portalId: reader.readLongOrNull(offsets[0]),
    portalName: reader.readStringOrNull(offsets[1]),
    userId: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _userRolePortalDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userRolePortalGetId(UserRolePortal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userRolePortalGetLinks(UserRolePortal object) {
  return [];
}

void _userRolePortalAttach(
    IsarCollection<dynamic> col, Id id, UserRolePortal object) {}

extension UserRolePortalQueryWhereSort
    on QueryBuilder<UserRolePortal, UserRolePortal, QWhere> {
  QueryBuilder<UserRolePortal, UserRolePortal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserRolePortalQueryWhere
    on QueryBuilder<UserRolePortal, UserRolePortal, QWhereClause> {
  QueryBuilder<UserRolePortal, UserRolePortal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterWhereClause> idBetween(
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

extension UserRolePortalQueryFilter
    on QueryBuilder<UserRolePortal, UserRolePortal, QFilterCondition> {
  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
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

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
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

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portalId',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portalId',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portalId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portalId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portalId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portalName',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portalName',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portalName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portalName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portalName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portalName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      portalNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portalName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterFilterCondition>
      userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserRolePortalQueryObject
    on QueryBuilder<UserRolePortal, UserRolePortal, QFilterCondition> {}

extension UserRolePortalQueryLinks
    on QueryBuilder<UserRolePortal, UserRolePortal, QFilterCondition> {}

extension UserRolePortalQuerySortBy
    on QueryBuilder<UserRolePortal, UserRolePortal, QSortBy> {
  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy> sortByPortalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalId', Sort.asc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      sortByPortalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalId', Sort.desc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      sortByPortalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalName', Sort.asc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      sortByPortalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalName', Sort.desc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserRolePortalQuerySortThenBy
    on QueryBuilder<UserRolePortal, UserRolePortal, QSortThenBy> {
  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy> thenByPortalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalId', Sort.asc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      thenByPortalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalId', Sort.desc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      thenByPortalName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalName', Sort.asc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      thenByPortalNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portalName', Sort.desc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserRolePortalQueryWhereDistinct
    on QueryBuilder<UserRolePortal, UserRolePortal, QDistinct> {
  QueryBuilder<UserRolePortal, UserRolePortal, QDistinct> distinctByPortalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portalId');
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QDistinct> distinctByPortalName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portalName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserRolePortal, UserRolePortal, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension UserRolePortalQueryProperty
    on QueryBuilder<UserRolePortal, UserRolePortal, QQueryProperty> {
  QueryBuilder<UserRolePortal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserRolePortal, int?, QQueryOperations> portalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portalId');
    });
  }

  QueryBuilder<UserRolePortal, String?, QQueryOperations> portalNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portalName');
    });
  }

  QueryBuilder<UserRolePortal, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRolePortal _$$_UserRolePortalFromJson(Map<String, dynamic> json) =>
    _$_UserRolePortal(
      userId: json['UserId'] as int?,
      portalId: json['PortalId'] as int?,
      portalName: json['PortalName'] as String?,
    );

Map<String, dynamic> _$$_UserRolePortalToJson(_$_UserRolePortal instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'PortalId': instance.portalId,
      'PortalName': instance.portalName,
    };
