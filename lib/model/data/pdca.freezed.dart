// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdca.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pdca _$PdcaFromJson(Map<String, dynamic> json) {
  return _Pdca.fromJson(json);
}

/// @nodoc
mixin _$Pdca {
  @JsonKey(name: 'PDCAId')
  int? get pdcaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PDCAName')
  String? get pdcaName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdcaCopyWith<Pdca> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdcaCopyWith<$Res> {
  factory $PdcaCopyWith(Pdca value, $Res Function(Pdca) then) =
      _$PdcaCopyWithImpl<$Res, Pdca>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PDCAId') int? pdcaId,
      @JsonKey(name: 'PDCAName') String? pdcaName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$PdcaCopyWithImpl<$Res, $Val extends Pdca>
    implements $PdcaCopyWith<$Res> {
  _$PdcaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdcaId = freezed,
    Object? pdcaName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      pdcaId: freezed == pdcaId
          ? _value.pdcaId
          : pdcaId // ignore: cast_nullable_to_non_nullable
              as int?,
      pdcaName: freezed == pdcaName
          ? _value.pdcaName
          : pdcaName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PdcaCopyWith<$Res> implements $PdcaCopyWith<$Res> {
  factory _$$_PdcaCopyWith(_$_Pdca value, $Res Function(_$_Pdca) then) =
      __$$_PdcaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PDCAId') int? pdcaId,
      @JsonKey(name: 'PDCAName') String? pdcaName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_PdcaCopyWithImpl<$Res> extends _$PdcaCopyWithImpl<$Res, _$_Pdca>
    implements _$$_PdcaCopyWith<$Res> {
  __$$_PdcaCopyWithImpl(_$_Pdca _value, $Res Function(_$_Pdca) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdcaId = freezed,
    Object? pdcaName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Pdca(
      pdcaId: freezed == pdcaId
          ? _value.pdcaId
          : pdcaId // ignore: cast_nullable_to_non_nullable
              as int?,
      pdcaName: freezed == pdcaName
          ? _value.pdcaName
          : pdcaName // ignore: cast_nullable_to_non_nullable
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
class _$_Pdca implements _Pdca {
  const _$_Pdca(
      {@JsonKey(name: 'PDCAId') this.pdcaId,
      @JsonKey(name: 'PDCAName') this.pdcaName,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_Pdca.fromJson(Map<String, dynamic> json) => _$$_PdcaFromJson(json);

  @override
  @JsonKey(name: 'PDCAId')
  final int? pdcaId;
  @override
  @JsonKey(name: 'PDCAName')
  final String? pdcaName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Pdca(pdcaId: $pdcaId, pdcaName: $pdcaName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pdca &&
            (identical(other.pdcaId, pdcaId) || other.pdcaId == pdcaId) &&
            (identical(other.pdcaName, pdcaName) ||
                other.pdcaName == pdcaName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pdcaId, pdcaName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PdcaCopyWith<_$_Pdca> get copyWith =>
      __$$_PdcaCopyWithImpl<_$_Pdca>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PdcaToJson(
      this,
    );
  }
}

abstract class _Pdca implements Pdca {
  const factory _Pdca(
      {@JsonKey(name: 'PDCAId') final int? pdcaId,
      @JsonKey(name: 'PDCAName') final String? pdcaName,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Pdca;

  factory _Pdca.fromJson(Map<String, dynamic> json) = _$_Pdca.fromJson;

  @override
  @JsonKey(name: 'PDCAId')
  int? get pdcaId;
  @override
  @JsonKey(name: 'PDCAName')
  String? get pdcaName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_PdcaCopyWith<_$_Pdca> get copyWith => throw _privateConstructorUsedError;
}
