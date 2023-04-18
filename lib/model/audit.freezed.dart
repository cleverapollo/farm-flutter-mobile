// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Audit _$AuditFromJson(Map<String, dynamic> json) {
  return _Audit.fromJson(json);
}

/// @nodoc
mixin _$Audit {
  @JsonKey(name: 'AuditId')
  int? get auditId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreateTime')
  DateTime? get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteName')
  String? get siteName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLocal')
  bool? get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditCopyWith<Audit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditCopyWith<$Res> {
  factory $AuditCopyWith(Audit value, $Res Function(Audit) then) =
      _$AuditCopyWithImpl<$Res, Audit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AuditId') int? auditId,
      @JsonKey(name: 'CreateTime') DateTime? createTime,
      @JsonKey(name: 'CompartmentName') String? compartmentName,
      @JsonKey(name: 'SiteName') String? siteName,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class _$AuditCopyWithImpl<$Res, $Val extends Audit>
    implements $AuditCopyWith<$Res> {
  _$AuditCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auditId = freezed,
    Object? createTime = freezed,
    Object? compartmentName = freezed,
    Object? siteName = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_value.copyWith(
      auditId: freezed == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuditCopyWith<$Res> implements $AuditCopyWith<$Res> {
  factory _$$_AuditCopyWith(_$_Audit value, $Res Function(_$_Audit) then) =
      __$$_AuditCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AuditId') int? auditId,
      @JsonKey(name: 'CreateTime') DateTime? createTime,
      @JsonKey(name: 'CompartmentName') String? compartmentName,
      @JsonKey(name: 'SiteName') String? siteName,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class __$$_AuditCopyWithImpl<$Res> extends _$AuditCopyWithImpl<$Res, _$_Audit>
    implements _$$_AuditCopyWith<$Res> {
  __$$_AuditCopyWithImpl(_$_Audit _value, $Res Function(_$_Audit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auditId = freezed,
    Object? createTime = freezed,
    Object? compartmentName = freezed,
    Object? siteName = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_$_Audit(
      auditId: freezed == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as int?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Audit extends _Audit {
  const _$_Audit(
      {@JsonKey(name: 'AuditId') required this.auditId,
      @JsonKey(name: 'CreateTime') this.createTime,
      @JsonKey(name: 'CompartmentName') this.compartmentName,
      @JsonKey(name: 'SiteName') this.siteName,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'IsLocal') this.isLocal})
      : super._();

  factory _$_Audit.fromJson(Map<String, dynamic> json) =>
      _$$_AuditFromJson(json);

  @override
  @JsonKey(name: 'AuditId')
  final int? auditId;
  @override
  @JsonKey(name: 'CreateTime')
  final DateTime? createTime;
  @override
  @JsonKey(name: 'CompartmentName')
  final String? compartmentName;
  @override
  @JsonKey(name: 'SiteName')
  final String? siteName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsLocal')
  final bool? isLocal;

  @override
  String toString() {
    return 'Audit(auditId: $auditId, createTime: $createTime, compartmentName: $compartmentName, siteName: $siteName, isActive: $isActive, isLocal: $isLocal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Audit &&
            (identical(other.auditId, auditId) || other.auditId == auditId) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.compartmentName, compartmentName) ||
                other.compartmentName == compartmentName) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, auditId, createTime,
      compartmentName, siteName, isActive, isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuditCopyWith<_$_Audit> get copyWith =>
      __$$_AuditCopyWithImpl<_$_Audit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuditToJson(
      this,
    );
  }
}

abstract class _Audit extends Audit {
  const factory _Audit(
      {@JsonKey(name: 'AuditId') required final int? auditId,
      @JsonKey(name: 'CreateTime') final DateTime? createTime,
      @JsonKey(name: 'CompartmentName') final String? compartmentName,
      @JsonKey(name: 'SiteName') final String? siteName,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'IsLocal') final bool? isLocal}) = _$_Audit;
  const _Audit._() : super._();

  factory _Audit.fromJson(Map<String, dynamic> json) = _$_Audit.fromJson;

  @override
  @JsonKey(name: 'AuditId')
  int? get auditId;
  @override
  @JsonKey(name: 'CreateTime')
  DateTime? get createTime;
  @override
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName;
  @override
  @JsonKey(name: 'SiteName')
  String? get siteName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsLocal')
  bool? get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$_AuditCopyWith<_$_Audit> get copyWith =>
      throw _privateConstructorUsedError;
}
