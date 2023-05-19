// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regional_manager_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegionalManagerUnit _$RegionalManagerUnitFromJson(Map<String, dynamic> json) {
  return _RegionalManagerUnit.fromJson(json);
}

/// @nodoc
mixin _$RegionalManagerUnit {
  @JsonKey(name: 'RegionalManagerUnitId')
  int get regionalManagerUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RegionalManagerUnitName')
  String? get regionalManagerUnitName => throw _privateConstructorUsedError;
  @JsonKey(name: 'GroupschemeId')
  int? get groupSchemeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionalManagerUnitCopyWith<RegionalManagerUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionalManagerUnitCopyWith<$Res> {
  factory $RegionalManagerUnitCopyWith(
          RegionalManagerUnit value, $Res Function(RegionalManagerUnit) then) =
      _$RegionalManagerUnitCopyWithImpl<$Res, RegionalManagerUnit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RegionalManagerUnitId') int regionalManagerUnitId,
      @JsonKey(name: 'RegionalManagerUnitName') String? regionalManagerUnitName,
      @JsonKey(name: 'GroupschemeId') int? groupSchemeId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$RegionalManagerUnitCopyWithImpl<$Res, $Val extends RegionalManagerUnit>
    implements $RegionalManagerUnitCopyWith<$Res> {
  _$RegionalManagerUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionalManagerUnitId = null,
    Object? regionalManagerUnitName = freezed,
    Object? groupSchemeId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      regionalManagerUnitId: null == regionalManagerUnitId
          ? _value.regionalManagerUnitId
          : regionalManagerUnitId // ignore: cast_nullable_to_non_nullable
              as int,
      regionalManagerUnitName: freezed == regionalManagerUnitName
          ? _value.regionalManagerUnitName
          : regionalManagerUnitName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupSchemeId: freezed == groupSchemeId
          ? _value.groupSchemeId
          : groupSchemeId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegionalManagerUnitCopyWith<$Res>
    implements $RegionalManagerUnitCopyWith<$Res> {
  factory _$$_RegionalManagerUnitCopyWith(_$_RegionalManagerUnit value,
          $Res Function(_$_RegionalManagerUnit) then) =
      __$$_RegionalManagerUnitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RegionalManagerUnitId') int regionalManagerUnitId,
      @JsonKey(name: 'RegionalManagerUnitName') String? regionalManagerUnitName,
      @JsonKey(name: 'GroupschemeId') int? groupSchemeId,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_RegionalManagerUnitCopyWithImpl<$Res>
    extends _$RegionalManagerUnitCopyWithImpl<$Res, _$_RegionalManagerUnit>
    implements _$$_RegionalManagerUnitCopyWith<$Res> {
  __$$_RegionalManagerUnitCopyWithImpl(_$_RegionalManagerUnit _value,
      $Res Function(_$_RegionalManagerUnit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionalManagerUnitId = null,
    Object? regionalManagerUnitName = freezed,
    Object? groupSchemeId = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_RegionalManagerUnit(
      regionalManagerUnitId: null == regionalManagerUnitId
          ? _value.regionalManagerUnitId
          : regionalManagerUnitId // ignore: cast_nullable_to_non_nullable
              as int,
      regionalManagerUnitName: freezed == regionalManagerUnitName
          ? _value.regionalManagerUnitName
          : regionalManagerUnitName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupSchemeId: freezed == groupSchemeId
          ? _value.groupSchemeId
          : groupSchemeId // ignore: cast_nullable_to_non_nullable
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
class _$_RegionalManagerUnit extends _RegionalManagerUnit {
  const _$_RegionalManagerUnit(
      {@JsonKey(name: 'RegionalManagerUnitId')
          required this.regionalManagerUnitId,
      @JsonKey(name: 'RegionalManagerUnitName')
          this.regionalManagerUnitName,
      @JsonKey(name: 'GroupschemeId')
          this.groupSchemeId,
      @JsonKey(name: 'IsActive')
          this.isActive})
      : super._();

  factory _$_RegionalManagerUnit.fromJson(Map<String, dynamic> json) =>
      _$$_RegionalManagerUnitFromJson(json);

  @override
  @JsonKey(name: 'RegionalManagerUnitId')
  final int regionalManagerUnitId;
  @override
  @JsonKey(name: 'RegionalManagerUnitName')
  final String? regionalManagerUnitName;
  @override
  @JsonKey(name: 'GroupschemeId')
  final int? groupSchemeId;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'RegionalManagerUnit(regionalManagerUnitId: $regionalManagerUnitId, regionalManagerUnitName: $regionalManagerUnitName, groupSchemeId: $groupSchemeId, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegionalManagerUnit &&
            (identical(other.regionalManagerUnitId, regionalManagerUnitId) ||
                other.regionalManagerUnitId == regionalManagerUnitId) &&
            (identical(
                    other.regionalManagerUnitName, regionalManagerUnitName) ||
                other.regionalManagerUnitName == regionalManagerUnitName) &&
            (identical(other.groupSchemeId, groupSchemeId) ||
                other.groupSchemeId == groupSchemeId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, regionalManagerUnitId,
      regionalManagerUnitName, groupSchemeId, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegionalManagerUnitCopyWith<_$_RegionalManagerUnit> get copyWith =>
      __$$_RegionalManagerUnitCopyWithImpl<_$_RegionalManagerUnit>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegionalManagerUnitToJson(
      this,
    );
  }
}

abstract class _RegionalManagerUnit extends RegionalManagerUnit {
  const factory _RegionalManagerUnit(
      {@JsonKey(name: 'RegionalManagerUnitId')
          required final int regionalManagerUnitId,
      @JsonKey(name: 'RegionalManagerUnitName')
          final String? regionalManagerUnitName,
      @JsonKey(name: 'GroupschemeId')
          final int? groupSchemeId,
      @JsonKey(name: 'IsActive')
          final bool? isActive}) = _$_RegionalManagerUnit;
  const _RegionalManagerUnit._() : super._();

  factory _RegionalManagerUnit.fromJson(Map<String, dynamic> json) =
      _$_RegionalManagerUnit.fromJson;

  @override
  @JsonKey(name: 'RegionalManagerUnitId')
  int get regionalManagerUnitId;
  @override
  @JsonKey(name: 'RegionalManagerUnitName')
  String? get regionalManagerUnitName;
  @override
  @JsonKey(name: 'GroupschemeId')
  int? get groupSchemeId;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_RegionalManagerUnitCopyWith<_$_RegionalManagerUnit> get copyWith =>
      throw _privateConstructorUsedError;
}
