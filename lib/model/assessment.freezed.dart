// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Assessment _$AssessmentFromJson(Map<String, dynamic> json) {
  return _Assessment.fromJson(json);
}

/// @nodoc
mixin _$Assessment {
  @JsonKey(name: 'AssessmentId')
  int get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreateDT')
  String? get createDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdateDT')
  String? get updateDT => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssessmentCopyWith<Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssessmentCopyWith<$Res> {
  factory $AssessmentCopyWith(
          Assessment value, $Res Function(Assessment) then) =
      _$AssessmentCopyWithImpl<$Res, Assessment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AssessmentId') int assessmentId,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
}

/// @nodoc
class _$AssessmentCopyWithImpl<$Res, $Val extends Assessment>
    implements $AssessmentCopyWith<$Res> {
  _$AssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = null,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_value.copyWith(
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssessmentCopyWith<$Res>
    implements $AssessmentCopyWith<$Res> {
  factory _$$_AssessmentCopyWith(
          _$_Assessment value, $Res Function(_$_Assessment) then) =
      __$$_AssessmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AssessmentId') int assessmentId,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
}

/// @nodoc
class __$$_AssessmentCopyWithImpl<$Res>
    extends _$AssessmentCopyWithImpl<$Res, _$_Assessment>
    implements _$$_AssessmentCopyWith<$Res> {
  __$$_AssessmentCopyWithImpl(
      _$_Assessment _value, $Res Function(_$_Assessment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assessmentId = null,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_$_Assessment(
      assessmentId: null == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Assessment extends _Assessment {
  const _$_Assessment(
      {@JsonKey(name: 'AssessmentId') required this.assessmentId,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'CreateDT') this.createDT,
      @JsonKey(name: 'UpdateDT') this.updateDT})
      : super._();

  factory _$_Assessment.fromJson(Map<String, dynamic> json) =>
      _$$_AssessmentFromJson(json);

  @override
  @JsonKey(name: 'AssessmentId')
  final int assessmentId;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'CreateDT')
  final String? createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  final String? updateDT;

  @override
  String toString() {
    return 'Assessment(assessmentId: $assessmentId, status: $status, isActive: $isActive, createDT: $createDT, updateDT: $updateDT)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Assessment &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createDT, createDT) ||
                other.createDT == createDT) &&
            (identical(other.updateDT, updateDT) ||
                other.updateDT == updateDT));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, assessmentId, status, isActive, createDT, updateDT);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssessmentCopyWith<_$_Assessment> get copyWith =>
      __$$_AssessmentCopyWithImpl<_$_Assessment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssessmentToJson(
      this,
    );
  }
}

abstract class _Assessment extends Assessment {
  const factory _Assessment(
      {@JsonKey(name: 'AssessmentId') required final int assessmentId,
      @JsonKey(name: 'Status') final int? status,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'CreateDT') final String? createDT,
      @JsonKey(name: 'UpdateDT') final String? updateDT}) = _$_Assessment;
  const _Assessment._() : super._();

  factory _Assessment.fromJson(Map<String, dynamic> json) =
      _$_Assessment.fromJson;

  @override
  @JsonKey(name: 'AssessmentId')
  int get assessmentId;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'CreateDT')
  String? get createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  String? get updateDT;
  @override
  @JsonKey(ignore: true)
  _$$_AssessmentCopyWith<_$_Assessment> get copyWith =>
      throw _privateConstructorUsedError;
}
