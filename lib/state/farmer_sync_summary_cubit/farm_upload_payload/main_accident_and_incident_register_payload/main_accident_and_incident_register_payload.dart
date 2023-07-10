import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/accident_and_incident_register_payload/accident_and_incident_register_payload.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/accident_and_incident_register_property_damaged_payload/accident_and_incident_register_property_damaged_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_accident_and_incident_register_payload.freezed.dart';
part 'main_accident_and_incident_register_payload.g.dart';

@freezed
class MainAccidentAndIncidentRegisterPayLoad
    with _$MainAccidentAndIncidentRegisterPayLoad {
  const factory MainAccidentAndIncidentRegisterPayLoad({
    AccidentAndIncidentRegisterPayLoad? Register,
    List<AccidentAndIncidentRegisterPropertyDamagedPayLoad>? PropertyDamaged,
  }) = _MainAccidentAndIncidentRegisterPayLoad;
  factory MainAccidentAndIncidentRegisterPayLoad.fromJson(
          Map<String, dynamic> json) =>
      _$MainAccidentAndIncidentRegisterPayLoadFromJson(json);
}
