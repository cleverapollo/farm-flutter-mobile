// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'impact_caused.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImpactCaused _$ImpactCausedFromJson(Map<String, dynamic> json) {
  return _ImpactCaused.fromJson(json);
}

/// @nodoc
mixin _$ImpactCaused {
  @JsonKey(name: 'ImpactCausedId')
  int get impactCausedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImpactCausedName')
  String? get impactCausedName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactCausedCopyWith<ImpactCaused> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactCausedCopyWith<$Res> {
  factory $ImpactCausedCopyWith(
          ImpactCaused value, $Res Function(ImpactCaused) then) =
      _$ImpactCausedCopyWithImpl<$Res, ImpactCaused>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ImpactCausedId') int impactCausedId,
      @JsonKey(name: 'ImpactCausedName') String? impactCausedName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$ImpactCausedCopyWithImpl<$Res, $Val extends ImpactCaused>
    implements $ImpactCausedCopyWith<$Res> {
  _$ImpactCausedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impactCausedId = null,
    Object? impactCausedName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      impactCausedId: null == impactCausedId
          ? _value.impactCausedId
          : impactCausedId // ignore: cast_nullable_to_non_nullable
              as int,
      impactCausedName: freezed == impactCausedName
          ? _value.impactCausedName
          : impactCausedName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImpactCausedCopyWith<$Res>
    implements $ImpactCausedCopyWith<$Res> {
  factory _$$_ImpactCausedCopyWith(
          _$_ImpactCaused value, $Res Function(_$_ImpactCaused) then) =
      __$$_ImpactCausedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ImpactCausedId') int impactCausedId,
      @JsonKey(name: 'ImpactCausedName') String? impactCausedName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_ImpactCausedCopyWithImpl<$Res>
    extends _$ImpactCausedCopyWithImpl<$Res, _$_ImpactCaused>
    implements _$$_ImpactCausedCopyWith<$Res> {
  __$$_ImpactCausedCopyWithImpl(
      _$_ImpactCaused _value, $Res Function(_$_ImpactCaused) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impactCausedId = null,
    Object? impactCausedName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_ImpactCaused(
      impactCausedId: null == impactCausedId
          ? _value.impactCausedId
          : impactCausedId // ignore: cast_nullable_to_non_nullable
              as int,
      impactCausedName: freezed == impactCausedName
          ? _value.impactCausedName
          : impactCausedName // ignore: cast_nullable_to_non_nullable
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
class _$_ImpactCaused extends _ImpactCaused {
  const _$_ImpactCaused(
      {@JsonKey(name: 'ImpactCausedId') required this.impactCausedId,
      @JsonKey(name: 'ImpactCausedName') this.impactCausedName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_ImpactCaused.fromJson(Map<String, dynamic> json) =>
      _$$_ImpactCausedFromJson(json);

  @override
  @JsonKey(name: 'ImpactCausedId')
  final int impactCausedId;
  @override
  @JsonKey(name: 'ImpactCausedName')
  final String? impactCausedName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'ImpactCaused(impactCausedId: $impactCausedId, impactCausedName: $impactCausedName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImpactCaused &&
            (identical(other.impactCausedId, impactCausedId) ||
                other.impactCausedId == impactCausedId) &&
            (identical(other.impactCausedName, impactCausedName) ||
                other.impactCausedName == impactCausedName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, impactCausedId, impactCausedName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImpactCausedCopyWith<_$_ImpactCaused> get copyWith =>
      __$$_ImpactCausedCopyWithImpl<_$_ImpactCaused>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImpactCausedToJson(
      this,
    );
  }
}

abstract class _ImpactCaused extends ImpactCaused {
  const factory _ImpactCaused(
      {@JsonKey(name: 'ImpactCausedId') required final int impactCausedId,
      @JsonKey(name: 'ImpactCausedName') final String? impactCausedName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_ImpactCaused;
  const _ImpactCaused._() : super._();

  factory _ImpactCaused.fromJson(Map<String, dynamic> json) =
      _$_ImpactCaused.fromJson;

  @override
  @JsonKey(name: 'ImpactCausedId')
  int get impactCausedId;
  @override
  @JsonKey(name: 'ImpactCausedName')
  String? get impactCausedName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_ImpactCausedCopyWith<_$_ImpactCaused> get copyWith =>
      throw _privateConstructorUsedError;
}
