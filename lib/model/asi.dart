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
    @JsonKey(name: 'AsiRegisterId') String? asiRegisterId,
    @JsonKey(name: 'AsiTypeId') int? asiTypeId,
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
    @JsonKey(name: 'Date') DateTime? date,
    @JsonKey(name: 'Comment') String? comment,
    @JsonKey(name: 'CarRaisedDate') String? carRaisedDate,
    @JsonKey(name: 'CarClosedDate') String? carClosedDate,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'AsiTypeName') String? asiTypeName,
  }) = _Asi;

  const Asi._();

  factory Asi.fromJson(Map<String, dynamic> json) =>
      _$AsiFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
