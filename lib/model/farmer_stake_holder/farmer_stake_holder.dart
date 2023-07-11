import 'package:cmo/extensions/bool_estension.dart';
import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_payload/farm_stakeholder_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farmer_stake_holder.freezed.dart';

part 'farmer_stake_holder.g.dart';

// Gender
// Gender == 0: Male
// Gender == 1: Female

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
    @JsonKey(name: 'FarmerStakeHolderName') String? farmerStakeHolderName,
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'DateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'IdNumber') int? idNumber,
    @JsonKey(name: 'PhoneNumber') String? phoneNumber,
    @JsonKey(name: 'Nationality') String? nationality,
    @JsonKey(name: 'Gender') int? gender,
    @JsonKey(name: 'AvatarFilePath') String? avatarFilePath,
    @JsonKey(name: 'AvatarFileName') String? avatarFileName,
    @Default(<int>[])
    @JsonKey(name: 'JobDescription')
        List<int>? jobDescription,
    @Default(true) @JsonKey(name: 'IsActive') bool? isActive,
    @Default(true) @JsonKey(name: 'IsLocal') bool? isLocal,
    @JsonKey(name: 'IsMasterDataSynced') bool? isMasterDataSynced,
  }) = _FarmerStakeHolder;

  const FarmerStakeHolder._();

  factory FarmerStakeHolder.fromJson(Map<String, dynamic> json) =>
      _$FarmerStakeHolderFromJson(json);

  @override
  Id get id => farmerStakeHolderId ?? Isar.autoIncrement;
}

extension FarmerStakeHolderX on FarmerStakeHolder {
  FarmStakeholderPayLoad toPayLoad() {
    return FarmStakeholderPayLoad(
      FarmStakeholderId: farmerStakeHolderId.toString(),
      StakeholderId: stakeholderId.toString(),
      FarmId: farmId.toString(),
      IsMasterDataSynced: isMasterDataSynced.toInt,
    );
  }
}
