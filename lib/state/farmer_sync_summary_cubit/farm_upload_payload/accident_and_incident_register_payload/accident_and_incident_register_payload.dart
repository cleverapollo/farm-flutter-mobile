import 'package:freezed_annotation/freezed_annotation.dart';
part 'accident_and_incident_register_payload.freezed.dart';
part 'accident_and_incident_register_payload.g.dart';

@freezed
class AccidentAndIncidentRegisterPayLoad
    with _$AccidentAndIncidentRegisterPayLoad {
  const factory AccidentAndIncidentRegisterPayLoad({
    String? AccidentAndIncidentRegisterId,
    String? AccidentAndIncidentRegisterNo,
    String? FarmId,
    String? WorkerId,
    num? NatureOfInjuryId,
    DateTime? DateRecieved,
    DateTime? DateOfIncident,
    DateTime? DateResumeWork,
    bool? WorkerDisabled,
    num? JobDescriptionId,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? WorkerName,
    String? JobDescriptionName,
    String? NatureOfInjuryName,
    String? LostTimeInDays,
    String? PropertyDamaged,
    DateTime? CreateDT,
    DateTime? UpdateDT,
  }) = _AccidentAndIncidentRegisterPayLoad;
  factory AccidentAndIncidentRegisterPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$AccidentAndIncidentRegisterPayLoadFromJson(json);
}
