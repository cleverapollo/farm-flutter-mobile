// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobElement _$JobElementFromJson(Map<String, dynamic> json) {
  return _JobElement.fromJson(json);
}

/// @nodoc
mixin _$JobElement {
  @JsonKey(name: 'JobElementId')
  int get jobElementId => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobElementName')
  String? get jobElementName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobElementCopyWith<JobElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobElementCopyWith<$Res> {
  factory $JobElementCopyWith(
          JobElement value, $Res Function(JobElement) then) =
      _$JobElementCopyWithImpl<$Res, JobElement>;
  @useResult
  $Res call(
      {@JsonKey(name: 'JobElementId') int jobElementId,
      @JsonKey(name: 'JobElementName') String? jobElementName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$JobElementCopyWithImpl<$Res, $Val extends JobElement>
    implements $JobElementCopyWith<$Res> {
  _$JobElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobElementId = null,
    Object? jobElementName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      jobElementId: null == jobElementId
          ? _value.jobElementId
          : jobElementId // ignore: cast_nullable_to_non_nullable
              as int,
      jobElementName: freezed == jobElementName
          ? _value.jobElementName
          : jobElementName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobElementCopyWith<$Res>
    implements $JobElementCopyWith<$Res> {
  factory _$$_JobElementCopyWith(
          _$_JobElement value, $Res Function(_$_JobElement) then) =
      __$$_JobElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'JobElementId') int jobElementId,
      @JsonKey(name: 'JobElementName') String? jobElementName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_JobElementCopyWithImpl<$Res>
    extends _$JobElementCopyWithImpl<$Res, _$_JobElement>
    implements _$$_JobElementCopyWith<$Res> {
  __$$_JobElementCopyWithImpl(
      _$_JobElement _value, $Res Function(_$_JobElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobElementId = null,
    Object? jobElementName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_JobElement(
      jobElementId: null == jobElementId
          ? _value.jobElementId
          : jobElementId // ignore: cast_nullable_to_non_nullable
              as int,
      jobElementName: freezed == jobElementName
          ? _value.jobElementName
          : jobElementName // ignore: cast_nullable_to_non_nullable
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
class _$_JobElement extends _JobElement {
  const _$_JobElement(
      {@JsonKey(name: 'JobElementId') required this.jobElementId,
      @JsonKey(name: 'JobElementName') this.jobElementName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_JobElement.fromJson(Map<String, dynamic> json) =>
      _$$_JobElementFromJson(json);

  @override
  @JsonKey(name: 'JobElementId')
  final int jobElementId;
  @override
  @JsonKey(name: 'JobElementName')
  final String? jobElementName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'JobElement(jobElementId: $jobElementId, jobElementName: $jobElementName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobElement &&
            (identical(other.jobElementId, jobElementId) ||
                other.jobElementId == jobElementId) &&
            (identical(other.jobElementName, jobElementName) ||
                other.jobElementName == jobElementName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, jobElementId, jobElementName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobElementCopyWith<_$_JobElement> get copyWith =>
      __$$_JobElementCopyWithImpl<_$_JobElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobElementToJson(
      this,
    );
  }
}

abstract class _JobElement extends JobElement {
  const factory _JobElement(
      {@JsonKey(name: 'JobElementId') required final int jobElementId,
      @JsonKey(name: 'JobElementName') final String? jobElementName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_JobElement;
  const _JobElement._() : super._();

  factory _JobElement.fromJson(Map<String, dynamic> json) =
      _$_JobElement.fromJson;

  @override
  @JsonKey(name: 'JobElementId')
  int get jobElementId;
  @override
  @JsonKey(name: 'JobElementName')
  String? get jobElementName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_JobElementCopyWith<_$_JobElement> get copyWith =>
      throw _privateConstructorUsedError;
}
