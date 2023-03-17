// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrainingProvider _$TrainingProviderFromJson(Map<String, dynamic> json) {
  return _TrainingProvider.fromJson(json);
}

/// @nodoc
mixin _$TrainingProvider {
  @JsonKey(name: 'TrainingProviderId')
  int get trainingProviderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TrainingProviderName')
  String? get trainingProviderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainingProviderCopyWith<TrainingProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingProviderCopyWith<$Res> {
  factory $TrainingProviderCopyWith(
          TrainingProvider value, $Res Function(TrainingProvider) then) =
      _$TrainingProviderCopyWithImpl<$Res, TrainingProvider>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TrainingProviderId') int trainingProviderId,
      @JsonKey(name: 'TrainingProviderName') String? trainingProviderName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$TrainingProviderCopyWithImpl<$Res, $Val extends TrainingProvider>
    implements $TrainingProviderCopyWith<$Res> {
  _$TrainingProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainingProviderId = null,
    Object? trainingProviderName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      trainingProviderId: null == trainingProviderId
          ? _value.trainingProviderId
          : trainingProviderId // ignore: cast_nullable_to_non_nullable
              as int,
      trainingProviderName: freezed == trainingProviderName
          ? _value.trainingProviderName
          : trainingProviderName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrainingProviderCopyWith<$Res>
    implements $TrainingProviderCopyWith<$Res> {
  factory _$$_TrainingProviderCopyWith(
          _$_TrainingProvider value, $Res Function(_$_TrainingProvider) then) =
      __$$_TrainingProviderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TrainingProviderId') int trainingProviderId,
      @JsonKey(name: 'TrainingProviderName') String? trainingProviderName,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_TrainingProviderCopyWithImpl<$Res>
    extends _$TrainingProviderCopyWithImpl<$Res, _$_TrainingProvider>
    implements _$$_TrainingProviderCopyWith<$Res> {
  __$$_TrainingProviderCopyWithImpl(
      _$_TrainingProvider _value, $Res Function(_$_TrainingProvider) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trainingProviderId = null,
    Object? trainingProviderName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_TrainingProvider(
      trainingProviderId: null == trainingProviderId
          ? _value.trainingProviderId
          : trainingProviderId // ignore: cast_nullable_to_non_nullable
              as int,
      trainingProviderName: freezed == trainingProviderName
          ? _value.trainingProviderName
          : trainingProviderName // ignore: cast_nullable_to_non_nullable
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
class _$_TrainingProvider extends _TrainingProvider {
  const _$_TrainingProvider(
      {@JsonKey(name: 'TrainingProviderId') required this.trainingProviderId,
      @JsonKey(name: 'TrainingProviderName') this.trainingProviderName,
      @JsonKey(name: 'IsActive') this.isActive})
      : super._();

  factory _$_TrainingProvider.fromJson(Map<String, dynamic> json) =>
      _$$_TrainingProviderFromJson(json);

  @override
  @JsonKey(name: 'TrainingProviderId')
  final int trainingProviderId;
  @override
  @JsonKey(name: 'TrainingProviderName')
  final String? trainingProviderName;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'TrainingProvider(trainingProviderId: $trainingProviderId, trainingProviderName: $trainingProviderName, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrainingProvider &&
            (identical(other.trainingProviderId, trainingProviderId) ||
                other.trainingProviderId == trainingProviderId) &&
            (identical(other.trainingProviderName, trainingProviderName) ||
                other.trainingProviderName == trainingProviderName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, trainingProviderId, trainingProviderName, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrainingProviderCopyWith<_$_TrainingProvider> get copyWith =>
      __$$_TrainingProviderCopyWithImpl<_$_TrainingProvider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrainingProviderToJson(
      this,
    );
  }
}

abstract class _TrainingProvider extends TrainingProvider {
  const factory _TrainingProvider(
      {@JsonKey(name: 'TrainingProviderId')
          required final int trainingProviderId,
      @JsonKey(name: 'TrainingProviderName')
          final String? trainingProviderName,
      @JsonKey(name: 'IsActive')
          final bool? isActive}) = _$_TrainingProvider;
  const _TrainingProvider._() : super._();

  factory _TrainingProvider.fromJson(Map<String, dynamic> json) =
      _$_TrainingProvider.fromJson;

  @override
  @JsonKey(name: 'TrainingProviderId')
  int get trainingProviderId;
  @override
  @JsonKey(name: 'TrainingProviderName')
  String? get trainingProviderName;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_TrainingProviderCopyWith<_$_TrainingProvider> get copyWith =>
      throw _privateConstructorUsedError;
}
