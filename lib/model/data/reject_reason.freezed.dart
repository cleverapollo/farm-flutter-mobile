// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RejectReason _$RejectReasonFromJson(Map<String, dynamic> json) {
  return _RejectReason.fromJson(json);
}

/// @nodoc
mixin _$RejectReason {
  @JsonKey(name: 'RejectReasonId')
  int? get rejectReasonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RejectReasonName')
  String? get rejectReasonName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RejectReasonCopyWith<RejectReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectReasonCopyWith<$Res> {
  factory $RejectReasonCopyWith(
          RejectReason value, $Res Function(RejectReason) then) =
      _$RejectReasonCopyWithImpl<$Res, RejectReason>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RejectReasonId') int? rejectReasonId,
      @JsonKey(name: 'RejectReasonName') String? rejectReasonName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$RejectReasonCopyWithImpl<$Res, $Val extends RejectReason>
    implements $RejectReasonCopyWith<$Res> {
  _$RejectReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rejectReasonId = freezed,
    Object? rejectReasonName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      rejectReasonId: freezed == rejectReasonId
          ? _value.rejectReasonId
          : rejectReasonId // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectReasonName: freezed == rejectReasonName
          ? _value.rejectReasonName
          : rejectReasonName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RejectReasonCopyWith<$Res>
    implements $RejectReasonCopyWith<$Res> {
  factory _$$_RejectReasonCopyWith(
          _$_RejectReason value, $Res Function(_$_RejectReason) then) =
      __$$_RejectReasonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RejectReasonId') int? rejectReasonId,
      @JsonKey(name: 'RejectReasonName') String? rejectReasonName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_RejectReasonCopyWithImpl<$Res>
    extends _$RejectReasonCopyWithImpl<$Res, _$_RejectReason>
    implements _$$_RejectReasonCopyWith<$Res> {
  __$$_RejectReasonCopyWithImpl(
      _$_RejectReason _value, $Res Function(_$_RejectReason) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rejectReasonId = freezed,
    Object? rejectReasonName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_RejectReason(
      rejectReasonId: freezed == rejectReasonId
          ? _value.rejectReasonId
          : rejectReasonId // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectReasonName: freezed == rejectReasonName
          ? _value.rejectReasonName
          : rejectReasonName // ignore: cast_nullable_to_non_nullable
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
class _$_RejectReason implements _RejectReason {
  const _$_RejectReason(
      {@JsonKey(name: 'RejectReasonId') this.rejectReasonId,
      @JsonKey(name: 'RejectReasonName') this.rejectReasonName,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_RejectReason.fromJson(Map<String, dynamic> json) =>
      _$$_RejectReasonFromJson(json);

  @override
  @JsonKey(name: 'RejectReasonId')
  final int? rejectReasonId;
  @override
  @JsonKey(name: 'RejectReasonName')
  final String? rejectReasonName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'RejectReason(rejectReasonId: $rejectReasonId, rejectReasonName: $rejectReasonName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RejectReason &&
            (identical(other.rejectReasonId, rejectReasonId) ||
                other.rejectReasonId == rejectReasonId) &&
            (identical(other.rejectReasonName, rejectReasonName) ||
                other.rejectReasonName == rejectReasonName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rejectReasonId, rejectReasonName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RejectReasonCopyWith<_$_RejectReason> get copyWith =>
      __$$_RejectReasonCopyWithImpl<_$_RejectReason>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RejectReasonToJson(
      this,
    );
  }
}

abstract class _RejectReason implements RejectReason {
  const factory _RejectReason(
      {@JsonKey(name: 'RejectReasonId') final int? rejectReasonId,
      @JsonKey(name: 'RejectReasonName') final String? rejectReasonName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_RejectReason;

  factory _RejectReason.fromJson(Map<String, dynamic> json) =
      _$_RejectReason.fromJson;

  @override
  @JsonKey(name: 'RejectReasonId')
  int? get rejectReasonId;
  @override
  @JsonKey(name: 'RejectReasonName')
  String? get rejectReasonName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_RejectReasonCopyWith<_$_RejectReason> get copyWith =>
      throw _privateConstructorUsedError;
}
