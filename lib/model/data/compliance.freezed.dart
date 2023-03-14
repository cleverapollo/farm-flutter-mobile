// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compliance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Compliance _$ComplianceFromJson(Map<String, dynamic> json) {
  return _Compliance.fromJson(json);
}

/// @nodoc
mixin _$Compliance {
  @JsonKey(name: 'ComplianceId')
  int? get complianceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ComplianceName')
  String? get complianceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyId')
  int? get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'HasRejectReason')
  bool? get hasRejectReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'JobCategoryId')
  bool? get jobCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplianceCopyWith<Compliance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplianceCopyWith<$Res> {
  factory $ComplianceCopyWith(
          Compliance value, $Res Function(Compliance) then) =
      _$ComplianceCopyWithImpl<$Res, Compliance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ComplianceId') int? complianceId,
      @JsonKey(name: 'ComplianceName') String? complianceName,
      @JsonKey(name: 'CompanyId') int? companyId,
      @JsonKey(name: 'HasRejectReason') bool? hasRejectReason,
      @JsonKey(name: 'JobCategoryId') bool? jobCategoryId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$ComplianceCopyWithImpl<$Res, $Val extends Compliance>
    implements $ComplianceCopyWith<$Res> {
  _$ComplianceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complianceId = freezed,
    Object? complianceName = freezed,
    Object? companyId = freezed,
    Object? hasRejectReason = freezed,
    Object? jobCategoryId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      complianceId: freezed == complianceId
          ? _value.complianceId
          : complianceId // ignore: cast_nullable_to_non_nullable
              as int?,
      complianceName: freezed == complianceName
          ? _value.complianceName
          : complianceName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasRejectReason: freezed == hasRejectReason
          ? _value.hasRejectReason
          : hasRejectReason // ignore: cast_nullable_to_non_nullable
              as bool?,
      jobCategoryId: freezed == jobCategoryId
          ? _value.jobCategoryId
          : jobCategoryId // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComplianceCopyWith<$Res>
    implements $ComplianceCopyWith<$Res> {
  factory _$$_ComplianceCopyWith(
          _$_Compliance value, $Res Function(_$_Compliance) then) =
      __$$_ComplianceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ComplianceId') int? complianceId,
      @JsonKey(name: 'ComplianceName') String? complianceName,
      @JsonKey(name: 'CompanyId') int? companyId,
      @JsonKey(name: 'HasRejectReason') bool? hasRejectReason,
      @JsonKey(name: 'JobCategoryId') bool? jobCategoryId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_ComplianceCopyWithImpl<$Res>
    extends _$ComplianceCopyWithImpl<$Res, _$_Compliance>
    implements _$$_ComplianceCopyWith<$Res> {
  __$$_ComplianceCopyWithImpl(
      _$_Compliance _value, $Res Function(_$_Compliance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complianceId = freezed,
    Object? complianceName = freezed,
    Object? companyId = freezed,
    Object? hasRejectReason = freezed,
    Object? jobCategoryId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Compliance(
      complianceId: freezed == complianceId
          ? _value.complianceId
          : complianceId // ignore: cast_nullable_to_non_nullable
              as int?,
      complianceName: freezed == complianceName
          ? _value.complianceName
          : complianceName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      hasRejectReason: freezed == hasRejectReason
          ? _value.hasRejectReason
          : hasRejectReason // ignore: cast_nullable_to_non_nullable
              as bool?,
      jobCategoryId: freezed == jobCategoryId
          ? _value.jobCategoryId
          : jobCategoryId // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Compliance implements _Compliance {
  const _$_Compliance(
      {@JsonKey(name: 'ComplianceId') this.complianceId,
      @JsonKey(name: 'ComplianceName') this.complianceName,
      @JsonKey(name: 'CompanyId') this.companyId,
      @JsonKey(name: 'HasRejectReason') this.hasRejectReason,
      @JsonKey(name: 'JobCategoryId') this.jobCategoryId,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_Compliance.fromJson(Map<String, dynamic> json) =>
      _$$_ComplianceFromJson(json);

  @override
  @JsonKey(name: 'ComplianceId')
  final int? complianceId;
  @override
  @JsonKey(name: 'ComplianceName')
  final String? complianceName;
  @override
  @JsonKey(name: 'CompanyId')
  final int? companyId;
  @override
  @JsonKey(name: 'HasRejectReason')
  final bool? hasRejectReason;
  @override
  @JsonKey(name: 'JobCategoryId')
  final bool? jobCategoryId;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Compliance(complianceId: $complianceId, complianceName: $complianceName, companyId: $companyId, hasRejectReason: $hasRejectReason, jobCategoryId: $jobCategoryId, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Compliance &&
            (identical(other.complianceId, complianceId) ||
                other.complianceId == complianceId) &&
            (identical(other.complianceName, complianceName) ||
                other.complianceName == complianceName) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.hasRejectReason, hasRejectReason) ||
                other.hasRejectReason == hasRejectReason) &&
            (identical(other.jobCategoryId, jobCategoryId) ||
                other.jobCategoryId == jobCategoryId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, complianceId, complianceName,
      companyId, hasRejectReason, jobCategoryId, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComplianceCopyWith<_$_Compliance> get copyWith =>
      __$$_ComplianceCopyWithImpl<_$_Compliance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComplianceToJson(
      this,
    );
  }
}

abstract class _Compliance implements Compliance {
  const factory _Compliance(
      {@JsonKey(name: 'ComplianceId') final int? complianceId,
      @JsonKey(name: 'ComplianceName') final String? complianceName,
      @JsonKey(name: 'CompanyId') final int? companyId,
      @JsonKey(name: 'HasRejectReason') final bool? hasRejectReason,
      @JsonKey(name: 'JobCategoryId') final bool? jobCategoryId,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Compliance;

  factory _Compliance.fromJson(Map<String, dynamic> json) =
      _$_Compliance.fromJson;

  @override
  @JsonKey(name: 'ComplianceId')
  int? get complianceId;
  @override
  @JsonKey(name: 'ComplianceName')
  String? get complianceName;
  @override
  @JsonKey(name: 'CompanyId')
  int? get companyId;
  @override
  @JsonKey(name: 'HasRejectReason')
  bool? get hasRejectReason;
  @override
  @JsonKey(name: 'JobCategoryId')
  bool? get jobCategoryId;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_ComplianceCopyWith<_$_Compliance> get copyWith =>
      throw _privateConstructorUsedError;
}
