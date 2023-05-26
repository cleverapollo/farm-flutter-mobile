// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Disability _$DisabilityFromJson(Map<String, dynamic> json) {
  return _Disability.fromJson(json);
}

/// @nodoc
mixin _$Disability {
  @JsonKey(name: 'DisabilityId')
  int? get disabilityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DisabilityName')
  String? get disabilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisabilityCopyWith<Disability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisabilityCopyWith<$Res> {
  factory $DisabilityCopyWith(
          Disability value, $Res Function(Disability) then) =
      _$DisabilityCopyWithImpl<$Res, Disability>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DisabilityId') int? disabilityId,
      @JsonKey(name: 'DisabilityName') String? disabilityName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class _$DisabilityCopyWithImpl<$Res, $Val extends Disability>
    implements $DisabilityCopyWith<$Res> {
  _$DisabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disabilityId = freezed,
    Object? disabilityName = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      disabilityId: freezed == disabilityId
          ? _value.disabilityId
          : disabilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      disabilityName: freezed == disabilityName
          ? _value.disabilityName
          : disabilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DisabilityCopyWith<$Res>
    implements $DisabilityCopyWith<$Res> {
  factory _$$_DisabilityCopyWith(
          _$_Disability value, $Res Function(_$_Disability) then) =
      __$$_DisabilityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DisabilityId') int? disabilityId,
      @JsonKey(name: 'DisabilityName') String? disabilityName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class __$$_DisabilityCopyWithImpl<$Res>
    extends _$DisabilityCopyWithImpl<$Res, _$_Disability>
    implements _$$_DisabilityCopyWith<$Res> {
  __$$_DisabilityCopyWithImpl(
      _$_Disability _value, $Res Function(_$_Disability) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disabilityId = freezed,
    Object? disabilityName = freezed,
    Object? isActive = null,
  }) {
    return _then(_$_Disability(
      disabilityId: freezed == disabilityId
          ? _value.disabilityId
          : disabilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      disabilityName: freezed == disabilityName
          ? _value.disabilityName
          : disabilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Disability extends _Disability {
  const _$_Disability(
      {@JsonKey(name: 'DisabilityId') this.disabilityId,
      @JsonKey(name: 'DisabilityName') this.disabilityName,
      @JsonKey(name: 'IsActive') this.isActive = true})
      : super._();

  factory _$_Disability.fromJson(Map<String, dynamic> json) =>
      _$$_DisabilityFromJson(json);

  @override
  @JsonKey(name: 'DisabilityId')
  final int? disabilityId;
  @override
  @JsonKey(name: 'DisabilityName')
  final String? disabilityName;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;

  @override
  String toString() {
    return 'Disability(disabilityId: $disabilityId, disabilityName: $disabilityName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Disability &&
            (identical(other.disabilityId, disabilityId) ||
                other.disabilityId == disabilityId) &&
            (identical(other.disabilityName, disabilityName) ||
                other.disabilityName == disabilityName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, disabilityId, disabilityName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DisabilityCopyWith<_$_Disability> get copyWith =>
      __$$_DisabilityCopyWithImpl<_$_Disability>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DisabilityToJson(
      this,
    );
  }
}

abstract class _Disability extends Disability {
  const factory _Disability(
      {@JsonKey(name: 'DisabilityId') final int? disabilityId,
      @JsonKey(name: 'DisabilityName') final String? disabilityName,
      @JsonKey(name: 'IsActive') final bool isActive}) = _$_Disability;
  const _Disability._() : super._();

  factory _Disability.fromJson(Map<String, dynamic> json) =
      _$_Disability.fromJson;

  @override
  @JsonKey(name: 'DisabilityId')
  int? get disabilityId;
  @override
  @JsonKey(name: 'DisabilityName')
  String? get disabilityName;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_DisabilityCopyWith<_$_Disability> get copyWith =>
      throw _privateConstructorUsedError;
}
