import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'property_damaged.freezed.dart';

part 'property_damaged.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class PropertyDamaged with _$PropertyDamaged {
  const factory PropertyDamaged({
    @JsonKey(name: 'PropertyDamagedId') int? propertyDamagedId,
    @JsonKey(name: 'PropertyDamagedName') String? propertyDamagedName,
    @JsonKey(name: 'CreateDT') DateTime? createDT,
    @JsonKey(name: 'UpdateDT') DateTime? updateDT,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterdataSynced') bool? isMasterdataSynced,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
  }) = _PropertyDamaged;

  const PropertyDamaged._();

  factory PropertyDamaged.fromJson(Map<String, dynamic> json) =>
      _$PropertyDamagedFromJson(json);

  @override
  Id get id => Isar.autoIncrement;
}
