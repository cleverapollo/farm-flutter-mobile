// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      scheduleId: json['ScheduleId'] as String?,
      start: json['Start'] as String?,
      end: json['End'] as String?,
      userId: json['UserId'] as int?,
      companyId: json['CompanyId'] as int?,
      destinationCompanyId: json['DestinationCompanyId'] as int?,
      scheduleActivityId: json['ScheduleActivityId'] as int?,
      contractorId: json['ContractorId'] as int?,
      courseId: json['CourseId'] as int?,
      trainingProviderId: json['TrainingProviderId'] as int?,
      plantationId: json['PlantationId'] as int?,
      venue: json['Venue'] as String?,
      invoice: json['Invoice'] as String?,
      candidate: json['Candidate'] as String?,
      certificate: json['Certificate'] as String?,
      contactPerson: json['ContactPerson'] as String?,
      intOfAttendees: json['intOfAttendees'] as int?,
      isActive: json['IsActive'] as bool?,
      companyName: json['CompanyName'] as String?,
      destinationCompanyName: json['DestinationCompanyName'] as String?,
      scheduleActivityName: json['ScheduleActivityName'] as String?,
      contractorName: json['ContractorName'] as String?,
      courseName: json['CourseName'] as String?,
      trainingProviderName: json['TrainingProviderName'] as String?,
      plantationName: json['PlantationName'] as String?,
      potentialCompany: json['PotentialCompany'] as String?,
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'ScheduleId': instance.scheduleId,
      'Start': instance.start,
      'End': instance.end,
      'UserId': instance.userId,
      'CompanyId': instance.companyId,
      'DestinationCompanyId': instance.destinationCompanyId,
      'ScheduleActivityId': instance.scheduleActivityId,
      'ContractorId': instance.contractorId,
      'CourseId': instance.courseId,
      'TrainingProviderId': instance.trainingProviderId,
      'PlantationId': instance.plantationId,
      'Venue': instance.venue,
      'Invoice': instance.invoice,
      'Candidate': instance.candidate,
      'Certificate': instance.certificate,
      'ContactPerson': instance.contactPerson,
      'intOfAttendees': instance.intOfAttendees,
      'IsActive': instance.isActive,
      'CompanyName': instance.companyName,
      'DestinationCompanyName': instance.destinationCompanyName,
      'ScheduleActivityName': instance.scheduleActivityName,
      'ContractorName': instance.contractorName,
      'CourseName': instance.courseName,
      'TrainingProviderName': instance.trainingProviderName,
      'PlantationName': instance.plantationName,
      'PotentialCompany': instance.potentialCompany,
    };
