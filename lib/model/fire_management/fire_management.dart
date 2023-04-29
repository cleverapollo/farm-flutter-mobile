import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'fire_management.freezed.dart';

part 'fire_management.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FireManagement with _$FireManagement {
  const factory FireManagement({
    @JsonKey(name: 'FireManagementId') int? fireManagementId,
    @JsonKey(name: 'FireCause') String? fireCause,
    @JsonKey(name: 'FireCauseId') int? fireCauseId,
    @JsonKey(name: 'DateDetected') String? dateDetected,
    @JsonKey(name: 'DateExtinguished') String? dateExtinguished,
    @JsonKey(name: 'AreaBurnt') double? areaBurnt,
    @JsonKey(name: 'CommercialAreaLoss') double? commercialAreaLoss,
    @JsonKey(name: 'Latitude') double? latitude,
    @JsonKey(name: 'Longitude') double? longitude,
    @JsonKey(name: 'GeneralComments') String? generalComments,
    @Default(false) @JsonKey(name: 'CarRaised') bool? carRaised,
    @Default(false) @JsonKey(name: 'CarClosed') bool? carClosed,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _FireManagement;

  const FireManagement._();

  factory FireManagement.fromJson(Map<String, dynamic> json) =>
      _$FireManagementFromJson(json);

  @override
  Id get id => fireManagementId ?? Isar.autoIncrement;
}
