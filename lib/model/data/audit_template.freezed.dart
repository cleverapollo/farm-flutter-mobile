// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuditTemplate _$AuditTemplateFromJson(Map<String, dynamic> json) {
  return _AuditTemplate.fromJson(json);
}

/// @nodoc
mixin _$AuditTemplate {
  @JsonKey(name: 'AuditTemplateId')
  int get auditTemplateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AuditTemplateName')
  String? get auditTemplateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditTemplateCopyWith<AuditTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditTemplateCopyWith<$Res> {
  factory $AuditTemplateCopyWith(
          AuditTemplate value, $Res Function(AuditTemplate) then) =
      _$AuditTemplateCopyWithImpl<$Res, AuditTemplate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AuditTemplateId') int auditTemplateId,
      @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$AuditTemplateCopyWithImpl<$Res, $Val extends AuditTemplate>
    implements $AuditTemplateCopyWith<$Res> {
  _$AuditTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auditTemplateId = null,
    Object? auditTemplateName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      auditTemplateId: null == auditTemplateId
          ? _value.auditTemplateId
          : auditTemplateId // ignore: cast_nullable_to_non_nullable
              as int,
      auditTemplateName: freezed == auditTemplateName
          ? _value.auditTemplateName
          : auditTemplateName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuditTemplateCopyWith<$Res>
    implements $AuditTemplateCopyWith<$Res> {
  factory _$$_AuditTemplateCopyWith(
          _$_AuditTemplate value, $Res Function(_$_AuditTemplate) then) =
      __$$_AuditTemplateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AuditTemplateId') int auditTemplateId,
      @JsonKey(name: 'AuditTemplateName') String? auditTemplateName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_AuditTemplateCopyWithImpl<$Res>
    extends _$AuditTemplateCopyWithImpl<$Res, _$_AuditTemplate>
    implements _$$_AuditTemplateCopyWith<$Res> {
  __$$_AuditTemplateCopyWithImpl(
      _$_AuditTemplate _value, $Res Function(_$_AuditTemplate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auditTemplateId = null,
    Object? auditTemplateName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_AuditTemplate(
      auditTemplateId: null == auditTemplateId
          ? _value.auditTemplateId
          : auditTemplateId // ignore: cast_nullable_to_non_nullable
              as int,
      auditTemplateName: freezed == auditTemplateName
          ? _value.auditTemplateName
          : auditTemplateName // ignore: cast_nullable_to_non_nullable
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
class _$_AuditTemplate extends _AuditTemplate {
  const _$_AuditTemplate(
      {@JsonKey(name: 'AuditTemplateId') required this.auditTemplateId,
      @JsonKey(name: 'AuditTemplateName') this.auditTemplateName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_AuditTemplate.fromJson(Map<String, dynamic> json) =>
      _$$_AuditTemplateFromJson(json);

  @override
  @JsonKey(name: 'AuditTemplateId')
  final int auditTemplateId;
  @override
  @JsonKey(name: 'AuditTemplateName')
  final String? auditTemplateName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'AuditTemplate(auditTemplateId: $auditTemplateId, auditTemplateName: $auditTemplateName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuditTemplate &&
            (identical(other.auditTemplateId, auditTemplateId) ||
                other.auditTemplateId == auditTemplateId) &&
            (identical(other.auditTemplateName, auditTemplateName) ||
                other.auditTemplateName == auditTemplateName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, auditTemplateId, auditTemplateName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuditTemplateCopyWith<_$_AuditTemplate> get copyWith =>
      __$$_AuditTemplateCopyWithImpl<_$_AuditTemplate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuditTemplateToJson(
      this,
    );
  }
}

abstract class _AuditTemplate extends AuditTemplate {
  const factory _AuditTemplate(
      {@JsonKey(name: 'AuditTemplateId') required final int auditTemplateId,
      @JsonKey(name: 'AuditTemplateName') final String? auditTemplateName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_AuditTemplate;
  const _AuditTemplate._() : super._();

  factory _AuditTemplate.fromJson(Map<String, dynamic> json) =
      _$_AuditTemplate.fromJson;

  @override
  @JsonKey(name: 'AuditTemplateId')
  int get auditTemplateId;
  @override
  @JsonKey(name: 'AuditTemplateName')
  String? get auditTemplateName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AuditTemplateCopyWith<_$_AuditTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}
