// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contractor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contractor _$ContractorFromJson(Map<String, dynamic> json) {
  return _Contractor.fromJson(json);
}

/// @nodoc
mixin _$Contractor {
  @JsonKey(name: 'ContractorId')
  int? get contractorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyId')
  int? get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractorName')
  String? get contractorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmailAddress')
  String? get emailAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractorCopyWith<Contractor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractorCopyWith<$Res> {
  factory $ContractorCopyWith(
          Contractor value, $Res Function(Contractor) then) =
      _$ContractorCopyWithImpl<$Res, Contractor>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ContractorId') int? contractorId,
      @JsonKey(name: 'CompanyId') int? companyId,
      @JsonKey(name: 'ContractorName') String? contractorName,
      @JsonKey(name: 'PhoneNumber') String? phoneNumber,
      @JsonKey(name: 'EmailAddress') String? emailAddress,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class _$ContractorCopyWithImpl<$Res, $Val extends Contractor>
    implements $ContractorCopyWith<$Res> {
  _$ContractorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractorId = freezed,
    Object? companyId = freezed,
    Object? contractorName = freezed,
    Object? phoneNumber = freezed,
    Object? emailAddress = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      contractorId: freezed == contractorId
          ? _value.contractorId
          : contractorId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      contractorName: freezed == contractorName
          ? _value.contractorName
          : contractorName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContractorCopyWith<$Res>
    implements $ContractorCopyWith<$Res> {
  factory _$$_ContractorCopyWith(
          _$_Contractor value, $Res Function(_$_Contractor) then) =
      __$$_ContractorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ContractorId') int? contractorId,
      @JsonKey(name: 'CompanyId') int? companyId,
      @JsonKey(name: 'ContractorName') String? contractorName,
      @JsonKey(name: 'PhoneNumber') String? phoneNumber,
      @JsonKey(name: 'EmailAddress') String? emailAddress,
      @JsonKey(name: 'IsActive') bool? isActive});
}

/// @nodoc
class __$$_ContractorCopyWithImpl<$Res>
    extends _$ContractorCopyWithImpl<$Res, _$_Contractor>
    implements _$$_ContractorCopyWith<$Res> {
  __$$_ContractorCopyWithImpl(
      _$_Contractor _value, $Res Function(_$_Contractor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractorId = freezed,
    Object? companyId = freezed,
    Object? contractorName = freezed,
    Object? phoneNumber = freezed,
    Object? emailAddress = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Contractor(
      contractorId: freezed == contractorId
          ? _value.contractorId
          : contractorId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      contractorName: freezed == contractorName
          ? _value.contractorName
          : contractorName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
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
class _$_Contractor implements _Contractor {
  const _$_Contractor(
      {@JsonKey(name: 'ContractorId') this.contractorId,
      @JsonKey(name: 'CompanyId') this.companyId,
      @JsonKey(name: 'ContractorName') this.contractorName,
      @JsonKey(name: 'PhoneNumber') this.phoneNumber,
      @JsonKey(name: 'EmailAddress') this.emailAddress,
      @JsonKey(name: 'IsActive') this.isActive});

  factory _$_Contractor.fromJson(Map<String, dynamic> json) =>
      _$$_ContractorFromJson(json);

  @override
  @JsonKey(name: 'ContractorId')
  final int? contractorId;
  @override
  @JsonKey(name: 'CompanyId')
  final int? companyId;
  @override
  @JsonKey(name: 'ContractorName')
  final String? contractorName;
  @override
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'EmailAddress')
  final String? emailAddress;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;

  @override
  String toString() {
    return 'Contractor(contractorId: $contractorId, companyId: $companyId, contractorName: $contractorName, phoneNumber: $phoneNumber, emailAddress: $emailAddress, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contractor &&
            (identical(other.contractorId, contractorId) ||
                other.contractorId == contractorId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.contractorName, contractorName) ||
                other.contractorName == contractorName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contractorId, companyId,
      contractorName, phoneNumber, emailAddress, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractorCopyWith<_$_Contractor> get copyWith =>
      __$$_ContractorCopyWithImpl<_$_Contractor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractorToJson(
      this,
    );
  }
}

abstract class _Contractor implements Contractor {
  const factory _Contractor(
      {@JsonKey(name: 'ContractorId') final int? contractorId,
      @JsonKey(name: 'CompanyId') final int? companyId,
      @JsonKey(name: 'ContractorName') final String? contractorName,
      @JsonKey(name: 'PhoneNumber') final String? phoneNumber,
      @JsonKey(name: 'EmailAddress') final String? emailAddress,
      @JsonKey(name: 'IsActive') final bool? isActive}) = _$_Contractor;

  factory _Contractor.fromJson(Map<String, dynamic> json) =
      _$_Contractor.fromJson;

  @override
  @JsonKey(name: 'ContractorId')
  int? get contractorId;
  @override
  @JsonKey(name: 'CompanyId')
  int? get companyId;
  @override
  @JsonKey(name: 'ContractorName')
  String? get contractorName;
  @override
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'EmailAddress')
  String? get emailAddress;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_ContractorCopyWith<_$_Contractor> get copyWith =>
      throw _privateConstructorUsedError;
}
