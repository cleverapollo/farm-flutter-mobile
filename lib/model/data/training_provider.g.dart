// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrainingProvider _$$_TrainingProviderFromJson(Map<String, dynamic> json) =>
    _$_TrainingProvider(
      trainingProviderId: json['TrainingProviderId'] as int?,
      trainingProviderName: json['TrainingProviderName'] as String?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$$_TrainingProviderToJson(_$_TrainingProvider instance) =>
    <String, dynamic>{
      'TrainingProviderId': instance.trainingProviderId,
      'TrainingProviderName': instance.trainingProviderName,
      'IsActive': instance.isActive,
    };
