// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionComment _$QuestionCommentFromJson(Map<String, dynamic> json) {
  return _QuestionComment.fromJson(json);
}

/// @nodoc
mixin _$QuestionComment {
  @JsonKey(name: 'CommentId')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssessmentId')
  int? get assessmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'QuestionId')
  int? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Comment')
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCommentCopyWith<QuestionComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCommentCopyWith<$Res> {
  factory $QuestionCommentCopyWith(
          QuestionComment value, $Res Function(QuestionComment) then) =
      _$QuestionCommentCopyWithImpl<$Res, QuestionComment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CommentId') int? commentId,
      @JsonKey(name: 'AssessmentId') int? assessmentId,
      @JsonKey(name: 'QuestionId') int? questionId,
      @JsonKey(name: 'Comment') String? comment});
}

/// @nodoc
class _$QuestionCommentCopyWithImpl<$Res, $Val extends QuestionComment>
    implements $QuestionCommentCopyWith<$Res> {
  _$QuestionCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = freezed,
    Object? assessmentId = freezed,
    Object? questionId = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCommentCopyWith<$Res>
    implements $QuestionCommentCopyWith<$Res> {
  factory _$$_QuestionCommentCopyWith(
          _$_QuestionComment value, $Res Function(_$_QuestionComment) then) =
      __$$_QuestionCommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CommentId') int? commentId,
      @JsonKey(name: 'AssessmentId') int? assessmentId,
      @JsonKey(name: 'QuestionId') int? questionId,
      @JsonKey(name: 'Comment') String? comment});
}

/// @nodoc
class __$$_QuestionCommentCopyWithImpl<$Res>
    extends _$QuestionCommentCopyWithImpl<$Res, _$_QuestionComment>
    implements _$$_QuestionCommentCopyWith<$Res> {
  __$$_QuestionCommentCopyWithImpl(
      _$_QuestionComment _value, $Res Function(_$_QuestionComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = freezed,
    Object? assessmentId = freezed,
    Object? questionId = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$_QuestionComment(
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      assessmentId: freezed == assessmentId
          ? _value.assessmentId
          : assessmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionComment extends _QuestionComment {
  const _$_QuestionComment(
      {@JsonKey(name: 'CommentId') required this.commentId,
      @JsonKey(name: 'AssessmentId') required this.assessmentId,
      @JsonKey(name: 'QuestionId') required this.questionId,
      @JsonKey(name: 'Comment') required this.comment})
      : super._();

  factory _$_QuestionComment.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionCommentFromJson(json);

  @override
  @JsonKey(name: 'CommentId')
  final int? commentId;
  @override
  @JsonKey(name: 'AssessmentId')
  final int? assessmentId;
  @override
  @JsonKey(name: 'QuestionId')
  final int? questionId;
  @override
  @JsonKey(name: 'Comment')
  final String? comment;

  @override
  String toString() {
    return 'QuestionComment(commentId: $commentId, assessmentId: $assessmentId, questionId: $questionId, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionComment &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.assessmentId, assessmentId) ||
                other.assessmentId == assessmentId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, commentId, assessmentId, questionId, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCommentCopyWith<_$_QuestionComment> get copyWith =>
      __$$_QuestionCommentCopyWithImpl<_$_QuestionComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionCommentToJson(
      this,
    );
  }
}

abstract class _QuestionComment extends QuestionComment {
  const factory _QuestionComment(
          {@JsonKey(name: 'CommentId') required final int? commentId,
          @JsonKey(name: 'AssessmentId') required final int? assessmentId,
          @JsonKey(name: 'QuestionId') required final int? questionId,
          @JsonKey(name: 'Comment') required final String? comment}) =
      _$_QuestionComment;
  const _QuestionComment._() : super._();

  factory _QuestionComment.fromJson(Map<String, dynamic> json) =
      _$_QuestionComment.fromJson;

  @override
  @JsonKey(name: 'CommentId')
  int? get commentId;
  @override
  @JsonKey(name: 'AssessmentId')
  int? get assessmentId;
  @override
  @JsonKey(name: 'QuestionId')
  int? get questionId;
  @override
  @JsonKey(name: 'Comment')
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCommentCopyWith<_$_QuestionComment> get copyWith =>
      throw _privateConstructorUsedError;
}
