// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_element.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJobElementCollection on Isar {
  IsarCollection<JobElement> get jobElements => this.collection();
}

const JobElementSchema = CollectionSchema(
  name: r'JobElement',
  id: 1349029612989527456,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'jobElementId': PropertySchema(
      id: 1,
      name: r'jobElementId',
      type: IsarType.long,
    ),
    r'jobElementName': PropertySchema(
      id: 2,
      name: r'jobElementName',
      type: IsarType.string,
    )
  },
  estimateSize: _jobElementEstimateSize,
  serialize: _jobElementSerialize,
  deserialize: _jobElementDeserialize,
  deserializeProp: _jobElementDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _jobElementGetId,
  getLinks: _jobElementGetLinks,
  attach: _jobElementAttach,
  version: '3.1.0',
);

int _jobElementEstimateSize(
  JobElement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.jobElementName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _jobElementSerialize(
  JobElement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.jobElementId);
  writer.writeString(offsets[2], object.jobElementName);
}

JobElement _jobElementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JobElement(
    isActive: reader.readBoolOrNull(offsets[0]),
    jobElementId: reader.readLong(offsets[1]),
    jobElementName: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _jobElementDeserializeProp<P>(
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

Id _jobElementGetId(JobElement object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _jobElementGetLinks(JobElement object) {
  return [];
}

void _jobElementAttach(IsarCollection<dynamic> col, Id id, JobElement object) {}

extension JobElementQueryWhereSort
    on QueryBuilder<JobElement, JobElement, QWhere> {
  QueryBuilder<JobElement, JobElement, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobElementQueryWhere
    on QueryBuilder<JobElement, JobElement, QWhereClause> {
  QueryBuilder<JobElement, JobElement, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<JobElement, JobElement, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterWhereClause> idBetween(
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

extension JobElementQueryFilter
    on QueryBuilder<JobElement, JobElement, QFilterCondition> {
  QueryBuilder<JobElement, JobElement, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition> idBetween(
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

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobElementId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobElementId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobElementId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobElementId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobElementName',
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobElementName',
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobElementName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobElementName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobElementName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobElementName',
        value: '',
      ));
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterFilterCondition>
      jobElementNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobElementName',
        value: '',
      ));
    });
  }
}

extension JobElementQueryObject
    on QueryBuilder<JobElement, JobElement, QFilterCondition> {}

extension JobElementQueryLinks
    on QueryBuilder<JobElement, JobElement, QFilterCondition> {}

extension JobElementQuerySortBy
    on QueryBuilder<JobElement, JobElement, QSortBy> {
  QueryBuilder<JobElement, JobElement, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> sortByJobElementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.asc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> sortByJobElementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.desc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> sortByJobElementName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.asc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy>
      sortByJobElementNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.desc);
    });
  }
}

extension JobElementQuerySortThenBy
    on QueryBuilder<JobElement, JobElement, QSortThenBy> {
  QueryBuilder<JobElement, JobElement, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> thenByJobElementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.asc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> thenByJobElementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementId', Sort.desc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy> thenByJobElementName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.asc);
    });
  }

  QueryBuilder<JobElement, JobElement, QAfterSortBy>
      thenByJobElementNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobElementName', Sort.desc);
    });
  }
}

extension JobElementQueryWhereDistinct
    on QueryBuilder<JobElement, JobElement, QDistinct> {
  QueryBuilder<JobElement, JobElement, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<JobElement, JobElement, QDistinct> distinctByJobElementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobElementId');
    });
  }

  QueryBuilder<JobElement, JobElement, QDistinct> distinctByJobElementName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobElementName',
          caseSensitive: caseSensitive);
    });
  }
}

extension JobElementQueryProperty
    on QueryBuilder<JobElement, JobElement, QQueryProperty> {
  QueryBuilder<JobElement, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<JobElement, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<JobElement, int, QQueryOperations> jobElementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobElementId');
    });
  }

  QueryBuilder<JobElement, String?, QQueryOperations> jobElementNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobElementName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobElement _$$_JobElementFromJson(Map<String, dynamic> json) =>
    _$_JobElement(
      jobElementId: json['JobElementId'] as int,
      jobElementName: json['JobElementName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_JobElementToJson(_$_JobElement instance) =>
    <String, dynamic>{
      'JobElementId': instance.jobElementId,
      'JobElementName': instance.jobElementName,
      'IsActive': instance.isActive,
    };
