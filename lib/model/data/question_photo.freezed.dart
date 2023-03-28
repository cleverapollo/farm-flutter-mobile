// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionPhoto _$QuestionPhotoFromJson(Map<String, dynamic> json) {
  return _QuestionPhoto.fromJson(json);
}

/// @nodoc
mixin _$QuestionPhoto {
  @JsonKey(name: 'PhotoId')
  int? get photoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssessmentId')
  int? get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'QuestionId')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoPath')
  String? get photoPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionPhotoCopyWith<QuestionPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionPhotoCopyWith<$Res> {
  factory $QuestionPhotoCopyWith(
          QuestionPhoto value, $Res Function(QuestionPhoto) then) =
      _$QuestionPhotoCopyWithImpl<$Res, QuestionPhoto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PhotoId') int? photoId,
      @JsonKey(name: 'AssessmentId') int? assessmentId,
      @JsonKey(name: 'QuestionId') int? questionId,
      @JsonKey(name: 'PhotoPath') String? photoPath});
}

/// @nodoc
class _$QuestionPhotoCopyWithImpl<$Res, $Val extends QuestionPhoto>
    implements $QuestionPhotoCopyWith<$Res> {
  _$QuestionPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoId = freezed,
    Object? assessmentId = freezed,
    Object? questionId = freezed,
    Object? photoPath = freezed,
  }) {
    return _then(_value.copyWith(
      photoId: freezed == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionPhotoCopyWith<$Res>
    implements $QuestionPhotoCopyWith<$Res> {
  factory _$$_QuestionPhotoCopyWith(
          _$_QuestionPhoto value, $Res Function(_$_QuestionPhoto) then) =
      __$$_QuestionPhotoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PhotoId') int? photoId,
      @JsonKey(name: 'AssessmentId') int? assessmentId,
      @JsonKey(name: 'QuestionId') int? questionId,
      @JsonKey(name: 'PhotoPath') String? photoPath});
}

/// @nodoc
class __$$_QuestionPhotoCopyWithImpl<$Res>
    extends _$QuestionPhotoCopyWithImpl<$Res, _$_QuestionPhoto>
    implements _$$_QuestionPhotoCopyWith<$Res> {
  __$$_QuestionPhotoCopyWithImpl(
      _$_QuestionPhoto _value, $Res Function(_$_QuestionPhoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoId = freezed,
    Object? assessmentId = freezed,
    Object? questionId = freezed,
    Object? photoPath = freezed,
  }) {
    return _then(_$_QuestionPhoto(
      photoId: freezed == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionPhoto extends _QuestionPhoto {
  const _$_QuestionPhoto(
      {@JsonKey(name: 'PhotoId') required this.photoId,
      @JsonKey(name: 'AssessmentId') required this.assessmentId,
      @JsonKey(name: 'QuestionId') required this.questionId,
      @JsonKey(name: 'PhotoPath') required this.photoPath})
      : super._();

  factory _$_QuestionPhoto.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionPhotoFromJson(json);

  @override
  @JsonKey(name: 'PhotoId')
  final int? photoId;
  @override
  @JsonKey(name: 'AssessmentId')
  final int? assessmentId;
  @override
  @JsonKey(name: 'QuestionId')
  final int? questionId;
  @override
  @JsonKey(name: 'PhotoPath')
  final String? photoPath;

  @override
  String toString() {
    return 'QuestionPhoto(photoId: $photoId, assessmentId: $assessmentId, questionId: $questionId, photoPath: $photoPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionPhoto &&
            (identical(other.photoId, photoId) || other.photoId == photoId) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, photoId, assessmentId, questionId, photoPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionPhotoCopyWith<_$_QuestionPhoto> get copyWith =>
      __$$_QuestionPhotoCopyWithImpl<_$_QuestionPhoto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionPhotoToJson(
      this,
    );
  }
}

abstract class _QuestionPhoto extends QuestionPhoto {
  const factory _QuestionPhoto(
          {@JsonKey(name: 'PhotoId') required final int? photoId,
          @JsonKey(name: 'AssessmentId') required final int? assessmentId,
          @JsonKey(name: 'QuestionId') required final int? questionId,
          @JsonKey(name: 'PhotoPath') required final String? photoPath}) =
      _$_QuestionPhoto;
  const _QuestionPhoto._() : super._();

  factory _QuestionPhoto.fromJson(Map<String, dynamic> json) =
      _$_QuestionPhoto.fromJson;

  @override
  @JsonKey(name: 'PhotoId')
  int? get photoId;
  @override
  @JsonKey(name: 'AssessmentId')
  int? get assessmentId;
  @override
  @JsonKey(name: 'QuestionId')
  int? get questionId;
  @override
  @JsonKey(name: 'PhotoPath')
  String? get photoPath;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionPhotoCopyWith<_$_QuestionPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}
