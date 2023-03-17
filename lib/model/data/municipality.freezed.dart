// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'municipality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Municipality _$MunicipalityFromJson(Map<String, dynamic> json) {
  return _Municipality.fromJson(json);
}

/// @nodoc
mixin _$Municipality {
  @JsonKey(name: 'MunicipalityId')
  int get municipalityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MunicipalityName')
  String? get municipalityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MunicipalityCopyWith<Municipality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MunicipalityCopyWith<$Res> {
  factory $MunicipalityCopyWith(
          Municipality value, $Res Function(Municipality) then) =
      _$MunicipalityCopyWithImpl<$Res, Municipality>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MunicipalityId') int municipalityId,
      @JsonKey(name: 'MunicipalityName') String? municipalityName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$MunicipalityCopyWithImpl<$Res, $Val extends Municipality>
    implements $MunicipalityCopyWith<$Res> {
  _$MunicipalityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipalityId = null,
    Object? municipalityName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      municipalityId: null == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int,
      municipalityName: freezed == municipalityName
          ? _value.municipalityName
          : municipalityName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MunicipalityCopyWith<$Res>
    implements $MunicipalityCopyWith<$Res> {
  factory _$$_MunicipalityCopyWith(
          _$_Municipality value, $Res Function(_$_Municipality) then) =
      __$$_MunicipalityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MunicipalityId') int municipalityId,
      @JsonKey(name: 'MunicipalityName') String? municipalityName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_MunicipalityCopyWithImpl<$Res>
    extends _$MunicipalityCopyWithImpl<$Res, _$_Municipality>
    implements _$$_MunicipalityCopyWith<$Res> {
  __$$_MunicipalityCopyWithImpl(
      _$_Municipality _value, $Res Function(_$_Municipality) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? municipalityId = null,
    Object? municipalityName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Municipality(
      municipalityId: null == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as int,
      municipalityName: freezed == municipalityName
          ? _value.municipalityName
          : municipalityName // ignore: cast_nullable_to_non_nullable
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
class _$_Municipality extends _Municipality {
  const _$_Municipality(
      {@JsonKey(name: 'MunicipalityId') required this.municipalityId,
      @JsonKey(name: 'MunicipalityName') this.municipalityName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_Municipality.fromJson(Map<String, dynamic> json) =>
      _$$_MunicipalityFromJson(json);

  @override
  @JsonKey(name: 'MunicipalityId')
  final int municipalityId;
  @override
  @JsonKey(name: 'MunicipalityName')
  final String? municipalityName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Municipality(municipalityId: $municipalityId, municipalityName: $municipalityName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Municipality &&
            (identical(other.municipalityId, municipalityId) ||
                other.municipalityId == municipalityId) &&
            (identical(other.municipalityName, municipalityName) ||
                other.municipalityName == municipalityName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, municipalityId, municipalityName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MunicipalityCopyWith<_$_Municipality> get copyWith =>
      __$$_MunicipalityCopyWithImpl<_$_Municipality>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MunicipalityToJson(
      this,
    );
  }
}

abstract class _Municipality extends Municipality {
  const factory _Municipality(
      {@JsonKey(name: 'MunicipalityId') required final int municipalityId,
      @JsonKey(name: 'MunicipalityName') final String? municipalityName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Municipality;
  const _Municipality._() : super._();

  factory _Municipality.fromJson(Map<String, dynamic> json) =
      _$_Municipality.fromJson;

  @override
  @JsonKey(name: 'MunicipalityId')
  int get municipalityId;
  @override
  @JsonKey(name: 'MunicipalityName')
  String? get municipalityName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_MunicipalityCopyWith<_$_Municipality> get copyWith =>
      throw _privateConstructorUsedError;
}
