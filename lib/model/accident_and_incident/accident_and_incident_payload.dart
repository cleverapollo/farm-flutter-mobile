import 'package:cmo/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accident_and_incident_payload.freezed.dart';

part 'accident_and_incident_payload.g.dart';

@freezed
class AccidentAndIncidentPayload with _$AccidentAndIncidentPayload {
  const factory AccidentAndIncidentPayload({
    @JsonKey(name: 'Register') AccidentAndIncident? register,
    @JsonKey(name: 'Photos') List<AccidentAndIncidentPhoto>? photos,
    @JsonKey(name: 'PropertyDamaged') List<AccidentAndIncidentPropertyDamaged>? propertyDamaged,
  }) = _AccidentAndIncidentPayload;

  factory AccidentAndIncidentPayload.fromJson(Map<String, dynamic> json) =>
      _$AccidentAndIncidentPayloadFromJson(json);
}
