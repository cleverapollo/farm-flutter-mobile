import 'package:freezed_annotation/freezed_annotation.dart';

part 'fire_register_payload.freezed.dart';
part 'fire_register_payload.g.dart';

@freezed
class FireRegisterPayLoad with _$FireRegisterPayLoad {
  const factory FireRegisterPayLoad({
    String? FireRegisterNo,
    String? FarmId,
    String? FireRegisterId,
    DateTime? Date,
    DateTime? Detected,
    DateTime? Extinguished,
    num? FireCauseId,
    num? AreaBurnt,
    num? CommercialAreaLoss,
    num? Latitude,
    num? Longitude,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? FireCauseName,
  }) = _FireRegisterPayLoad;
  factory FireRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$FireRegisterPayLoadFromJson(json);
}
