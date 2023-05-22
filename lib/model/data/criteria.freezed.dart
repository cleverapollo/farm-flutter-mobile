// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'criteria.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Criteria _$CriteriaFromJson(Map<String, dynamic> json) {
  return _Criteria.fromJson(json);
}

/// @nodoc
mixin _$Criteria {
  @JsonKey(name: 'CriteriaId')
  int get criteriaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CriteriaName')
  String? get criteriaName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CriteriaDescription')
  String? get criteriaDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CriteriaCopyWith<Criteria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CriteriaCopyWith<$Res> {
  factory $CriteriaCopyWith(Criteria value, $Res Function(Criteria) then) =
      _$CriteriaCopyWithImpl<$Res, Criteria>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CriteriaId') int criteriaId,
      @JsonKey(name: 'CriteriaName') String? criteriaName,
      @JsonKey(name: 'CriteriaDescription') String? criteriaDescription,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$CriteriaCopyWithImpl<$Res, $Val extends Criteria>
    implements $CriteriaCopyWith<$Res> {
  _$CriteriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? criteriaId = null,
    Object? criteriaName = freezed,
    Object? criteriaDescription = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      criteriaId: null == criteriaId
          ? _value.criteriaId
          : criteriaId // ignore: cast_nullable_to_non_nullable
              as int,
      criteriaName: freezed == criteriaName
          ? _value.criteriaName
          : criteriaName // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaDescription: freezed == criteriaDescription
          ? _value.criteriaDescription
          : criteriaDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CriteriaCopyWith<$Res> implements $CriteriaCopyWith<$Res> {
  factory _$$_CriteriaCopyWith(
          _$_Criteria value, $Res Function(_$_Criteria) then) =
      __$$_CriteriaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CriteriaId') int criteriaId,
      @JsonKey(name: 'CriteriaName') String? criteriaName,
      @JsonKey(name: 'CriteriaDescription') String? criteriaDescription,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_CriteriaCopyWithImpl<$Res>
    extends _$CriteriaCopyWithImpl<$Res, _$_Criteria>
    implements _$$_CriteriaCopyWith<$Res> {
  __$$_CriteriaCopyWithImpl(
      _$_Criteria _value, $Res Function(_$_Criteria) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? criteriaId = null,
    Object? criteriaName = freezed,
    Object? criteriaDescription = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Criteria(
      criteriaId: null == criteriaId
          ? _value.criteriaId
          : criteriaId // ignore: cast_nullable_to_non_nullable
              as int,
      criteriaName: freezed == criteriaName
          ? _value.criteriaName
          : criteriaName // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaDescription: freezed == criteriaDescription
          ? _value.criteriaDescription
          : criteriaDescription // ignore: cast_nullable_to_non_nullable
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
class _$_Criteria extends _Criteria {
  const _$_Criteria(
      {@JsonKey(name: 'CriteriaId') required this.criteriaId,
      @JsonKey(name: 'CriteriaName') this.criteriaName,
      @JsonKey(name: 'CriteriaDescription') this.criteriaDescription,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_Criteria.fromJson(Map<String, dynamic> json) =>
      _$$_CriteriaFromJson(json);

  @override
  @JsonKey(name: 'CriteriaId')
  final int criteriaId;
  @override
  @JsonKey(name: 'CriteriaName')
  final String? criteriaName;
  @override
  @JsonKey(name: 'CriteriaDescription')
  final String? criteriaDescription;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Criteria(criteriaId: $criteriaId, criteriaName: $criteriaName, criteriaDescription: $criteriaDescription, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Criteria &&
            (identical(other.criteriaId, criteriaId) ||
                other.criteriaId == criteriaId) &&
            (identical(other.criteriaName, criteriaName) ||
                other.criteriaName == criteriaName) &&
            (identical(other.criteriaDescription, criteriaDescription) ||
                other.criteriaDescription == criteriaDescription) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, criteriaId, criteriaName, criteriaDescription, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CriteriaCopyWith<_$_Criteria> get copyWith =>
      __$$_CriteriaCopyWithImpl<_$_Criteria>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CriteriaToJson(
      this,
    );
  }
}

abstract class _Criteria extends Criteria {
  const factory _Criteria(
      {@JsonKey(name: 'CriteriaId') required final int criteriaId,
      @JsonKey(name: 'CriteriaName') final String? criteriaName,
      @JsonKey(name: 'CriteriaDescription') final String? criteriaDescription,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Criteria;
  const _Criteria._() : super._();

  factory _Criteria.fromJson(Map<String, dynamic> json) = _$_Criteria.fromJson;

  @override
  @JsonKey(name: 'CriteriaId')
  int get criteriaId;
  @override
  @JsonKey(name: 'CriteriaName')
  String? get criteriaName;
  @override
  @JsonKey(name: 'CriteriaDescription')
  String? get criteriaDescription;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_CriteriaCopyWith<_$_Criteria> get copyWith =>
      throw _privateConstructorUsedError;
}
