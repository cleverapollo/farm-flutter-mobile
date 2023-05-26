// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'race.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Race _$RaceFromJson(Map<String, dynamic> json) {
  return _Race.fromJson(json);
}

/// @nodoc
mixin _$Race {
  @JsonKey(name: 'RaceId')
  int? get raceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RaceName')
  String? get raceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RaceCopyWith<Race> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RaceCopyWith<$Res> {
  factory $RaceCopyWith(Race value, $Res Function(Race) then) =
      _$RaceCopyWithImpl<$Res, Race>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RaceId') int? raceId,
      @JsonKey(name: 'RaceName') String? raceName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class _$RaceCopyWithImpl<$Res, $Val extends Race>
    implements $RaceCopyWith<$Res> {
  _$RaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raceId = freezed,
    Object? raceName = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      raceId: freezed == raceId
          ? _value.raceId
          : raceId // ignore: cast_nullable_to_non_nullable
              as int?,
      raceName: freezed == raceName
          ? _value.raceName
          : raceName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RaceCopyWith<$Res> implements $RaceCopyWith<$Res> {
  factory _$$_RaceCopyWith(_$_Race value, $Res Function(_$_Race) then) =
      __$$_RaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RaceId') int? raceId,
      @JsonKey(name: 'RaceName') String? raceName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class __$$_RaceCopyWithImpl<$Res> extends _$RaceCopyWithImpl<$Res, _$_Race>
    implements _$$_RaceCopyWith<$Res> {
  __$$_RaceCopyWithImpl(_$_Race _value, $Res Function(_$_Race) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raceId = freezed,
    Object? raceName = freezed,
    Object? isActive = null,
  }) {
    return _then(_$_Race(
      raceId: freezed == raceId
          ? _value.raceId
          : raceId // ignore: cast_nullable_to_non_nullable
              as int?,
      raceName: freezed == raceName
          ? _value.raceName
          : raceName // ignore: cast_nullable_to_non_nullable
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
class _$_Race extends _Race {
  const _$_Race(
      {@JsonKey(name: 'RaceId') this.raceId,
      @JsonKey(name: 'RaceName') this.raceName,
      @JsonKey(name: 'IsActive') this.isActive = true})
      : super._();

  factory _$_Race.fromJson(Map<String, dynamic> json) => _$$_RaceFromJson(json);

  @override
  @JsonKey(name: 'RaceId')
  final int? raceId;
  @override
  @JsonKey(name: 'RaceName')
  final String? raceName;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;

  @override
  String toString() {
    return 'Race(raceId: $raceId, raceName: $raceName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Race &&
            (identical(other.raceId, raceId) || other.raceId == raceId) &&
            (identical(other.raceName, raceName) ||
                other.raceName == raceName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, raceId, raceName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RaceCopyWith<_$_Race> get copyWith =>
      __$$_RaceCopyWithImpl<_$_Race>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RaceToJson(
      this,
    );
  }
}

abstract class _Race extends Race {
  const factory _Race(
      {@JsonKey(name: 'RaceId') final int? raceId,
      @JsonKey(name: 'RaceName') final String? raceName,
      @JsonKey(name: 'IsActive') final bool isActive}) = _$_Race;
  const _Race._() : super._();

  factory _Race.fromJson(Map<String, dynamic> json) = _$_Race.fromJson;

  @override
  @JsonKey(name: 'RaceId')
  int? get raceId;
  @override
  @JsonKey(name: 'RaceName')
  String? get raceName;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_RaceCopyWith<_$_Race> get copyWith => throw _privateConstructorUsedError;
}
