// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stakeholder_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StakeHolderType _$StakeHolderTypeFromJson(Map<String, dynamic> json) {
  return _StakeHolderType.fromJson(json);
}

/// @nodoc
mixin _$StakeHolderType {
  @JsonKey(name: 'StakeholderTypeId')
  int? get stakeholderTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StakeholderTypeName')
  String? get stakeholderTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsMasterDataSynced')
  bool? get isMasterDataSynced => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLocal')
  bool? get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StakeHolderTypeCopyWith<StakeHolderType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakeHolderTypeCopyWith<$Res> {
  factory $StakeHolderTypeCopyWith(
          StakeHolderType value, $Res Function(StakeHolderType) then) =
      _$StakeHolderTypeCopyWithImpl<$Res, StakeHolderType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'StakeholderTypeId') int? stakeholderTypeId,
      @JsonKey(name: 'StakeholderTypeName') String? stakeholderTypeName,
      @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class _$StakeHolderTypeCopyWithImpl<$Res, $Val extends StakeHolderType>
    implements $StakeHolderTypeCopyWith<$Res> {
  _$StakeHolderTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stakeholderTypeId = freezed,
    Object? stakeholderTypeName = freezed,
    Object? isMasterDataSynced = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_value.copyWith(
      stakeholderTypeId: freezed == stakeholderTypeId
          ? _value.stakeholderTypeId
          : stakeholderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      stakeholderTypeName: freezed == stakeholderTypeName
          ? _value.stakeholderTypeName
          : stakeholderTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isMasterDataSynced: freezed == isMasterDataSynced
          ? _value.isMasterDataSynced
          : isMasterDataSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StakeHolderTypeCopyWith<$Res>
    implements $StakeHolderTypeCopyWith<$Res> {
  factory _$$_StakeHolderTypeCopyWith(
          _$_StakeHolderType value, $Res Function(_$_StakeHolderType) then) =
      __$$_StakeHolderTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StakeholderTypeId') int? stakeholderTypeId,
      @JsonKey(name: 'StakeholderTypeName') String? stakeholderTypeName,
      @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class __$$_StakeHolderTypeCopyWithImpl<$Res>
    extends _$StakeHolderTypeCopyWithImpl<$Res, _$_StakeHolderType>
    implements _$$_StakeHolderTypeCopyWith<$Res> {
  __$$_StakeHolderTypeCopyWithImpl(
      _$_StakeHolderType _value, $Res Function(_$_StakeHolderType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stakeholderTypeId = freezed,
    Object? stakeholderTypeName = freezed,
    Object? isMasterDataSynced = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_$_StakeHolderType(
      stakeholderTypeId: freezed == stakeholderTypeId
          ? _value.stakeholderTypeId
          : stakeholderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      stakeholderTypeName: freezed == stakeholderTypeName
          ? _value.stakeholderTypeName
          : stakeholderTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      isMasterDataSynced: freezed == isMasterDataSynced
          ? _value.isMasterDataSynced
          : isMasterDataSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StakeHolderType extends _StakeHolderType {
  const _$_StakeHolderType(
      {@JsonKey(name: 'StakeholderTypeId') this.stakeholderTypeId,
      @JsonKey(name: 'StakeholderTypeName') this.stakeholderTypeName,
      @JsonKey(name: 'IsMasterDataSynced') this.isMasterDataSynced,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'IsLocal') this.isLocal})
      : super._();

  factory _$_StakeHolderType.fromJson(Map<String, dynamic> json) =>
      _$$_StakeHolderTypeFromJson(json);

  @override
  @JsonKey(name: 'StakeholderTypeId')
  final int? stakeholderTypeId;
  @override
  @JsonKey(name: 'StakeholderTypeName')
  final String? stakeholderTypeName;
  @override
  @JsonKey(name: 'IsMasterDataSynced')
  final bool? isMasterDataSynced;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsLocal')
  final bool? isLocal;

  @override
  String toString() {
    return 'StakeHolderType(stakeholderTypeId: $stakeholderTypeId, stakeholderTypeName: $stakeholderTypeName, isMasterDataSynced: $isMasterDataSynced, isActive: $isActive, isLocal: $isLocal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StakeHolderType &&
            (identical(other.stakeholderTypeId, stakeholderTypeId) ||
                other.stakeholderTypeId == stakeholderTypeId) &&
            (identical(other.stakeholderTypeName, stakeholderTypeName) ||
                other.stakeholderTypeName == stakeholderTypeName) &&
            (identical(other.isMasterDataSynced, isMasterDataSynced) ||
                other.isMasterDataSynced == isMasterDataSynced) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stakeholderTypeId,
      stakeholderTypeName, isMasterDataSynced, isActive, isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StakeHolderTypeCopyWith<_$_StakeHolderType> get copyWith =>
      __$$_StakeHolderTypeCopyWithImpl<_$_StakeHolderType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StakeHolderTypeToJson(
      this,
    );
  }
}

abstract class _StakeHolderType extends StakeHolderType {
  const factory _StakeHolderType(
      {@JsonKey(name: 'StakeholderTypeId') final int? stakeholderTypeId,
      @JsonKey(name: 'StakeholderTypeName') final String? stakeholderTypeName,
      @JsonKey(name: 'IsMasterDataSynced') final bool? isMasterDataSynced,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'IsLocal') final bool? isLocal}) = _$_StakeHolderType;
  const _StakeHolderType._() : super._();

  factory _StakeHolderType.fromJson(Map<String, dynamic> json) =
      _$_StakeHolderType.fromJson;

  @override
  @JsonKey(name: 'StakeholderTypeId')
  int? get stakeholderTypeId;
  @override
  @JsonKey(name: 'StakeholderTypeName')
  String? get stakeholderTypeName;
  @override
  @JsonKey(name: 'IsMasterDataSynced')
  bool? get isMasterDataSynced;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsLocal')
  bool? get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$_StakeHolderTypeCopyWith<_$_StakeHolderType> get copyWith =>
      throw _privateConstructorUsedError;
}
