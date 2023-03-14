// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'impact_on.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImpactOn _$ImpactOnFromJson(Map<String, dynamic> json) {
  return _ImpactOn.fromJson(json);
}

/// @nodoc
mixin _$ImpactOn {
  @JsonKey(name: 'ImpactOnId')
  int? get impactOnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImpactOnName')
  String? get impactOnName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImpactOnCopyWith<ImpactOn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpactOnCopyWith<$Res> {
  factory $ImpactOnCopyWith(ImpactOn value, $Res Function(ImpactOn) then) =
      _$ImpactOnCopyWithImpl<$Res, ImpactOn>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ImpactOnId') int? impactOnId,
      @JsonKey(name: 'ImpactOnName') String? impactOnName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$ImpactOnCopyWithImpl<$Res, $Val extends ImpactOn>
    implements $ImpactOnCopyWith<$Res> {
  _$ImpactOnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impactOnId = freezed,
    Object? impactOnName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      impactOnId: freezed == impactOnId
          ? _value.impactOnId
          : impactOnId // ignore: cast_nullable_to_non_nullable
              as int?,
      impactOnName: freezed == impactOnName
          ? _value.impactOnName
          : impactOnName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImpactOnCopyWith<$Res> implements $ImpactOnCopyWith<$Res> {
  factory _$$_ImpactOnCopyWith(
          _$_ImpactOn value, $Res Function(_$_ImpactOn) then) =
      __$$_ImpactOnCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ImpactOnId') int? impactOnId,
      @JsonKey(name: 'ImpactOnName') String? impactOnName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_ImpactOnCopyWithImpl<$Res>
    extends _$ImpactOnCopyWithImpl<$Res, _$_ImpactOn>
    implements _$$_ImpactOnCopyWith<$Res> {
  __$$_ImpactOnCopyWithImpl(
      _$_ImpactOn _value, $Res Function(_$_ImpactOn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? impactOnId = freezed,
    Object? impactOnName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_ImpactOn(
      impactOnId: freezed == impactOnId
          ? _value.impactOnId
          : impactOnId // ignore: cast_nullable_to_non_nullable
              as int?,
      impactOnName: freezed == impactOnName
          ? _value.impactOnName
          : impactOnName // ignore: cast_nullable_to_non_nullable
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
class _$_ImpactOn implements _ImpactOn {
  const _$_ImpactOn(
      {@JsonKey(name: 'ImpactOnId') this.impactOnId,
      @JsonKey(name: 'ImpactOnName') this.impactOnName,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_ImpactOn.fromJson(Map<String, dynamic> json) =>
      _$$_ImpactOnFromJson(json);

  @override
  @JsonKey(name: 'ImpactOnId')
  final int? impactOnId;
  @override
  @JsonKey(name: 'ImpactOnName')
  final String? impactOnName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'ImpactOn(impactOnId: $impactOnId, impactOnName: $impactOnName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImpactOn &&
            (identical(other.impactOnId, impactOnId) ||
                other.impactOnId == impactOnId) &&
            (identical(other.impactOnName, impactOnName) ||
                other.impactOnName == impactOnName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, impactOnId, impactOnName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImpactOnCopyWith<_$_ImpactOn> get copyWith =>
      __$$_ImpactOnCopyWithImpl<_$_ImpactOn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImpactOnToJson(
      this,
    );
  }
}

abstract class _ImpactOn implements ImpactOn {
  const factory _ImpactOn(
      {@JsonKey(name: 'ImpactOnId') final int? impactOnId,
      @JsonKey(name: 'ImpactOnName') final String? impactOnName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_ImpactOn;

  factory _ImpactOn.fromJson(Map<String, dynamic> json) = _$_ImpactOn.fromJson;

  @override
  @JsonKey(name: 'ImpactOnId')
  int? get impactOnId;
  @override
  @JsonKey(name: 'ImpactOnName')
  String? get impactOnName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_ImpactOnCopyWith<_$_ImpactOn> get copyWith =>
      throw _privateConstructorUsedError;
}
