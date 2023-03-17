// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speqs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Speqs _$SpeqsFromJson(Map<String, dynamic> json) {
  return _Speqs.fromJson(json);
}

/// @nodoc
mixin _$Speqs {
  @JsonKey(name: 'SPEQSId')
  int get speqsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SPEQSName')
  String? get speqsName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpeqsCopyWith<Speqs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeqsCopyWith<$Res> {
  factory $SpeqsCopyWith(Speqs value, $Res Function(Speqs) then) =
      _$SpeqsCopyWithImpl<$Res, Speqs>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SPEQSId') int speqsId,
      @JsonKey(name: 'SPEQSName') String? speqsName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$SpeqsCopyWithImpl<$Res, $Val extends Speqs>
    implements $SpeqsCopyWith<$Res> {
  _$SpeqsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speqsId = null,
    Object? speqsName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      speqsId: null == speqsId
          ? _value.speqsId
          : speqsId // ignore: cast_nullable_to_non_nullable
              as int,
      speqsName: freezed == speqsName
          ? _value.speqsName
          : speqsName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpeqsCopyWith<$Res> implements $SpeqsCopyWith<$Res> {
  factory _$$_SpeqsCopyWith(_$_Speqs value, $Res Function(_$_Speqs) then) =
      __$$_SpeqsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SPEQSId') int speqsId,
      @JsonKey(name: 'SPEQSName') String? speqsName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_SpeqsCopyWithImpl<$Res> extends _$SpeqsCopyWithImpl<$Res, _$_Speqs>
    implements _$$_SpeqsCopyWith<$Res> {
  __$$_SpeqsCopyWithImpl(_$_Speqs _value, $Res Function(_$_Speqs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speqsId = null,
    Object? speqsName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Speqs(
      speqsId: null == speqsId
          ? _value.speqsId
          : speqsId // ignore: cast_nullable_to_non_nullable
              as int,
      speqsName: freezed == speqsName
          ? _value.speqsName
          : speqsName // ignore: cast_nullable_to_non_nullable
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
class _$_Speqs extends _Speqs {
  const _$_Speqs(
      {@JsonKey(name: 'SPEQSId') required this.speqsId,
      @JsonKey(name: 'SPEQSName') this.speqsName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_Speqs.fromJson(Map<String, dynamic> json) =>
      _$$_SpeqsFromJson(json);

  @override
  @JsonKey(name: 'SPEQSId')
  final int speqsId;
  @override
  @JsonKey(name: 'SPEQSName')
  final String? speqsName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Speqs(speqsId: $speqsId, speqsName: $speqsName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Speqs &&
            (identical(other.speqsId, speqsId) || other.speqsId == speqsId) &&
            (identical(other.speqsName, speqsName) ||
                other.speqsName == speqsName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, speqsId, speqsName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpeqsCopyWith<_$_Speqs> get copyWith =>
      __$$_SpeqsCopyWithImpl<_$_Speqs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpeqsToJson(
      this,
    );
  }
}

abstract class _Speqs extends Speqs {
  const factory _Speqs(
      {@JsonKey(name: 'SPEQSId') required final int speqsId,
      @JsonKey(name: 'SPEQSName') final String? speqsName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Speqs;
  const _Speqs._() : super._();

  factory _Speqs.fromJson(Map<String, dynamic> json) = _$_Speqs.fromJson;

  @override
  @JsonKey(name: 'SPEQSId')
  int get speqsId;
  @override
  @JsonKey(name: 'SPEQSName')
  String? get speqsName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_SpeqsCopyWith<_$_Speqs> get copyWith =>
      throw _privateConstructorUsedError;
}
