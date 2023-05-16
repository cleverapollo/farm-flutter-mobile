import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_property_owner_ship_type.freezed.dart';
part 'farm_property_owner_ship_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmPropertyOwnerShipType with _$FarmPropertyOwnerShipType {
  const factory FarmPropertyOwnerShipType({
    @JsonKey(name: 'FarmPropertyOwnershipTypeId')
        int? farmPropertyOwnershipTypeId,
    @JsonKey(name: 'FarmPropertyOwnershipTypeName')
        String? farmPropertyOwnershipTypeName,
  }) = _FarmPropertyOwnerShipType;

  const FarmPropertyOwnerShipType._();

  factory FarmPropertyOwnerShipType.fromJson(Map<String, dynamic> json) =>
      _$FarmPropertyOwnerShipTypeFromJson(json);

  @override
  Id get id => farmPropertyOwnershipTypeId ?? Isar.autoIncrement;
}
