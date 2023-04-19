// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Site _$SiteFromJson(Map<String, dynamic> json) {
  return _Site.fromJson(json);
}

/// @nodoc
mixin _$Site {
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteName')
  String? get siteName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteCopyWith<Site> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteCopyWith<$Res> {
  factory $SiteCopyWith(Site value, $Res Function(Site) then) =
      _$SiteCopyWithImpl<$Res, Site>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SiteName') String? siteName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class _$SiteCopyWithImpl<$Res, $Val extends Site>
    implements $SiteCopyWith<$Res> {
  _$SiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? siteName = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SiteCopyWith<$Res> implements $SiteCopyWith<$Res> {
  factory _$$_SiteCopyWith(_$_Site value, $Res Function(_$_Site) then) =
      __$$_SiteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SiteName') String? siteName,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class __$$_SiteCopyWithImpl<$Res> extends _$SiteCopyWithImpl<$Res, _$_Site>
    implements _$$_SiteCopyWith<$Res> {
  __$$_SiteCopyWithImpl(_$_Site _value, $Res Function(_$_Site) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? siteName = freezed,
    Object? isActive = null,
  }) {
    return _then(_$_Site(
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Site extends _Site {
  const _$_Site(
      {@JsonKey(name: 'SiteId') required this.siteId,
      @JsonKey(name: 'SiteName') this.siteName,
      @JsonKey(name: 'IsActive') this.isActive = true})
      : super._();

  factory _$_Site.fromJson(Map<String, dynamic> json) => _$$_SiteFromJson(json);

  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'SiteName')
  final String? siteName;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;

  @override
  String toString() {
    return 'Site(siteId: $siteId, siteName: $siteName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Site &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, siteId, siteName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SiteCopyWith<_$_Site> get copyWith =>
      __$$_SiteCopyWithImpl<_$_Site>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteToJson(
      this,
    );
  }
}

abstract class _Site extends Site {
  const factory _Site(
      {@JsonKey(name: 'SiteId') required final int siteId,
      @JsonKey(name: 'SiteName') final String? siteName,
      @JsonKey(name: 'IsActive') final bool isActive}) = _$_Site;
  const _Site._() : super._();

  factory _Site.fromJson(Map<String, dynamic> json) = _$_Site.fromJson;

  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'SiteName')
  String? get siteName;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_SiteCopyWith<_$_Site> get copyWith => throw _privateConstructorUsedError;
}
