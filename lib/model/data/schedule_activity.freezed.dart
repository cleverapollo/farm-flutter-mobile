// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleActivity _$ScheduleActivityFromJson(Map<String, dynamic> json) {
  return _ScheduleActivity.fromJson(json);
}

/// @nodoc
mixin _$ScheduleActivity {
  @JsonKey(name: 'ScheduleActivityId')
  int? get scheduleActivityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ScheduleActivityName')
  String? get scheduleActivityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleActivityCopyWith<ScheduleActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleActivityCopyWith<$Res> {
  factory $ScheduleActivityCopyWith(
          ScheduleActivity value, $Res Function(ScheduleActivity) then) =
      _$ScheduleActivityCopyWithImpl<$Res, ScheduleActivity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ScheduleActivityId') int? scheduleActivityId,
      @JsonKey(name: 'ScheduleActivityName') String? scheduleActivityName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$ScheduleActivityCopyWithImpl<$Res, $Val extends ScheduleActivity>
    implements $ScheduleActivityCopyWith<$Res> {
  _$ScheduleActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleActivityId = freezed,
    Object? scheduleActivityName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleActivityId: freezed == scheduleActivityId
          ? _value.scheduleActivityId
          : scheduleActivityId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduleActivityName: freezed == scheduleActivityName
          ? _value.scheduleActivityName
          : scheduleActivityName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleActivityCopyWith<$Res>
    implements $ScheduleActivityCopyWith<$Res> {
  factory _$$_ScheduleActivityCopyWith(
          _$_ScheduleActivity value, $Res Function(_$_ScheduleActivity) then) =
      __$$_ScheduleActivityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ScheduleActivityId') int? scheduleActivityId,
      @JsonKey(name: 'ScheduleActivityName') String? scheduleActivityName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_ScheduleActivityCopyWithImpl<$Res>
    extends _$ScheduleActivityCopyWithImpl<$Res, _$_ScheduleActivity>
    implements _$$_ScheduleActivityCopyWith<$Res> {
  __$$_ScheduleActivityCopyWithImpl(
      _$_ScheduleActivity _value, $Res Function(_$_ScheduleActivity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleActivityId = freezed,
    Object? scheduleActivityName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_ScheduleActivity(
      scheduleActivityId: freezed == scheduleActivityId
          ? _value.scheduleActivityId
          : scheduleActivityId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduleActivityName: freezed == scheduleActivityName
          ? _value.scheduleActivityName
          : scheduleActivityName // ignore: cast_nullable_to_non_nullable
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
class _$_ScheduleActivity implements _ScheduleActivity {
  const _$_ScheduleActivity(
      {@JsonKey(name: 'ScheduleActivityId') this.scheduleActivityId,
      @JsonKey(name: 'ScheduleActivityName') this.scheduleActivityName,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_ScheduleActivity.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleActivityFromJson(json);

  @override
  @JsonKey(name: 'ScheduleActivityId')
  final int? scheduleActivityId;
  @override
  @JsonKey(name: 'ScheduleActivityName')
  final String? scheduleActivityName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'ScheduleActivity(scheduleActivityId: $scheduleActivityId, scheduleActivityName: $scheduleActivityName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleActivity &&
            (identical(other.scheduleActivityId, scheduleActivityId) ||
                other.scheduleActivityId == scheduleActivityId) &&
            (identical(other.scheduleActivityName, scheduleActivityName) ||
                other.scheduleActivityName == scheduleActivityName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, scheduleActivityId, scheduleActivityName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleActivityCopyWith<_$_ScheduleActivity> get copyWith =>
      __$$_ScheduleActivityCopyWithImpl<_$_ScheduleActivity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleActivityToJson(
      this,
    );
  }
}

abstract class _ScheduleActivity implements ScheduleActivity {
  const factory _ScheduleActivity(
      {@JsonKey(name: 'ScheduleActivityId') final int? scheduleActivityId,
      @JsonKey(name: 'ScheduleActivityName') final String? scheduleActivityName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_ScheduleActivity;

  factory _ScheduleActivity.fromJson(Map<String, dynamic> json) =
      _$_ScheduleActivity.fromJson;

  @override
  @JsonKey(name: 'ScheduleActivityId')
  int? get scheduleActivityId;
  @override
  @JsonKey(name: 'ScheduleActivityName')
  String? get scheduleActivityName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleActivityCopyWith<_$_ScheduleActivity> get copyWith =>
      throw _privateConstructorUsedError;
}
