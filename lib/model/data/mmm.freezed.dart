// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mmm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mmm _$MmmFromJson(Map<String, dynamic> json) {
  return _Mmm.fromJson(json);
}

/// @nodoc
mixin _$Mmm {
  @JsonKey(name: 'MMMId')
  int? get mmmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MMMName')
  String? get mmmName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MmmCopyWith<Mmm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MmmCopyWith<$Res> {
  factory $MmmCopyWith(Mmm value, $Res Function(Mmm) then) =
      _$MmmCopyWithImpl<$Res, Mmm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MMMId') int? mmmId,
      @JsonKey(name: 'MMMName') String? mmmName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$MmmCopyWithImpl<$Res, $Val extends Mmm> implements $MmmCopyWith<$Res> {
  _$MmmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mmmId = freezed,
    Object? mmmName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      mmmId: freezed == mmmId
          ? _value.mmmId
          : mmmId // ignore: cast_nullable_to_non_nullable
              as int?,
      mmmName: freezed == mmmName
          ? _value.mmmName
          : mmmName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MmmCopyWith<$Res> implements $MmmCopyWith<$Res> {
  factory _$$_MmmCopyWith(_$_Mmm value, $Res Function(_$_Mmm) then) =
      __$$_MmmCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MMMId') int? mmmId,
      @JsonKey(name: 'MMMName') String? mmmName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_MmmCopyWithImpl<$Res> extends _$MmmCopyWithImpl<$Res, _$_Mmm>
    implements _$$_MmmCopyWith<$Res> {
  __$$_MmmCopyWithImpl(_$_Mmm _value, $Res Function(_$_Mmm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mmmId = freezed,
    Object? mmmName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Mmm(
      mmmId: freezed == mmmId
          ? _value.mmmId
          : mmmId // ignore: cast_nullable_to_non_nullable
              as int?,
      mmmName: freezed == mmmName
          ? _value.mmmName
          : mmmName // ignore: cast_nullable_to_non_nullable
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
class _$_Mmm implements _Mmm {
  const _$_Mmm(
      {@JsonKey(name: 'MMMId') this.mmmId,
      @JsonKey(name: 'MMMName') this.mmmName,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_Mmm.fromJson(Map<String, dynamic> json) => _$$_MmmFromJson(json);

  @override
  @JsonKey(name: 'MMMId')
  final int? mmmId;
  @override
  @JsonKey(name: 'MMMName')
  final String? mmmName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Mmm(mmmId: $mmmId, mmmName: $mmmName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mmm &&
            (identical(other.mmmId, mmmId) || other.mmmId == mmmId) &&
            (identical(other.mmmName, mmmName) || other.mmmName == mmmName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mmmId, mmmName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MmmCopyWith<_$_Mmm> get copyWith =>
      __$$_MmmCopyWithImpl<_$_Mmm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MmmToJson(
      this,
    );
  }
}

abstract class _Mmm implements Mmm {
  const factory _Mmm(
      {@JsonKey(name: 'MMMId') final int? mmmId,
      @JsonKey(name: 'MMMName') final String? mmmName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Mmm;

  factory _Mmm.fromJson(Map<String, dynamic> json) = _$_Mmm.fromJson;

  @override
  @JsonKey(name: 'MMMId')
  int? get mmmId;
  @override
  @JsonKey(name: 'MMMName')
  String? get mmmName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_MmmCopyWith<_$_Mmm> get copyWith => throw _privateConstructorUsedError;
}
