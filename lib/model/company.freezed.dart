// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  @JsonKey(name: 'CompanyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsInUse')
  bool? get isInUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsMasterDataSynced')
  bool? get isMasterDataSynced => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreateDT')
  String? get createDT => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdateDT')
  String? get updateDT => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CompanyId') int companyId,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'IsInUse') bool? isInUse,
      @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? companyName = freezed,
    Object? isInUse = freezed,
    Object? isMasterDataSynced = freezed,
    Object? isActive = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_value.copyWith(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      isInUse: freezed == isInUse
          ? _value.isInUse
          : isInUse // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMasterDataSynced: freezed == isMasterDataSynced
          ? _value.isMasterDataSynced
          : isMasterDataSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$_CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$_CompanyCopyWith(
          _$_Company value, $Res Function(_$_Company) then) =
      __$$_CompanyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CompanyId') int companyId,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'IsInUse') bool? isInUse,
      @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'CreateDT') String? createDT,
      @JsonKey(name: 'UpdateDT') String? updateDT});
}

/// @nodoc
class __$$_CompanyCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$_Company>
    implements _$$_CompanyCopyWith<$Res> {
  __$$_CompanyCopyWithImpl(_$_Company _value, $Res Function(_$_Company) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? companyName = freezed,
    Object? isInUse = freezed,
    Object? isMasterDataSynced = freezed,
    Object? isActive = freezed,
    Object? createDT = freezed,
    Object? updateDT = freezed,
  }) {
    return _then(_$_Company(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      isInUse: freezed == isInUse
          ? _value.isInUse
          : isInUse // ignore: cast_nullable_to_non_nullable
              as bool?,
      isMasterDataSynced: freezed == isMasterDataSynced
          ? _value.isMasterDataSynced
          : isMasterDataSynced // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$_Company extends _Company {
  const _$_Company(
      {@JsonKey(name: 'CompanyId') required this.companyId,
      @JsonKey(name: 'CompanyName') this.companyName,
      @JsonKey(name: 'IsInUse') this.isInUse,
      @JsonKey(name: 'IsMasterDataSynced') this.isMasterDataSynced,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'CreateDT') this.createDT,
      @JsonKey(name: 'UpdateDT') this.updateDT})
      : super._();

  factory _$_Company.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyFromJson(json);

  @override
  @JsonKey(name: 'CompanyId')
  final int companyId;
  @override
  @JsonKey(name: 'CompanyName')
  final String? companyName;
  @override
  @JsonKey(name: 'IsInUse')
  final bool? isInUse;
  @override
  @JsonKey(name: 'IsMasterDataSynced')
  final bool? isMasterDataSynced;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'CreateDT')
  final String? createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  final String? updateDT;

  @override
  String toString() {
    return 'Company(companyId: $companyId, companyName: $companyName, isInUse: $isInUse, isMasterDataSynced: $isMasterDataSynced, isActive: $isActive, createDT: $createDT, updateDT: $updateDT)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Company &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.isInUse, isInUse) || other.isInUse == isInUse) &&
            (identical(other.isMasterDataSynced, isMasterDataSynced) ||
                other.isMasterDataSynced == isMasterDataSynced) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createDT, createDT) ||
                other.createDT == createDT) &&
            (identical(other.updateDT, updateDT) ||
                other.updateDT == updateDT));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, companyId, companyName, isInUse,
      isMasterDataSynced, isActive, createDT, updateDT);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyCopyWith<_$_Company> get copyWith =>
      __$$_CompanyCopyWithImpl<_$_Company>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyToJson(
      this,
    );
  }
}

abstract class _Company extends Company {
  const factory _Company(
      {@JsonKey(name: 'CompanyId') required final int companyId,
      @JsonKey(name: 'CompanyName') final String? companyName,
      @JsonKey(name: 'IsInUse') final bool? isInUse,
      @JsonKey(name: 'IsMasterDataSynced') final bool? isMasterDataSynced,
      @JsonKey(name: 'IsActive') final bool? isActive,
      @JsonKey(name: 'CreateDT') final String? createDT,
      @JsonKey(name: 'UpdateDT') final String? updateDT}) = _$_Company;
  const _Company._() : super._();

  factory _Company.fromJson(Map<String, dynamic> json) = _$_Company.fromJson;

  @override
  @JsonKey(name: 'CompanyId')
  int get companyId;
  @override
  @JsonKey(name: 'CompanyName')
  String? get companyName;
  @override
  @JsonKey(name: 'IsInUse')
  bool? get isInUse;
  @override
  @JsonKey(name: 'IsMasterDataSynced')
  bool? get isMasterDataSynced;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'CreateDT')
  String? get createDT;
  @override
  @JsonKey(name: 'UpdateDT')
  String? get updateDT;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyCopyWith<_$_Company> get copyWith =>
      throw _privateConstructorUsedError;
}
