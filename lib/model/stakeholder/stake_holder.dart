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
    @JsonKey(name: 'StakeholderTypeId') int? stakeHolderTypeId,
    @JsonKey(name: 'entityName') String? entityName,
    @JsonKey(name: 'contactName') String? contactName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'IsActive') bool? isActive,
    @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _StakeHolder;

  const StakeHolder._();

  factory StakeHolder.fromJson(Map<String, dynamic> json) => _$StakeHolderFromJson(json);

  @override
  Id get id => stakeHolderId ?? Isar.autoIncrement;
}
