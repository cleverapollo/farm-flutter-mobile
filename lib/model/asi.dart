import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/asi_register_payload/asi_register_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'asi.freezed.dart';
part 'asi.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Asi with _$Asi {
  const factory Asi({
    @JsonKey(name: 'LocalId') int? localId,
    @JsonKey(name: 'AsiRegisterNo') String? asiRegisterNo,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'CampId') String? campId,
    @JsonKey(name: 'AsiRegisterId') String? asiRegisterId,
    @JsonKey(name: 'AsiTypeId') int? asiTypeId,
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(false) @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'AsiTypeName') String? asiTypeName,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'CompartmentId') int? compartmentId,
  }) = _Asi;

  const Asi._();

  factory Asi.fromJson(Map<String, dynamic> json) => _$AsiFromJson(json);

  @override
  Id get id => localId ?? Isar.autoIncrement;
}

extension AsiX on Asi {
  AsiRegisterPayLoad toPayLoad() {
    return AsiRegisterPayLoad(
      AsiRegisterNo: asiRegisterNo,
      FarmId: farmId,
      AsiRegisterId: asiRegisterId,
      AsiTypeId: asiTypeId,
      Latitude: latitude,
      Longitude: longitude,
      Date: date,
      Comment: comment,
      CarRaisedDate: carRaisedDate,
      CarClosedDate: carClosedDate,
      IsActive: isActive,
      IsMasterdataSynced: isMasterdataSynced,
      AsiTypeName: asiTypeName,
    );
  }
}
