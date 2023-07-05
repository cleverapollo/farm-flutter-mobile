// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'stake_holder.freezed.dart';

part 'stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class StakeHolder with _$StakeHolder {
  const factory StakeHolder({
    @JsonKey(name: 'StakeHolderId') int? stakeHolderId,
    @JsonKey(name: 'StakeholderName') String? stakeholderName,
    @JsonKey(name: 'StakeholderTypeId') String? stakeHolderTypeId,
    @JsonKey(name: 'ContactName') String? contactName,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Address1') String? address1,
    @JsonKey(name: 'Address2') String? address2,
    @JsonKey(name: 'Tel') String? tel,
    @JsonKey(name: 'Cell') String? cell,
    @Default(1) @JsonKey(name: 'IsActive') int? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _StakeHolder;

  const StakeHolder._();

  factory StakeHolder.fromJson(Map<String, dynamic> json) => _$StakeHolderFromJson(json);

  @override
  Id get id => stakeHolderId ?? Isar.autoIncrement;
}
