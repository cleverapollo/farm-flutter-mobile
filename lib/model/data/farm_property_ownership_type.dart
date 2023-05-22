// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_property_ownership_type.freezed.dart';

part 'farm_property_ownership_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmPropertyOwnershipType with _$FarmPropertyOwnershipType {
  const factory FarmPropertyOwnershipType({
    @JsonKey(name: 'FarmPropertyOwnershipTypeId')
        required int farmPropertyOwnershipTypeId,
    @JsonKey(name: 'FarmPropertyOwnershipTypeName')
        String? farmPropertyOwnershipTypeName,
    @JsonKey(name: 'IsActive') int? isActive,
  }) = _FarmPropertyOwnershipType;

  const FarmPropertyOwnershipType._();

  factory FarmPropertyOwnershipType.fromJson(Map<String, dynamic> json) =>
      _$FarmPropertyOwnershipTypeFromJson(json);

  @override
  Id get id => farmPropertyOwnershipTypeId;
}
