// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_property_ownership_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FarmPropertyOwnershipType _$FarmPropertyOwnershipTypeFromJson(
    Map<String, dynamic> json) {
  return _FarmPropertyOwnershipType.fromJson(json);
}

/// @nodoc
mixin _$FarmPropertyOwnershipType {
  @JsonKey(name: 'FarmPropertyOwnershipTypeId')
  int get farmPropertyOwnershipTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FarmPropertyOwnershipTypeName')
  String? get farmPropertyOwnershipTypeName =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FarmPropertyOwnershipTypeCopyWith<FarmPropertyOwnershipType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmPropertyOwnershipTypeCopyWith<$Res> {
  factory $FarmPropertyOwnershipTypeCopyWith(FarmPropertyOwnershipType value,
          $Res Function(FarmPropertyOwnershipType) then) =
      _$FarmPropertyOwnershipTypeCopyWithImpl<$Res, FarmPropertyOwnershipType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
          int farmPropertyOwnershipTypeId,
      @JsonKey(name: 'FarmPropertyOwnershipTypeName')
          String? farmPropertyOwnershipTypeName});
}

/// @nodoc
class _$FarmPropertyOwnershipTypeCopyWithImpl<$Res,
        $Val extends FarmPropertyOwnershipType>
    implements $FarmPropertyOwnershipTypeCopyWith<$Res> {
  _$FarmPropertyOwnershipTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmPropertyOwnershipTypeId = null,
    Object? farmPropertyOwnershipTypeName = freezed,
  }) {
    return _then(_value.copyWith(
      farmPropertyOwnershipTypeId: null == farmPropertyOwnershipTypeId
          ? _value.farmPropertyOwnershipTypeId
          : farmPropertyOwnershipTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      farmPropertyOwnershipTypeName: freezed == farmPropertyOwnershipTypeName
          ? _value.farmPropertyOwnershipTypeName
          : farmPropertyOwnershipTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FarmPropertyOwnershipTypeCopyWith<$Res>
    implements $FarmPropertyOwnershipTypeCopyWith<$Res> {
  factory _$$_FarmPropertyOwnershipTypeCopyWith(
          _$_FarmPropertyOwnershipType value,
          $Res Function(_$_FarmPropertyOwnershipType) then) =
      __$$_FarmPropertyOwnershipTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
          int farmPropertyOwnershipTypeId,
      @JsonKey(name: 'FarmPropertyOwnershipTypeName')
          String? farmPropertyOwnershipTypeName});
}

/// @nodoc
class __$$_FarmPropertyOwnershipTypeCopyWithImpl<$Res>
    extends _$FarmPropertyOwnershipTypeCopyWithImpl<$Res,
        _$_FarmPropertyOwnershipType>
    implements _$$_FarmPropertyOwnershipTypeCopyWith<$Res> {
  __$$_FarmPropertyOwnershipTypeCopyWithImpl(
      _$_FarmPropertyOwnershipType _value,
      $Res Function(_$_FarmPropertyOwnershipType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmPropertyOwnershipTypeId = null,
    Object? farmPropertyOwnershipTypeName = freezed,
  }) {
    return _then(_$_FarmPropertyOwnershipType(
      farmPropertyOwnershipTypeId: null == farmPropertyOwnershipTypeId
          ? _value.farmPropertyOwnershipTypeId
          : farmPropertyOwnershipTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      farmPropertyOwnershipTypeName: freezed == farmPropertyOwnershipTypeName
          ? _value.farmPropertyOwnershipTypeName
          : farmPropertyOwnershipTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FarmPropertyOwnershipType extends _FarmPropertyOwnershipType {
  const _$_FarmPropertyOwnershipType(
      {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
          required this.farmPropertyOwnershipTypeId,
      @JsonKey(name: 'FarmPropertyOwnershipTypeName')
          this.farmPropertyOwnershipTypeName})
      : super._();

  factory _$_FarmPropertyOwnershipType.fromJson(Map<String, dynamic> json) =>
      _$$_FarmPropertyOwnershipTypeFromJson(json);

  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeId')
  final int farmPropertyOwnershipTypeId;
  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeName')
  final String? farmPropertyOwnershipTypeName;

  @override
  String toString() {
    return 'FarmPropertyOwnershipType(farmPropertyOwnershipTypeId: $farmPropertyOwnershipTypeId, farmPropertyOwnershipTypeName: $farmPropertyOwnershipTypeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FarmPropertyOwnershipType &&
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
  _$$_FarmPropertyOwnershipTypeCopyWith<_$_FarmPropertyOwnershipType>
      get copyWith => __$$_FarmPropertyOwnershipTypeCopyWithImpl<
          _$_FarmPropertyOwnershipType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FarmPropertyOwnershipTypeToJson(
      this,
    );
  }
}

abstract class _FarmPropertyOwnershipType extends FarmPropertyOwnershipType {
  const factory _FarmPropertyOwnershipType(
          {@JsonKey(name: 'FarmPropertyOwnershipTypeId')
              required final int farmPropertyOwnershipTypeId,
          @JsonKey(name: 'FarmPropertyOwnershipTypeName')
              final String? farmPropertyOwnershipTypeName}) =
      _$_FarmPropertyOwnershipType;
  const _FarmPropertyOwnershipType._() : super._();

  factory _FarmPropertyOwnershipType.fromJson(Map<String, dynamic> json) =
      _$_FarmPropertyOwnershipType.fromJson;

  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeId')
  int get farmPropertyOwnershipTypeId;
  @override
  @JsonKey(name: 'FarmPropertyOwnershipTypeName')
  String? get farmPropertyOwnershipTypeName;
  @override
  @JsonKey(ignore: true)
  _$$_FarmPropertyOwnershipTypeCopyWith<_$_FarmPropertyOwnershipType>
      get copyWith => throw _privateConstructorUsedError;
}
