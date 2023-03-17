// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'severity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSeverityCollection on Isar {
  IsarCollection<Severity> get severitys => this.collection();
}

const SeveritySchema = CollectionSchema(
  name: r'Severity',
  id: 8969989293756254857,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'severityId': PropertySchema(
      id: 1,
      name: r'severityId',
      type: IsarType.long,
    )
  },
  estimateSize: _severityEstimateSize,
  serialize: _severitySerialize,
  deserialize: _severityDeserialize,
  deserializeProp: _severityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _severityGetId,
  getLinks: _severityGetLinks,
  attach: _severityAttach,
  version: '3.0.5',
);

int _severityEstimateSize(
  Severity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _severitySerialize(
  Severity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.severityId);
}

Severity _severityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Severity(
    isActive: reader.readBoolOrNull(offsets[0]),
    severityId: reader.readLong(offsets[1]),
  );
  return object;
}

P _severityDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _severityGetId(Severity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _severityGetLinks(Severity object) {
  return [];
}

void _severityAttach(IsarCollection<dynamic> col, Id id, Severity object) {}

extension SeverityQueryWhereSort on QueryBuilder<Severity, Severity, QWhere> {
  QueryBuilder<Severity, Severity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SeverityQueryWhere on QueryBuilder<Severity, Severity, QWhereClause> {
  QueryBuilder<Severity, Severity, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Severity, Severity, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Severity, Severity, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Severity, Severity, QAfterWhereClause> idBetween(
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

extension SeverityQueryFilter
    on QueryBuilder<Severity, Severity, QFilterCondition> {
  QueryBuilder<Severity, Severity, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Severity, Severity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Severity, Severity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Severity, Severity, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterFilterCondition> severityIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterFilterCondition> severityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterFilterCondition> severityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'severityId',
        value: value,
      ));
    });
  }

  QueryBuilder<Severity, Severity, QAfterFilterCondition> severityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'severityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SeverityQueryObject
    on QueryBuilder<Severity, Severity, QFilterCondition> {}

extension SeverityQueryLinks
    on QueryBuilder<Severity, Severity, QFilterCondition> {}

extension SeverityQuerySortBy on QueryBuilder<Severity, Severity, QSortBy> {
  QueryBuilder<Severity, Severity, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> sortBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> sortBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }
}

extension SeverityQuerySortThenBy
    on QueryBuilder<Severity, Severity, QSortThenBy> {
  QueryBuilder<Severity, Severity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> thenBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.asc);
    });
  }

  QueryBuilder<Severity, Severity, QAfterSortBy> thenBySeverityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'severityId', Sort.desc);
    });
  }
}

extension SeverityQueryWhereDistinct
    on QueryBuilder<Severity, Severity, QDistinct> {
  QueryBuilder<Severity, Severity, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Severity, Severity, QDistinct> distinctBySeverityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'severityId');
    });
  }
}

extension SeverityQueryProperty
    on QueryBuilder<Severity, Severity, QQueryProperty> {
  QueryBuilder<Severity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Severity, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Severity, int, QQueryOperations> severityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'severityId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Severity _$$_SeverityFromJson(Map<String, dynamic> json) => _$_Severity(
      severityId: json['SeverityId'] as int,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_SeverityToJson(_$_Severity instance) =>
    <String, dynamic>{
      'SeverityId': instance.severityId,
      'IsActive': instance.isActive,
    };
