import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farmer_stake_holder.freezed.dart';

part 'farmer_stake_holder.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmerStakeHolder with _$FarmerStakeHolder {
  const factory FarmerStakeHolder({
    @JsonKey(name: 'FarmerStakeHolderId') int? farmerStakeHolderId,
    @JsonKey(name: 'FarmId') int? farmId,
    @JsonKey(name: 'StakeholderId') int? stakeholderId,
    @JsonKey(name: 'CreateDT') String? createDT,
    @JsonKey(name: 'UpdateDT') String? updateDT,
    @JsonKey(name: 'JobTitle') String? jobTitle,
    @JsonKey(name: 'FarmerStakeHolderName') String? stakeHolderName,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
  }) = _FarmerStakeHolder;

  const FarmerStakeHolder._();

  factory FarmerStakeHolder.fromJson(Map<String, dynamic> json) => _$FarmerStakeHolderFromJson(json);

  @override
  Id get id => farmerStakeHolderId ?? Isar.autoIncrement;
}
