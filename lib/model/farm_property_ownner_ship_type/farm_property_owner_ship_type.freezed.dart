// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_property_owner_ship_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FarmPropertyOwnerShipType _$FarmPropertyOwnerShipTypeFromJson(
    Map<String, dynamic> json) {
  return _FarmPropertyOwnerShipType.fromJson(json);
}

/// @nodoc
mixin _$FarmPropertyOwnerShipType {
  @JsonKey(name: 'FarmPropertyOwnershipTypeId')
  int? get farmPropertyOwnershipTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FarmPropertyOwnershipTypeName')
  String? get farmPropertyOwnershipTypeName =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmPropertyOwnerShipTypeCopyWith<FarmPropertyOwnerShipType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmPropertyOwnerShipTypeCopyWith<$Res> {
  factory $FarmPropertyOwnerShipTypeCopyWith(FarmPropertyOwnerShipType value,
          $Res Function(FarmPropertyOwnerShipType) then) =
      _$FarmPropertyOwnerShipTypeCopyWithImpl<$Res, FarmPropertyOwnerShipType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
          int? farmPropertyOwnershipTypeId,
      @JsonKey(name: 'FarmPropertyOwnershipTypeName')
          String? farmPropertyOwnershipTypeName});
}

/// @nodoc
class _$FarmPropertyOwnerShipTypeCopyWithImpl<$Res,
        $Val extends FarmPropertyOwnerShipType>
    implements $FarmPropertyOwnerShipTypeCopyWith<$Res> {
  _$FarmPropertyOwnerShipTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmPropertyOwnershipTypeId = freezed,
    Object? farmPropertyOwnershipTypeName = freezed,
  }) {
    return _then(_value.copyWith(
      farmPropertyOwnershipTypeId: freezed == farmPropertyOwnershipTypeId
          ? _value.farmPropertyOwnershipTypeId
          : farmPropertyOwnershipTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      farmPropertyOwnershipTypeName: freezed == farmPropertyOwnershipTypeName
          ? _value.farmPropertyOwnershipTypeName
          : farmPropertyOwnershipTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FarmPropertyOwnerShipTypeCopyWith<$Res>
    implements $FarmPropertyOwnerShipTypeCopyWith<$Res> {
  factory _$$_FarmPropertyOwnerShipTypeCopyWith(
          _$_FarmPropertyOwnerShipType value,
          $Res Function(_$_FarmPropertyOwnerShipType) then) =
      __$$_FarmPropertyOwnerShipTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
          int? farmPropertyOwnershipTypeId,
      @JsonKey(name: 'FarmPropertyOwnershipTypeName')
          String? farmPropertyOwnershipTypeName});
}

/// @nodoc
class __$$_FarmPropertyOwnerShipTypeCopyWithImpl<$Res>
    extends _$FarmPropertyOwnerShipTypeCopyWithImpl<$Res,
        _$_FarmPropertyOwnerShipType>
    implements _$$_FarmPropertyOwnerShipTypeCopyWith<$Res> {
  __$$_FarmPropertyOwnerShipTypeCopyWithImpl(
      _$_FarmPropertyOwnerShipType _value,
      $Res Function(_$_FarmPropertyOwnerShipType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmPropertyOwnershipTypeId = freezed,
    Object? farmPropertyOwnershipTypeName = freezed,
  }) {
    return _then(_$_FarmPropertyOwnerShipType(
      farmPropertyOwnershipTypeId: freezed == farmPropertyOwnershipTypeId
          ? _value.farmPropertyOwnershipTypeId
          : farmPropertyOwnershipTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      farmPropertyOwnershipTypeName: freezed == farmPropertyOwnershipTypeName
          ? _value.farmPropertyOwnershipTypeName
          : farmPropertyOwnershipTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FarmPropertyOwnerShipType extends _FarmPropertyOwnerShipType {
  const _$_FarmPropertyOwnerShipType(
      {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
          this.farmPropertyOwnershipTypeId,
      @JsonKey(name: 'FarmPropertyOwnershipTypeName')
          this.farmPropertyOwnershipTypeName})
      : super._();

  factory _$_FarmPropertyOwnerShipType.fromJson(Map<String, dynamic> json) =>
      _$$_FarmPropertyOwnerShipTypeFromJson(json);

  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeId')
  final int? farmPropertyOwnershipTypeId;
  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeName')
  final String? farmPropertyOwnershipTypeName;

  @override
  String toString() {
    return 'FarmPropertyOwnerShipType(farmPropertyOwnershipTypeId: $farmPropertyOwnershipTypeId, farmPropertyOwnershipTypeName: $farmPropertyOwnershipTypeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FarmPropertyOwnerShipType &&
            (identical(other.farmPropertyOwnershipTypeId,
                    farmPropertyOwnershipTypeId) ||
                other.farmPropertyOwnershipTypeId ==
                    farmPropertyOwnershipTypeId) &&
            (identical(other.farmPropertyOwnershipTypeName,
                    farmPropertyOwnershipTypeName) ||
                other.farmPropertyOwnershipTypeName ==
                    farmPropertyOwnershipTypeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, farmPropertyOwnershipTypeId, farmPropertyOwnershipTypeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FarmPropertyOwnerShipTypeCopyWith<_$_FarmPropertyOwnerShipType>
      get copyWith => __$$_FarmPropertyOwnerShipTypeCopyWithImpl<
          _$_FarmPropertyOwnerShipType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FarmPropertyOwnerShipTypeToJson(
      this,
    );
  }
}

abstract class _FarmPropertyOwnerShipType extends FarmPropertyOwnerShipType {
  const factory _FarmPropertyOwnerShipType(
          {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
              final int? farmPropertyOwnershipTypeId,
          @JsonKey(name: 'FarmPropertyOwnershipTypeName')
              final String? farmPropertyOwnershipTypeName}) =
      _$_FarmPropertyOwnerShipType;
  const _FarmPropertyOwnerShipType._() : super._();

  factory _FarmPropertyOwnerShipType.fromJson(Map<String, dynamic> json) =
      _$_FarmPropertyOwnerShipType.fromJson;

  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeId')
  int? get farmPropertyOwnershipTypeId;
  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeName')
  String? get farmPropertyOwnershipTypeName;
  @override
  @JsonKey(ignore: true)
  _$$_FarmPropertyOwnerShipTypeCopyWith<_$_FarmPropertyOwnerShipType>
      get copyWith => throw _privateConstructorUsedError;
}
