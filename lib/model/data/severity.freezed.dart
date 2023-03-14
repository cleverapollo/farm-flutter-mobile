// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'severity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Severity _$SeverityFromJson(Map<String, dynamic> json) {
  return _Severity.fromJson(json);
}

/// @nodoc
mixin _$Severity {
  @JsonKey(name: 'SeverityId')
  int? get severityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeverityCopyWith<Severity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeverityCopyWith<$Res> {
  factory $SeverityCopyWith(Severity value, $Res Function(Severity) then) =
      _$SeverityCopyWithImpl<$Res, Severity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SeverityId') int? severityId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$SeverityCopyWithImpl<$Res, $Val extends Severity>
    implements $SeverityCopyWith<$Res> {
  _$SeverityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? severityId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      severityId: freezed == severityId
          ? _value.severityId
          : severityId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SeverityCopyWith<$Res> implements $SeverityCopyWith<$Res> {
  factory _$$_SeverityCopyWith(
          _$_Severity value, $Res Function(_$_Severity) then) =
      __$$_SeverityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SeverityId') int? severityId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_SeverityCopyWithImpl<$Res>
    extends _$SeverityCopyWithImpl<$Res, _$_Severity>
    implements _$$_SeverityCopyWith<$Res> {
  __$$_SeverityCopyWithImpl(
      _$_Severity _value, $Res Function(_$_Severity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? severityId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Severity(
      severityId: freezed == severityId
          ? _value.severityId
          : severityId // ignore: cast_nullable_to_non_nullable
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
class _$_Severity implements _Severity {
  const _$_Severity(
      {@JsonKey(name: 'SeverityId') this.severityId,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_Severity.fromJson(Map<String, dynamic> json) =>
      _$$_SeverityFromJson(json);

  @override
  @JsonKey(name: 'SeverityId')
  final int? severityId;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Severity(severityId: $severityId, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Severity &&
            (identical(other.severityId, severityId) ||
                other.severityId == severityId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, severityId, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SeverityCopyWith<_$_Severity> get copyWith =>
      __$$_SeverityCopyWithImpl<_$_Severity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeverityToJson(
      this,
    );
  }
}

abstract class _Severity implements Severity {
  const factory _Severity(
      {@JsonKey(name: 'SeverityId') final int? severityId,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Severity;

  factory _Severity.fromJson(Map<String, dynamic> json) = _$_Severity.fromJson;

  @override
  @JsonKey(name: 'SeverityId')
  int? get severityId;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_SeverityCopyWith<_$_Severity> get copyWith =>
      throw _privateConstructorUsedError;
}
