import 'package:freezed_annotation/freezed_annotation.dart';

part 'accident_and_incident_register_property_damaged_payload.freezed.dart';
part 'accident_and_incident_register_property_damaged_payload.g.dart';

@freezed
class AccidentAndIncidentRegisterPropertyDamagedPayLoad
    with _$AccidentAndIncidentRegisterPropertyDamagedPayLoad {
  const factory AccidentAndIncidentRegisterPropertyDamagedPayLoad({
    int? AccidentAndIncidentRegisterPropertyDamagedId,
    String? AccidentAndIncidentRegisterPropertyDamagedNo,
    String? AccidentAndIncidentRegisterId,
    String? AccidentAndIncidentRegisterNo,
    int? PropertyDamagedId,
    bool? IsActive,
    bool? IsMasterdataSynced,
  }) = _AccidentAndIncidentRegisterPropertyDamagedPayLoad;
  factory AccidentAndIncidentRegisterPropertyDamagedPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$AccidentAndIncidentRegisterPropertyDamagedPayLoadFromJson(json);
}
