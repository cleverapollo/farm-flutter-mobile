// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return _Province.fromJson(json);
}

/// @nodoc
mixin _$Province {
  @JsonKey(name: 'ProvinceId')
  int get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProvinceName')
  String? get provinceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProvinceCopyWith<Province> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceCopyWith<$Res> {
  factory $ProvinceCopyWith(Province value, $Res Function(Province) then) =
      _$ProvinceCopyWithImpl<$Res, Province>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProvinceId') int provinceId,
      @JsonKey(name: 'ProvinceName') String? provinceName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$ProvinceCopyWithImpl<$Res, $Val extends Province>
    implements $ProvinceCopyWith<$Res> {
  _$ProvinceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceId = null,
    Object? provinceName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProvinceCopyWith<$Res> implements $ProvinceCopyWith<$Res> {
  factory _$$_ProvinceCopyWith(
          _$_Province value, $Res Function(_$_Province) then) =
      __$$_ProvinceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProvinceId') int provinceId,
      @JsonKey(name: 'ProvinceName') String? provinceName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_ProvinceCopyWithImpl<$Res>
    extends _$ProvinceCopyWithImpl<$Res, _$_Province>
    implements _$$_ProvinceCopyWith<$Res> {
  __$$_ProvinceCopyWithImpl(
      _$_Province _value, $Res Function(_$_Province) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceId = null,
    Object? provinceName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Province(
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
      provinceName: freezed == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
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
class _$_Province extends _Province {
  const _$_Province(
      {@JsonKey(name: 'ProvinceId') required this.provinceId,
      @JsonKey(name: 'ProvinceName') this.provinceName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_Province.fromJson(Map<String, dynamic> json) =>
      _$$_ProvinceFromJson(json);

  @override
  @JsonKey(name: 'ProvinceId')
  final int provinceId;
  @override
  @JsonKey(name: 'ProvinceName')
  final String? provinceName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Province(provinceId: $provinceId, provinceName: $provinceName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Province &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, provinceId, provinceName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProvinceCopyWith<_$_Province> get copyWith =>
      __$$_ProvinceCopyWithImpl<_$_Province>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProvinceToJson(
      this,
    );
  }
}

abstract class _Province extends Province {
  const factory _Province(
      {@JsonKey(name: 'ProvinceId') required final int provinceId,
      @JsonKey(name: 'ProvinceName') final String? provinceName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Province;
  const _Province._() : super._();

  factory _Province.fromJson(Map<String, dynamic> json) = _$_Province.fromJson;

  @override
  @JsonKey(name: 'ProvinceId')
  int get provinceId;
  @override
  @JsonKey(name: 'ProvinceName')
  String? get provinceName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_ProvinceCopyWith<_$_Province> get copyWith =>
      throw _privateConstructorUsedError;
}
