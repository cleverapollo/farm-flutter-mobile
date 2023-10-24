import 'package:cmo/model/asi_photo/asi_photo.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/fire_register_payload/fire_register_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'fire_register.freezed.dart';
part 'fire_register.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FireRegister with _$FireRegister {
  const factory FireRegister({
    @JsonKey(name: 'FireRegisterNo') String? fireRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'FireRegisterId') String? fireRegisterId,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'Detected') DateTime? detected,
    @JsonKey(name: 'Extinguished') DateTime? extinguished,
    @JsonKey(name: 'FireCauseId') int? fireCauseId,
    @JsonKey(name: 'AreaBurnt') double? areaBurnt,
    @JsonKey(name: 'CommercialAreaLoss') double? commercialAreaLoss,
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'FireCauseName') String? fireCauseName,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'AsiPhotos') List<String>? asiPhotos,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _FireRegister;

  const FireRegister._();

  factory FireRegister.fromJson(Map<String, dynamic> json) =>
      _$FireRegisterFromJson(json);

  @override
  Id get id => int.tryParse(fireRegisterNo ?? '') ?? Isar.autoIncrement;
}

extension FireRegisterX on FireRegister {
  FireRegister cleanDateData({
    bool isExtinguished = false,
    bool isDetected = false,
  }) {
    return FireRegister(
      fireRegisterNo: fireRegisterNo,
      farmId: farmId,
      fireRegisterId: fireRegisterId,
      date: date,
      detected: isDetected ? null : detected,
      extinguished: isExtinguished ? null : extinguished,
      fireCauseId: fireCauseId,
      areaBurnt: areaBurnt,
      commercialAreaLoss: commercialAreaLoss,
      latitude: latitude,
      longitude: longitude,
      comment: comment,
      carRaisedDate: carRaisedDate,
      carClosedDate: carClosedDate,
      isActive: isActive,
      isMasterdataSynced: isMasterdataSynced,
      fireCauseName: fireCauseName,
      createDT: createDT,
      updateDT: updateDT,
    );
  }

  FireRegisterPayLoad toPayLoad() {
    return FireRegisterPayLoad(
      FireRegisterNo: fireRegisterNo,
      FarmId: farmId,
      FireRegisterId: fireRegisterId,
      Date: date,
      Detected: detected,
      Extinguished: extinguished,
      FireCauseId: fireCauseId,
      AreaBurnt: areaBurnt,
      CommercialAreaLoss: commercialAreaLoss,
      Latitude: latitude,
      Longitude: longitude,
      Comment: comment,
      CarRaisedDate: carRaisedDate,
      CarClosedDate: carClosedDate,
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
      FireCauseName: fireCauseName,
      UpdateDT: updateDT,
      CreateDT: createDT,
    );
  }
}
