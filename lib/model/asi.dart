import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'asi.freezed.dart';
part 'asi.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Asi with _$Asi {
  const factory Asi({
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
    @Default(false)
    @JsonKey(name: 'IsMasterdataSynced')
        bool? isMasterdataSynced,
    @JsonKey(name: 'AsiTypeName') String? asiTypeName,
    @JsonKey(name: 'CompartmentName') String? compartmentName,
    @JsonKey(name: 'LocalCompartmentId') int? localCompartmentId,
    @JsonKey(name: 'ManagementUnitId') String? managementUnitId,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
  }) = _Asi;

  const Asi._();

  factory Asi.fromJson(Map<String, dynamic> json) => _$AsiFromJson(json);

  Id get id => int.tryParse(asiRegisterNo ?? '') ?? Isar.autoIncrement;
}