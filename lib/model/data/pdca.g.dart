// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdca.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPdcaCollection on Isar {
  IsarCollection<Pdca> get pdcas => this.collection();
}

const PdcaSchema = CollectionSchema(
  name: r'Pdca',
  id: -1199579162593190778,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'pdcaId': PropertySchema(
      id: 1,
      name: r'pdcaId',
      type: IsarType.long,
    ),
    r'pdcaName': PropertySchema(
      id: 2,
      name: r'pdcaName',
      type: IsarType.string,
    )
  },
  estimateSize: _pdcaEstimateSize,
  serialize: _pdcaSerialize,
  deserialize: _pdcaDeserialize,
  deserializeProp: _pdcaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _pdcaGetId,
  getLinks: _pdcaGetLinks,
  attach: _pdcaAttach,
  version: '3.0.5',
);

int _pdcaEstimateSize(
  Pdca object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.pdcaName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pdcaSerialize(
  Pdca object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.pdcaId);
  writer.writeString(offsets[2], object.pdcaName);
}

Pdca _pdcaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Pdca(
    isActive: reader.readBoolOrNull(offsets[0]),
    pdcaId: reader.readLong(offsets[1]),
    pdcaName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _pdcaDeserializeProp<P>(
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

Id _pdcaGetId(Pdca object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pdcaGetLinks(Pdca object) {
  return [];
}

void _pdcaAttach(IsarCollection<dynamic> col, Id id, Pdca object) {}

extension PdcaQueryWhereSort on QueryBuilder<Pdca, Pdca, QWhere> {
  QueryBuilder<Pdca, Pdca, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PdcaQueryWhere on QueryBuilder<Pdca, Pdca, QWhereClause> {
  QueryBuilder<Pdca, Pdca, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Pdca, Pdca, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterWhereClause> idBetween(
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

extension PdcaQueryFilter on QueryBuilder<Pdca, Pdca, QFilterCondition> {
  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdcaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdcaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdcaId',
        value: value,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdcaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdcaName',
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdcaName',
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdcaName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdcaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdcaName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdcaName',
        value: '',
      ));
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterFilterCondition> pdcaNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdcaName',
        value: '',
      ));
    });
  }
}

extension PdcaQueryObject on QueryBuilder<Pdca, Pdca, QFilterCondition> {}

extension PdcaQueryLinks on QueryBuilder<Pdca, Pdca, QFilterCondition> {}

extension PdcaQuerySortBy on QueryBuilder<Pdca, Pdca, QSortBy> {
  QueryBuilder<Pdca, Pdca, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> sortByPdcaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.asc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> sortByPdcaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.desc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> sortByPdcaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.asc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> sortByPdcaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.desc);
    });
  }
}

extension PdcaQuerySortThenBy on QueryBuilder<Pdca, Pdca, QSortThenBy> {
  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenByPdcaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.asc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenByPdcaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaId', Sort.desc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenByPdcaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.asc);
    });
  }

  QueryBuilder<Pdca, Pdca, QAfterSortBy> thenByPdcaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdcaName', Sort.desc);
    });
  }
}

extension PdcaQueryWhereDistinct on QueryBuilder<Pdca, Pdca, QDistinct> {
  QueryBuilder<Pdca, Pdca, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Pdca, Pdca, QDistinct> distinctByPdcaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdcaId');
    });
  }

  QueryBuilder<Pdca, Pdca, QDistinct> distinctByPdcaName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdcaName', caseSensitive: caseSensitive);
    });
  }
}

extension PdcaQueryProperty on QueryBuilder<Pdca, Pdca, QQueryProperty> {
  QueryBuilder<Pdca, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Pdca, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Pdca, int, QQueryOperations> pdcaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdcaId');
    });
  }

  QueryBuilder<Pdca, String?, QQueryOperations> pdcaNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdcaName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pdca _$$_PdcaFromJson(Map<String, dynamic> json) => _$_Pdca(
      pdcaId: json['PDCAId'] as int,
      pdcaName: json['PDCAName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_PdcaToJson(_$_Pdca instance) => <String, dynamic>{
      'PDCAId': instance.pdcaId,
      'PDCAName': instance.pdcaName,
      'IsActive': instance.isActive,
    };
