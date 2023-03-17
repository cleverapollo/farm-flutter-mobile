// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_description.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobDescription _$JobDescriptionFromJson(Map<String, dynamic> json) {
  return _JobDescription.fromJson(json);
}

/// @nodoc
mixin _$JobDescription {
  @JsonKey(name: 'JobDescriptionId')
  int get jobDescriptionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobDescriptionName')
  String? get jobDescriptionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobDescriptionCopyWith<JobDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobDescriptionCopyWith<$Res> {
  factory $JobDescriptionCopyWith(
          JobDescription value, $Res Function(JobDescription) then) =
      _$JobDescriptionCopyWithImpl<$Res, JobDescription>;
  @useResult
  $Res call(
      {@JsonKey(name: 'JobDescriptionId') int jobDescriptionId,
      @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$JobDescriptionCopyWithImpl<$Res, $Val extends JobDescription>
    implements $JobDescriptionCopyWith<$Res> {
  _$JobDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobDescriptionId = null,
    Object? jobDescriptionName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      jobDescriptionId: null == jobDescriptionId
          ? _value.jobDescriptionId
          : jobDescriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      jobDescriptionName: freezed == jobDescriptionName
          ? _value.jobDescriptionName
          : jobDescriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobDescriptionCopyWith<$Res>
    implements $JobDescriptionCopyWith<$Res> {
  factory _$$_JobDescriptionCopyWith(
          _$_JobDescription value, $Res Function(_$_JobDescription) then) =
      __$$_JobDescriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'JobDescriptionId') int jobDescriptionId,
      @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_JobDescriptionCopyWithImpl<$Res>
    extends _$JobDescriptionCopyWithImpl<$Res, _$_JobDescription>
    implements _$$_JobDescriptionCopyWith<$Res> {
  __$$_JobDescriptionCopyWithImpl(
      _$_JobDescription _value, $Res Function(_$_JobDescription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobDescriptionId = null,
    Object? jobDescriptionName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_JobDescription(
      jobDescriptionId: null == jobDescriptionId
          ? _value.jobDescriptionId
          : jobDescriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      jobDescriptionName: freezed == jobDescriptionName
          ? _value.jobDescriptionName
          : jobDescriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobDescription extends _JobDescription {
  const _$_JobDescription(
      {@JsonKey(name: 'JobDescriptionId') required this.jobDescriptionId,
      @JsonKey(name: 'JobDescriptionName') this.jobDescriptionName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_JobDescription.fromJson(Map<String, dynamic> json) =>
      _$$_JobDescriptionFromJson(json);

  @override
  @JsonKey(name: 'JobDescriptionId')
  final int jobDescriptionId;
  @override
  @JsonKey(name: 'JobDescriptionName')
  final String? jobDescriptionName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'JobDescription(jobDescriptionId: $jobDescriptionId, jobDescriptionName: $jobDescriptionName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobDescription &&
            (identical(other.jobDescriptionId, jobDescriptionId) ||
                other.jobDescriptionId == jobDescriptionId) &&
            (identical(other.jobDescriptionName, jobDescriptionName) ||
                other.jobDescriptionName == jobDescriptionName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, jobDescriptionId, jobDescriptionName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobDescriptionCopyWith<_$_JobDescription> get copyWith =>
      __$$_JobDescriptionCopyWithImpl<_$_JobDescription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobDescriptionToJson(
      this,
    );
  }
}

abstract class _JobDescription extends JobDescription {
  const factory _JobDescription(
      {@JsonKey(name: 'JobDescriptionId') required final int jobDescriptionId,
      @JsonKey(name: 'JobDescriptionName') final String? jobDescriptionName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_JobDescription;
  const _JobDescription._() : super._();

  factory _JobDescription.fromJson(Map<String, dynamic> json) =
      _$_JobDescription.fromJson;

  @override
  @JsonKey(name: 'JobDescriptionId')
  int get jobDescriptionId;
  @override
  @JsonKey(name: 'JobDescriptionName')
  String? get jobDescriptionName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_JobDescriptionCopyWith<_$_JobDescription> get copyWith =>
      throw _privateConstructorUsedError;
}
