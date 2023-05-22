// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rm_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RMSchedule _$RMScheduleFromJson(Map<String, dynamic> json) {
  return _RMSchedule.fromJson(json);
}

/// @nodoc
mixin _$RMSchedule {
  @JsonKey(name: 'ScheduleId')
  String get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ScheduleActivityId')
  int? get scheduleActivityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'GroupSchemeId')
  int? get groupSchemeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Start')
  String? get start => throw _privateConstructorUsedError;
  @JsonKey(name: 'End')
  String? get end => throw _privateConstructorUsedError;
  @JsonKey(name: 'FarmId')
  String? get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserId')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Venue')
  String? get venue => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsMasterDataSynced')
  int? get isMasterDataSynced => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RMScheduleCopyWith<RMSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RMScheduleCopyWith<$Res> {
  factory $RMScheduleCopyWith(
          RMSchedule value, $Res Function(RMSchedule) then) =
      _$RMScheduleCopyWithImpl<$Res, RMSchedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ScheduleId') String scheduleId,
      @JsonKey(name: 'ScheduleActivityId') int? scheduleActivityId,
      @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
      @JsonKey(name: 'Start') String? start,
      @JsonKey(name: 'End') String? end,
      @JsonKey(name: 'FarmId') String? farmId,
      @JsonKey(name: 'UserId') String? userId,
      @JsonKey(name: 'Venue') String? venue,
      @JsonKey(name: 'IsActive') int? isActive,
      @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced});
}

/// @nodoc
class _$RMScheduleCopyWithImpl<$Res, $Val extends RMSchedule>
    implements $RMScheduleCopyWith<$Res> {
  _$RMScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? scheduleActivityId = freezed,
    Object? groupSchemeId = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? farmId = freezed,
    Object? userId = freezed,
    Object? venue = freezed,
    Object? isActive = freezed,
    Object? isMasterDataSynced = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleActivityId: freezed == scheduleActivityId
          ? _value.scheduleActivityId
          : scheduleActivityId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupSchemeId: freezed == groupSchemeId
          ? _value.groupSchemeId
          : groupSchemeId // ignore: cast_nullable_to_non_nullable
              as int?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      farmId: freezed == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      isMasterDataSynced: freezed == isMasterDataSynced
          ? _value.isMasterDataSynced
          : isMasterDataSynced // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RMScheduleCopyWith<$Res>
    implements $RMScheduleCopyWith<$Res> {
  factory _$$_RMScheduleCopyWith(
          _$_RMSchedule value, $Res Function(_$_RMSchedule) then) =
      __$$_RMScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ScheduleId') String scheduleId,
      @JsonKey(name: 'ScheduleActivityId') int? scheduleActivityId,
      @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
      @JsonKey(name: 'Start') String? start,
      @JsonKey(name: 'End') String? end,
      @JsonKey(name: 'FarmId') String? farmId,
      @JsonKey(name: 'UserId') String? userId,
      @JsonKey(name: 'Venue') String? venue,
      @JsonKey(name: 'IsActive') int? isActive,
      @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced});
}

/// @nodoc
class __$$_RMScheduleCopyWithImpl<$Res>
    extends _$RMScheduleCopyWithImpl<$Res, _$_RMSchedule>
    implements _$$_RMScheduleCopyWith<$Res> {
  __$$_RMScheduleCopyWithImpl(
      _$_RMSchedule _value, $Res Function(_$_RMSchedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? scheduleActivityId = freezed,
    Object? groupSchemeId = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? farmId = freezed,
    Object? userId = freezed,
    Object? venue = freezed,
    Object? isActive = freezed,
    Object? isMasterDataSynced = freezed,
  }) {
    return _then(_$_RMSchedule(
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleActivityId: freezed == scheduleActivityId
          ? _value.scheduleActivityId
          : scheduleActivityId // ignore: cast_nullable_to_non_nullable
              as int?,
      groupSchemeId: freezed == groupSchemeId
          ? _value.groupSchemeId
          : groupSchemeId // ignore: cast_nullable_to_non_nullable
              as int?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      farmId: freezed == farmId
          ? _value.farmId
          : farmId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      isMasterDataSynced: freezed == isMasterDataSynced
          ? _value.isMasterDataSynced
          : isMasterDataSynced // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RMSchedule extends _RMSchedule {
  const _$_RMSchedule(
      {@JsonKey(name: 'ScheduleId') required this.scheduleId,
      @JsonKey(name: 'ScheduleActivityId') this.scheduleActivityId,
      @JsonKey(name: 'GroupSchemeId') this.groupSchemeId,
      @JsonKey(name: 'Start') this.start,
      @JsonKey(name: 'End') this.end,
      @JsonKey(name: 'FarmId') this.farmId,
      @JsonKey(name: 'UserId') this.userId,
      @JsonKey(name: 'Venue') this.venue,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'IsMasterDataSynced') this.isMasterDataSynced})
      : super._();

  factory _$_RMSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_RMScheduleFromJson(json);

  @override
  @JsonKey(name: 'ScheduleId')
  final String scheduleId;
  @override
  @JsonKey(name: 'ScheduleActivityId')
  final int? scheduleActivityId;
  @override
  @JsonKey(name: 'GroupSchemeId')
  final int? groupSchemeId;
  @override
  @JsonKey(name: 'Start')
  final String? start;
  @override
  @JsonKey(name: 'End')
  final String? end;
  @override
  @JsonKey(name: 'FarmId')
  final String? farmId;
  @override
  @JsonKey(name: 'UserId')
  final String? userId;
  @override
  @JsonKey(name: 'Venue')
  final String? venue;
  @override
  @JsonKey(name: 'IsActive')
  final int? isActive;
  @override
  @JsonKey(name: 'IsMasterDataSynced')
  final int? isMasterDataSynced;

  @override
  String toString() {
    return 'RMSchedule(scheduleId: $scheduleId, scheduleActivityId: $scheduleActivityId, groupSchemeId: $groupSchemeId, start: $start, end: $end, farmId: $farmId, userId: $userId, venue: $venue, isActive: $isActive, isMasterDataSynced: $isMasterDataSynced)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RMSchedule &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.scheduleActivityId, scheduleActivityId) ||
                other.scheduleActivityId == scheduleActivityId) &&
            (identical(other.groupSchemeId, groupSchemeId) ||
                other.groupSchemeId == groupSchemeId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isMasterDataSynced, isMasterDataSynced) ||
                other.isMasterDataSynced == isMasterDataSynced));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scheduleId,
      scheduleActivityId,
      groupSchemeId,
      start,
      end,
      farmId,
      userId,
      venue,
      isActive,
      isMasterDataSynced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RMScheduleCopyWith<_$_RMSchedule> get copyWith =>
      __$$_RMScheduleCopyWithImpl<_$_RMSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RMScheduleToJson(
      this,
    );
  }
}

abstract class _RMSchedule extends RMSchedule {
  const factory _RMSchedule(
          {@JsonKey(name: 'ScheduleId') required final String scheduleId,
          @JsonKey(name: 'ScheduleActivityId') final int? scheduleActivityId,
          @JsonKey(name: 'GroupSchemeId') final int? groupSchemeId,
          @JsonKey(name: 'Start') final String? start,
          @JsonKey(name: 'End') final String? end,
          @JsonKey(name: 'FarmId') final String? farmId,
          @JsonKey(name: 'UserId') final String? userId,
          @JsonKey(name: 'Venue') final String? venue,
          @JsonKey(name: 'IsActive') final int? isActive,
          @JsonKey(name: 'IsMasterDataSynced') final int? isMasterDataSynced}) =
      _$_RMSchedule;
  const _RMSchedule._() : super._();

  factory _RMSchedule.fromJson(Map<String, dynamic> json) =
      _$_RMSchedule.fromJson;

  @override
  @JsonKey(name: 'ScheduleId')
  String get scheduleId;
  @override
  @JsonKey(name: 'ScheduleActivityId')
  int? get scheduleActivityId;
  @override
  @JsonKey(name: 'GroupSchemeId')
  int? get groupSchemeId;
  @override
  @JsonKey(name: 'Start')
  String? get start;
  @override
  @JsonKey(name: 'End')
  String? get end;
  @override
  @JsonKey(name: 'FarmId')
  String? get farmId;
  @override
  @JsonKey(name: 'UserId')
  String? get userId;
  @override
  @JsonKey(name: 'Venue')
  String? get venue;
  @override
  @JsonKey(name: 'IsActive')
  int? get isActive;
  @override
  @JsonKey(name: 'IsMasterDataSynced')
  int? get isMasterDataSynced;
  @override
  @JsonKey(ignore: true)
  _$$_RMScheduleCopyWith<_$_RMSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
