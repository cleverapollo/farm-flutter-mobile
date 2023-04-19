// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compartment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Compartment _$CompartmentFromJson(Map<String, dynamic> json) {
  return _Compartment.fromJson(json);
}

/// @nodoc
mixin _$Compartment {
  @JsonKey(name: 'CompartmentId')
  int get compartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompartmentCopyWith<Compartment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompartmentCopyWith<$Res> {
  factory $CompartmentCopyWith(
          Compartment value, $Res Function(Compartment) then) =
      _$CompartmentCopyWithImpl<$Res, Compartment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CompartmentId') int compartmentId,
      @JsonKey(name: 'CompartmentName') String? compartmentName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class _$CompartmentCopyWithImpl<$Res, $Val extends Compartment>
    implements $CompartmentCopyWith<$Res> {
  _$CompartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compartmentId = null,
    Object? compartmentName = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      compartmentId: null == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as int,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompartmentCopyWith<$Res>
    implements $CompartmentCopyWith<$Res> {
  factory _$$_CompartmentCopyWith(
          _$_Compartment value, $Res Function(_$_Compartment) then) =
      __$$_CompartmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CompartmentId') int compartmentId,
      @JsonKey(name: 'CompartmentName') String? compartmentName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class __$$_CompartmentCopyWithImpl<$Res>
    extends _$CompartmentCopyWithImpl<$Res, _$_Compartment>
    implements _$$_CompartmentCopyWith<$Res> {
  __$$_CompartmentCopyWithImpl(
      _$_Compartment _value, $Res Function(_$_Compartment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compartmentId = null,
    Object? compartmentName = freezed,
    Object? isActive = null,
  }) {
    return _then(_$_Compartment(
      compartmentId: null == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as int,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
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
class _$_Compartment extends _Compartment {
  const _$_Compartment(
      {@JsonKey(name: 'CompartmentId') required this.compartmentId,
      @JsonKey(name: 'CompartmentName') this.compartmentName,
      @JsonKey(name: 'IsActive') this.isActive = true})
      : super._();

  factory _$_Compartment.fromJson(Map<String, dynamic> json) =>
      _$$_CompartmentFromJson(json);

  @override
  @JsonKey(name: 'CompartmentId')
  final int compartmentId;
  @override
  @JsonKey(name: 'CompartmentName')
  final String? compartmentName;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;

  @override
  String toString() {
    return 'Compartment(compartmentId: $compartmentId, compartmentName: $compartmentName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Compartment &&
            (identical(other.compartmentId, compartmentId) ||
                other.compartmentId == compartmentId) &&
            (identical(other.compartmentName, compartmentName) ||
                other.compartmentName == compartmentName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, compartmentId, compartmentName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompartmentCopyWith<_$_Compartment> get copyWith =>
      __$$_CompartmentCopyWithImpl<_$_Compartment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompartmentToJson(
      this,
    );
  }
}

abstract class _Compartment extends Compartment {
  const factory _Compartment(
      {@JsonKey(name: 'CompartmentId') required final int compartmentId,
      @JsonKey(name: 'CompartmentName') final String? compartmentName,
      @JsonKey(name: 'IsActive') final bool isActive}) = _$_Compartment;
  const _Compartment._() : super._();

  factory _Compartment.fromJson(Map<String, dynamic> json) =
      _$_Compartment.fromJson;

  @override
  @JsonKey(name: 'CompartmentId')
  int get compartmentId;
  @override
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_CompartmentCopyWith<_$_Compartment> get copyWith =>
      throw _privateConstructorUsedError;
}
