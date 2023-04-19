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
  @JsonKey(name: 'AuditTemplateName')
  String? get auditTemplateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'AuditTemplateId')
  String? get auditTemplateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompartmentId')
  int? get compartmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteName')
  String? get siteName => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int? get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLocal')
  bool? get isLocal => throw _privateConstructorUsedError;
  @JsonKey(name: 'Completed')
  bool? get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreateDT')
  String? get createDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdateDT')
  String? get updateDT => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
      @JsonKey(name: 'AuditTemplateId') String? auditTemplateId,
      @JsonKey(name: 'CompartmentName') String? compartmentName,
      @JsonKey(name: 'CompartmentId') int? compartmentId,
      @JsonKey(name: 'SiteName') String? siteName,
      @JsonKey(name: 'SiteId') int? siteId,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal,
      @JsonKey(name: 'Completed') bool? completed,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
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
    Object? auditTemplateName = freezed,
    Object? auditTemplateId = freezed,
    Object? compartmentName = freezed,
    Object? compartmentId = freezed,
    Object? siteName = freezed,
    Object? siteId = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
    Object? completed = freezed,
    Object? status = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_value.copyWith(
      auditId: freezed == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as int?,
      auditTemplateName: freezed == auditTemplateName
          ? _value.auditTemplateName
          : auditTemplateName // ignore: cast_nullable_to_non_nullable
              as String?,
      auditTemplateId: freezed == auditTemplateId
          ? _value.auditTemplateId
          : auditTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentId: freezed == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
      @JsonKey(name: 'AuditTemplateId') String? auditTemplateId,
      @JsonKey(name: 'CompartmentName') String? compartmentName,
      @JsonKey(name: 'CompartmentId') int? compartmentId,
      @JsonKey(name: 'SiteName') String? siteName,
      @JsonKey(name: 'SiteId') int? siteId,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal,
      @JsonKey(name: 'Completed') bool? completed,
      @JsonKey(name: 'Status') int? status,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
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
    Object? auditTemplateName = freezed,
    Object? auditTemplateId = freezed,
    Object? compartmentName = freezed,
    Object? compartmentId = freezed,
    Object? siteName = freezed,
    Object? siteId = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
    Object? completed = freezed,
    Object? status = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_$_Audit(
      auditId: freezed == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as int?,
      auditTemplateName: freezed == auditTemplateName
          ? _value.auditTemplateName
          : auditTemplateName // ignore: cast_nullable_to_non_nullable
              as String?,
      auditTemplateId: freezed == auditTemplateId
          ? _value.auditTemplateId
          : auditTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentId: freezed == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createDT: freezed == createDT
          ? _value.createDT
          : createDT // ignore: cast_nullable_to_non_nullable
              as String?,
      updateDT: freezed == updateDT
          ? _value.updateDT
          : updateDT // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Audit extends _Audit {
  const _$_Audit(
      {@JsonKey(name: 'AuditId') required this.auditId,
      @JsonKey(name: 'AuditTemplateName') this.auditTemplateName,
      @JsonKey(name: 'AuditTemplateId') this.auditTemplateId,
      @JsonKey(name: 'CompartmentName') this.compartmentName,
      @JsonKey(name: 'CompartmentId') this.compartmentId,
      @JsonKey(name: 'SiteName') this.siteName,
      @JsonKey(name: 'SiteId') this.siteId,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'IsLocal') this.isLocal,
      @JsonKey(name: 'Completed') this.completed,
      @JsonKey(name: 'Status') this.status,
      @JsonKey(name: 'CreateDT') this.createDT,
      @JsonKey(name: 'UpdateDT') this.updateDT})
      : super._();

  factory _$_Audit.fromJson(Map<String, dynamic> json) =>
      _$$_AuditFromJson(json);

  @override
  @JsonKey(name: 'AuditId')
  final int? auditId;
  @override
  @JsonKey(name: 'AuditTemplateName')
  final String? auditTemplateName;
  @override
  @JsonKey(name: 'AuditTemplateId')
  final String? auditTemplateId;
  @override
  @JsonKey(name: 'CompartmentName')
  final String? compartmentName;
  @override
  @JsonKey(name: 'CompartmentId')
  final int? compartmentId;
  @override
  @JsonKey(name: 'SiteName')
  final String? siteName;
  @override
  @JsonKey(name: 'SiteId')
  final int? siteId;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsLocal')
  final bool? isLocal;
  @override
  @JsonKey(name: 'Completed')
  final bool? completed;
  @override
  @JsonKey(name: 'Status')
  final int? status;
  @override
  @JsonKey(name: 'CreateDT')
  final String? createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  final String? updateDT;

  @override
  String toString() {
    return 'Audit(auditId: $auditId, auditTemplateName: $auditTemplateName, auditTemplateId: $auditTemplateId, compartmentName: $compartmentName, compartmentId: $compartmentId, siteName: $siteName, siteId: $siteId, isActive: $isActive, isLocal: $isLocal, completed: $completed, status: $status, createDT: $createDT, updateDT: $updateDT)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Audit &&
            (identical(other.auditId, auditId) || other.auditId == auditId) &&
            (identical(other.auditTemplateName, auditTemplateName) ||
                other.auditTemplateName == auditTemplateName) &&
            (identical(other.auditTemplateId, auditTemplateId) ||
                other.auditTemplateId == auditTemplateId) &&
            (identical(other.compartmentName, compartmentName) ||
                other.compartmentName == compartmentName) &&
            (identical(other.compartmentId, compartmentId) ||
                other.compartmentId == compartmentId) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createDT, createDT) ||
                other.createDT == createDT) &&
            (identical(other.updateDT, updateDT) ||
                other.updateDT == updateDT));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      auditId,
      auditTemplateName,
      auditTemplateId,
      compartmentName,
      compartmentId,
      siteName,
      siteId,
      isActive,
      isLocal,
      completed,
      status,
      createDT,
      updateDT);

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
      @JsonKey(name: 'AuditTemplateName') final String? auditTemplateName,
      @JsonKey(name: 'AuditTemplateId') final String? auditTemplateId,
      @JsonKey(name: 'CompartmentName') final String? compartmentName,
      @JsonKey(name: 'CompartmentId') final int? compartmentId,
      @JsonKey(name: 'SiteName') final String? siteName,
      @JsonKey(name: 'SiteId') final int? siteId,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'IsLocal') final bool? isLocal,
      @JsonKey(name: 'Completed') final bool? completed,
      @JsonKey(name: 'Status') final int? status,
      @JsonKey(name: 'CreateDT') final String? createDT,
      @JsonKey(name: 'UpdateDT') final String? updateDT}) = _$_Audit;
  const _Audit._() : super._();

  factory _Audit.fromJson(Map<String, dynamic> json) = _$_Audit.fromJson;

  @override
  @JsonKey(name: 'AuditId')
  int? get auditId;
  @override
  @JsonKey(name: 'AuditTemplateName')
  String? get auditTemplateName;
  @override
  @JsonKey(name: 'AuditTemplateId')
  String? get auditTemplateId;
  @override
  @JsonKey(name: 'CompartmentName')
  String? get compartmentName;
  @override
  @JsonKey(name: 'CompartmentId')
  int? get compartmentId;
  @override
  @JsonKey(name: 'SiteName')
  String? get siteName;
  @override
  @JsonKey(name: 'SiteId')
  int? get siteId;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsLocal')
  bool? get isLocal;
  @override
  @JsonKey(name: 'Completed')
  bool? get completed;
  @override
  @JsonKey(name: 'Status')
  int? get status;
  @override
  @JsonKey(name: 'CreateDT')
  String? get createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  String? get updateDT;
  @override
  @JsonKey(ignore: true)
  _$$_AuditCopyWith<_$_Audit> get copyWith =>
      throw _privateConstructorUsedError;
}
