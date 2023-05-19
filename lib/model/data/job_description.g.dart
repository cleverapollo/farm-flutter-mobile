// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_description.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetJobDescriptionCollection on Isar {
  IsarCollection<JobDescription> get jobDescriptions => this.collection();
}

const JobDescriptionSchema = CollectionSchema(
  name: r'JobDescription',
  id: -7367012115274360360,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isAssignedToWorker': PropertySchema(
      id: 1,
      name: r'isAssignedToWorker',
      type: IsarType.bool,
    ),
    r'jobDescriptionId': PropertySchema(
      id: 2,
      name: r'jobDescriptionId',
      type: IsarType.long,
    ),
    r'jobDescriptionName': PropertySchema(
      id: 3,
      name: r'jobDescriptionName',
      type: IsarType.string,
    )
  },
  estimateSize: _jobDescriptionEstimateSize,
  serialize: _jobDescriptionSerialize,
  deserialize: _jobDescriptionDeserialize,
  deserializeProp: _jobDescriptionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _jobDescriptionGetId,
  getLinks: _jobDescriptionGetLinks,
  attach: _jobDescriptionAttach,
  version: '3.0.5',
);

int _jobDescriptionEstimateSize(
  JobDescription object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.jobDescriptionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _jobDescriptionSerialize(
  JobDescription object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeBool(offsets[1], object.isAssignedToWorker);
  writer.writeLong(offsets[2], object.jobDescriptionId);
  writer.writeString(offsets[3], object.jobDescriptionName);
}

JobDescription _jobDescriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JobDescription(
    isActive: reader.readBoolOrNull(offsets[0]),
    isAssignedToWorker: reader.readBoolOrNull(offsets[1]),
    jobDescriptionId: reader.readLong(offsets[2]),
    jobDescriptionName: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _jobDescriptionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jobDescriptionGetId(JobDescription object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _jobDescriptionGetLinks(JobDescription object) {
  return [];
}

void _jobDescriptionAttach(
    IsarCollection<dynamic> col, Id id, JobDescription object) {}

extension JobDescriptionQueryWhereSort
    on QueryBuilder<JobDescription, JobDescription, QWhere> {
  QueryBuilder<JobDescription, JobDescription, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobDescriptionQueryWhere
    on QueryBuilder<JobDescription, JobDescription, QWhereClause> {
  QueryBuilder<JobDescription, JobDescription, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<JobDescription, JobDescription, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterWhereClause> idBetween(
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

extension JobDescriptionQueryFilter
    on QueryBuilder<JobDescription, JobDescription, QFilterCondition> {
  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
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

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
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

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition> idBetween(
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

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      isAssignedToWorkerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isAssignedToWorker',
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      isAssignedToWorkerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isAssignedToWorker',
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      isAssignedToWorkerEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAssignedToWorker',
        value: value,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobDescriptionId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobDescriptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobDescriptionName',
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobDescriptionName',
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobDescriptionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobDescriptionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobDescriptionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobDescriptionName',
        value: '',
      ));
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterFilterCondition>
      jobDescriptionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobDescriptionName',
        value: '',
      ));
    });
  }
}

extension JobDescriptionQueryObject
    on QueryBuilder<JobDescription, JobDescription, QFilterCondition> {}

extension JobDescriptionQueryLinks
    on QueryBuilder<JobDescription, JobDescription, QFilterCondition> {}

extension JobDescriptionQuerySortBy
    on QueryBuilder<JobDescription, JobDescription, QSortBy> {
  QueryBuilder<JobDescription, JobDescription, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      sortByIsAssignedToWorker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAssignedToWorker', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      sortByIsAssignedToWorkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAssignedToWorker', Sort.desc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      sortByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      sortByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      sortByJobDescriptionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      sortByJobDescriptionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.desc);
    });
  }
}

extension JobDescriptionQuerySortThenBy
    on QueryBuilder<JobDescription, JobDescription, QSortThenBy> {
  QueryBuilder<JobDescription, JobDescription, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      thenByIsAssignedToWorker() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAssignedToWorker', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      thenByIsAssignedToWorkerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAssignedToWorker', Sort.desc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      thenByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      thenByJobDescriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionId', Sort.desc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      thenByJobDescriptionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.asc);
    });
  }

  QueryBuilder<JobDescription, JobDescription, QAfterSortBy>
      thenByJobDescriptionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobDescriptionName', Sort.desc);
    });
  }
}

extension JobDescriptionQueryWhereDistinct
    on QueryBuilder<JobDescription, JobDescription, QDistinct> {
  QueryBuilder<JobDescription, JobDescription, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<JobDescription, JobDescription, QDistinct>
      distinctByIsAssignedToWorker() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAssignedToWorker');
    });
  }

  QueryBuilder<JobDescription, JobDescription, QDistinct>
      distinctByJobDescriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescriptionId');
    });
  }

  QueryBuilder<JobDescription, JobDescription, QDistinct>
      distinctByJobDescriptionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobDescriptionName',
          caseSensitive: caseSensitive);
    });
  }
}

extension JobDescriptionQueryProperty
    on QueryBuilder<JobDescription, JobDescription, QQueryProperty> {
  QueryBuilder<JobDescription, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<JobDescription, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<JobDescription, bool?, QQueryOperations>
      isAssignedToWorkerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAssignedToWorker');
    });
  }

  QueryBuilder<JobDescription, int, QQueryOperations>
      jobDescriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescriptionId');
    });
  }

  QueryBuilder<JobDescription, String?, QQueryOperations>
      jobDescriptionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobDescriptionName');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobDescription _$$_JobDescriptionFromJson(Map<String, dynamic> json) =>
    _$_JobDescription(
      jobDescriptionId: json['JobDescriptionId'] as int,
      jobDescriptionName: json['JobDescriptionName'] as String?,
      isAssignedToWorker: json['IsAssignedToWorker'] as bool?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_JobDescriptionToJson(_$_JobDescription instance) =>
    <String, dynamic>{
      'JobDescriptionId': instance.jobDescriptionId,
      'JobDescriptionName': instance.jobDescriptionName,
      'IsAssignedToWorker': instance.isAssignedToWorker,
      'IsActive': instance.isActive,
    };
