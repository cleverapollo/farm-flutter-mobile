// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Indicator _$IndicatorFromJson(Map<String, dynamic> json) {
  return _Indicator.fromJson(json);
}

/// @nodoc
mixin _$Indicator {
  @JsonKey(name: 'IndicatorId')
  int get indicatorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IndicatorName')
  String? get indicatorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IndicatorDescription')
  String? get indicatorDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndicatorCopyWith<Indicator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicatorCopyWith<$Res> {
  factory $IndicatorCopyWith(Indicator value, $Res Function(Indicator) then) =
      _$IndicatorCopyWithImpl<$Res, Indicator>;
  @useResult
  $Res call(
      {@JsonKey(name: 'IndicatorId') int indicatorId,
      @JsonKey(name: 'IndicatorName') String? indicatorName,
      @JsonKey(name: 'IndicatorDescription') String? indicatorDescription,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$IndicatorCopyWithImpl<$Res, $Val extends Indicator>
    implements $IndicatorCopyWith<$Res> {
  _$IndicatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indicatorId = null,
    Object? indicatorName = freezed,
    Object? indicatorDescription = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      indicatorId: null == indicatorId
          ? _value.indicatorId
          : indicatorId // ignore: cast_nullable_to_non_nullable
              as int,
      indicatorName: freezed == indicatorName
          ? _value.indicatorName
          : indicatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      indicatorDescription: freezed == indicatorDescription
          ? _value.indicatorDescription
          : indicatorDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IndicatorCopyWith<$Res> implements $IndicatorCopyWith<$Res> {
  factory _$$_IndicatorCopyWith(
          _$_Indicator value, $Res Function(_$_Indicator) then) =
      __$$_IndicatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'IndicatorId') int indicatorId,
      @JsonKey(name: 'IndicatorName') String? indicatorName,
      @JsonKey(name: 'IndicatorDescription') String? indicatorDescription,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_IndicatorCopyWithImpl<$Res>
    extends _$IndicatorCopyWithImpl<$Res, _$_Indicator>
    implements _$$_IndicatorCopyWith<$Res> {
  __$$_IndicatorCopyWithImpl(
      _$_Indicator _value, $Res Function(_$_Indicator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indicatorId = null,
    Object? indicatorName = freezed,
    Object? indicatorDescription = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Indicator(
      indicatorId: null == indicatorId
          ? _value.indicatorId
          : indicatorId // ignore: cast_nullable_to_non_nullable
              as int,
      indicatorName: freezed == indicatorName
          ? _value.indicatorName
          : indicatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      indicatorDescription: freezed == indicatorDescription
          ? _value.indicatorDescription
          : indicatorDescription // ignore: cast_nullable_to_non_nullable
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
class _$_Indicator extends _Indicator {
  const _$_Indicator(
      {@JsonKey(name: 'IndicatorId') required this.indicatorId,
      @JsonKey(name: 'IndicatorName') this.indicatorName,
      @JsonKey(name: 'IndicatorDescription') this.indicatorDescription,
      @JsonKey(name: 'IsActive') this.isActive = true})
      : super._();

  factory _$_Indicator.fromJson(Map<String, dynamic> json) =>
      _$$_IndicatorFromJson(json);

  @override
  @JsonKey(name: 'IndicatorId')
  final int indicatorId;
  @override
  @JsonKey(name: 'IndicatorName')
  final String? indicatorName;
  @override
  @JsonKey(name: 'IndicatorDescription')
  final String? indicatorDescription;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Indicator(indicatorId: $indicatorId, indicatorName: $indicatorName, indicatorDescription: $indicatorDescription, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Indicator &&
            (identical(other.indicatorId, indicatorId) ||
                other.indicatorId == indicatorId) &&
            (identical(other.indicatorName, indicatorName) ||
                other.indicatorName == indicatorName) &&
            (identical(other.indicatorDescription, indicatorDescription) ||
                other.indicatorDescription == indicatorDescription) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, indicatorId, indicatorName, indicatorDescription, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IndicatorCopyWith<_$_Indicator> get copyWith =>
      __$$_IndicatorCopyWithImpl<_$_Indicator>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IndicatorToJson(
      this,
    );
  }
}

abstract class _Indicator extends Indicator {
  const factory _Indicator(
      {@JsonKey(name: 'IndicatorId') required final int indicatorId,
      @JsonKey(name: 'IndicatorName') final String? indicatorName,
      @JsonKey(name: 'IndicatorDescription') final String? indicatorDescription,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Indicator;
  const _Indicator._() : super._();

  factory _Indicator.fromJson(Map<String, dynamic> json) =
      _$_Indicator.fromJson;

  @override
  @JsonKey(name: 'IndicatorId')
  int get indicatorId;
  @override
  @JsonKey(name: 'IndicatorName')
  String? get indicatorName;
  @override
  @JsonKey(name: 'IndicatorDescription')
  String? get indicatorDescription;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_IndicatorCopyWith<_$_Indicator> get copyWith =>
      throw _privateConstructorUsedError;
}
