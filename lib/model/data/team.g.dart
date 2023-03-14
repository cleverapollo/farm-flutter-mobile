// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Team _$$_TeamFromJson(Map<String, dynamic> json) => _$_Team(
      teamId: json['TeamId'] as int?,
      teamName: json['TeamName'] as String?,
      companyId: json['CompanyId'] as int?,
      contractorId: json['ContractorId'] as int?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_TeamToJson(_$_Team instance) => <String, dynamic>{
      'TeamId': instance.teamId,
      'TeamName': instance.teamName,
      'CompanyId': instance.companyId,
      'ContractorId': instance.contractorId,
      'IsActive': instance.isActive,
    };
