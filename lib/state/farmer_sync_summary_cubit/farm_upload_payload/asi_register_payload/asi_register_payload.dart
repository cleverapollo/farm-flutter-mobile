import 'package:freezed_annotation/freezed_annotation.dart';

part 'asi_register_payload.freezed.dart';
part 'asi_register_payload.g.dart';

@freezed
class AsiRegisterPayLoad with _$AsiRegisterPayLoad {
  const factory AsiRegisterPayLoad({
    String? AsiRegisterNo,
    String? FarmId,
    String? AsiRegisterId,
    int? AsiTypeId,
    int? Latitude,
    int? Longitude,
    DateTime? Date,
    String? Comment,
    String? CarRaisedDate,
    String? CarClosedDate,
    bool? IsActive,
    bool? IsMasterdataSynced,
    String? AsiTypeName,
  }) = _AsiRegisterPayLoad;
  factory AsiRegisterPayLoad.fromJson(Map<String, dynamic> json) =>
      _$AsiRegisterPayLoadFromJson(json);
}
