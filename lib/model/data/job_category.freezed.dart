// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobCategory _$JobCategoryFromJson(Map<String, dynamic> json) {
  return _JobCategory.fromJson(json);
}

/// @nodoc
mixin _$JobCategory {
  @JsonKey(name: 'JobCategoryId')
  int? get jobCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobCategoryName')
  String? get jobCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'UnitId')
  int? get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobCategoryCopyWith<JobCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCategoryCopyWith<$Res> {
  factory $JobCategoryCopyWith(
          JobCategory value, $Res Function(JobCategory) then) =
      _$JobCategoryCopyWithImpl<$Res, JobCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'JobCategoryId') int? jobCategoryId,
      @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
      @JsonKey(name: 'UnitId') int? unitId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$JobCategoryCopyWithImpl<$Res, $Val extends JobCategory>
    implements $JobCategoryCopyWith<$Res> {
  _$JobCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobCategoryId = freezed,
    Object? jobCategoryName = freezed,
    Object? unitId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      jobCategoryId: freezed == jobCategoryId
          ? _value.jobCategoryId
          : jobCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobCategoryName: freezed == jobCategoryName
          ? _value.jobCategoryName
          : jobCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobCategoryCopyWith<$Res>
    implements $JobCategoryCopyWith<$Res> {
  factory _$$_JobCategoryCopyWith(
          _$_JobCategory value, $Res Function(_$_JobCategory) then) =
      __$$_JobCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'JobCategoryId') int? jobCategoryId,
      @JsonKey(name: 'JobCategoryName') String? jobCategoryName,
      @JsonKey(name: 'UnitId') int? unitId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_JobCategoryCopyWithImpl<$Res>
    extends _$JobCategoryCopyWithImpl<$Res, _$_JobCategory>
    implements _$$_JobCategoryCopyWith<$Res> {
  __$$_JobCategoryCopyWithImpl(
      _$_JobCategory _value, $Res Function(_$_JobCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobCategoryId = freezed,
    Object? jobCategoryName = freezed,
    Object? unitId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_JobCategory(
      jobCategoryId: freezed == jobCategoryId
          ? _value.jobCategoryId
          : jobCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      jobCategoryName: freezed == jobCategoryName
          ? _value.jobCategoryName
          : jobCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobCategory implements _JobCategory {
  const _$_JobCategory(
      {@JsonKey(name: 'JobCategoryId') this.jobCategoryId,
      @JsonKey(name: 'JobCategoryName') this.jobCategoryName,
      @JsonKey(name: 'UnitId') this.unitId,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_JobCategory.fromJson(Map<String, dynamic> json) =>
      _$$_JobCategoryFromJson(json);

  @override
  @JsonKey(name: 'JobCategoryId')
  final int? jobCategoryId;
  @override
  @JsonKey(name: 'JobCategoryName')
  final String? jobCategoryName;
  @override
  @JsonKey(name: 'UnitId')
  final int? unitId;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'JobCategory(jobCategoryId: $jobCategoryId, jobCategoryName: $jobCategoryName, unitId: $unitId, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobCategory &&
            (identical(other.jobCategoryId, jobCategoryId) ||
                other.jobCategoryId == jobCategoryId) &&
            (identical(other.jobCategoryName, jobCategoryName) ||
                other.jobCategoryName == jobCategoryName) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, jobCategoryId, jobCategoryName, unitId, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobCategoryCopyWith<_$_JobCategory> get copyWith =>
      __$$_JobCategoryCopyWithImpl<_$_JobCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobCategoryToJson(
      this,
    );
  }
}

abstract class _JobCategory implements JobCategory {
  const factory _JobCategory(
      {@JsonKey(name: 'JobCategoryId') final int? jobCategoryId,
      @JsonKey(name: 'JobCategoryName') final String? jobCategoryName,
      @JsonKey(name: 'UnitId') final int? unitId,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_JobCategory;

  factory _JobCategory.fromJson(Map<String, dynamic> json) =
      _$_JobCategory.fromJson;

  @override
  @JsonKey(name: 'JobCategoryId')
  int? get jobCategoryId;
  @override
  @JsonKey(name: 'JobCategoryName')
  String? get jobCategoryName;
  @override
  @JsonKey(name: 'UnitId')
  int? get unitId;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_JobCategoryCopyWith<_$_JobCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
