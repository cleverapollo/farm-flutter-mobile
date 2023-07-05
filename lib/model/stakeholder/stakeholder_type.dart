// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'stakeholder_type.freezed.dart';

part 'stakeholder_type.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class StakeHolderType with _$StakeHolderType {
  const factory StakeHolderType({
    @JsonKey(name: 'StakeholderTypeId') required String stakeHolderTypeId,
    @JsonKey(name: 'StakeholderTypeName') String? stakeHolderTypeName,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
    @JsonKey(name: 'IsActive') int? isActive,
  }) = _StakeHolderType;

  const StakeHolderType._();

  factory StakeHolderType.fromJson(Map<String, dynamic> json) =>
      _$StakeHolderTypeFromJson(json);

  @override
  Id get id => int.tryParse(stakeHolderTypeId) ?? Isar.autoIncrement;
}