// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_reason.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRejectReasonCollection on Isar {
  IsarCollection<RejectReason> get rejectReasons => this.collection();
}

const RejectReasonSchema = CollectionSchema(
  name: r'RejectReason',
  id: 2385396964597622081,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'rejectReasonId': PropertySchema(
      id: 1,
      name: r'rejectReasonId',
      type: IsarType.long,
    ),
    r'rejectReasonName': PropertySchema(
      id: 2,
      name: r'rejectReasonName',
      type: IsarType.string,
    )
  },
  estimateSize: _rejectReasonEstimateSize,
  serialize: _rejectReasonSerialize,
  deserialize: _rejectReasonDeserialize,
  deserializeProp: _rejectReasonDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _rejectReasonGetId,
  getLinks: _rejectReasonGetLinks,
  attach: _rejectReasonAttach,
  version: '3.1.0',
);

int _rejectReasonEstimateSize(
  RejectReason object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.rejectReasonName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rejectReasonSerialize(
  RejectReason object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.rejectReasonId);
  writer.writeString(offsets[2], object.rejectReasonName);
}

RejectReason _rejectReasonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RejectReason(
    isActive: reader.readBoolOrNull(offsets[0]),
    rejectReasonId: reader.readLong(offsets[1]),
    rejectReasonName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _rejectReasonDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rejectReasonGetId(RejectReason object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rejectReasonGetLinks(RejectReason object) {
  return [];
}

void _rejectReasonAttach(
    IsarCollection<dynamic> col, Id id, RejectReason object) {}

extension RejectReasonQueryWhereSort
    on QueryBuilder<RejectReason, RejectReason, QWhere> {
  QueryBuilder<RejectReason, RejectReason, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RejectReasonQueryWhere
    on QueryBuilder<RejectReason, RejectReason, QWhereClause> {
  QueryBuilder<RejectReason, RejectReason, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RejectReason, RejectReason, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterWhereClause> idBetween(
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

extension RejectReasonQueryFilter
    on QueryBuilder<RejectReason, RejectReason, QFilterCondition> {
  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rejectReasonId',
        value: value,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rejectReasonId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rejectReasonName',
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rejectReasonName',
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rejectReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rejectReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rejectReasonName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rejectReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rejectReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rejectReasonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rejectReasonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectReasonName',
        value: '',
      ));
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterFilterCondition>
      rejectReasonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rejectReasonName',
        value: '',
      ));
    });
  }
}

extension RejectReasonQueryObject
    on QueryBuilder<RejectReason, RejectReason, QFilterCondition> {}

extension RejectReasonQueryLinks
    on QueryBuilder<RejectReason, RejectReason, QFilterCondition> {}

extension RejectReasonQuerySortBy
    on QueryBuilder<RejectReason, RejectReason, QSortBy> {
  QueryBuilder<RejectReason, RejectReason, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      sortByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      sortByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      sortByRejectReasonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonName', Sort.asc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      sortByRejectReasonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonName', Sort.desc);
    });
  }
}

extension RejectReasonQuerySortThenBy
    on QueryBuilder<RejectReason, RejectReason, QSortThenBy> {
  QueryBuilder<RejectReason, RejectReason, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      thenByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.asc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      thenByRejectReasonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonId', Sort.desc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      thenByRejectReasonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonName', Sort.asc);
    });
  }

  QueryBuilder<RejectReason, RejectReason, QAfterSortBy>
      thenByRejectReasonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectReasonName', Sort.desc);
    });
  }
}

extension RejectReasonQueryWhereDistinct
    on QueryBuilder<RejectReason, RejectReason, QDistinct> {
  QueryBuilder<RejectReason, RejectReason, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RejectReason, RejectReason, QDistinct>
      distinctByRejectReasonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectReasonId');
    });
  }

  QueryBuilder<RejectReason, RejectReason, QDistinct>
      distinctByRejectReasonName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectReasonName',
          caseSensitive: caseSensitive);
    });
  }
}

extension RejectReasonQueryProperty
    on QueryBuilder<RejectReason, RejectReason, QQueryProperty> {
  QueryBuilder<RejectReason, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RejectReason, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RejectReason, int, QQueryOperations> rejectReasonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectReasonId');
    });
  }

  QueryBuilder<RejectReason, String?, QQueryOperations>
      rejectReasonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectReasonName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RejectReason _$$_RejectReasonFromJson(Map<String, dynamic> json) =>
    _$_RejectReason(
      rejectReasonId: json['RejectReasonId'] as int,
      rejectReasonName: json['RejectReasonName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_RejectReasonToJson(_$_RejectReason instance) =>
    <String, dynamic>{
      'RejectReasonId': instance.rejectReasonId,
      'RejectReasonName': instance.rejectReasonName,
      'IsActive': instance.isActive,
    };
