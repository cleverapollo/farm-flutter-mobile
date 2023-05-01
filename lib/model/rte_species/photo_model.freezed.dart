// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return _PhotoModel.fromJson(json);
}

/// @nodoc
mixin _$PhotoModel {
  @JsonKey(name: 'PhotoId')
  int? get photoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoName')
  String? get photoName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhotoPath')
  String? get photoPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsLocal')
  bool? get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoModelCopyWith<PhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoModelCopyWith<$Res> {
  factory $PhotoModelCopyWith(
          PhotoModel value, $Res Function(PhotoModel) then) =
      _$PhotoModelCopyWithImpl<$Res, PhotoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PhotoId') int? photoId,
      @JsonKey(name: 'PhotoName') String? photoName,
      @JsonKey(name: 'PhotoPath') String? photoPath,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class _$PhotoModelCopyWithImpl<$Res, $Val extends PhotoModel>
    implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoId = freezed,
    Object? photoName = freezed,
    Object? photoPath = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_value.copyWith(
      photoId: freezed == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoName: freezed == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PhotoModelCopyWith<$Res>
    implements $PhotoModelCopyWith<$Res> {
  factory _$$_PhotoModelCopyWith(
          _$_PhotoModel value, $Res Function(_$_PhotoModel) then) =
      __$$_PhotoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PhotoId') int? photoId,
      @JsonKey(name: 'PhotoName') String? photoName,
      @JsonKey(name: 'PhotoPath') String? photoPath,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsLocal') bool? isLocal});
}

/// @nodoc
class __$$_PhotoModelCopyWithImpl<$Res>
    extends _$PhotoModelCopyWithImpl<$Res, _$_PhotoModel>
    implements _$$_PhotoModelCopyWith<$Res> {
  __$$_PhotoModelCopyWithImpl(
      _$_PhotoModel _value, $Res Function(_$_PhotoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoId = freezed,
    Object? photoName = freezed,
    Object? photoPath = freezed,
    Object? isActive = freezed,
    Object? isLocal = freezed,
  }) {
    return _then(_$_PhotoModel(
      photoId: freezed == photoId
          ? _value.photoId
          : photoId // ignore: cast_nullable_to_non_nullable
              as int?,
      photoName: freezed == photoName
          ? _value.photoName
          : photoName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoPath: freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
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
class _$_PhotoModel extends _PhotoModel {
  const _$_PhotoModel(
      {@JsonKey(name: 'PhotoId') this.photoId,
      @JsonKey(name: 'PhotoName') this.photoName,
      @JsonKey(name: 'PhotoPath') this.photoPath,
      @JsonKey(name: 'IsActive') this.isActive = true,
      @JsonKey(name: 'IsLocal') this.isLocal = true})
      : super._();

  factory _$_PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$$_PhotoModelFromJson(json);

  @override
  @JsonKey(name: 'PhotoId')
  final int? photoId;
  @override
  @JsonKey(name: 'PhotoName')
  final String? photoName;
  @override
  @JsonKey(name: 'PhotoPath')
  final String? photoPath;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsLocal')
  final bool? isLocal;

  @override
  String toString() {
    return 'PhotoModel(photoId: $photoId, photoName: $photoName, photoPath: $photoPath, isActive: $isActive, isLocal: $isLocal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhotoModel &&
            (identical(other.photoId, photoId) || other.photoId == photoId) &&
            (identical(other.photoName, photoName) ||
                other.photoName == photoName) &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, photoId, photoName, photoPath, isActive, isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoModelCopyWith<_$_PhotoModel> get copyWith =>
      __$$_PhotoModelCopyWithImpl<_$_PhotoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhotoModelToJson(
      this,
    );
  }
}

abstract class _PhotoModel extends PhotoModel {
  const factory _PhotoModel(
      {@JsonKey(name: 'PhotoId') final int? photoId,
      @JsonKey(name: 'PhotoName') final String? photoName,
      @JsonKey(name: 'PhotoPath') final String? photoPath,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'IsLocal') final bool? isLocal}) = _$_PhotoModel;
  const _PhotoModel._() : super._();

  factory _PhotoModel.fromJson(Map<String, dynamic> json) =
      _$_PhotoModel.fromJson;

  @override
  @JsonKey(name: 'PhotoId')
  int? get photoId;
  @override
  @JsonKey(name: 'PhotoName')
  String? get photoName;
  @override
  @JsonKey(name: 'PhotoPath')
  String? get photoPath;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsLocal')
  bool? get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoModelCopyWith<_$_PhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
