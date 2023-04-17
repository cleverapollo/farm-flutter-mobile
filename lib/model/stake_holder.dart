// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'stake_holder.freezed.dart';

part 'stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class StakeHolder with _$StakeHolder {
  const factory StakeHolder({
    @JsonKey(name: 'StakeHolderId') required String stakeHolderId,
    @JsonKey(name: 'serviceName') required String serviceName,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'email') required String email,
  }) = _StakeHolder;

  const StakeHolder._();

  factory StakeHolder.fromJson(Map<String, dynamic> json) => _$StakeHolderFromJson(json);

  @override
  Id get id => int.tryParse(stakeHolderId) ?? Isar.autoIncrement;
}
