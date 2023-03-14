// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RejectReason _$$_RejectReasonFromJson(Map<String, dynamic> json) =>
    _$_RejectReason(
      rejectReasonId: json['RejectReasonId'] as int?,
      rejectReasonName: json['RejectReasonName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_RejectReasonToJson(_$_RejectReason instance) =>
    <String, dynamic>{
      'RejectReasonId': instance.rejectReasonId,
      'RejectReasonName': instance.rejectReasonName,
      'IsActive': instance.isActive,
    };
