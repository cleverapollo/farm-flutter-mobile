// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compartment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCompartmentCollection on Isar {
  IsarCollection<Compartment> get compartments => this.collection();
}

const CompartmentSchema = CollectionSchema(
  name: r'Compartment',
  id: -2504452513762761647,
  properties: {
    r'compartmentId': PropertySchema(
      id: 0,
      name: r'compartmentId',
      type: IsarType.long,
    ),
    r'compartmentName': PropertySchema(
      id: 1,
      name: r'compartmentName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 2,
      name: r'isActive',
      type: IsarType.bool,
    )
  },
  estimateSize: _compartmentEstimateSize,
  serialize: _compartmentSerialize,
  deserialize: _compartmentDeserialize,
  deserializeProp: _compartmentDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _compartmentGetId,
  getLinks: _compartmentGetLinks,
  attach: _compartmentAttach,
  version: '3.0.5',
);

int _compartmentEstimateSize(
  Compartment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.compartmentName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _compartmentSerialize(
  Compartment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.compartmentId);
  writer.writeString(offsets[1], object.compartmentName);
  writer.writeBool(offsets[2], object.isActive);
}

Compartment _compartmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Compartment(
    compartmentId: reader.readLong(offsets[0]),
    compartmentName: reader.readStringOrNull(offsets[1]),
    isActive: reader.readBool(offsets[2]),
  );
  return object;
}

P _compartmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _compartmentGetId(Compartment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _compartmentGetLinks(Compartment object) {
  return [];
}

void _compartmentAttach(
    IsarCollection<dynamic> col, Id id, Compartment object) {}

extension CompartmentQueryWhereSort
    on QueryBuilder<Compartment, Compartment, QWhere> {
  QueryBuilder<Compartment, Compartment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompartmentQueryWhere
    on QueryBuilder<Compartment, Compartment, QWhereClause> {
  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterWhereClause> idBetween(
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

extension CompartmentQueryFilter
    on QueryBuilder<Compartment, Compartment, QFilterCondition> {
  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compartmentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compartmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'compartmentName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'compartmentName',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'compartmentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'compartmentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'compartmentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'compartmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition>
      compartmentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'compartmentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Compartment, Compartment, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }
}

extension CompartmentQueryObject
    on QueryBuilder<Compartment, Compartment, QFilterCondition> {}

extension CompartmentQueryLinks
    on QueryBuilder<Compartment, Compartment, QFilterCondition> {}

extension CompartmentQuerySortBy
    on QueryBuilder<Compartment, Compartment, QSortBy> {
  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByCompartmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByCompartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      sortByCompartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension CompartmentQuerySortThenBy
    on QueryBuilder<Compartment, Compartment, QSortThenBy> {
  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByCompartmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentId', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByCompartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy>
      thenByCompartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'compartmentName', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Compartment, Compartment, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }
}

extension CompartmentQueryWhereDistinct
    on QueryBuilder<Compartment, Compartment, QDistinct> {
  QueryBuilder<Compartment, Compartment, QDistinct> distinctByCompartmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compartmentId');
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByCompartmentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'compartmentName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Compartment, Compartment, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }
}

extension CompartmentQueryProperty
    on QueryBuilder<Compartment, Compartment, QQueryProperty> {
  QueryBuilder<Compartment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Compartment, int, QQueryOperations> compartmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compartmentId');
    });
  }

  QueryBuilder<Compartment, String?, QQueryOperations>
      compartmentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'compartmentName');
    });
  }

  QueryBuilder<Compartment, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Compartment _$$_CompartmentFromJson(Map<String, dynamic> json) =>
    _$_Compartment(
      compartmentId: json['CompartmentId'] as int,
      compartmentName: json['CompartmentName'] as String?,
      isActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$_CompartmentToJson(_$_Compartment instance) =>
    <String, dynamic>{
      'CompartmentId': instance.compartmentId,
      'CompartmentName': instance.compartmentName,
      'IsActive': instance.isActive,
    };
