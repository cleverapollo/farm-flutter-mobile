// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stake_holder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StakeHolder _$StakeHolderFromJson(Map<String, dynamic> json) {
  return _StakeHolder.fromJson(json);
}

/// @nodoc
mixin _$StakeHolder {
  @JsonKey(name: 'StakeHolderId')
  String get stakeHolderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceName')
  String get serviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StakeHolderCopyWith<StakeHolder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakeHolderCopyWith<$Res> {
  factory $StakeHolderCopyWith(
          StakeHolder value, $Res Function(StakeHolder) then) =
      _$StakeHolderCopyWithImpl<$Res, StakeHolder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'StakeHolderId') String stakeHolderId,
      @JsonKey(name: 'serviceName') String serviceName,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'email') String email});
}

/// @nodoc
class _$StakeHolderCopyWithImpl<$Res, $Val extends StakeHolder>
    implements $StakeHolderCopyWith<$Res> {
  _$StakeHolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stakeHolderId = null,
    Object? serviceName = null,
    Object? address = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      stakeHolderId: null == stakeHolderId
          ? _value.stakeHolderId
          : stakeHolderId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StakeHolderCopyWith<$Res>
    implements $StakeHolderCopyWith<$Res> {
  factory _$$_StakeHolderCopyWith(
          _$_StakeHolder value, $Res Function(_$_StakeHolder) then) =
      __$$_StakeHolderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StakeHolderId') String stakeHolderId,
      @JsonKey(name: 'serviceName') String serviceName,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'email') String email});
}

/// @nodoc
class __$$_StakeHolderCopyWithImpl<$Res>
    extends _$StakeHolderCopyWithImpl<$Res, _$_StakeHolder>
    implements _$$_StakeHolderCopyWith<$Res> {
  __$$_StakeHolderCopyWithImpl(
      _$_StakeHolder _value, $Res Function(_$_StakeHolder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stakeHolderId = null,
    Object? serviceName = null,
    Object? address = null,
    Object? fullName = null,
    Object? email = null,
  }) {
    return _then(_$_StakeHolder(
      stakeHolderId: null == stakeHolderId
          ? _value.stakeHolderId
          : stakeHolderId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StakeHolder extends _StakeHolder {
  const _$_StakeHolder(
      {@JsonKey(name: 'StakeHolderId') required this.stakeHolderId,
      @JsonKey(name: 'serviceName') required this.serviceName,
      @JsonKey(name: 'address') required this.address,
      @JsonKey(name: 'fullName') required this.fullName,
      @JsonKey(name: 'email') required this.email})
      : super._();

  factory _$_StakeHolder.fromJson(Map<String, dynamic> json) =>
      _$$_StakeHolderFromJson(json);

  @override
  @JsonKey(name: 'StakeHolderId')
  final String stakeHolderId;
  @override
  @JsonKey(name: 'serviceName')
  final String serviceName;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'fullName')
  final String fullName;
  @override
  @JsonKey(name: 'email')
  final String email;

  @override
  String toString() {
    return 'StakeHolder(stakeHolderId: $stakeHolderId, serviceName: $serviceName, address: $address, fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StakeHolder &&
            (identical(other.stakeHolderId, stakeHolderId) ||
                other.stakeHolderId == stakeHolderId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, stakeHolderId, serviceName, address, fullName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StakeHolderCopyWith<_$_StakeHolder> get copyWith =>
      __$$_StakeHolderCopyWithImpl<_$_StakeHolder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StakeHolderToJson(
      this,
    );
  }
}

abstract class _StakeHolder extends StakeHolder {
  const factory _StakeHolder(
      {@JsonKey(name: 'StakeHolderId') required final String stakeHolderId,
      @JsonKey(name: 'serviceName') required final String serviceName,
      @JsonKey(name: 'address') required final String address,
      @JsonKey(name: 'fullName') required final String fullName,
      @JsonKey(name: 'email') required final String email}) = _$_StakeHolder;
  const _StakeHolder._() : super._();

  factory _StakeHolder.fromJson(Map<String, dynamic> json) =
      _$_StakeHolder.fromJson;

  @override
  @JsonKey(name: 'StakeHolderId')
  String get stakeHolderId;
  @override
  @JsonKey(name: 'serviceName')
  String get serviceName;
  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'fullName')
  String get fullName;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_StakeHolderCopyWith<_$_StakeHolder> get copyWith =>
      throw _privateConstructorUsedError;
}
