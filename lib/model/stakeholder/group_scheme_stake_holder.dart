// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'group_scheme_stake_holder.freezed.dart';

part 'group_scheme_stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class GroupSchemeStakeHolder with _$GroupSchemeStakeHolder {
  const factory GroupSchemeStakeHolder({
    @JsonKey(name: 'GroupSchemeStakeHolderId')
        required String groupSchemeStakeHolderId,
    @JsonKey(name: 'StakeholderId') String? stakeHolderId,
    @JsonKey(name: 'GroupSchemeId') int? groupSchemeId,
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
  }) = _GroupSchemeStakeHolder;

  const GroupSchemeStakeHolder._();

  factory GroupSchemeStakeHolder.fromJson(Map<String, dynamic> json) =>
      _$GroupSchemeStakeHolderFromJson(json);

  @override
  Id get id => int.tryParse(groupSchemeStakeHolderId) ?? Isar.autoIncrement;
}
