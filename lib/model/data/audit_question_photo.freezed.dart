// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_question_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuditQuestionPhoto _$AuditQuestionPhotoFromJson(Map<String, dynamic> json) {
  return _AuditQuestionPhoto.fromJson(json);
}

/// @nodoc
mixin _$AuditQuestionPhoto {
  @JsonKey(name: 'PhotoId')
  int? get photoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AuditId')
  int? get auditId => throw _privateConstructorUsedError;
  @JsonKey(name: 'QuestionId')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoPath')
  String? get photoPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoName')
  String? get photoName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditQuestionPhotoCopyWith<AuditQuestionPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditQuestionPhotoCopyWith<$Res> {
  factory $AuditQuestionPhotoCopyWith(
          AuditQuestionPhoto value, $Res Function(AuditQuestionPhoto) then) =
      _$AuditQuestionPhotoCopyWithImpl<$Res, AuditQuestionPhoto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PhotoId') int? photoId,
      @JsonKey(name: 'AuditId') int? auditId,
      @JsonKey(name: 'QuestionId') int? questionId,
      @JsonKey(name: 'PhotoPath') String? photoPath,
      @JsonKey(name: 'PhotoName') String? photoName});
}

/// @nodoc
class _$AuditQuestionPhotoCopyWithImpl<$Res, $Val extends AuditQuestionPhoto>
    implements $AuditQuestionPhotoCopyWith<$Res> {
  _$AuditQuestionPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoId = freezed,
    Object? auditId = freezed,
    Object? questionId = freezed,
    Object? photoPath = freezed,
    Object? photoName = freezed,
  }) {
    return _then(_value.copyWith(
      photoId: freezed == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as int?,
      auditId: freezed == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      photoName: freezed == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuditQuestionPhotoCopyWith<$Res>
    implements $AuditQuestionPhotoCopyWith<$Res> {
  factory _$$_AuditQuestionPhotoCopyWith(_$_AuditQuestionPhoto value,
          $Res Function(_$_AuditQuestionPhoto) then) =
      __$$_AuditQuestionPhotoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PhotoId') int? photoId,
      @JsonKey(name: 'AuditId') int? auditId,
      @JsonKey(name: 'QuestionId') int? questionId,
      @JsonKey(name: 'PhotoPath') String? photoPath,
      @JsonKey(name: 'PhotoName') String? photoName});
}

/// @nodoc
class __$$_AuditQuestionPhotoCopyWithImpl<$Res>
    extends _$AuditQuestionPhotoCopyWithImpl<$Res, _$_AuditQuestionPhoto>
    implements _$$_AuditQuestionPhotoCopyWith<$Res> {
  __$$_AuditQuestionPhotoCopyWithImpl(
      _$_AuditQuestionPhoto _value, $Res Function(_$_AuditQuestionPhoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoId = freezed,
    Object? auditId = freezed,
    Object? questionId = freezed,
    Object? photoPath = freezed,
    Object? photoName = freezed,
  }) {
    return _then(_$_AuditQuestionPhoto(
      photoId: freezed == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as int?,
      auditId: freezed == auditId
          ? _value.auditId
          : auditId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      photoName: freezed == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuditQuestionPhoto extends _AuditQuestionPhoto {
  const _$_AuditQuestionPhoto(
      {@JsonKey(name: 'PhotoId') required this.photoId,
      @JsonKey(name: 'AuditId') required this.auditId,
      @JsonKey(name: 'QuestionId') required this.questionId,
      @JsonKey(name: 'PhotoPath') required this.photoPath,
      @JsonKey(name: 'PhotoName') required this.photoName})
      : super._();

  factory _$_AuditQuestionPhoto.fromJson(Map<String, dynamic> json) =>
      _$$_AuditQuestionPhotoFromJson(json);

  @override
  @JsonKey(name: 'PhotoId')
  final int? photoId;
  @override
  @JsonKey(name: 'AuditId')
  final int? auditId;
  @override
  @JsonKey(name: 'QuestionId')
  final int? questionId;
  @override
  @JsonKey(name: 'PhotoPath')
  final String? photoPath;
  @override
  @JsonKey(name: 'PhotoName')
  final String? photoName;

  @override
  String toString() {
    return 'AuditQuestionPhoto(photoId: $photoId, auditId: $auditId, questionId: $questionId, photoPath: $photoPath, photoName: $photoName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuditQuestionPhoto &&
            (identical(other.photoId, photoId) || other.photoId == photoId) &&
            (identical(other.auditId, auditId) || other.auditId == auditId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.photoName, photoName) ||
                other.photoName == photoName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, photoId, auditId, questionId, photoPath, photoName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuditQuestionPhotoCopyWith<_$_AuditQuestionPhoto> get copyWith =>
      __$$_AuditQuestionPhotoCopyWithImpl<_$_AuditQuestionPhoto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuditQuestionPhotoToJson(
      this,
    );
  }
}

abstract class _AuditQuestionPhoto extends AuditQuestionPhoto {
  const factory _AuditQuestionPhoto(
          {@JsonKey(name: 'PhotoId') required final int? photoId,
          @JsonKey(name: 'AuditId') required final int? auditId,
          @JsonKey(name: 'QuestionId') required final int? questionId,
          @JsonKey(name: 'PhotoPath') required final String? photoPath,
          @JsonKey(name: 'PhotoName') required final String? photoName}) =
      _$_AuditQuestionPhoto;
  const _AuditQuestionPhoto._() : super._();

  factory _AuditQuestionPhoto.fromJson(Map<String, dynamic> json) =
      _$_AuditQuestionPhoto.fromJson;

  @override
  @JsonKey(name: 'PhotoId')
  int? get photoId;
  @override
  @JsonKey(name: 'AuditId')
  int? get auditId;
  @override
  @JsonKey(name: 'QuestionId')
  int? get questionId;
  @override
  @JsonKey(name: 'PhotoPath')
  String? get photoPath;
  @override
  @JsonKey(name: 'PhotoName')
  String? get photoName;
  @override
  @JsonKey(ignore: true)
  _$$_AuditQuestionPhotoCopyWith<_$_AuditQuestionPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}
