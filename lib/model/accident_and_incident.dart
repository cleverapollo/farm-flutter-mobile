import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/accident_and_incident_register_payload/accident_and_incident_register_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'accident_and_incident.freezed.dart';
part 'accident_and_incident.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AccidentAndIncident with _$AccidentAndIncident {
  const factory AccidentAndIncident({
    @JsonKey(name: 'AccidentAndIncidentRegisterId')
        String? accidentAndIncidentRegisterId,
    @JsonKey(name: 'AccidentAndIncidentRegisterNo')
        String? accidentAndIncidentRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'WorkerId') String? workerId,
    @JsonKey(name: 'NatureOfInjuryId') int? natureOfInjuryId,
    @JsonKey(name: 'DateRecieved') DateTime? dateRecieved,
    @JsonKey(name: 'DateOfIncident') DateTime? dateOfIncident,
    @JsonKey(name: 'DateResumeWork') DateTime? dateResumeWork,
    @JsonKey(name: 'WorkerDisabled') bool? workerDisabled,
    @JsonKey(name: 'JobDescriptionId') int? jobDescriptionId,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
    @JsonKey(name: 'WorkerName') String? workerName,
    @JsonKey(name: 'JobDescriptionName') String? jobDescriptionName,
    @JsonKey(name: 'NatureOfInjuryName') String? natureOfInjuryName,
    @JsonKey(name: 'LostTimeInDays') String? lostTimeInDays,
    @JsonKey(name: 'PropertyDamaged') String? propertyDamaged,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _AccidentAndIncident;

  const AccidentAndIncident._();

  factory AccidentAndIncident.fromJson(Map<String, dynamic> json) =>
      _$AccidentAndIncidentFromJson(json);

  @override
  Id get id =>
      int.tryParse(accidentAndIncidentRegisterNo ?? '') ?? Isar.autoIncrement;
}

extension AccidentAndIncidentX on AccidentAndIncident {
  AccidentAndIncidentRegisterPayLoad toPayLoad() {
    return AccidentAndIncidentRegisterPayLoad(
      AccidentAndIncidentRegisterId: accidentAndIncidentRegisterId,
      AccidentAndIncidentRegisterNo: accidentAndIncidentRegisterNo,
      FarmId: farmId,
      WorkerId: workerId.toString(),
      NatureOfInjuryId: natureOfInjuryId,
      DateRecieved: dateRecieved,
      DateOfIncident: dateOfIncident,
      DateResumeWork: dateResumeWork,
      WorkerDisabled: workerDisabled,
      JobDescriptionId: jobDescriptionId,
      Comment: comment,
      CarRaisedDate: carRaisedDate,
      CarClosedDate: carClosedDate,
      IsActive: isActive,
      IsMasterdataSynced: isMasterDataSynced,
      WorkerName: workerName,
      JobDescriptionName: jobDescriptionName,
      NatureOfInjuryName: natureOfInjuryName,
      LostTimeInDays: lostTimeInDays,
      PropertyDamaged: propertyDamaged,
      CreateDT: createDT,
      UpdateDT: updateDT,
    );
  }
}
