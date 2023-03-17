// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_category.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetJobCategoryCollection on Isar {
  IsarCollection<JobCategory> get jobCategorys => this.collection();
}

const JobCategorySchema = CollectionSchema(
  name: r'JobCategory',
  id: 2234019104052323294,
  properties: {
    r'isActive': PropertySchema(
      id: 0,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'jobCategoryId': PropertySchema(
      id: 1,
      name: r'jobCategoryId',
      type: IsarType.long,
    ),
    r'jobCategoryName': PropertySchema(
      id: 2,
      name: r'jobCategoryName',
      type: IsarType.string,
    ),
    r'unitId': PropertySchema(
      id: 3,
      name: r'unitId',
      type: IsarType.long,
    )
  },
  estimateSize: _jobCategoryEstimateSize,
  serialize: _jobCategorySerialize,
  deserialize: _jobCategoryDeserialize,
  deserializeProp: _jobCategoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _jobCategoryGetId,
  getLinks: _jobCategoryGetLinks,
  attach: _jobCategoryAttach,
  version: '3.0.5',
);

int _jobCategoryEstimateSize(
  JobCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.jobCategoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _jobCategorySerialize(
  JobCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isActive);
  writer.writeLong(offsets[1], object.jobCategoryId);
  writer.writeString(offsets[2], object.jobCategoryName);
  writer.writeLong(offsets[3], object.unitId);
}

JobCategory _jobCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JobCategory(
    isActive: reader.readBoolOrNull(offsets[0]),
    jobCategoryId: reader.readLong(offsets[1]),
    jobCategoryName: reader.readStringOrNull(offsets[2]),
    unitId: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _jobCategoryDeserializeProp<P>(
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
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jobCategoryGetId(JobCategory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _jobCategoryGetLinks(JobCategory object) {
  return [];
}

void _jobCategoryAttach(
    IsarCollection<dynamic> col, Id id, JobCategory object) {}

extension JobCategoryQueryWhereSort
    on QueryBuilder<JobCategory, JobCategory, QWhere> {
  QueryBuilder<JobCategory, JobCategory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobCategoryQueryWhere
    on QueryBuilder<JobCategory, JobCategory, QWhereClause> {
  QueryBuilder<JobCategory, JobCategory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<JobCategory, JobCategory, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterWhereClause> idBetween(
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

extension JobCategoryQueryFilter
    on QueryBuilder<JobCategory, JobCategory, QFilterCondition> {
  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> idBetween(
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

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> isActiveEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobCategoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobCategoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobCategoryName',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobCategoryName',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobCategoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobCategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobCategoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobCategoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      jobCategoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobCategoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> unitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      unitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> unitIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition>
      unitIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> unitIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
      ));
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterFilterCondition> unitIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension JobCategoryQueryObject
    on QueryBuilder<JobCategory, JobCategory, QFilterCondition> {}

extension JobCategoryQueryLinks
    on QueryBuilder<JobCategory, JobCategory, QFilterCondition> {}

extension JobCategoryQuerySortBy
    on QueryBuilder<JobCategory, JobCategory, QSortBy> {
  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> sortByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy>
      sortByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> sortByJobCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy>
      sortByJobCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.desc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }
}

extension JobCategoryQuerySortThenBy
    on QueryBuilder<JobCategory, JobCategory, QSortThenBy> {
  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy>
      thenByJobCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryId', Sort.desc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenByJobCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy>
      thenByJobCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobCategoryName', Sort.desc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QAfterSortBy> thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }
}

extension JobCategoryQueryWhereDistinct
    on QueryBuilder<JobCategory, JobCategory, QDistinct> {
  QueryBuilder<JobCategory, JobCategory, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<JobCategory, JobCategory, QDistinct> distinctByJobCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobCategoryId');
    });
  }

  QueryBuilder<JobCategory, JobCategory, QDistinct> distinctByJobCategoryName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobCategoryName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JobCategory, JobCategory, QDistinct> distinctByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId');
    });
  }
}

extension JobCategoryQueryProperty
    on QueryBuilder<JobCategory, JobCategory, QQueryProperty> {
  QueryBuilder<JobCategory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<JobCategory, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<JobCategory, int, QQueryOperations> jobCategoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobCategoryId');
    });
  }

  QueryBuilder<JobCategory, String?, QQueryOperations>
      jobCategoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobCategoryName');
    });
  }

  QueryBuilder<JobCategory, int?, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JobCategory _$$_JobCategoryFromJson(Map<String, dynamic> json) =>
    _$_JobCategory(
      jobCategoryId: json['JobCategoryId'] as int,
      jobCategoryName: json['JobCategoryName'] as String?,
      unitId: json['UnitId'] as int?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_JobCategoryToJson(_$_JobCategory instance) =>
    <String, dynamic>{
      'JobCategoryId': instance.jobCategoryId,
      'JobCategoryName': instance.jobCategoryName,
      'UnitId': instance.unitId,
      'IsActive': instance.isActive,
    };
