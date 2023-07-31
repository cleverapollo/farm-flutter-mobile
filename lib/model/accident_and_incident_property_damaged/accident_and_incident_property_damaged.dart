import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/accident_and_incident_register_property_damaged_payload/accident_and_incident_register_property_damaged_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'accident_and_incident_property_damaged.freezed.dart';
part 'accident_and_incident_property_damaged.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class AccidentAndIncidentPropertyDamaged
    with _$AccidentAndIncidentPropertyDamaged {
  const factory AccidentAndIncidentPropertyDamaged({
    @JsonKey(name: 'AccidentAndIncidentRegisterPropertyDamagedId')
        int? accidentAndIncidentRegisterPropertyDamagedId,
    @JsonKey(name: 'AccidentAndIncidentRegisterPropertyDamagedNo')
        String? accidentAndIncidentRegisterPropertyDamagedNo,
    @JsonKey(name: 'AccidentAndIncidentRegisterId')
        String? accidentAndIncidentRegisterId,
    @JsonKey(name: 'AccidentAndIncidentRegisterNo')
        String? accidentAndIncidentRegisterNo,
    @JsonKey(name: 'PropertyDamagedId') int? propertyDamagedId,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
  }) = _AccidentAndIncidentPropertyDamaged;

  const AccidentAndIncidentPropertyDamaged._();

  factory AccidentAndIncidentPropertyDamaged.fromJson(
          Map<String, dynamic> json) =>
      _$AccidentAndIncidentPropertyDamagedFromJson(json);

  @override
  Id get id =>
      int.tryParse(accidentAndIncidentRegisterPropertyDamagedNo ?? '') ?? Isar.autoIncrement;
}

extension AccidentAndIncidentPropertyDamagedX
    on AccidentAndIncidentPropertyDamaged {
  AccidentAndIncidentRegisterPropertyDamagedPayLoad toPayLoad() {
    return AccidentAndIncidentRegisterPropertyDamagedPayLoad(
      AccidentAndIncidentRegisterPropertyDamagedId:
          accidentAndIncidentRegisterPropertyDamagedId,
      AccidentAndIncidentRegisterPropertyDamagedNo:
          accidentAndIncidentRegisterPropertyDamagedNo,
      AccidentAndIncidentRegisterId: accidentAndIncidentRegisterId,
      AccidentAndIncidentRegisterNo: accidentAndIncidentRegisterNo,
      PropertyDamagedId: propertyDamagedId,
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
    );
  }
}
