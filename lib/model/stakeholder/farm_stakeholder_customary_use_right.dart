// ignore_for_file: invalid_annotation_target

import 'package:cmo/state/farmer_sync_summary_cubit/farm_upload_payload/farm_stakeholder_customary_use_right_payload/farm_stakeholder_customary_use_right_payload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'farm_stakeholder_customary_use_right.freezed.dart';

part 'farm_stakeholder_customary_use_right.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class FarmStakeholderCustomaryUseRight with _$FarmStakeholderCustomaryUseRight {
  const factory FarmStakeholderCustomaryUseRight({
    @JsonKey(name: 'FarmStakeholderCustomaryUseRightId')
        String? farmStakeholderCustomaryUseRightId,
    @JsonKey(name: 'FarmStakeholderId') String? farmStakeholderId,
    @JsonKey(name: 'CustomaryUseRightId') String? customaryUseRightId,
    @JsonKey(name: 'IsActive') int? isActive,
    @JsonKey(name: 'IsMasterDataSynced') int? isMasterDataSynced,
  }) = _FarmStakeholderCustomaryUseRight;

  const FarmStakeholderCustomaryUseRight._();

  factory FarmStakeholderCustomaryUseRight.fromJson(
          Map<String, dynamic> json) =>
      _$FarmStakeholderCustomaryUseRightFromJson(json);

  @override
  Id get id =>
      int.tryParse(farmStakeholderCustomaryUseRightId ?? '') ??
      Isar.autoIncrement;
}

extension FarmStakeholderCustomaryUseRightX
    on FarmStakeholderCustomaryUseRight {
  FarmStakeholderCustomaryUseRightPayLoad toPayLoad() {
    return FarmStakeholderCustomaryUseRightPayLoad(
      FarmStakeholderCustomaryUseRightId: farmStakeholderCustomaryUseRightId,
      FarmStakeholderId: farmStakeholderId,
      CustomaryUseRightId: customaryUseRightId,
      IsActive: isActive,
      IsMasterDataSynced: isMasterDataSynced,
    );
  }
}
