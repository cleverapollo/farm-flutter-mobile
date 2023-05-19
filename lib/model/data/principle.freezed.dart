// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'principle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Principle _$PrincipleFromJson(Map<String, dynamic> json) {
  return _Principle.fromJson(json);
}

/// @nodoc
mixin _$Principle {
  @JsonKey(name: 'PrincipleId')
  int get principleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipleName')
  String? get principleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PrincipleDescription')
  String? get principleDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrincipleCopyWith<Principle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipleCopyWith<$Res> {
  factory $PrincipleCopyWith(Principle value, $Res Function(Principle) then) =
      _$PrincipleCopyWithImpl<$Res, Principle>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PrincipleId') int principleId,
      @JsonKey(name: 'PrincipleName') String? principleName,
      @JsonKey(name: 'PrincipleDescription') String? principleDescription,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$PrincipleCopyWithImpl<$Res, $Val extends Principle>
    implements $PrincipleCopyWith<$Res> {
  _$PrincipleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principleId = null,
    Object? principleName = freezed,
    Object? principleDescription = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      principleId: null == principleId
          ? _value.principleId
          : principleId // ignore: cast_nullable_to_non_nullable
              as int,
      principleName: freezed == principleName
          ? _value.principleName
          : principleName // ignore: cast_nullable_to_non_nullable
              as String?,
      principleDescription: freezed == principleDescription
          ? _value.principleDescription
          : principleDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrincipleCopyWith<$Res> implements $PrincipleCopyWith<$Res> {
  factory _$$_PrincipleCopyWith(
          _$_Principle value, $Res Function(_$_Principle) then) =
      __$$_PrincipleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PrincipleId') int principleId,
      @JsonKey(name: 'PrincipleName') String? principleName,
      @JsonKey(name: 'PrincipleDescription') String? principleDescription,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_PrincipleCopyWithImpl<$Res>
    extends _$PrincipleCopyWithImpl<$Res, _$_Principle>
    implements _$$_PrincipleCopyWith<$Res> {
  __$$_PrincipleCopyWithImpl(
      _$_Principle _value, $Res Function(_$_Principle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principleId = null,
    Object? principleName = freezed,
    Object? principleDescription = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Principle(
      principleId: null == principleId
          ? _value.principleId
          : principleId // ignore: cast_nullable_to_non_nullable
              as int,
      principleName: freezed == principleName
          ? _value.principleName
          : principleName // ignore: cast_nullable_to_non_nullable
              as String?,
      principleDescription: freezed == principleDescription
          ? _value.principleDescription
          : principleDescription // ignore: cast_nullable_to_non_nullable
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
class _$_Principle extends _Principle {
  const _$_Principle(
      {@JsonKey(name: 'PrincipleId') required this.principleId,
      @JsonKey(name: 'PrincipleName') this.principleName,
      @JsonKey(name: 'PrincipleDescription') this.principleDescription,
      @JsonKey(name: 'IsActive') this.isActive = true})
      : super._();

  factory _$_Principle.fromJson(Map<String, dynamic> json) =>
      _$$_PrincipleFromJson(json);

  @override
  @JsonKey(name: 'PrincipleId')
  final int principleId;
  @override
  @JsonKey(name: 'PrincipleName')
  final String? principleName;
  @override
  @JsonKey(name: 'PrincipleDescription')
  final String? principleDescription;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Principle(principleId: $principleId, principleName: $principleName, principleDescription: $principleDescription, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Principle &&
            (identical(other.principleId, principleId) ||
                other.principleId == principleId) &&
            (identical(other.principleName, principleName) ||
                other.principleName == principleName) &&
            (identical(other.principleDescription, principleDescription) ||
                other.principleDescription == principleDescription) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, principleId, principleName, principleDescription, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrincipleCopyWith<_$_Principle> get copyWith =>
      __$$_PrincipleCopyWithImpl<_$_Principle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrincipleToJson(
      this,
    );
  }
}

abstract class _Principle extends Principle {
  const factory _Principle(
      {@JsonKey(name: 'PrincipleId') required final int principleId,
      @JsonKey(name: 'PrincipleName') final String? principleName,
      @JsonKey(name: 'PrincipleDescription') final String? principleDescription,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Principle;
  const _Principle._() : super._();

  factory _Principle.fromJson(Map<String, dynamic> json) =
      _$_Principle.fromJson;

  @override
  @JsonKey(name: 'PrincipleId')
  int get principleId;
  @override
  @JsonKey(name: 'PrincipleName')
  String? get principleName;
  @override
  @JsonKey(name: 'PrincipleDescription')
  String? get principleDescription;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_PrincipleCopyWith<_$_Principle> get copyWith =>
      throw _privateConstructorUsedError;
}
