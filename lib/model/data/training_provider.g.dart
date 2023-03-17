// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_provider.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTrainingProviderCollection on Isar {
  IsarCollection<TrainingProvider> get trainingProviders => this.collection();
}

const TrainingProviderSchema = CollectionSchema(
  name: r'TrainingProvider',
  id: -2883248314403758037,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'trainingProviderId': PropertySchema(
      id: 1,
      name: r'trainingProviderId',
      type: IsarType.long,
    ),
    r'trainingProviderName': PropertySchema(
      id: 2,
      name: r'trainingProviderName',
      type: IsarType.string,
    )
  },
  estimateSize: _trainingProviderEstimateSize,
  serialize: _trainingProviderSerialize,
  deserialize: _trainingProviderDeserialize,
  deserializeProp: _trainingProviderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _trainingProviderGetId,
  getLinks: _trainingProviderGetLinks,
  attach: _trainingProviderAttach,
  version: '3.0.5',
);

int _trainingProviderEstimateSize(
  TrainingProvider object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.trainingProviderName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trainingProviderSerialize(
  TrainingProvider object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.trainingProviderId);
  writer.writeString(offsets[2], object.trainingProviderName);
}

TrainingProvider _trainingProviderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TrainingProvider(
    isActive: reader.readBoolOrNull(offsets[0]),
    trainingProviderId: reader.readLong(offsets[1]),
    trainingProviderName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _trainingProviderDeserializeProp<P>(
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

Id _trainingProviderGetId(TrainingProvider object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _trainingProviderGetLinks(TrainingProvider object) {
  return [];
}

void _trainingProviderAttach(
    IsarCollection<dynamic> col, Id id, TrainingProvider object) {}

extension TrainingProviderQueryWhereSort
    on QueryBuilder<TrainingProvider, TrainingProvider, QWhere> {
  QueryBuilder<TrainingProvider, TrainingProvider, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TrainingProviderQueryWhere
    on QueryBuilder<TrainingProvider, TrainingProvider, QWhereClause> {
  QueryBuilder<TrainingProvider, TrainingProvider, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterWhereClause> idBetween(
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

extension TrainingProviderQueryFilter
    on QueryBuilder<TrainingProvider, TrainingProvider, QFilterCondition> {
  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
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

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
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

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingProviderId',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainingProviderId',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainingProviderId',
        value: value,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainingProviderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trainingProviderName',
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trainingProviderName',
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainingProviderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trainingProviderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trainingProviderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainingProviderName',
        value: '',
      ));
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterFilterCondition>
      trainingProviderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trainingProviderName',
        value: '',
      ));
    });
  }
}

extension TrainingProviderQueryObject
    on QueryBuilder<TrainingProvider, TrainingProvider, QFilterCondition> {}

extension TrainingProviderQueryLinks
    on QueryBuilder<TrainingProvider, TrainingProvider, QFilterCondition> {}

extension TrainingProviderQuerySortBy
    on QueryBuilder<TrainingProvider, TrainingProvider, QSortBy> {
  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      sortByTrainingProviderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.asc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      sortByTrainingProviderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.desc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      sortByTrainingProviderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.asc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      sortByTrainingProviderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.desc);
    });
  }
}

extension TrainingProviderQuerySortThenBy
    on QueryBuilder<TrainingProvider, TrainingProvider, QSortThenBy> {
  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      thenByTrainingProviderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.asc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      thenByTrainingProviderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderId', Sort.desc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      thenByTrainingProviderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.asc);
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QAfterSortBy>
      thenByTrainingProviderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainingProviderName', Sort.desc);
    });
  }
}

extension TrainingProviderQueryWhereDistinct
    on QueryBuilder<TrainingProvider, TrainingProvider, QDistinct> {
  QueryBuilder<TrainingProvider, TrainingProvider, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QDistinct>
      distinctByTrainingProviderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainingProviderId');
    });
  }

  QueryBuilder<TrainingProvider, TrainingProvider, QDistinct>
      distinctByTrainingProviderName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainingProviderName',
          caseSensitive: caseSensitive);
    });
  }
}

extension TrainingProviderQueryProperty
    on QueryBuilder<TrainingProvider, TrainingProvider, QQueryProperty> {
  QueryBuilder<TrainingProvider, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TrainingProvider, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<TrainingProvider, int, QQueryOperations>
      trainingProviderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainingProviderId');
    });
  }

  QueryBuilder<TrainingProvider, String?, QQueryOperations>
      trainingProviderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainingProviderName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrainingProvider _$$_TrainingProviderFromJson(Map<String, dynamic> json) =>
    _$_TrainingProvider(
      trainingProviderId: json['TrainingProviderId'] as int,
      trainingProviderName: json['TrainingProviderName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_TrainingProviderToJson(_$_TrainingProvider instance) =>
    <String, dynamic>{
      'TrainingProviderId': instance.trainingProviderId,
      'TrainingProviderName': instance.trainingProviderName,
      'IsActive': instance.isActive,
    };
