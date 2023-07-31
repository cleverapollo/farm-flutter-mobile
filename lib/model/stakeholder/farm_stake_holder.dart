// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_stake_holder.freezed.dart';
part 'farm_stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmStakeHolder with _$FarmStakeHolder {
  const factory FarmStakeHolder({
    @JsonKey(name: 'FarmStakeholderId') String? farmStakeHolderId,
    @JsonKey(name: 'StakeholderId') String? stakeHolderId,
    @JsonKey(name: 'FarmId') String? farmId,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _FarmStakeHolder;

  const FarmStakeHolder._();

  factory FarmStakeHolder.fromJson(Map<String, dynamic> json) =>
      _$FarmStakeHolderFromJson(json);

  @override
  Id get id => int.tryParse(farmStakeHolderId ?? '') ?? Isar.autoIncrement;
}
