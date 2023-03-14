// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plantation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plantation _$PlantationFromJson(Map<String, dynamic> json) {
  return _Plantation.fromJson(json);
}

/// @nodoc
mixin _$Plantation {
  @JsonKey(name: 'PlantationId')
  int? get plantationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PlantationName')
  String? get plantationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyId')
  int? get companyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantationCopyWith<Plantation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantationCopyWith<$Res> {
  factory $PlantationCopyWith(
          Plantation value, $Res Function(Plantation) then) =
      _$PlantationCopyWithImpl<$Res, Plantation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PlantationId') int? plantationId,
      @JsonKey(name: 'PlantationName') String? plantationName,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CompanyId') int? companyId});
}

/// @nodoc
class _$PlantationCopyWithImpl<$Res, $Val extends Plantation>
    implements $PlantationCopyWith<$Res> {
  _$PlantationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantationId = freezed,
    Object? plantationName = freezed,
    Object? isActive = freezed,
    Object? companyId = freezed,
  }) {
    return _then(_value.copyWith(
      plantationId: freezed == plantationId
          ? _value.plantationId
          : plantationId // ignore: cast_nullable_to_non_nullable
              as int?,
      plantationName: freezed == plantationName
          ? _value.plantationName
          : plantationName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlantationCopyWith<$Res>
    implements $PlantationCopyWith<$Res> {
  factory _$$_PlantationCopyWith(
          _$_Plantation value, $Res Function(_$_Plantation) then) =
      __$$_PlantationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PlantationId') int? plantationId,
      @JsonKey(name: 'PlantationName') String? plantationName,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CompanyId') int? companyId});
}

/// @nodoc
class __$$_PlantationCopyWithImpl<$Res>
    extends _$PlantationCopyWithImpl<$Res, _$_Plantation>
    implements _$$_PlantationCopyWith<$Res> {
  __$$_PlantationCopyWithImpl(
      _$_Plantation _value, $Res Function(_$_Plantation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantationId = freezed,
    Object? plantationName = freezed,
    Object? isActive = freezed,
    Object? companyId = freezed,
  }) {
    return _then(_$_Plantation(
      plantationId: freezed == plantationId
          ? _value.plantationId
          : plantationId // ignore: cast_nullable_to_non_nullable
              as int?,
      plantationName: freezed == plantationName
          ? _value.plantationName
          : plantationName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Plantation implements _Plantation {
  const _$_Plantation(
      {@JsonKey(name: 'PlantationId') this.plantationId,
      @JsonKey(name: 'PlantationName') this.plantationName,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'CompanyId') this.companyId});

  factory _$_Plantation.fromJson(Map<String, dynamic> json) =>
      _$$_PlantationFromJson(json);

  @override
  @JsonKey(name: 'PlantationId')
  final int? plantationId;
  @override
  @JsonKey(name: 'PlantationName')
  final String? plantationName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'CompanyId')
  final int? companyId;

  @override
  String toString() {
    return 'Plantation(plantationId: $plantationId, plantationName: $plantationName, isActive: $isActive, companyId: $companyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Plantation &&
            (identical(other.plantationId, plantationId) ||
                other.plantationId == plantationId) &&
            (identical(other.plantationName, plantationName) ||
                other.plantationName == plantationName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, plantationId, plantationName, isActive, companyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlantationCopyWith<_$_Plantation> get copyWith =>
      __$$_PlantationCopyWithImpl<_$_Plantation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlantationToJson(
      this,
    );
  }
}

abstract class _Plantation implements Plantation {
  const factory _Plantation(
      {@JsonKey(name: 'PlantationId') final int? plantationId,
      @JsonKey(name: 'PlantationName') final String? plantationName,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'CompanyId') final int? companyId}) = _$_Plantation;

  factory _Plantation.fromJson(Map<String, dynamic> json) =
      _$_Plantation.fromJson;

  @override
  @JsonKey(name: 'PlantationId')
  int? get plantationId;
  @override
  @JsonKey(name: 'PlantationName')
  String? get plantationName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'CompanyId')
  int? get companyId;
  @override
  @JsonKey(ignore: true)
  _$$_PlantationCopyWith<_$_Plantation> get copyWith =>
      throw _privateConstructorUsedError;
}
