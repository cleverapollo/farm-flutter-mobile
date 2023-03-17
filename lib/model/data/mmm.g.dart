// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mmm.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMmmCollection on Isar {
  IsarCollection<Mmm> get mmms => this.collection();
}

const MmmSchema = CollectionSchema(
  name: r'Mmm',
  id: -8840043474114914066,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'mmmId': PropertySchema(
      id: 1,
      name: r'mmmId',
      type: IsarType.long,
    ),
    r'mmmName': PropertySchema(
      id: 2,
      name: r'mmmName',
      type: IsarType.string,
    )
  },
  estimateSize: _mmmEstimateSize,
  serialize: _mmmSerialize,
  deserialize: _mmmDeserialize,
  deserializeProp: _mmmDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mmmGetId,
  getLinks: _mmmGetLinks,
  attach: _mmmAttach,
  version: '3.0.5',
);

int _mmmEstimateSize(
  Mmm object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.mmmName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mmmSerialize(
  Mmm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.mmmId);
  writer.writeString(offsets[2], object.mmmName);
}

Mmm _mmmDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mmm(
    isActive: reader.readBoolOrNull(offsets[0]),
    mmmId: reader.readLong(offsets[1]),
    mmmName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _mmmDeserializeProp<P>(
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

Id _mmmGetId(Mmm object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mmmGetLinks(Mmm object) {
  return [];
}

void _mmmAttach(IsarCollection<dynamic> col, Id id, Mmm object) {}

extension MmmQueryWhereSort on QueryBuilder<Mmm, Mmm, QWhere> {
  QueryBuilder<Mmm, Mmm, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MmmQueryWhere on QueryBuilder<Mmm, Mmm, QWhereClause> {
  QueryBuilder<Mmm, Mmm, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mmm, Mmm, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterWhereClause> idBetween(
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

extension MmmQueryFilter on QueryBuilder<Mmm, Mmm, QFilterCondition> {
  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mmmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mmmName',
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mmmName',
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mmmName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mmmName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mmmName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mmmName',
        value: '',
      ));
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterFilterCondition> mmmNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mmmName',
        value: '',
      ));
    });
  }
}

extension MmmQueryObject on QueryBuilder<Mmm, Mmm, QFilterCondition> {}

extension MmmQueryLinks on QueryBuilder<Mmm, Mmm, QFilterCondition> {}

extension MmmQuerySortBy on QueryBuilder<Mmm, Mmm, QSortBy> {
  QueryBuilder<Mmm, Mmm, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> sortByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.asc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> sortByMmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.desc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> sortByMmmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.asc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> sortByMmmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.desc);
    });
  }
}

extension MmmQuerySortThenBy on QueryBuilder<Mmm, Mmm, QSortThenBy> {
  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.asc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenByMmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmId', Sort.desc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenByMmmName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.asc);
    });
  }

  QueryBuilder<Mmm, Mmm, QAfterSortBy> thenByMmmNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mmmName', Sort.desc);
    });
  }
}

extension MmmQueryWhereDistinct on QueryBuilder<Mmm, Mmm, QDistinct> {
  QueryBuilder<Mmm, Mmm, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Mmm, Mmm, QDistinct> distinctByMmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mmmId');
    });
  }

  QueryBuilder<Mmm, Mmm, QDistinct> distinctByMmmName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mmmName', caseSensitive: caseSensitive);
    });
  }
}

extension MmmQueryProperty on QueryBuilder<Mmm, Mmm, QQueryProperty> {
  QueryBuilder<Mmm, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mmm, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Mmm, int, QQueryOperations> mmmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mmmId');
    });
  }

  QueryBuilder<Mmm, String?, QQueryOperations> mmmNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mmmName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Mmm _$$_MmmFromJson(Map<String, dynamic> json) => _$_Mmm(
      mmmId: json['MMMId'] as int,
      mmmName: json['MMMName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_MmmToJson(_$_Mmm instance) => <String, dynamic>{
      'MMMId': instance.mmmId,
      'MMMName': instance.mmmName,
      'IsActive': instance.isActive,
    };
