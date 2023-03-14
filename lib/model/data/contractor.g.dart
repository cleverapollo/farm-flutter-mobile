// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contractor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contractor _$$_ContractorFromJson(Map<String, dynamic> json) =>
    _$_Contractor(
      contractorId: json['ContractorId'] as int?,
      companyId: json['CompanyId'] as int?,
      contractorName: json['ContractorName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      emailAddress: json['EmailAddress'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_ContractorToJson(_$_Contractor instance) =>
    <String, dynamic>{
      'ContractorId': instance.contractorId,
      'CompanyId': instance.companyId,
      'ContractorName': instance.contractorName,
      'PhoneNumber': instance.phoneNumber,
      'EmailAddress': instance.emailAddress,
      'IsActive': instance.isActive,
    };
