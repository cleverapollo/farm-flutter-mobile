// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'rm_stake_holder.freezed.dart';

part 'rm_stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class RMStakeHolder with _$RMStakeHolder {
  const factory RMStakeHolder({
    @JsonKey(name: 'StakeholderId') required String stakeHolderId,
    @JsonKey(name: 'StakeholderName') String? stakeHolderName,
    @JsonKey(name: 'StakeholderTypeId') int? stakeHolderTypeId,
    @JsonKey(name: 'Address1') String? address1,
    @JsonKey(name: 'Address2') String? address2,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Tel') String? tel,
    @JsonKey(name: 'Cell') String? cell,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
  }) = _RMStakeHolder;

  const RMStakeHolder._();

  factory RMStakeHolder.fromJson(Map<String, dynamic> json) =>
      _$RMStakeHolderFromJson(json);

  @override
  Id get id => int.tryParse(stakeHolderId) ?? Isar.autoIncrement;
}
