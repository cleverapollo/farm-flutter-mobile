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
    int? FireCauseId,
    int? AreaBurnt,
    int? CommercialAreaLoss,
    int? Latitude,
    int? Longitude,
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
